
using JooleProject_DAL;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace JooleRepository_Repository.Repositories
{
    public interface IProductRepo : IRepository<Product>
    {

    }

    public class ProductRepo : Repository<Product>, IProductRepo
    {
        public ProductRepo(DbContext context) : base(context)
        {

        }
    }
}