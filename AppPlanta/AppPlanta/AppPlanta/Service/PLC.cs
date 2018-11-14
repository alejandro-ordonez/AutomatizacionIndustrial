using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using S7.Net;
using Xamarin.Forms;

namespace AppPlanta.Service
{
    public class PLC
    {
        public Plc Plc;
        public string Status { get; set; }
        public bool Connected { get; set; }
        public PLC()
        {
            Plc= new Plc(CpuType.S71500, "192.168.0.10", 0, 1); //192.168.1.1
        }

        private Command<object> _CheckConnection;
        public Command<object> CheckConnection { get { return _CheckConnection ?? (_CheckConnection = new Command<object>((obj) => CheckCon(obj))); } }


        public void CheckCon(object o)
        {
            Debug.Write("You got it");
            Plc.Open();
            if (Plc.IsConnected)
            {
                Status = "Conectado";
                Connected = true;
            }
            else { Connected = false; Status = "Desconectado"; }
        }
    }
}
