using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace AppPlanta.GUI
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Home : ContentPage
    {
        public Home ()
        {
            NavigationPage.SetHasNavigationBar(this, false);
            InitializeComponent ();
        }

        private async void Ok_Clicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new GUI.MainMenu());
        }

        private void about_Clicked(object sender, EventArgs e)
        {

        }
    }
}