using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarkvarteLatvianWeatherNews.WeatherHelpFiles
{

    public class DDLItem
    {
        public long id { get; set; }
        public string name { get; set; }
        public string state { get; set; }
        public string country { get; set; }
        public Coord coord { get; set; }

    }

}