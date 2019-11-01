using AppPlanta.Services;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace AppPlanta.ViewModels
{
    public class AutomaticViewModel : BaseViewModel
    {
        private readonly IPLCService service;
        private double _therm1;

        public double Therm1
        {
            get => _therm1;
            set => SetProperty(ref _therm1, value);
        }
        private double _therm2;

        public double Therm2
        {
            get => _therm2;
            set => SetProperty(ref _therm2, value);
        }

        public AutomaticViewModel(IPLCService service)
        {
            this.service = service;
            Device.StartTimer(TimeSpan.FromSeconds(2), () =>
            {
                UpdateReadings();
                return true;
            });
        }

        private void UpdateReadings()
        {
            var res = service.GetReadings();
            Therm1 = res.Termo1;
            Therm2 = res.Termo2;
        }
    }
}
