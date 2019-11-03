using AppPlanta.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace AppPlanta.Services
{
    public interface IPLCService
    {
        Task<string> CheckConnection();
        Task<bool> SetBitAt(string adress, bool state);
        Reading GetReadings();
        Task<bool> ReadBitAt(string adress);
    }
}
