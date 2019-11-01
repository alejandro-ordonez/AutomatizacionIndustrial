using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using Xamarin.Forms;
using AppPlanta.Views;
using System.Collections.ObjectModel;

namespace AppPlanta.Models
{
    public class Actuator:BindableObject
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }       
        public ImageSource Icon { get; set; }
        public string Address { get; set; }

        private bool _state;

        public bool State
        {
            get => _state;
            set => SetProperty(ref _state, value);
        }

        private Color _boxColor;

        public Color BoxColor
        {
            get => _boxColor;
            set => SetProperty(ref _boxColor, value);
        }
    }
}
