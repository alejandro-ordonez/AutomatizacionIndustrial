using System;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

[assembly: XamlCompilation(XamlCompilationOptions.Compile)]
namespace AppPlanta
{
    public partial class App : Application
    {
        public App()
        {
            //Register Syncfusion license
            Syncfusion.Licensing.SyncfusionLicenseProvider.RegisterLicense("NDMxMDlAMzEzNjJlMzMyZTMwSi8wdGhPRjFjMlhoNFVDdEhoWUUvdG16OXNQVitaRFF1NzU1RTdrTGQwaz0=");
            InitializeComponent();

            MainPage = new NavigationPage(new GUI.Home());
        }

        protected override void OnStart()
        {
            // Handle when your app starts
        }

        protected override void OnSleep()
        {
            // Handle when your app sleeps
        }

        protected override void OnResume()
        {
            // Handle when your app resumes
        }
    }
}
