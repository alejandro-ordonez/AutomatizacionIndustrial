using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppPlanta.ViewModels;
using S7.Net;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace AppPlanta.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class HMI : ContentPage
    {
        public bool Start { get; set; }
        public bool Stop { get; set; }
        public bool Emergency { get; set; }
        public Plc PLCS71500;
        public HMI()
        {
            InitializeComponent();
            BindingContext = Startup.ServiceProvider.GetService<HMIViewModel>();
        }

    }
}