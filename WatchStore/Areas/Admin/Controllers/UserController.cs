using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WatchStore.Models;

namespace WatchStore.Areas.Admin.Controllers
{
    public class UserController : BaseController
    {
        private WatchStoreDbContext db = new WatchStoreDbContext();
        public ActionResult Index(string searchString)
        {
            // người dùng , khách hàng 
            // Đếm số người dùng trong thùng rác (Status = 0 và Access = 0)
            ViewBag.demrac = db.Users.Where(m => m.Status == 0 && m.Access == 0).Count();

            // Truy vấn cơ bản để lấy người dùng có Status != 0 và Access == 0
            var query = db.Users.Where(m => m.Status != 0 && m.Access == 0);

            // Áp dụng tìm kiếm nếu có searchString
            if (!String.IsNullOrEmpty(searchString))
            {
                searchString = searchString.ToLower().Trim();

                // Tìm kiếm theo FullName, Email hoặc Address
                query = query.Where(m =>
                    m.FullName.ToLower().Contains(searchString) ||
                    m.Email.ToLower().Contains(searchString) ||
                    m.Name.ToLower().Contains(searchString) ||
                    (m.Address != null && m.Address.ToLower().Contains(searchString))
                );
            }

            // Lấy danh sách người dùng sau khi áp dụng tìm kiếm
            var users = query.ToList();

            // Debugging output nếu không tìm thấy người dùng nào
            if (!users.Any())
            {
                System.Diagnostics.Debug.WriteLine("No users found in the database.");
            }

            // Trả danh sách người dùng và chuỗi tìm kiếm về View
            ViewBag.SearchString = searchString;
            return View(users);
        }

        public ActionResult Trash(string searchString)
        {
            // Truy vấn cơ bản để lấy người dùng có Status = 0 và Access = 0
            var query = db.Users.Where(m => m.Status == 0 && m.Access == 0);

            // Áp dụng tìm kiếm nếu có searchString
            if (!String.IsNullOrEmpty(searchString))
            {
                searchString = searchString.ToLower().Trim();

                // Tìm kiếm theo FullName, Email và Address
                query = query.Where(m =>
                    m.FullName.ToLower().Contains(searchString) ||
                    m.Email.ToLower().Contains(searchString) ||
                    m.Name.ToLower().Contains(searchString) ||
                    (m.Address != null && m.Address.ToLower().Contains(searchString))
                );
            }

            // Lấy danh sách người dùng sau khi áp dụng tìm kiếm
            var users = query.ToList();

            // Debugging output nếu không tìm thấy người dùng nào
            if (!users.Any())
            {
                System.Diagnostics.Debug.WriteLine("No users found in the trash.");
            }

            // Trả danh sách người dùng và chuỗi tìm kiếm về View
            ViewBag.SearchString = searchString;
            return View(users);
        }


        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(MUser mUser)
        {
            ViewBag.demrac = db.Users.Where(m => m.Status == 0).Count();
            if (ModelState.IsValid)
            {
                String avatar = MyString.ToAscii(mUser.FullName);
                mUser.Password = MyString.ToMD5(mUser.Password);
                mUser.Created_at = DateTime.Now;
                mUser.Created_by =int.Parse(Session["Admin_ID"].ToString());
                mUser.Updated_at = DateTime.Now;
                mUser.Updated_by =int.Parse(Session["Admin_ID"].ToString());

                var file = Request.Files["Image"];
                if (file != null && file.ContentLength > 0)
                {
                    String filename = avatar + file.FileName.Substring(file.FileName.LastIndexOf("."));
                    mUser.Image = filename;
                    String Strpath = Path.Combine(Server.MapPath("~/Public/library/user"), filename);
                    file.SaveAs(Strpath);
                }

                db.Users.Add(mUser);
                Notification.set_flash("Thêm mới người dùng thành công!","success");
                db.SaveChanges();
                return RedirectToAction("Index", "Users");

            }

            return View(mUser);
        }


        public ActionResult DelTrash(int id)
        {
            MUser mUser = db.Users.Find(id);
            if (mUser == null)
            {
                Notification.set_flash("Không tồn tại User trên!", "warning");
                return RedirectToAction("Index");
            }

            mUser.Status = 0;

            mUser.Created_at = DateTime.Now;
            mUser.Updated_by =int.Parse(Session["Admin_ID"].ToString());
            mUser.Updated_at = DateTime.Now;
            mUser.Updated_by =int.Parse(Session["Admin_ID"].ToString());
            db.Entry(mUser).State = EntityState.Modified;
            db.SaveChanges();
            Notification.set_flash("Đã xóa vào thùng rác!" + " ID = " + id, "success");
            return RedirectToAction("Index");
        }

        // Delete to trash
        public ActionResult ReTrash(int? id)
        {
            MUser mUser = db.Users.Find(id);
            if (mUser == null)
            {
                Notification.set_flash("Không tồn tại User!", "warning");
                return RedirectToAction("Trash", "User");
            }
            mUser.Status = 2;

            mUser.Updated_at = DateTime.Now;
            mUser.Updated_by =int.Parse(Session["Admin_ID"].ToString());
            db.Entry(mUser).State = EntityState.Modified;
            db.SaveChanges();
            Notification.set_flash("Khôi phục thành công!" + " ID = " + id, "success");
            return RedirectToAction("Trash", "User");
        }

        // GET: Admin/User/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MUser mUser = db.Users.Find(id);
            if (mUser == null)
            {
                return HttpNotFound();
            }
            return View(mUser);
        }


        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MUser mUser = db.Users.Find(id);
            if (mUser == null)
            {
                return HttpNotFound();
            }
            return View(mUser);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(MUser mUser)
        {
            ViewBag.demrac = db.Users.Where(m => m.Status == 0).Count();
            if (ModelState.IsValid)
            {
                String avatar = MyString.ToAscii(mUser.FullName);
                mUser.Password = MyString.ToMD5(mUser.Password);
                mUser.Created_at = DateTime.Now;
                mUser.Created_by =int.Parse(Session["Admin_ID"].ToString());
                mUser.Updated_at = DateTime.Now;
                mUser.Updated_by =int.Parse(Session["Admin_ID"].ToString());
                
                var file = Request.Files["Image"];
                if (file != null && file.ContentLength > 0)
                {
                    String filename = avatar + file.FileName.Substring(file.FileName.LastIndexOf("."));
                    mUser.Image = filename;
                    String Strpath = Path.Combine(Server.MapPath("~/Public/library/user"), filename);
                    file.SaveAs(Strpath);
                }
                db.Entry(mUser).State = EntityState.Modified;
                Notification.set_flash("Sửa thành công!" , "success");
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(mUser);
        }

        // GET: Admin/User/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MUser mUser = db.Users.Find(id);
            if (mUser == null)
            {
                return HttpNotFound();
            }
            return View(mUser);
        }

        // POST: Admin/User/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            MUser mUser = db.Users.Find(id);
            db.Users.Remove(mUser);
            db.SaveChanges();
            Notification.set_flash("Đã xóa hoàn User!", "success");
            return RedirectToAction("Trash");
        }

        [HttpPost]
        public JsonResult changeStatus(int id)
        {
            MUser mUser = db.Users.Find(id);
            mUser.Status = (mUser.Status == 1) ? 2 : 1;

            mUser.Updated_at = DateTime.Now;
            mUser.Updated_by =int.Parse(Session["Admin_ID"].ToString());
            db.Entry(mUser).State = EntityState.Modified;
            db.SaveChanges();
            return Json(new
            {
                Status = mUser.Status
            });
        }
    }
}
