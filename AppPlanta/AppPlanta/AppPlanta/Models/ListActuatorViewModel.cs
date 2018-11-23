using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using Xamarin.Forms;
using S7.Net;
using AppPlanta.Service;

namespace AppPlanta.Models
{
    public class ListActuatorViewModel
    {
        public PLC PlCS71500 = new PLC();
        public ObservableCollection<Actuador> lstActuators { get; set; }
        public int MyProperty { get; set; }
        private Command<Actuador> _UpdateElement;
        public ListActuatorViewModel()
        {
            ImageSource Valve = "Valve.jpg";
            ImageSource Pump = "Pump.jpg";
            lstActuators = new ObservableCollection<Actuador>()
            {
                new Actuador{ Name="Bomba 1", Icon= Pump, State=false, Description= "Valvula numero 1", BoxColor=Color.Green},
                new Actuador{ Name="Bomba 2", Icon= Pump, State=false, Description= "Valvula numero 2", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 1", Icon= Valve, State=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 2", Icon= Valve, State=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 3", Icon= Valve, State=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 4", Icon= Valve, State=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 5", Icon= Valve, State=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 6", Icon= Valve, State=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 7", Icon= Valve, State=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 8", Icon= Valve, State=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 9", Icon= Valve, State=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 10", Icon= Valve, State=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 11", Icon= Valve, State=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 12", Icon= Valve, State=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 13", Icon= Valve, State=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 14", Icon= Valve, State=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 15", Icon= Valve, State=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 16", Icon= Valve, State=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 17", Icon= Valve, State=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 18", Icon= Valve, State=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 19", Icon= Valve, State=false, Description= "Valvula numero 1", BoxColor=Color.Red},
                new Actuador{ Name="Valvula 20", Icon= Valve, State=false, Description= "Valvula numero 1", BoxColor=Color.Red},
            };
        }
        public Command<Actuador> UpdateElement
        {
            get { return _UpdateElement?? (_UpdateElement = new Command<Actuador>((actuador) => ChangeColor(actuador))); }
        }

        public void ChangeColor(Actuador a)
        {
            Actuador x = new Actuador { Name = "Guardando.." };
            Debug.WriteLine("Working...");
            var act = lstActuators.FirstOrDefault(Actuador => Actuador == a);
            int i = lstActuators.IndexOf(act);
            Debug.WriteLine(lstActuators[i].State);
            lstActuators[i].State = !lstActuators[i].State;
            PlCS71500.Check();
            Debug.WriteLine(lstActuators.FirstOrDefault(Actuador => Actuador == a).State);
            if (lstActuators.FirstOrDefault(Actuador => Actuador == a).State)
            {
                lstActuators[i].BoxColor = Color.Green;

            }
            else
            {
                lstActuators.FirstOrDefault(Actuador => Actuador == a).BoxColor = Color.Red;
            }
            
        }

    }
}
