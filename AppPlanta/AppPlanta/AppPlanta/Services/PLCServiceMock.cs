using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using AppPlanta.Models;

namespace AppPlanta.Services
{
    public class PLCServiceMock : IPLCService
    {
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
                Termo1 = Rand.Next(0, 100),
                Termo2 = Rand.Next(0,100)
            };
            return reading;
        }

        public Task<bool> SetBitAt()
        {
            throw new NotImplementedException();
        }
    }
}
