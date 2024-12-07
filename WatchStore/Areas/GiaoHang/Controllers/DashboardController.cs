using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WatchStore.Models;

namespace WatchStore.Areas.GiaoHang.Controllers
{
    public class DashboardController : BasesController
    {
        private WatchStoreDbContext db = new WatchStoreDbContext();
        // GET: GiaoHang/Dashboard
        public ActionResult Index()
        {
            int currentUserId = Convert.ToInt32(Session["GiaoHang_ID"]);
            var currentUser = db.Users.FirstOrDefault(u => u.ID == currentUserId);
            if (currentUser != null)
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
            ViewBag.Title = "Nhan vien giao hang"; 
            return View();
        }
    }
}