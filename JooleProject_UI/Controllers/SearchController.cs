﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using JooleProject_DAL;
using JooleService;

namespace JooleProject_UI.Controllers
{
    public class SearchController : Controller
    {

        [ChildActionOnly]
        public PartialViewResult _SearchBar()
        {
            Service service = new Service();
            List<Category> categories = service.GetAllCategory();
            // identify which page now we are in

            return PartialView(categories);
        }

        public ActionResult Search()
        {
            Service service = new Service();
            List<Category> categories = service.GetAllCategory();
            // identify which page now we are in
            Session["page"] = "Search";
            return View(categories);
        }

       

        public ActionResult GetSubCategoryName(int categoryid)
        {
            Service service = new Service();
            List<SubCategory> subcategories = service.GetAllSubcategoryByCategoryID(categoryid);
            /*return Json(subcategories, JsonRequestBehavior.AllowGet);*/
            string output = "";
            foreach (var item in subcategories)
            {
                output = output + item.SubCategory_Name.ToString() + ",";
            }
            int index = output.LastIndexOf(",");
            output = output.Remove(index, 1);
            return Content(output);

        }
    }
}