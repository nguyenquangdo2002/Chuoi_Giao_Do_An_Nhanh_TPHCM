using Microsoft.AspNet.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WatchStore.hubs
{
    public class ChatDemo : Hub
    {
        public void Hello()
        {
            Clients.All.hello();
        }
    }
}