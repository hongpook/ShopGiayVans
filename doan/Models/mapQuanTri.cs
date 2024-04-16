using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace doan.Models
{
    public class mapQuanTri
    {
        public quanTri ChiTiet(string Email)
        {
            try
            {
                ShopGiayVansEntities2 db = new ShopGiayVansEntities2();

                var model = db.quanTri.SingleOrDefault(x => x.email == Email.ToLower());
                return model;
            }
            catch
            {
                return null;
            }
        }
    }
}