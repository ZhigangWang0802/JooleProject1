using JooleProject_DAL;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace JooleRepository_Repository.Repositories
{
    public interface IPropertyValueRepo : IRepository<PropertyValue>
    {

    }
    public class PropertyValueRepo : Repository<PropertyValue>, IPropertyValueRepo
    {
        public PropertyValueRepo(DbContext context) : base(context)
        {

        }
    }
}