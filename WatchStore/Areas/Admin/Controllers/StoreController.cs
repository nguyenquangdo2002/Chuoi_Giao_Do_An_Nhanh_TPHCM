using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Metadata.Edm;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WatchStore.Models;

namespace WatchStore.Areas.Admin.Controllers
{
    public class StoreController : BaseController
    {
        private WatchStoreDbContext db = new WatchStoreDbContext();
        public ActionResult Index(string searchString)
        {
            // Truy vấn cơ bản để lấy các cửa hàng có Status != 0
            var query = db.Stores.Where(m => m.Status != 0);

            // Đếm số lượng cửa hàng trong thùng rác (Status = 0)
            ViewBag.count_Trash = db.Stores.Where(m => m.Status == 0).Count();

            // Áp dụng tìm kiếm nếu có searchString
            if (!String.IsNullOrEmpty(searchString))
            {
                searchString = searchString.ToLower().Trim();

                // Tìm kiếm theo Address và Description
                query = query.Where(m =>
                    m.Address.ToLower().Contains(searchString) ||
                    m.DeliveryUrl.ToLower().Contains(searchString) ||
                    m.MenuUrl.ToLower().Contains(searchString) ||
                    (m.Description != null && m.Description.ToLower().Contains(searchString))
                );
            }

            // Lấy danh sách các cửa hàng (sau khi áp dụng tìm kiếm)
            var stores = query.ToList();

            // Debugging output nếu không tìm thấy cửa hàng nào
            if (!stores.Any())
            {
                System.Diagnostics.Debug.WriteLine("No stores found in the database.");
            }

            // Trả danh sách cửa hàng và chuỗi tìm kiếm về View
            ViewBag.SearchString = searchString;
            return View(stores);
        }



        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Stores modelStore = db.Stores.Find(id);
            if (modelStore == null)
            {
                return HttpNotFound();
            }
            return View(modelStore);
        }
        public ActionResult Create()
        {
            ViewBag.count_Trash = db.Stores.Where(m => m.Status == 0).Count();
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Stores moduleStore)
        {
            if (ModelState.IsValid)
            {
                moduleStore.Created_at = DateTime.Now;
                moduleStore.Updated_at = DateTime.Now;
                moduleStore.Created_by = int.Parse(Session["Admin_ID"].ToString());
                moduleStore.Updated_by = int.Parse(Session["Admin_ID"].ToString());
                db.Stores.Add(moduleStore);
                db.SaveChanges();
                Notification.set_flash("Thêm cửa hàng thành công", "succcess");
                return RedirectToAction("Index");

            }
            return View(moduleStore);
        }


        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Stores moduleStore
                = db.Stores.Find(id);
            if (moduleStore == null) { return HttpNotFound(); }
            return View(moduleStore);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Stores moduleStore)
        {
            if (ModelState.IsValid)
            {
                moduleStore.Updated_at = DateTime.Now;
                moduleStore.Updated_by = int.Parse(Session["Admin_ID"].ToString());
                db.Entry(moduleStore).State = EntityState.Modified;
                db.SaveChanges();
                Notification.set_flash("Cập nhật cửa hàng thành công ", "success");
                return RedirectToAction("Index");
            }
            return View(moduleStore);
        }

        public ActionResult Trash(string searchString)
        {
            // Truy vấn cơ bản để lấy các cửa hàng trong thùng rác (Status = 0)
            var query = db.Stores.Where(m => m.Status == 0);

            // Áp dụng tìm kiếm nếu có searchString
            if (!String.IsNullOrEmpty(searchString))
            {
                searchString = searchString.ToLower().Trim();

                // Tìm kiếm theo Address và Description trong thùng rác
                query = query.Where(m =>
                    m.Address.ToLower().Contains(searchString) ||
                    m.DeliveryUrl.ToLower().Contains(searchString) ||
                    m.MenuUrl.ToLower().Contains(searchString) ||
                    (m.Description != null && m.Description.ToLower().Contains(searchString))
                );
            }

            // Lấy danh sách các cửa hàng sau khi áp dụng tìm kiếm
            var list = query.ToList();

            // Debugging output nếu không tìm thấy cửa hàng nào
            if (!list.Any())
            {
                System.Diagnostics.Debug.WriteLine("No stores found in the trash.");
            }

            // Trả danh sách cửa hàng và chuỗi tìm kiếm về View
            ViewBag.SearchString = searchString;
            return View(list);
        }

        public ActionResult DelTrash(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            Stores moduleStore = db.Stores.Find(id);
            moduleStore.Status = 0;
            moduleStore.Updated_at = DateTime.Now;
            moduleStore.Updated_by = int.Parse(Session["Admin_ID"].ToString());
            db.Entry(moduleStore).State = EntityState.Modified;
            db.SaveChanges();
            Notification.set_flash("Chuyển vào thùng rác thành công!! ", "success");

            return RedirectToAction("Index");
        }
        public ActionResult Undo(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            Stores moduleStore = db.Stores.Find(id);
            moduleStore.Status = 1;
            moduleStore.Updated_at = DateTime.Now;
            moduleStore.Updated_by = int.Parse(Session["Admin_ID"].ToString());
            db.Entry(moduleStore).State = EntityState.Modified;
            db.SaveChanges();
            Notification.set_flash("Phục hồi thành công ", "success");
            return RedirectToAction("Trash");

        }
        public ActionResult Delete(int? id )
        {
            if(id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest); 
            }
            Stores moduleStore = db.Stores.Find(id);
            if (moduleStore == null) { 
            
                return HttpNotFound();
            }
            return View(moduleStore);

        }
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DelConFirmed(int id) { 
        Stores moduleStore = db.Stores.Find(id);    
            db.Stores.Remove(moduleStore);
            db.SaveChanges();
            Notification.set_flash("Cửa hàng đã được xóa ", "success");
            return RedirectToAction("Index");
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}