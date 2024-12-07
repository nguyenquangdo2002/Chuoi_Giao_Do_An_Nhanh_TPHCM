using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WatchStore.Areas.GiaoHang.Controllers
{
    public class BasesController : Controller
    {
        // GET: GiaoHang/Base
        public BasesController() {

            if (System.Web.HttpContext.Current.Session["GiaoHang_Name"] == null)
            {
                System.Web.HttpContext.Current.Response.Redirect("~/GiaoHang/Login");
            }
        }
    }
}