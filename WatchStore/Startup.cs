using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(WatchStore.Startup))]
namespace WatchStore
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.MapSignalR();
        }
    }
}
