using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Text;
using System.Linq;
using System.Windows.Input;
using AppPlanta.Models;
using Xamarin.Forms;
using AppPlanta.Services;

namespace AppPlanta.ViewModels
{
    
    public class ManualModeViewModel:BaseViewModel
    {
        //Read on starting
        private readonly IPLCService service;

        public ObservableCollection<Actuator> LstActuators { get; set; }
        public ICommand ChangeStateCommand { get; set; }
        public ICommand RefreshConnection { get; set; }
        private bool _available;

        public bool Available
        {
            get => _available;
            set => SetProperty(ref _available, value);
        }

        private string _status;

        public string Status
        {
            get => _status;
            set => SetProperty(ref _status, value);
        }
        private string _exception;

        public string Exception
        {
            get => _exception;
            set => SetProperty(ref _exception, value);
        }
        public string Message { get; set; }

        public ManualModeViewModel(IPLCService service)
        {
            this.service = service;
            ChangeStateCommand = new Command<int>((id) => ChangeState(id));
            RefreshConnection = new Command(() => Init());
            ImageSource Valve = "Valve.jpg";
            ImageSource Pump = "Pump.jpg";
            ImageSource Piston = "Piston.jpg";
            LstActuators = new ObservableCollection<Actuator>
            {
                new Actuator { Id = 0, Name = "Motor",   Icon = Pump, State = false, Description = "Motor", BoxColor = Color.Red, Address="0" },
                new Actuator { Id = 1, Name = "Válvula", Icon = Valve, State = false, Description = "Valvula", BoxColor = Color.Red, Address="1" },
                new Actuator { Id = 2, Name = "Pistón",  Icon = Piston, State = false, Description = "Piston", BoxColor = Color.Red, Address="2" }
            };
            Init();
        }

        private async void Init()
        {
            Message = await service.CheckConnection();
            if (Message.Contains("No fue posible conectarse con el PLC") || Message.Contains("no pudo ser conectado"))
            {
                Status = "No Conectado";
                Available = false;
            }
            else 
            {
                Status = "Conectado";
                Available = true;
            }
            await Application.Current.MainPage.DisplayAlert("Aviso!", Message, "Ok");
        }

        private async void ChangeState(int id)
        {
            var actuator= LstActuators.Where(a => a.Id == id).FirstOrDefault();
            //actuator.State = await service.ReadBitAt(actuator.Address);
            await service.SetBitAt(actuator.Address, !actuator.State);
            actuator.State = !actuator.State;
            //actuator.State = await service.ReadBitAt(actuator.Address);
            actuator.BoxColor = actuator.State ? Color.Green : Color.Red;
        }
    }
}
