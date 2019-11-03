using System;
using System.Collections.Generic;
using System.Text;

namespace AppPlanta.Models
{
    public struct Reading
    {
        public bool Motor;
        public bool Valve;
        public bool Piston;
        public bool Inductive;
        public bool Optic;
        public bool Stop;
        public bool Automatic;
        public double Thermistor;
        public double Level;
    }
}
