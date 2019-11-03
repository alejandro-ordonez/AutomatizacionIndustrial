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
        private readonly string BaseAdress="Datos.";
        public PLCService()
        {
            Plc= new Plc(CpuType.S71200, "192.168.0.80", 0, 1); //192.168.1.1
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

        public async Task<bool> SetBitAt(string adress, bool state)
        {
            try
            {
                //await PLCS71500.WriteBitAsync(DataType.DataBlock, 2, 1, 0, !Start);
                await Plc.WriteBitAsync(DataType.DataBlock,1,0,int.Parse(adress), state);
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
            
        }

        public Reading GetReadings()
        {
            return (Reading)Plc.ReadStruct<Reading>(1);
        }

        public async Task<bool> ReadBitAt(string adress)
        {
            
            return (bool)await Plc.ReadAsync($"{BaseAdress}{adress}");
        }
    }
}
