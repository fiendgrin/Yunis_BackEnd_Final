var builder = WebApplication.CreateBuilder(args);
builder.Services.AddControllersWithViews();


var app = builder.Build();

app.MapControllerRoute("default","{Controller=Home}/{Action=Index}/{id?}");
app.UseStaticFiles();

app.Run();
