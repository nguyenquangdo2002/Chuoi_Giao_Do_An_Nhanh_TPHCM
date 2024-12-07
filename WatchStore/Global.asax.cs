using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using WatchStore.Models;

namespace WatchStore
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);

        }

        protected void Session_Start()
        {
            Session["Notification"] = "";
            Session["Message"] = "";

            // Quản trị viên
            Session["Admin_Name"] = null;
            Session["Admin_ID"] = null;
            Session["Admin_Images"] = null;
            Session["Admin_Address"] = null;
            Session["Admin_Email"] = null;
            Session["Admin_Created_at"] = null;

            // Khách hàng
            Session["User_Name"] = null;
            Session["User_ID"] = null;
            Session["User_Images"] = null;

            // Giao hàng
            //Session["GiaoHang_Name"] = null;
            //Session["GiaoHang_ID"] = null;
            //Session["GiaoHang_Images"] = null;
            //Session["GiaoHang_Address"] = null;
            //Session["GiaoHang_Email"] = null;
            //Session["GiaoHang_Created_at"] = null;

            // Các thông tin khác
            Session["Cart"] = null;
            Session["keywords"] = null;
            Session["Status"] = null;

            // Danh sách sản phẩm đã xem gần đây
            Session["RecentlyViewedProducts"] = new List<MProduct>();
        }
    }
}
