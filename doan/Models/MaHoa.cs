using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;

namespace doan.Models
{
    public class MaHoa
    {
        public static string encryptSHA256(string PlainText)
        {
            string result = "";

            // tạo đói tượng 
            using (SHA256 has = SHA256.Create())
            {
                byte[] sourceData = Encoding.UTF8.GetBytes(PlainText);
                byte[] hashResult = has.ComputeHash(sourceData);
                result= BitConverter.ToString(hashResult);
            }

            return result;
        }
    }
}