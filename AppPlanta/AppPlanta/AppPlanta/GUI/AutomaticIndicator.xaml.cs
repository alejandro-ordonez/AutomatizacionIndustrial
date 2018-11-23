using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using S7.Net;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace AppPlanta.GUI
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class AutomaticIndicator : ContentPage
    {
        public Plc PLCS71500;
        public AutomaticIndicator()
        {
            InitializeComponent();
            PLCS71500= new Plc(CpuType.S71500, "172.18.4.1", 0, 1);
            Device.StartTimer(TimeSpan.FromSeconds(1), UpdateTermos);
        }
        private bool UpdateTermos()
        {
            PLCS71500.Open();

            /*
            Random rn = new Random();
            Termo1.Value = rn.Next(-40, 150);
            Termo2.Value = rn.Next(-40, 150);
            Termo3.Value = rn.Next(-40, 150);
            Termo4.Value = rn.Next(-40, 150);*/
            Datos data = (Datos)PLCS71500.ReadStruct(typeof(Datos), 2, 2);
            Termo1.Value = data.Termo1;
            Termo2.Value = data.Termo2;
            PLCS71500.Close();
            return true;
        }
    }
    public struct Datos
    {
        public double Termo1;
        public double Termo2;
    }

}