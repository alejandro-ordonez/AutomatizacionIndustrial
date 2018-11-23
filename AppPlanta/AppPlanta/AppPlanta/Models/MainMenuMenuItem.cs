﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppPlanta.GUI;
using Xamarin.Forms;

namespace AppPlanta.Models
{

    public class MainMenuMenuItem
    {
        public MainMenuMenuItem()
        {
            TargetType = typeof(MainMenuDetail);
        }
        public int Id { get; set; }
        public string Title { get; set; }
        public ImageSource Icon { get; set; }
        public Type TargetType { get; set; }
    }
}