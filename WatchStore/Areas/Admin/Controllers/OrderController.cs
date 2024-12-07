using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WatchStore.Models;

namespace WatchStore.Areas.Admin.Controllers
{
    public class OrderController : BaseController
    {
        private WatchStoreDbContext db = new WatchStoreDbContext();


        public ActionResult Index(string searchString)
        {
            ViewBag.countTrash = db.Orders.Where(m => m.Trash == 1).Count();

            // Tạo truy vấn cơ bản
            var query = (from od in db.Orderdetails
                         join o in db.Orders on od.OrderId equals o.Id
                         //join x in db.Stores on od.OrderId equals x.Id
                         where o.Trash != 1
                         group od by new { od.OrderId, o } into groupb
                         select new ListOrder
                         {
                             ID = groupb.Key.OrderId,
                             StoreId = groupb.Key.o.StoreId ,

                             SAmount = groupb.Sum(m => m.Amount),
                             DeliveryPaymentMethod = groupb.Key.o.DeliveryPaymentMethod ?? "Unknown",
                             DeliveryAddress = groupb.Key.o.DeliveryAddress,
                             CustomerName = groupb.Key.o.DeliveryName,
                             Status = groupb.Key.o.Status,
                             CreateDate = groupb.Key.o.CreateDate,
                             ExportDate = groupb.Key.o.ExportDate,
                         });

            // Áp dụng tìm kiếm nếu có searchString
            if (!String.IsNullOrEmpty(searchString))
            {
                searchString = searchString.ToLower().Trim();
                query = query.Where(m =>
                    m.CustomerName.ToLower().Contains(searchString) ||
                    m.ID.ToString().Contains(searchString)
                );
            }

            // Sắp xếp theo ngày tạo
            var results = query.OrderByDescending(m => m.CreateDate);

            ViewBag.SearchString = searchString;
            return View(results.ToList());
        }
        // Controller
        public ActionResult Trash(string searchString)
        {
            ViewBag.countTrash = db.Orders.Where(m => m.Status == 0).Count();

            // Tạo truy vấn cơ bản
            var query = (from od in db.Orderdetails
                         join o in db.Orders on od.OrderId equals o.Id
                         where o.Trash == 1
                         group od by new { od.OrderId, o } into groupb
                         select new ListOrder
                         {
                             ID = groupb.Key.OrderId,
                             StoreId = groupb.Key.o.StoreId,
                             SAmount = groupb.Sum(m => m.Amount),
                             DeliveryPaymentMethod = groupb.Key.o.DeliveryPaymentMethod ?? "Unknown",

                             CustomerName = groupb.Key.o.DeliveryName,
                             CustomerAddress = groupb.Key.o.DeliveryAddress,
                             CustomerEmail = groupb.Key.o.DeliveryEmail,
                             Status = groupb.Key.o.Status,
                             CreateDate = groupb.Key.o.CreateDate,
                             ExportDate = groupb.Key.o.ExportDate,
                         });

            // Áp dụng tìm kiếm nếu có searchString
            if (!String.IsNullOrEmpty(searchString))
            {
                searchString = searchString.ToLower().Trim();
                query = query.Where(m =>
                    m.CustomerName.ToLower().Contains(searchString) ||
                    m.CustomerEmail.ToLower().Contains(searchString) ||
                    m.CustomerAddress.ToLower().Contains(searchString) ||
                    m.ID.ToString().Contains(searchString)
                );
            }

            // Sắp xếp theo ngày tạo
            var results = query.OrderByDescending(m => m.CreateDate);

            ViewBag.SearchString = searchString;
            return View(results.ToList());
        }
        public ActionResult DelTrash(int? id)
        {
            MOrder mOrder = db.Orders.Find(id);
            mOrder.Trash = 1;

            mOrder.Updated_at = DateTime.Now;
            mOrder.Updated_by = 1;
            db.Entry(mOrder).State = EntityState.Modified;
            db.SaveChanges();
            Notification.set_flash("Đã hủy đơn hàng!" + " ID = " + id, "success");
            return RedirectToAction("Index");
        }



        public ActionResult UpStatus(int? id , int storeId)
        {
            MOrder mOrder = db.Orders.Find(id);
            mOrder.Status = mOrder.Status+ 1;
            mOrder.StoreId = storeId;

            mOrder.Updated_at = DateTime.Now;
            mOrder.Updated_by = 1;
            db.Entry(mOrder).State = EntityState.Modified;
            db.SaveChanges();
            Notification.set_flash("Đã cập nhật trạng thái đơn hàng !" + " ID = " + id, "success");
            return RedirectToAction("Index");
        }
        public ActionResult Undo(int? id)
        {
            MOrder mOrder = db.Orders.Find(id);
            mOrder.Trash = 0;

            mOrder.Updated_at = DateTime.Now;
            mOrder.Updated_by = int.Parse(Session["Admin_ID"].ToString());
            db.Entry(mOrder).State = EntityState.Modified;
            db.SaveChanges();
            Notification.set_flash("Khôi phục thành công!" + " ID = " + id, "success");
            return RedirectToAction("Trash");
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                Notification.set_flash("Không tồn tại đơn hàng!", "warning");
                return RedirectToAction("Index", "Order");
            }
            MOrder mOrder = db.Orders.Find(id);
            if (mOrder == null)
            {
                Notification.set_flash("Không tồn tại  đơn hàng!", "warning");
                return RedirectToAction("Index", "Order");
            }
            ViewBag.orderDetails = db.Orderdetails.Where(m => m.OrderId == id).ToList();
            ViewBag.productOrder = db.Products.ToList();
            return View(mOrder);
        }


        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                Notification.set_flash("Không tồn tại đơn hàng!", "warning");
                return RedirectToAction("Trash", "Order");
            }
            MOrder mOrder = db.Orders.Find(id);
            if (mOrder == null)
            {
                Notification.set_flash("Không tồn tại đơn hàng!", "warning");
                return RedirectToAction("Trash", "Order");
            }
            ViewBag.orderDetails = db.Orderdetails.Where(m => m.OrderId == id).ToList();
            ViewBag.productOrder = db.Products.ToList();
            return View(mOrder);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            // Delete related OrderDetails entries
            db.Database.ExecuteSqlCommand("DELETE FROM [dbo].[OrderDetails] WHERE [OrderId] = @p0", id);

            // Delete the Order entry
            db.Database.ExecuteSqlCommand("DELETE FROM [dbo].[Orders] WHERE [ID] = @p0", id);

            // Flash a success message and redirect
            Notification.set_flash("Đã xóa đơn hàng!", "success");
            return RedirectToAction("Trash");
        }



        [HttpPost]
        public JsonResult changeStatus(int id, int op)
        {
            MOrder mOrder = db.Orders.Find(id);
            if (op == 0) { mOrder.Status = 0; } else if (op == 1) { mOrder.Status = 1; } else if (op == 2) { mOrder.Status = 2; } else if(op ==3) { mOrder.Status = 3; }

            mOrder.ExportDate = DateTime.Now;
            mOrder.Updated_at = DateTime.Now;
            mOrder.Updated_by = int.Parse(Session["Admin_ID"].ToString());
            db.Entry(mOrder).State = EntityState.Modified;
            db.SaveChanges();
            return Json(new { s = mOrder.Status, t = mOrder.ExportDate.ToString() });
        }


    }
}
