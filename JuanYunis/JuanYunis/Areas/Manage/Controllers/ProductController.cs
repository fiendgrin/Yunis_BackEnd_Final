using JuanYunis.DataAccessLayer;
using JuanYunis.Helpers;
using JuanYunis.Models;
using JuanYunis.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Drawing.Drawing2D;

namespace JuanYunis.Areas.Manage.Controllers
{
    [Area("manage")]
    [Authorize(Roles = "SuperAdmin, Admin")]
    public class ProductController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _env;
        public ProductController(AppDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }

        //1.Index
        //2.Detail
        //3.Create(Get)
        //4.Create(Post)
        //5.Update(Get)
        //6.Update(Post)
        //7.DeleteImage
        //8.Delete
        //9.DeleteProduct

        //=============================================================

        //1.Index
        public IActionResult Index(int currentPage = 1)
        {
            IQueryable<Product> queries = _context.Products
                .Include(p => p.Category)
                .Include(p => p.ProductImages.Where(pi => pi.IsDeleted == false))
                .Where(p => p.IsDeleted == false)
                .OrderByDescending(p => p.Id);

            return View(PageNatedList<Product>.Create(queries, currentPage, 5, 10));
        }

        //2.Detail
        public async Task<IActionResult> Detail(int? id)
        {
            if (id == null) return BadRequest();
            Product product = await _context.Products
                .Include(p => p.Category)
                .Include(p => p.ProductImages.Where(pi => pi.IsDeleted == false))
                .FirstOrDefaultAsync(p => p.IsDeleted == false && p.Id == id);

            if (product == null) return NotFound();

            return View(product);
        }

        //3.Create(Get)
        public async Task<IActionResult> Create()
        {
            ViewBag.Categories = await _context.Categories.Where(c => c.IsDeleted == false).ToListAsync();

            return View();
        }

