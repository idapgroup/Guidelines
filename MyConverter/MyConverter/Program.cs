using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyConverter.Sources;

namespace MyConverter
{
    class Program
    {
        static void Main(string[] args)
        {
            string result = ConvertingManager.converter(Languages.ger).convertedValue(12315);
            Console.WriteLine(result);
            Console.ReadKey();
        }
    }
}
