using System.Web.Mvc;

namespace WatchStore.Areas.GiaoHang
{
    public class GiaoHangAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "GiaoHang";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "GiaoHangLogin",
                "GiaoHang/Login",
                new { Controller = "Auths", action = "Login", id = UrlParameter.Optional });
            context.MapRoute(
                "GiaoHang_Logout",
                "GiaoHang/Logout",
                new { Controller = "Auths", action = "Logout", id = UrlParameter.Optional });
            context.MapRoute(
                "GiaoHang_default",
                "GiaoHang/{controller}/{action}/{id}",
                new {Controller = "Dashboard" , action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}