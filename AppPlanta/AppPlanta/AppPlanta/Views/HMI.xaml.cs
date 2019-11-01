using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using S7.Net;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace AppPlanta.Views
{
	[XamlCompilation(XamlCompilationOptions.Compile)]
	public partial class HMI : ContentPage
	{
		public bool Start { get; set; }
		public bool Stop { get; set; }
		public bool Emergency { get; set; }
		public Plc PLCS71500;
		public HMI ()
		{
			InitializeComponent ();
			//PLCS71500= new Plc(CpuType.S71500, "172.18.4.1", 0, 1);
			//Device.StartTimer(TimeSpan.FromSeconds(2), UpdateStates);
		}

		private async void  Start_Tapped(object sender, EventArgs e)
		{
			await PLCS71500.OpenAsync();
			var image = sender as Image;
			await image.FadeTo(0.3, 100);
			await image.FadeTo(1, 100);
			await PLCS71500.WriteBitAsync(DataType.DataBlock, 2, 1, 0, !Start );
			PLCS71500.Close();
		}

		private async void Stop_Tapped(object sender, EventArgs e)
		{
			await PLCS71500.OpenAsync();
			var image = sender as Image;
			await image.FadeTo(0.3, 100);
			await image.FadeTo(1, 100);
			await PLCS71500.WriteBitAsync(DataType.DataBlock, 2, 1, 0, !Start);
			PLCS71500.Close();
		}

		private async void Emergency_Tapped(object sender, EventArgs e)
		{
			await PLCS71500.OpenAsync();
			var image = sender as Image;
			await image.FadeTo(0.3, 100);
			await image.FadeTo(1, 100);
			await PLCS71500.WriteBitAsync(DataType.DataBlock, 2, 1, 0, !Start);
			PLCS71500.Close();
		}
		private bool UpdateStates()
		{
			/*PLCS71500.OpenAsync();
			States states = (States)PLCS71500.ReadStruct(typeof(States), 2);
			Start = states.Start;
			Stop = states.Stop;
			Emergency = states.Emergency;
			PLCS71500.Close();*/
			return true;
		}
	}
	public struct States
	{
		public bool Start;
		public bool Stop;
		public bool Emergency;
	}
}