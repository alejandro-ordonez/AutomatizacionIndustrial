using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppPlanta.Models;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace AppPlanta.GUI
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Manual : TabbedPage
    {

        public Manual ()
        {
            InitializeComponent();
        }

        private async void TapGestureRecognizer_Tapped(object sender, EventArgs e)
        {
            ImageSource Valve = "Valve.jpg";
            var image = sender as Image;
            var Ac = image?.BindingContext as Actuador;
            Ac.OnClickableImage.Execute(image);
            Debug.WriteLine(Ac.Name);
            await image.FadeTo(0.3, 100);
            await image.FadeTo(1, 100);
            var up = this.BindingContext as ListActuatorViewModel;
            Debug.WriteLine(up?.MyProperty);
            up?.UpdateElement.Execute(Ac);

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
    }
}