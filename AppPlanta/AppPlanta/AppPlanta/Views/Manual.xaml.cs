using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppPlanta.Models;
using AppPlanta.Services;
using AppPlanta.ViewModels;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace AppPlanta.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Manual : ContentPage
    {
        public Manual ()
        {
            InitializeComponent();
            BindingContext = Startup.ServiceProvider.GetService<ManualModeViewModel>();           
        }
    }
}