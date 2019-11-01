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
            Device.StartTimer(TimeSpan.FromMilliseconds(100), () =>
            {
                Task.Factory.StartNew(async () =>
                {
                    await UpdateReadings();
                });
                return false;
            });
        }

        private async Task UpdateReadings()
        {
            var res = await service.GetReadingsAsync();
            Therm1 = res.Termo1;
            Therm2 = res.Termo2;
        }
    }
}
