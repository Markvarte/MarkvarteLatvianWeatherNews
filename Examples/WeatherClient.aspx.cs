using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarkvarteLatvianWeatherNews.Examples
{
    public partial class WeatherClient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            WebService1 proxy = new WebService1();
            string City = TextBox1.Text;
            string xml = proxy.getWeatherByCity(City);
            Xml1.DocumentContent = xml;
            Xml1.TransformSource = "~/Examples/XML/Weather.xslt";
        }
    }
}