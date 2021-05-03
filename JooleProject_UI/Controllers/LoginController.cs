using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using JooleProject_DAL;
using JooleService;

namespace JooleProject_UI.Controllers
{
    public class LoginController : Controller


    {

     

       
        // GET: Login
        public ActionResult Login()
        {

           
            return View();
        }

        //define this action as a post action
        [HttpPost]
        //action for post URL
        public ActionResult Authorize(JooleProject_DAL.User User)
        {
            using (JooleProject_DAL.JooleDatabaseEntities db = new JooleProject_DAL.JooleDatabaseEntities())
            {
                //FirstOrDefault(): Returns the first element of a sequence, or a default value if no element is found.
                var userDetails = db.User.Where(x => (x.User_Name == User.User_Name || x.User_Email == User.User_Email)
                && x.User_Password == User.User_Password).FirstOrDefault();

                if (userDetails == null)
                {
                    User.LoginErrorMessage = "Wrong username or password.";
                    return View("Login", User);
                }
                else
                {
                    Session["User_Name"] = userDetails.User_Name;
                    //redirect users to the appropriate landing page
                    return RedirectToAction("Search", "Search");
                }
            }
        }

        [HttpPost]
        public ActionResult Signup(User obj)
        {
            //create database context using Entity framework 
            using (var databaseContext = new JooleDatabaseEntities())
            {
                //If the model state is valid i.e. the form values passed the validation then we are storing the User's details in DB.
                User user = new User
                {
                    //Save all details in obj object
                    User_Name = obj.User_Name,
                    User_Email = obj.User_Email,
                    User_Password = obj.User_Password,
                                   
                   
                };

                databaseContext.User.Add(user);
                databaseContext.SaveChanges();
            }

            ViewBag.Message = "User Details Saved";
            return View("Login");
        }
    }
}