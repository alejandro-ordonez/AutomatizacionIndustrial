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
        public bool V { get; set; }
        public PLC()
        {
            Plc= new Plc(CpuType.S71500, "172.18.4.1", 0, 1); //192.168.1.1
            V = false;
        }

        private Command<object> _CheckConnection;
        public Command<object> CheckConnection { get { return _CheckConnection ?? (_CheckConnection = new Command<object>((obj) => CheckCon(obj))); } }


        public void CheckCon(object o)
        {
            Debug.Write("You got it");
            Plc.Open();
            if (Plc.IsConnected)
            {
                Debug.WriteLine("Conectado");
                Status = "Conectado";
                Connected = true;
            }
            else { Connected = false; Status = "Desconectado"; }
        }
        public void Check()
        {
            V = !V;
            Debug.WriteLine("Here we are!"+V);
            Plc Plc2 = new Plc(CpuType.S71500, "172.18.4.1", 0, 1);
            Debug.WriteLine(Plc2.IsAvailable);
            Plc2.Open();
            Debug.WriteLine("Open connection");
            if (Plc2.IsConnected)
            {
                Debug.WriteLine("Conectado");
                Plc2.Write(DataType.DataBlock, 2, 0, V);
            }
            else
            {
                Debug.WriteLine("No es posible establecer la conexion");
            }
            Plc2.Close();
        }
    }
}
