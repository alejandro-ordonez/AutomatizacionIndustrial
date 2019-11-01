﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace AppPlanta.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Home : ContentPage
    {
        public Home ()
        {
            NavigationPage.SetHasNavigationBar(this, false);
            InitializeComponent ();
        }

        private void Ok_Clicked(object sender, EventArgs e)
        {
            Application.Current.MainPage = new MainMenu();
        }
    }
}