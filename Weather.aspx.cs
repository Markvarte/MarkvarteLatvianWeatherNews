using MarkvarteLatvianWeatherNews.WeatherHelpFiles;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace MarkvarteLatvianWeatherNews
{
    public partial class Weather : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Load data for the DropDownList control only once, when the 
            // page is first loaded.
            if (!IsPostBack)
            { 
                var jsonPath = Server.MapPath("~\\WeatherHelpFiles\\city.list.json");
                var json = File.ReadAllText(jsonPath);
                DDLItemList dropdownlistJsonItem = JsonConvert.DeserializeObject<DDLItemList>(json);
                    foreach(DDLItem ddlItem in dropdownlistJsonItem.data)
                    {
                       if (ddlItem.country == "LV")
                       {
                        this.DropDownList1.Items.Add(new ListItem(ddlItem.name));
                       }
                    }

            }
        }

        protected void ShowCurrentSityWeather(object sender, EventArgs e)
        {
            HttpResponseMessage rez = getCurrentSityWeather(DropDownList1.SelectedItem.Value);
            string json = rez.Content.ReadAsStringAsync().Result;
            // Get classes from JSON
            DeserializedReceivedWeather myDeserializedClass = JsonConvert.DeserializeObject<DeserializedReceivedWeather>(json);
            myDeserializedClass.weather.ForEach(x => x.icon = "http://openweathermap.org/img/wn/" + x.icon + "@2x.png");

            // Display url somehow
            foreach (WeatherHelpFiles.Weather weateher in myDeserializedClass.weather)
            {
                Image1.ImageUrl = weateher.icon;
                // GridView1.BackImageUrl = weateher.icon;
            }
            // Fill in weather table
            GridView1.DataSource = myDeserializedClass.weather;
            GridView1.DataBind();

            // Fill in coord table
            List < Coord > coordList = new List<Coord>();
            coordList.Add(myDeserializedClass.coord);
            GridView2.DataSource = coordList; 
            GridView2.DataBind();

            // Fill in main table
            List<Main> mainList = new List<Main>();
            mainList.Add(myDeserializedClass.main);
            GridView3.DataSource = mainList;
            GridView3.DataBind();

            // Fill in Wind table
            List<Wind> windList = new List<Wind>();
            windList.Add(myDeserializedClass.wind);
            GridView4.DataSource = windList;
            GridView4.DataBind();

            // Fill in sys table
            List<Sys> sysList = new List<Sys>();
            sysList.Add(myDeserializedClass.sys);
            GridView5.DataSource = sysList;
            GridView5.DataBind();
        }

        public HttpResponseMessage getCurrentSityWeather(string selectedVal)
        {
            string url = "https://api.openweathermap.org/data/2.5/weather?q=" + selectedVal + "&lang=la&units=metric&appid=83b1e84532b0db55a73b3da1c292a98a&mode=json";

            using (HttpClient client = new HttpClient())
            {
                Task<HttpResponseMessage> task = client.GetAsync(url);
                HttpResponseMessage msg = task.Result;
                task.Wait(3000); // wait for 3 second 
                return task.Result;
            }
        }
    }
}