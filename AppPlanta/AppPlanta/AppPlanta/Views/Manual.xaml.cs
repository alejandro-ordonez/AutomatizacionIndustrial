using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppPlanta.Models;
using AppPlanta.Services;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace AppPlanta.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Manual : ContentPage
    {
        public string Status { get; set; }
        public Manual ()
        {
            InitializeComponent();
            
            CheckCon();
            
        }

        private async void TapGestureRecognizer_Tapped(object sender, EventArgs e)
        {
            ImageSource Valve = "Valve.jpg";
            var image = sender as Image;
            var Ac = image?.BindingContext as Actuador;
            Debug.WriteLine(Ac.Name);
            await image.FadeTo(0.3, 100);
            await image.FadeTo(1, 100);
            var up = this.BindingContext as ListActuatorViewModel;
            Debug.WriteLine(up?.MyProperty);
            up?.UpdateElement.Execute(Ac);
            lstData.ItemsSource = null;
            lstData.ItemsSource = up.LstActuators;
            

        }

        private void Button_Clicked(object sender, EventArgs e)
        {
            var bt = sender as Button;
            var ac = bt?.BindingContext as Actuador;
            var vm = BindingContext as ListActuatorViewModel;
            Debug.WriteLine(ac.Name);
            vm?.UpdateElement.Execute(ac);
            Debug.WriteLine(vm.MyProperty);


        }
        private async void CheckCon()
        {
            /*var ch = BindingContext as ListActuatorViewModel;
            ch?.CheckConnection.Execute(null);
            if (ch.connected)
            {
               await DisplayAlert("Alerta!", "El PLC o el dispositivo no está conectado", "Ok");
            }
            else { await DisplayAlert("Aviso", "El dispositivo está Conectado", "Ok"); }*/
        }
    }
}