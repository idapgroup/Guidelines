using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IDAP_TEST
{
    public abstract class NumberToOrdinal
    {
        
        public string convert()
        {
            string result = "";
            if (Number.getLastClass() == 10) return LanguageSettings.zero;
            result += convertHundreds(Number.getHundred(4), Number.getTens(4), 4);
            result += convertHundreds(Number.getHundred(3), Number.getTens(3), 3);
            result += convertHundreds(Number.getHundred(2), Number.getTens(2), 2);
            result += convertHundreds(Number.getHundred(1), Number.getTens(1), 1);
            result += convertHundreds(Number.getHundred(0), Number.getTens(0), 0);
            return result;
        }
        protected abstract string convertHundreds(int hundreds, int tens, int classOfNumber);
    }
}
