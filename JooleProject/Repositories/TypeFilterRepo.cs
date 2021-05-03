﻿using JooleProject_DAL;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace JooleRepository_Repository.Repositories
{
    public interface ITypeFilterRepo : IRepository<TypeFilter>
    {

    }

    public class TypeFilterRepo : Repository<TypeFilter>, ITypeFilterRepo
    {
        public TypeFilterRepo(DbContext context) : base(context)
        {

        }
    }
}