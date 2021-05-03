
using JooleProject_DAL;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace JooleRepository_Repository.Repositories
{
    public interface IPropertyRepo : IRepository<Property>
    {

    }
    public class PropertyRepo : Repository<Property>, IPropertyRepo
    {
        public PropertyRepo(DbContext context) : base(context)
        {

        }
    }
}