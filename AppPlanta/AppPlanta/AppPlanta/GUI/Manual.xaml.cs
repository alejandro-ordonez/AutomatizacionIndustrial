using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
        public ObservableCollection<Actuador> lstActuators;
        public Manual ()
        {
            InitializeComponent();
        }
        public void setList()
        {
            ImageSource Valve = "";
            ImageSource Pump = "";
            lstActuators = new ObservableCollection<Actuador>()
            {
                new Actuador{ Name="Bomba 1", Icon= Pump, Satate=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Bomba 2", Icon= Pump, Satate=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 1", Icon= Valve, Satate=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 2", Icon= Valve, Satate=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 3", Icon= Valve, Satate=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 4", Icon= Valve, Satate=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 5", Icon= Valve, Satate=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 6", Icon= Valve, Satate=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 7", Icon= Valve, Satate=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 8", Icon= Valve, Satate=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 9", Icon= Valve, Satate=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 10", Icon= Valve, Satate=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 11", Icon= Valve, Satate=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 12", Icon= Valve, Satate=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 13", Icon= Valve, Satate=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 14", Icon= Valve, Satate=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 15", Icon= Valve, Satate=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 16", Icon= Valve, Satate=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 17", Icon= Valve, Satate=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 18", Icon= Valve, Satate=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 19", Icon= Valve, Satate=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 20", Icon= Valve, Satate=false, Description= "Valvula numero 1", BoxColor=Color.Red},
            };
        }
    }
}