﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WatchStore.Models
{
    public class ListOrder
    {
        public int ID { get; set; }
        public int StoreId { get; set; }
        public String CustomerName { get; set; }
        public string CustomerAddress { get; set; }
        public string CustomerEmail { get; set; }
        public double SAmount { get; set; }
        public string DeliveryPaymentMethod { get; set; }
        public string DeliveryAddress { get; set; } 
        public int? Status { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime? ExportDate { get; set; }
    }
}