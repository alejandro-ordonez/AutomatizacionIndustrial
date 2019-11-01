using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Text;

namespace AppPlanta.ViewModels
{
    public class BaseViewModel : AppPlanta.Models.BindableObject
    {
        bool isBusy = false;
        public bool IsBusy
        {
            get { return isBusy; }
            set { SetProperty(ref isBusy, value); }
        }

        string title = string.Empty;
        public string Title
        {
            get { return title; }
            set { SetProperty(ref title, value); }
        }


    }
}
