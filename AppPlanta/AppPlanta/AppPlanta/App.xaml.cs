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
            Syncfusion.Licensing.SyncfusionLicenseProvider.RegisterLicense("MTU0MDcxQDMxMzcyZTMzMmUzMFZPcGswa0ljV2tvYi9ZTURpeWZOclk2dFZDV3dWcDZSYjY4TjR6MnlCRlk9");
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
