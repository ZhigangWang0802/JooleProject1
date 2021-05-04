using JooleProject_DAL;
using JooleService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace JooleProject_UI.Controllers
{
    public class SearchProductController : Controller
    {
        public ActionResult SearchResult(string subCategory = "Fans")
        {
            Service service = new Service();
            List<Category> categories = service.GetAllCategory();
            Session["page"] = "Search";
            Dictionary<string, List<string>> typeFilters = service.GetAllTypeFilterBySubCategory(subCategory);
            Dictionary<string, List<decimal?>> techSpecFilter = service.GetAllTechSpecFilterBySubCategory(subCategory);
            string categoryName = service.GetCategoryBySubCategory(subCategory);
            List<Product> listOfProducts = service.GetProductsBySubCategory(subCategory);
            ViewBag.typeFilters = typeFilters;
            ViewBag.techSpecFilter = techSpecFilter;
            Session["categoryName"] = categoryName;
            Session["subCategory"] = subCategory;
            ViewBag.products = listOfProducts;
            return View(categories);
        }
        public ActionResult Summary(int productId)
        {
            Service service = new Service();
            List<Category> categories = service.GetAllCategory();
            Session["page"] = "Search";
            Dictionary<string, Dictionary<string, string>> productDetails = service.GetDetailsByProductId(productId);
            ViewBag.productDetails = productDetails;
            return View(categories);
        }
        [HttpPost]
        public ActionResult Compare(List<int> productsId)
        {
            Service service = new Service();
            List<Category> categories = service.GetAllCategory();
            ViewBag.productDetails = new List<Dictionary<string, Dictionary<string, string>>>();
            foreach (var item in productsId)
            {
                Dictionary<string, Dictionary<string, string>> productDetails = service.GetDetailsByProductId(item);
                ViewBag.productDetails.Add(productDetails);
            }
            Session["page"] = "Search";
            return View(categories);
        }
        [HttpPost]
        public ActionResult Filter(List<int> fltVal, string subCategory)
        {
            Service service = new Service();
            ViewBag.products = service.GetProductsByTechSpecFilter(fltVal, subCategory);
            return PartialView();
        }
    }
}