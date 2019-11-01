using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using AppPlanta.Models;
using AppPlanta.Views;
using Xamarin.Forms;

namespace AppPlanta.ViewModels
{
    public class MainMenuViewModel:BaseViewModel
    {
        public ICommand NavigateCommand { get; set; }
        public ObservableCollection<MainMenuItem> Items { get; set; }

        public MainMenuViewModel()
        {
            NavigateCommand = new Command<Type>((item) =>  NavigateTo(item));
            Items = new ObservableCollection<MainMenuItem>
            {
                new MainMenuItem { Id = 0, Title = "Manual", TargetType=typeof(ManualTab), Icon="Manual.png" },
                new MainMenuItem { Id = 1, Title = "Automatico", TargetType=typeof(Automatic), Icon="automatic.png"},
                new MainMenuItem { Id = 2, Title = "Informacion", TargetType=typeof(About), Icon="info.png" }
            };
        }

        private void NavigateTo(Type target)
        {
            (Application.Current.MainPage as MasterDetailPage).Detail =new NavigationPage((Page)Activator.CreateInstance(target));
            Debug.WriteLine("Command Working");
        }
    }
}
