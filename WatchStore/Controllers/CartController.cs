using WatchStore.Library;
using WatchStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WatchStore.Controllers
{
    public class CartController : Controller
    {
        private WatchStoreDbContext db = new WatchStoreDbContext();
        // GET: Cart
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Add(int pid, int qty)
        {

            // 
            var p = db.Products.First(m => m.Status == 1 && m.ID == pid);
            if(p.Quantity < qty)
            {
                return Json(new { result = 3 });
            }

            var cart = Session["Cart"];
            if (cart == null)
            {
                var item = new ModelCart();
                item.ProductID = p.ID;
                item.Name = p.Name;
                item.Slug = p.Slug;
              
                item.Image = p.Image;
                item.Quantity = qty;
                if(p.Discount == 1) {
                     item.Price = p.ProPrice;
                }
                else {
                    item.Price = p.Price;
                }
                var list = new List<ModelCart>();
                list.Add(item);

                Session["Cart"] = list;
                return Json(new { result = 1 });
            }
            else
            {
                var list = (List<ModelCart>)cart;

                if (list.Exists(m => m.ProductID == pid))
                {
                    foreach (var item in list)
                    {
                        if (item.ProductID == pid)
                            item.Quantity += qty;
                        return Json(new { result = 2 });
                    }
                }
                else
                {
                    var item = new ModelCart();
                    item.ProductID = p.ID;
                    item.Name = p.Name;
                    item.Slug = p.Slug;
                    item.Image = p.Image;
                    item.Quantity = qty;
                    if (p.Discount == 1)
                    {
                        item.Price = p.ProPrice;
                    }
                    else
                    {
                        item.Price = p.Price;
                    }
                    list.Add(item);
                    return Json(new { result = 1 });
                }
            }
            return Json(new { result = 0 });
        }

        public ActionResult Set(int pid, int qty)
        {

            // 
            var p = db.Products.First(m => m.Status == 1 && m.ID == pid);
            if (p.Quantity < qty)
            {
                return Json(new { result = 2 });
            }

            var cart = Session["Cart"];
            if (cart == null)
            {

            }
            else
            {
                var list = (List<ModelCart>)cart;

                if (list.Exists(m => m.ProductID == pid))
                {
                    foreach (var item in list)
                    {
                        if (item.ProductID == pid)
                            item.Quantity = qty;
                        return Json(new { result = 1 });
                    }
                }
            }
            return Json(new { result = 0 });
        }

        public JsonResult Update(int pid, String option)
        {
            var sCart = (List<ModelCart>)Session["Cart"];
            ModelCart c = sCart.First(m => m.ProductID == pid);
            if (c != null)
            {
                switch (option)
                {
                    case "add":
                        c.Quantity++;
                        return Json(1);
                    case "minus":
                        c.Quantity--;
                        return Json(2);
                    case "remove":
                        sCart.Remove(c);
                        if (sCart.Count() == 0)
                            Session.Remove("Cart");
                        return Json(3);
                    default:
                        break;
                }
            }
            return Json(null);
        }
        public ActionResult Remove(int pid)
        {
            var cart = Session["Cart"];
            if (cart != null)
            {
                var list = (List<ModelCart>)cart;
                var item = list.FirstOrDefault(m => m.ProductID == pid);
                if (item != null)
                {
                    list.Remove(item);
                    if (list.Count == 0)
                    {
                        Session.Remove("Cart"); // Xóa session nếu giỏ hàng rỗng
                    }
                    else
                    {
                        Session["Cart"] = list; // Cập nhật session với danh sách mới
                    }
                    Notification.set_flash("Món ăn đã được xóa khỏi giỏ hàng!", "success");
                }
                else
                {
                    Notification.set_flash("Món ăn không tồn tại trong giỏ hàng!", "warning");
                }
            }
            else
            {
                Notification.set_flash("Giỏ hàng hiện đang trống!", "warning");
            }

            return RedirectToAction("Index", "Cart");
        }

        public ActionResult RemoveAll()
        {
            Session.Remove("Cart");
            Notification.set_flash("Đã xóa toàn bộ món ăn trong giỏ hàng!", "success");
            return Redirect("~/gio-hang");
        }
        public ActionResult Checkout()
        {
            if (Session["User_Name"] != null && Session["Cart"] != null)
            {
                int user_id = Convert.ToInt32(Session["User_ID"]);
                ViewBag.Info = db.Users.Where(m => m.ID == user_id).First();
            }
            else
                return RedirectToAction("Index", "Cart");
            return View();
        }
        //[HttpPost]
        //public JsonResult Payment(String Email, String Address, String FullName, String Phone)
        //{
        //    var order = new MOrder();
        //    int user_id = Convert.ToInt32(Session["User_ID"]);
        //    order.Code = DateTime.Now.ToString("yyyyMMddhhMMss"); // yyyy-MM-dd hh:MM:ss
        //    order.CustemerId = user_id;
        //    order.CreateDate = DateTime.Now;
        //    order.DeliveryAddress = Address;
        //    order.DeliveryEmail = Email;
        //    order.DeliveryPhone = Phone;
        //    order.DeliveryName = FullName;
        //    order.Status = 1;
        //    order.StoreId = 1;
        //    db.Orders.Add(order);
        //    db.SaveChanges();

        //    var OrderID = order.Id;

        //    foreach (var c in (List<ModelCart>)Session["Cart"])
        //    {
        //        var orderdetails = new MOrderdetail();
        //        orderdetails.OrderId = OrderID;
        //        //orderdetails
        //        orderdetails.ProductId = c.ProductID;
        //        orderdetails.Price = c.Price;
        //        orderdetails.Quantity = c.Quantity;
        //        orderdetails.Amount = c.Price * c.Quantity;
        //        db.Orderdetails.Add(orderdetails);
        //    }
        //    db.SaveChanges();

        //    Session.Remove("Cart");
        //    Notification.set_flash("Bạn đã đặt hàng thành công!", "success");
        //    return Json(true);

        //}
        [HttpPost]
        public ActionResult Payment(String Email, String Address, String FullName, String Phone, int? StoreId , int? PaymentMethod)
        {
            //Kiểm tra nếu không có chi nhánh nào được chọn
            if (!StoreId.HasValue || StoreId.Value == 0)
            {
                return Json(new { success = false, message = "Vui lòng chọn chi nhánh." });
            }

            var order = new MOrder();
            var user = new MUser();
            int user_id = Convert.ToInt32(Session["User_ID"]);
            order.Code = DateTime.Now.ToString("yyyyMMddhhMMss");
            order.CustemerId = user_id;
            order.CreateDate = DateTime.Now;
            order.DeliveryAddress = Address;
            order.DeliveryEmail = Email;
            order.DeliveryPhone = Phone;
            order.DeliveryName = FullName;
            order.Status = 0;
            order.StoreId = StoreId.Value; // Gán StoreId được chọn
            order.DeliveryPaymentMethod = (PaymentMethod.Value == 1) ? "Tiền mặt " : "VNPay"; 
            db.Orders.Add(order);
            db.SaveChanges();

            var OrderID = order.Id;

            foreach (var c in (List<ModelCart>)Session["Cart"])
            {
                var orderdetails = new MOrderdetail
                {
                    OrderId = OrderID,
                    ProductId = c.ProductID,
                    Price = c.Price,
                    Quantity = c.Quantity,
                    Amount = c.Price * c.Quantity
                };
                db.Orderdetails.Add(orderdetails);
            }
            db.SaveChanges();

            // Xóa giỏ hàng sau khi đặt hàng thành công
            Session.Remove("Cart");
            Notification.set_flash("Bạn đã đặt hàng thành công!", "success");

            return Redirect("~/account/order");
        }

        public JsonResult Tesst()
        {
            if (Session["User_Name"] != null)
                return Json(1);
            return Json(0);
        }
        public JsonResult CheckAuth()
        {
            if (Session["User_Name"] != null)
                return Json(1);
            return Json(0);
        }
        
    }
}