using JuanYunis.DataAccessLayer;
using JuanYunis.Interfaces;
using JuanYunis.Services;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddControllersWithViews();
builder.Services.AddDbContext<AppDbContext>(options => options.UseSqlServer(builder.Configuration
    .GetConnectionString("Default")));


builder.Services.AddScoped<ILayoutService,LayoutService>();
builder.Services.AddHttpContextAccessor();


var app = builder.Build();

app.MapControllerRoute("default","{Controller=Home}/{Action=Index}/{id?}");
app.UseStaticFiles();

app.Run();
