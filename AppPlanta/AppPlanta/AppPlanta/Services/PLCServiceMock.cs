using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using AppPlanta.Models;

namespace AppPlanta.Services
{
    public class PLCServiceMock : IPLCService
    {
        public bool State { get; set; }
        private Random Rand { get; set; }
        public PLCServiceMock()
        {
            Rand = new Random();
        }
        public async Task<string> CheckConnection()
        {
            await Task.Delay(100);
            return "Conectado";
        }

        public Reading GetReadings()
        {
            Reading reading = new Reading
            {
                Thermistor = Rand.Next(0, 100),
                Level = Rand.Next(0,100)
            };
            return reading;
        }

        public async Task<bool> SetBitAt(string adress, bool state)
        {
            await Task.Delay(100);
            return State = !State;
        }

        public async Task<bool> ReadBitAt(string adress)
        {
            await Task.Delay(100);
            return State;
        }
    }
}
