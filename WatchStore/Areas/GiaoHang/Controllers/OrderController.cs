using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.SessionState;
using System.Web.UI;
using WatchStore.Models;

namespace WatchStore.Areas.GiaoHang.Controllers
{
    public class OrderController : BasesController
    {
        // GET: GiaoHang/Order
        private WatchStoreDbContext db = new WatchStoreDbContext();


        public ActionResult Index(string searchString)
        {

            ViewBag.countTrash = db.Orders.Where(m => m.Trash == 1).Count();

            int currentUserId = Convert.ToInt32(Session["GiaoHang_ID"]);
            var currentUser = db.Users.FirstOrDefault(u => u.ID == currentUserId);
            if(currentUser != null)
            {
            //    var storeNames = new Dictionary<int, string>
            //    {
            //         { 1, "Chi nhánh Thống Nhất" },
            //{ 2, "Chi nhánh Tô Ngọc Vân" },
            //{ 3, "Chi nhánh Lê Lai" },
            //{ 4, "Chi nhánh 87 ĐƯỜNG THÍCH QUẢNG ĐỨC" },
            //{ 5, "Chi nhánh Pandora" },
            //{ 6, "Chi nhánh Co.opmart" }
            //    };
                ViewBag.CurrentUserStoreId = currentUser.StoreId;
                //ViewBag.storeNames = storeNames.ContainsKey(currentUser.StoreId) ? storeNames[currentUser.StoreId] : "Chi nhánh không xác định";
            }

            // Tạo truy vấn cơ bản
            var query = (from od in db.Orderdetails
                         join o in db.Orders on od.OrderId equals o.Id
                         //join x in db.Stores on od.OrderId equals x.Id
                         where o.Trash != 1
                         group od by new { od.OrderId, o } into groupb
                         select new ListOrder
                         {
                             ID = groupb.Key.OrderId,
                             StoreId = groupb.Key.o.StoreId,
                             DeliveryPaymentMethod = groupb.Key.o.DeliveryPaymentMethod , 
                             DeliveryAddress = groupb.Key.o.DeliveryAddress ,
                             SAmount = groupb.Sum(m => m.Amount),
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
                    m.ID.ToString().Contains(searchString) ||
                    m.StoreId.ToString().Contains(searchString)
                );
            }

            // Sắp xếp theo ngày tạo

            var results = query.OrderByDescending(m => m.CreateDate);

            ViewBag.SearchString = searchString;
            return View(results.ToList());
        }
        // Controller
        //public ActionResult Trash(string searchString)
        //{
        //    ViewBag.countTrash = db.Orders.Where(m => m.Status == 0).Count();

        //    // Tạo truy vấn cơ bản
        //    var query = (from od in db.Orderdetails
        //                 join o in db.Orders on od.OrderId equals o.Id
        //                 where o.Trash == 1
        //                 group od by new { od.OrderId, o } into groupb
        //                 select new ListOrder
        //                 {
        //                     ID = groupb.Key.OrderId,
        //                     StoreId = groupb.Key.o.StoreId,
        //                     SAmount = groupb.Sum(m => m.Amount),
        //                     CustomerName = groupb.Key.o.DeliveryName,
        //                     CustomerAddress = groupb.Key.o.DeliveryAddress,
        //                     CustomerEmail = groupb.Key.o.DeliveryEmail,
        //                     Status = groupb.Key.o.Status,
        //                     CreateDate = groupb.Key.o.CreateDate,
        //                     ExportDate = groupb.Key.o.ExportDate,
        //                 });

        //    // Áp dụng tìm kiếm nếu có searchString
        //    if (!String.IsNullOrEmpty(searchString))
        //    {
        //        searchString = searchString.ToLower().Trim();
        //        query = query.Where(m =>
        //            m.CustomerName.ToLower().Contains(searchString) ||
        //            m.CustomerEmail.ToLower().Contains(searchString) ||
        //            m.CustomerAddress.ToLower().Contains(searchString) ||
        //            m.ID.ToString().Contains(searchString)
        //        );
        //    }

        //    // Sắp xếp theo ngày tạo
        //    var results = query.OrderByDescending(m => m.CreateDate);

        //    ViewBag.SearchString = searchString;
        //    return View(results.ToList());
        //}
        //public ActionResult DelTrash(int? id)
        //{
        //    MOrder mOrder = db.Orders.Find(id);
        //    mOrder.Trash = 1;

        //    mOrder.Updated_at = DateTime.Now;
        //    mOrder.Updated_by = 1;
        //    db.Entry(mOrder).State = EntityState.Modified;
        //    db.SaveChanges();
        //    Notification.set_flash("Đã hủy đơn hàng!" + " ID = " + id, "success");
        //    return RedirectToAction("Index");
        //}


        // Controller Action
        public ActionResult UpStatus(int? id)
        {
            MOrder mOrder = db.Orders.Find(id);
            if (mOrder == null)
            {
                return HttpNotFound();
            }

            mOrder.Status = mOrder.Status + 1;
            //mOrder.StoreId = storeId;
            mOrder.Updated_at = DateTime.Now;
            mOrder.Updated_by = 3;
            db.Entry(mOrder).State = EntityState.Modified;
            db.SaveChanges();

            Notification.set_flash("Đã cập nhật trạng thái đơn hàng và chi nhánh!" + " ID = " + id, "success");
            return RedirectToAction("Index");
        }
        //public ActionResult UpdateStore( int?id ,int storeId)
        //{
        //    MOrder mOrder = db.Orders.Find(id);
        //    mOrder.Status = mOrder.Status + 1;
        //    mOrder.StoreId = storeId;
        //    mOrder.Updated_at = DateTime.Now;
        //    mOrder.Updated_by = 3;  
        //    db.Entry(mOrder).State = EntityState.Modified;
        //    db.SaveChanges();
            
        //    return RedirectToAction("Index");
        //}
        public ActionResult Undo(int? id)
        {
            MOrder mOrder = db.Orders.Find(id);
            mOrder.Trash = 0;

            mOrder.Updated_at = DateTime.Now;
            mOrder.Updated_by = int.Parse(Session["GiaoHang_ID"].ToString());
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
            MOrder mOrder = db.Orders.Find(id);
            db.Orders.Remove(mOrder);
            db.SaveChanges();
            Notification.set_flash("Đã xóa đơn hàng!", "success");
            return RedirectToAction("Trash");
        }
        [HttpPost]
        public JsonResult changeStatus(int id, int op)
        {
            MOrder mOrder = db.Orders.Find(id);
            if (op == 1) { mOrder.Status = 1; } else if (op == 2) { mOrder.Status = 2; } else { mOrder.Status = 3; }

            mOrder.ExportDate = DateTime.Now;
            mOrder.Updated_at = DateTime.Now;
            mOrder.Updated_by = int.Parse(Session["GiaoHang_ID"].ToString());
            db.Entry(mOrder).State = EntityState.Modified;
            db.SaveChanges();
            return Json(new { s = mOrder.Status, t = mOrder.ExportDate.ToString() });
        }


    }
}