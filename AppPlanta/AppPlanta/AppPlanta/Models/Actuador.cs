using System;
using System.Collections.Generic;
using System.Text;
using Xamarin.Forms;

namespace AppPlanta.Models
{
    public class Actuador
    {
        public string Name { get; set; }
        public string Description { get; set; }       
        public bool Satate { get; set; }
        public ImageSource Icon { get; set; }
        public string Address { get; set; }
        public Color BoxColor { get; set; }
    }
}
