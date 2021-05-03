using JooleRepository_Repository.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.Entity;

namespace JooleProject 
{
    public class UnitOfWork : IDisposable
    {
        DbContext Context;
        public IProductRepo Product;
        public ITypeFilterRepo TypeFilter;
        public ISubCategoryRepo SubCategory;
        public ITechSpecFilterRepo TechSpecFilter;
        public IPropertyRepo Property;
        public ICategoryRepo Category;
        public IPropertyValueRepo PropertyValue;
        /*public IUserRepo user;*/

        public UnitOfWork(DbContext context)
        {
            this.Context = context;
            Product = new ProductRepo(Context);
            TypeFilter = new TypeFilterRepo(Context);
            SubCategory = new SubCategoryRepo(Context);
            TechSpecFilter = new TechSpecFilterRepo(Context);
            Property = new PropertyRepo(Context);
            PropertyValue = new PropertyValueRepo(Context);
            Category = new CategoryRepo(Context);
            /*user = new UserRepo(Context);*/
        }
        public void SaveChanges()
        {
            Context.SaveChanges();
        }
        public void Dispose()
        {
            throw new NotImplementedException();
        }
    }
}