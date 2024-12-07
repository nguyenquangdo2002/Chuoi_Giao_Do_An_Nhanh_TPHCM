using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WatchStore.Models;

namespace WatchStore.Areas.GiaoHang.Controllers
{
    public class AuthsController : Controller
    {
        private WatchStoreDbContext db = new WatchStoreDbContext();
        // GET: GiaoHang/Auth
        public ActionResult Login()
        {
            if (Session["GiaoHang_Name"] != null)
            {
                return RedirectToAction("Index", "GiaoHang"); // Assuming Index is your action method
            }
            return View();
        }

        [HttpPost]
        public JsonResult Login(String User, String Pass)
        {
            int count_username = db.Users.Where(m => m.Status == 1 && ((m.Phone).ToString() == User || m.Email == User || m.Name == User) && m.Access == 3).Count();

            if (count_username == 0)
                return Json(new { s = 1 });
            else
            {
                String Password = MyString.ToMD5(Pass);
                var user_acount = db.Users
                    .Where(m => m.Status == 1 && ((m.Phone).ToString() == User || m.Email == User || m.Name == User) && m.Password == Password && m.Access == 3);

                if (user_acount.Count() == 0)
                    return Json(new { s = 2 });
                else
                {
                    var user = user_acount.First();
                    Session["GiaoHang_Name"] = user.FullName;
                    Session["GiaoHang_ID"] = user.ID;
                    Session["GiaoHang_Images"] = user.Image;
                    Session["GiaoHang_Email"] = user.Email;
                    Session["GiaoHang_Created_at"] = user.Created_at;

                    // Redirect to the delivery staff dashboard
                    return Json(new { s = 0, redirectUrl = Url.Action("Index", "Dashboard") });
                }
            }
        }
        public ActionResult Logout()
        {
            if (Session["GiaoHang_Name"] != null)
            {
                Session["GiaoHang_Name"] = null;
                Session["GiaoHang_ID"] = null;
                Session["GiaoHang_Images"] = null;
                Session["GiaoHang_Address"] = null;
                Session["GiaoHang_Email"] = null;
                Session["GiaoHang_Created_at"] = null;
            }
            return Redirect("~/GiaoHang/Login");
        }


    }
}