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
    public partial class AutomaticIndicator : ContentPage
    {
        public AutomaticIndicator()
        {
            InitializeComponent();
            BindingContext = Startup.ServiceProvider.GetService<AutomaticViewModel>();
        }
    }

}