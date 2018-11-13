using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using Xamarin.Forms;
using AppPlanta.GUI;
using System.Collections.ObjectModel;

namespace AppPlanta.Models
{
    public class Actuador
    {
        public string Name { get; set; }
        public string Description { get; set; }       
        public bool State { get; set; }
        public ImageSource Icon { get; set; }
        public string Address { get; set; }
        public Color BoxColor { get; set; }

        private Command<object> _OnClickableImage;
        public Command<object> OnClickableImage
        {
            get { return _OnClickableImage ?? (_OnClickableImage = new Command<object>((currentObject) => Test(currentObject)));}
        }
        private void Test(object currentObject)
        {

            Debug.WriteLine("It works!!!!!!!!!!!!!!!!!!");
            Debug.WriteLine(this.Name);
            this.State = !this.State;
            if (this.State){ this.BoxColor = Color.Green; }
            else { this.BoxColor = Color.Red; }
        }

    }
}
