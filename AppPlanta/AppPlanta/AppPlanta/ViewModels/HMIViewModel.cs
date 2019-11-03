using AppPlanta.Services;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Xamarin.Forms;

namespace AppPlanta.ViewModels
{
    public class HMIViewModel: BaseViewModel
    {
        //TODO: Add Stop command -> It should reset the state of the processs
        public ICommand AutomaticCommand { get; set; }
        private Color _isAutomatic =Color.Red;

        public Color IsAutomatic
        {
            get => _isAutomatic;
            set => SetProperty(ref _isAutomatic, value);
        }
        private Color _isStopped =Color.Red;

        public Color IsStopped
        {
            get => _isStopped;
            set => SetProperty(ref _isStopped, value);
        }

        private readonly IPLCService service;

        public HMIViewModel(IPLCService service)
        {
            this.service = service;
            AutomaticCommand = new Command<bool>(async (flag) => await SetAutomatic(flag));
        }

        private async Task SetAutomatic(bool flag)
        {
            await service.SetBitAt("6", flag);
            IsAutomatic = flag? Color.Green:Color.Red;
            IsStopped = !flag? Color.Green:Color.Red;
        }
    }
}
