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
        private readonly IPLCService service;

        public ObservableCollection<Actuator> LstActuators { get; set; }
        public ICommand ChangeStateCommand { get; set; }
        private string _status;

        public string Status
        {
            get => _status;
            set => SetProperty(ref _status, value);
        }


        public ManualModeViewModel(IPLCService service)
        {
            this.service = service;
            ChangeStateCommand = new Command<int>((id) => ChangeState(id));
            ImageSource Valve = "Valve.jpg";
            ImageSource Pump = "Pump.jpg";
            LstActuators = new ObservableCollection<Actuator>
            {
                new Actuator { Id = 0, Name = "Bomba 1", Icon = Pump, State = false, Description = "Valvula numero 1", BoxColor = Color.Red },
                new Actuator { Id = 1, Name = "Bomba 2", Icon = Pump, State = false, Description = "Valvula numero 2", BoxColor = Color.Red }
            };
            for (int i = 0; i < 10; i++)
            {
                LstActuators.Add(new Actuator {Id=i+2, Name = $"Valvula {i+2}", Icon = Valve, State = false, Description = $"Valvula numero {i+2}", BoxColor = Color.Red });
            }
            Init();
        }

        private async void Init()
        {
            Status = await service.CheckConnection();
        }

        private void ChangeState(int id)
        {
            var actuator= LstActuators.Where(a => a.Id == id).FirstOrDefault();
            actuator.State = !actuator.State;
            actuator.BoxColor = actuator.State ? Color.Green : Color.Red;
        }
    }
}
