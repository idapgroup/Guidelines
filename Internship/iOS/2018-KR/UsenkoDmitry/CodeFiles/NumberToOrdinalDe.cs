using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IDAP_TEST
{
    class NumberToOrdinalDe : NumberToOrdinal
    {
        string result;
        private string checkOnes(int tens)
        {
            switch (tens)
            {
                case 0:
                    return "";
                case 7:
                    return Ordinal.getOnes(tens) + "en"; // Sieb - en -  te
                case 8:
                    return result = Ordinal.getOnes(tens) + "t"; // Ach - t - te
                default:
                    return result = Ordinal.getOnes(tens);
            }
        }

        protected override string convertHundreds(int hundreds, int tens, int classOfNumber)
        {
            result = "";
            switch (!Number.isNull(classOfNumber))//hundreds
            {
                case true:
                    switch (hundreds != 0)
                    {
                        case true:
                            result += checkOnes(hundreds) + Ordinal.getClassName(0);
                            switch (classOfNumber == 0 && tens == 0)
                            {
                                case true:
                                    result += "ste";
                                    break;
                            }
                            result += " ";
                            break;
                    }
                    switch (tens > 19) //tens
                    {
                        case true:
                            switch (tens % 10 != 0)
                            {
                                case true:
                                    result += Ordinal.getOnes(tens % 10) + "und";
                                    break;
                            }
                            result += Ordinal.getTens(tens / 10);
                            switch (tens % 10 == 0 || classOfNumber == 0)
                            {
                                case true:
                                    result += "ste ";
                                    break;
                            }
                            break;
                        case false:
                            switch (classOfNumber == 0)
                            {
                                case true:
                                    switch (tens)
                                    {
                                        case 1:
                                            result += Ordinal.getLastOnes(tens);
                                            break;
                                        case 3:
                                            result += Ordinal.getLastOnes(tens);
                                            break;
                                        default:
                                            result += Ordinal.getOnes(tens) + "te";
                                            break;
                                    }
                                    break;
                                case false:
                                    result += Ordinal.getOnes(tens);
                                    break;
                            }
                            break;
                    }
                    switch (classOfNumber > 0)// classes
                    {
                        case true:
                            result += Ordinal.getClassName(classOfNumber);
                            switch (Number.getLastClass() == classOfNumber)
                            {
                                case true:
                                    result += "ste ";
                                    break;
                                case false:
                                    switch (classOfNumber)
                                    {
                                        case 3:
                                            result += "en"; // milliard - en
                                            break;
                                    }
                                    result += " ";
                                    break;
                            }
                            break;
                    }
                    break;
            }
            return result;
        }
    }
}
