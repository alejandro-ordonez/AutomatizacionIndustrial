using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppPlanta.Views;
using Xamarin.Forms;

namespace AppPlanta.Models
{

    public class MainMenuItem
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Icon { get; set; }
        public Type TargetType { get; set; }
    }
}