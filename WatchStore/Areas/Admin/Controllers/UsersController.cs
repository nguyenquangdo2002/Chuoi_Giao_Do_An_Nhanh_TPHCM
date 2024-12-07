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
    public class UsersController : BaseController
    {
        private WatchStoreDbContext db = new WatchStoreDbContext();
        // Controller
        public ActionResult Index(string searchString)
        {
            // Đếm số user trong thùng rác (Status = 0)
            ViewBag.demrac = db.Users.Where(m => m.Status == 0 && m.Access != 0).Count();

            // Tạo truy vấn cơ bản
            var query = db.Users.Where(m => m.Status != 0 && m.Access != 0);

            // Áp dụng tìm kiếm nếu có searchString
            if (!String.IsNullOrEmpty(searchString))
            {
                searchString = searchString.ToLower().Trim();
                query = query.Where(m =>
                    m.FullName.ToLower().Contains(searchString) ||
                    m.Email.ToLower().Contains(searchString) ||
                    m.Address.Contains(searchString)
                );
            }

            // Sắp xếp theo ngày tạo mới nhất (giả sử có trường CreateDate)
            var list = query.OrderByDescending(m => m.Created_at);

            ViewBag.SearchString = searchString;
            return View(list.ToList());
        }
        // Controller
        public ActionResult Trash(string searchString)
        {
            // Tạo truy vấn cơ bản cho thùng rác
            var query = db.Users.Where(m => m.Status == 0 && m.Access != 0);

            // Áp dụng tìm kiếm nếu có searchString
            if (!String.IsNullOrEmpty(searchString))
            {
                searchString = searchString.ToLower().Trim();
                query = query.Where(m =>
                    m.FullName.ToLower().Contains(searchString) ||
                    m.Email.ToLower().Contains(searchString) ||
                    m.Address.Contains(searchString)

                );
            }

            // Sắp xếp theo ngày cập nhật mới nhất
            var list = query.OrderByDescending(m => m.Updated_at);

            ViewBag.SearchString = searchString;
            return View(list.ToList());
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
            mUser.Updated_by = int.Parse(Session["Admin_ID"].ToString());
            mUser.Updated_at = DateTime.Now;
            mUser.Updated_by = int.Parse(Session["Admin_ID"].ToString());
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
                Notification.set_flash("Không tồn tại Users!", "warning");
                return RedirectToAction("Trash", "Users");
            }
            mUser.Status = 2;

            mUser.Updated_at = DateTime.Now;
            mUser.Updated_by = int.Parse(Session["Admin_ID"].ToString());
            db.Entry(mUser).State = EntityState.Modified;
            db.SaveChanges();
            Notification.set_flash("Khôi phục thành công!" + " ID = " + id, "success");
            return RedirectToAction("Trash", "Users");
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
                mUser.Created_by = int.Parse(Session["Admin_ID"].ToString());
                mUser.Updated_at = DateTime.Now;
                mUser.Updated_by = int.Parse(Session["Admin_ID"].ToString());

                var file = Request.Files["Image"];
                if (file != null && file.ContentLength > 0)
                {
                    String filename = avatar + file.FileName.Substring(file.FileName.LastIndexOf("."));
                    mUser.Image = filename;
                    String Strpath = Path.Combine(Server.MapPath("~/Public/library/users"), filename);
                    file.SaveAs(Strpath);
                }

                db.Users.Add(mUser);
                Notification.set_flash("Thêm mới người dùng thành công!", "success");
                db.SaveChanges();
                return RedirectToAction("Index", "Users");

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
        public ActionResult Edit(MUser mUser , int? storeId)
        {
            ViewBag.demrac = db.Users.Where(m => m.Status == 0).Count();
            if (ModelState.IsValid)
            {
                String avatar = MyString.str_slug(mUser.FullName);
                mUser.Password = MyString.ToMD5(mUser.Password);
                mUser.Created_at = DateTime.Now;
                mUser.Created_by = int.Parse(Session["Admin_ID"].ToString());
                mUser.Updated_at = DateTime.Now;
                mUser.Updated_by = int.Parse(Session["Admin_ID"].ToString());
                mUser.StoreId = storeId.Value;
                var file = Request.Files["Image"];
                if (file != null && file.ContentLength > 0)
                {
                    String filename = avatar + file.FileName.Substring(file.FileName.LastIndexOf("."));
                    mUser.Image = filename;
                    String Strpath = Path.Combine(Server.MapPath("~/Public/library/users"), filename);
                    file.SaveAs(Strpath);
                }
                db.Entry(mUser).State = EntityState.Modified;
                Notification.set_flash("Sửa thành công!", "success");
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(mUser);
        }

        // GET: Admin/Users/Delete/5
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

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            MUser mUser = db.Users.Find(id);

            if (mUser == null)
            {
                // Nếu User không tồn tại, thông báo và chuyển hướng về Trash
                Notification.set_flash("User không tồn tại!", "warning");
                return RedirectToAction("Trash");
            }

            db.Users.Remove(mUser);
            db.SaveChanges();

            Notification.set_flash("Đã xóa hoàn toàn Users!", "success");
            return RedirectToAction("Trash");
        }

        [HttpPost]
        public JsonResult changeStatus(int id)
        {
            MUser mUser = db.Users.Find(id);
            mUser.Status = (mUser.Status == 1) ? 2 : 1;

            mUser.Updated_at = DateTime.Now;
            mUser.Updated_by = int.Parse(Session["Admin_ID"].ToString());
            db.Entry(mUser).State = EntityState.Modified;
            db.SaveChanges();
            return Json(new
            {
                Status = mUser.Status
            });
        }
    }
}
