using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Services;
using System.Xml;

namespace MarkvarteLatvianWeatherNews.Examples
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string getCountry()
        {
            DataTable tbl = new DataTable();
            tbl.Columns.Add(new DataColumn("sityName", typeof(string)));

            DataRow dr = tbl.NewRow();
            dr["sityName"] = "Riga";
            tbl.Rows.Add(dr);
            tbl.AcceptChanges();

            return JsonConvert.SerializeObject(tbl);
        }

        [WebMethod]
        public string SendMail(string To, string Subject, string Body, string Pass)
        {
            if (Pass == "Test13579!")
            {
                MailMessage mail = new MailMessage();
                SmtpClient smtpClient = new SmtpClient(ConfigurationManager.AppSettings["mailhost"]);
                mail.From = new MailAddress(ConfigurationManager.AppSettings["mailfrom"]);
                mail.To.Add(To);
                mail.Subject = Subject;
                mail.Body = Body;
                mail.IsBodyHtml = true;

                smtpClient.Port = 2525;
                smtpClient.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["mailuser"],
                    ConfigurationManager.AppSettings["mailpass"]);
                smtpClient.EnableSsl = false;
                smtpClient.Send(mail);
                return "Mail sent";
            }
            else
            {
                return "Fail";
            }
        }

        [WebMethod]
        public string getWeatherByCity(string city)
        {
            string Url = $"https://api.openweathermap.org/data/2.5/weather?q={city}&lang=la&units=metric&appid=83b1e84532b0db55a73b3da1c292a98a&mode=xml&ln=lv";
            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.Load(Url);
            return xmlDocument.InnerXml;
        }
    }
}
