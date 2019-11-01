using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppPlanta.Models;
using AppPlanta.ViewModels;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace AppPlanta.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class MainMenu : MasterDetailPage
    {
        public MainMenu()
        {
            InitializeComponent();
            NavigationPage.SetHasNavigationBar(this, false);
            BindingContext = Startup.ServiceProvider.GetService<MainMenuViewModel>();
            
        }
    }
}