        //4.Create(Post)
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Product product)
        {
            ViewBag.Categories = await _context.Categories.Where(c => c.IsDeleted == false).ToListAsync();

            if (!ModelState.IsValid) return View(product);

            if (product.CategoryId == null || !await _context.Categories.AnyAsync(c => c.IsDeleted == false && c.Id == product.CategoryId))
            {
                ModelState.AddModelError("CategoryId", $"{product.CategoryId} is Incorrect");
                return View(product);
            }


            if (product.Files == null)
            {
                ModelState.AddModelError("Files", $"Minimum 1 file");
                return View(product);
            }
            if (product.Files.Count() > 10)
            {
                ModelState.AddModelError("Files", $"Maximum of 10 files is allowed");
                return View(product);
            }

            List<ProductImage> productImages = new List<ProductImage>();

            foreach (IFormFile file in product.Files)
            {

                ProductImage productImage = new ProductImage
                {
                    Image = await file.Save(_env.WebRootPath, new string[] { "assets", "img", "product" }),
                    IsMainImage = false

                };
                productImages.Add(productImage);
            }

            product.ProductImages = productImages;

            if (product.MainFile == null)
            {
                ModelState.AddModelError("MainFile", $"Main File required");
                return View(product);
            }
            else
            {
                ProductImage productImage = new ProductImage
                {
                    Image = await product.MainFile.Save(_env.WebRootPath, new string[] { "assets", "img", "product" }),
                    IsMainImage = true
                };
                productImages.Add(productImage);
            }


            Category? category = await _context.Categories.FirstOrDefaultAsync(c => c.Id == product.CategoryId);


            await _context.Products.AddAsync(product);
            await _context.SaveChangesAsync();


            return RedirectToAction(nameof(Index));
        }

        //5.Update(Get)
        public async Task<IActionResult> Update(int? id)
        {
            ViewBag.Categories = await _context.Categories.Where(c => c.IsDeleted == false).ToListAsync();

            if (id == null) return BadRequest();

            Product? product = await _context.Products
                .Include(p => p.ProductImages.Where(pi => pi.IsDeleted == false))
                .FirstOrDefaultAsync(p => p.Id == id && p.IsDeleted == false);

            if (product == null) return BadRequest();

            return View(product);
        }

        //6.Update(Post)
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Update(int? id, Product product)
        {
            ViewBag.Categories = await _context.Categories.Where(c => c.IsDeleted == false).ToListAsync();


            if (id == null) return BadRequest();

            if (product.Id != id) return BadRequest();


            Product? dbProduct = await _context.Products
                .Include(p => p.ProductImages.Where(pi => pi.IsDeleted == false))
                .FirstOrDefaultAsync(p => p.Id == product.Id && p.IsDeleted == false);

            if (dbProduct == null) return NotFound();


            if (!ModelState.IsValid) return View(product);

            int canUpload = 10 - dbProduct.ProductImages.Count();

            if (product.Files != null && product.Files.Count() > canUpload)
            {
                ModelState.AddModelError("Files", $"Maximum of 10 Images, you only have space for {canUpload} more");
                return View(dbProduct);
            }

            if (product.CategoryId == null || !await _context.Categories.AnyAsync(c => c.IsDeleted == false && c.Id == product.CategoryId))
            {
                ModelState.AddModelError("CategoryId", $"{product.CategoryId} is Incorrect");
                return View(dbProduct);
            }

            if (product.MainFile != null)
            {

                string filePath = Path.Combine(_env.WebRootPath, "assets", "img", "product", dbProduct.ProductImages.FirstOrDefault(pi => pi.IsMainImage == true).Image);
                if (System.IO.File.Exists(filePath))
                {
                    System.IO.File.Delete(filePath);
                }

                dbProduct.ProductImages.FirstOrDefault(pi => pi.IsMainImage == true).Image = await product.MainFile.Save(_env.WebRootPath, new string[] { "assets", "img", "product" });
            }


            List<ProductImage> productImages = new List<ProductImage>();

            if (product.Files != null && product.Files.Count() > 0)
            {
                foreach (IFormFile file in product.Files)
                {
                    ProductImage productImage = new ProductImage
                    {
                        Image = await file.Save(_env.WebRootPath, new string[] { "assets", "img", "product" })
                    };
                    productImages.Add(productImage);
                }

                dbProduct.ProductImages.AddRange(productImages);


            }

            Category? category = await _context.Categories.FirstOrDefaultAsync(c => c.Id == product.CategoryId);


            dbProduct.Title = product.Title.Trim();

            dbProduct.FullDescription = product.FullDescription.Trim();

            dbProduct.SmallDescription = product.SmallDescription.Trim();

            dbProduct.EcoTax = product.EcoTax;

            dbProduct.Price = product.Price;

            dbProduct.DiscountedPrice = product.DiscountedPrice;

            dbProduct.IsOurProduct = product.IsOurProduct;
            dbProduct.IsTopSeller = product.IsTopSeller;
            dbProduct.CategoryId = product.CategoryId;

            dbProduct.UpdatedBy = "User";

            dbProduct.UpdatedAt = DateTime.Now;

            await _context.SaveChangesAsync();


            return RedirectToAction(nameof(Index));
        }

        //7.DeleteImage
        public async Task<IActionResult> DeleteImage(int? id, int? imageId)
        {
            if (id == null) return BadRequest();

            if (imageId == null) return BadRequest();

            Product? product = await _context.Products
                .Include(p => p.ProductImages.Where(pi => pi.IsDeleted == false))
                .FirstOrDefaultAsync(p => p.Id == id && p.IsDeleted == false);

            if (product == null) return NotFound();




            if (!product.ProductImages.Any(pi => pi.Id == imageId)) return NotFound();

            if (product.ProductImages.Count <= 1) return BadRequest();

            product.ProductImages.FirstOrDefault(pi => pi.Id == imageId).IsDeleted = true;
            product.ProductImages.FirstOrDefault(pi => pi.Id == imageId).DeletedAt = DateTime.Now;
            product.ProductImages.FirstOrDefault(pi => pi.Id == imageId).DeletedBy = "User";

            string fileName = product.ProductImages.FirstOrDefault(pi => pi.Id == imageId).Image;
            await _context.SaveChangesAsync();
            string filePath = Path.Combine(_env.WebRootPath, "assets", "images", "product", fileName);
            if (System.IO.File.Exists(filePath))
            {
                System.IO.File.Delete(filePath);
            }

            return PartialView("_DeleteImagePartial", product.ProductImages.Where(p => p.IsDeleted == false).ToList());
        }

        //8.Delete
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null) return BadRequest();
            Product product = await _context.Products
                .Include(p => p.Category)
                .Include(p => p.ProductImages.Where(pi => pi.IsDeleted == false))
                .FirstOrDefaultAsync(p => p.IsDeleted == false && p.Id == id);

            if (product == null) return NotFound();

            return View(product);
        }
        //9.DeleteProduct
        public async Task<IActionResult> DeleteProduct(int? id)
        {
            if (id == null) return BadRequest();

            Product product = await _context.Products
                .Include(p => p.Category)
                .Include(p => p.ProductImages.Where(pi => pi.IsDeleted == false))
                .FirstOrDefaultAsync(p => p.IsDeleted == false && p.Id == id);

            if (product == null) return NotFound();


           

            if (product.ProductImages != null && product.ProductImages.Count > 0)
            {
                foreach (ProductImage productImage in product.ProductImages)
                {
                    productImage.IsDeleted = true;
                    productImage.DeletedBy = "User";
                    productImage.DeletedAt = DateTime.Now;
                }
            }

            product.IsDeleted = true;
            product.DeletedBy = "User";
            product.DeletedAt = DateTime.Now;

            await _context.SaveChangesAsync();
            

            foreach (ProductImage productImage1 in product.ProductImages)
            {
                if (!string.IsNullOrWhiteSpace(productImage1.Image))
                {
                    string filePath = Path.Combine(_env.WebRootPath, "assets", "img", "product", productImage1.Image);

                    if (System.IO.File.Exists(filePath))
                    {
                        System.IO.File.Delete(filePath);
                    }

                }
            }

            return RedirectToAction(nameof(Index));
        }

    }
}
