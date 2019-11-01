using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using System.Threading.Tasks;
using AppPlanta.Models;
using S7.Net;
using Xamarin.Forms;

namespace AppPlanta.Services
{
    public class PLCService:IPLCService
    {
        private Plc Plc { get; set; }
        public PLCService()
        {
            Plc= new Plc(CpuType.S71500, "172.18.4.1", 0, 1); //192.168.1.1
        }

        public async Task<string> CheckConnection()
        {
            try
            {
                await Plc.OpenAsync();
            }
            catch(Exception e)
            {
                return $"No fue posible conectarse con el PLC {Plc.IP}\n Se produjo la siguiente excepcion:{e}";
            }
            if (Plc.IsConnected)
            {
                return $"PLC {Plc.IP} Conectado y listo";
            }
            else { return $"El Plc {Plc.IP} es accesible, pero no pudo ser conectado"; }
        }

        public Task<bool> SetBitAt()
        {
            throw new NotImplementedException();
        }

        public Reading GetReadings()
        {
            throw new NotImplementedException();
        }
    }
}
