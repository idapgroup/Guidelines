using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IDAP_TEST
{
    public class NumberToOrdinalEng : NumberToOrdinal
    {
        string result;
        private string checkOnes(int tens)
        {
            switch (tens)
            {
                case 0:
                    return "";
                case 8:
                    return Ordinal.getOnes(tens) + "t "; // eigh - t - th
                case 9:
                    return result = Ordinal.getOnes(tens) + "e"; // nin - e - th
                default:
                    return result = Ordinal.getOnes(tens);
            }
        }

        protected override string convertHundreds(int hundreds, int tens, int classOfNumber)
        {
            result = "";
            switch (!Number.isNull(classOfNumber))
            {
                case true:
                    switch (hundreds != 0)//hundreds
                    {
                        case true:
                            result += checkOnes(hundreds) + Ordinal.getClassName(0);
                            switch (classOfNumber == 0 && tens == 0)
                            {
                                case true:
                                    result += "th";
                                    break;
                            }
                            break;
                    }
                    switch (tens > 19)//Tens
                    {
                        case true:
                            result += Ordinal.getTens(tens / 10);
                            switch (classOfNumber == 0) // if last hundred
                            {
                                case true:
                                    switch (tens % 10 != 0)
                                    {
                                        case true:
                                            result += "y";
                                            switch (tens % 10 < 5)
                                            {
                                                case true:
                                                    result += Ordinal.getLastOnes(tens % 10);
                                                    break;
                                                case false:
                                                    result += Ordinal.getOnes(tens % 10) + "th";
                                                    break;
                                            }
                                            break;
                                        case false:
                                            result += "ieth";
                                            break;
                                    }
                                    break;
                                case false:
                                    result += "y";
                                    result += checkOnes(tens % 10);
                                    break;
                            }
                            break;
                        case false:
                            switch (classOfNumber == 0) // if last hundred
                            {
                                case true:
                                    switch (tens < 5)
                                    {
                                        case true:
                                            result += Ordinal.getLastOnes(tens);
                                            break;
                                        case false:
                                            result += Ordinal.getOnes(tens) + "th";
                                            break;
                                    }
                                    break;
                                case false:
                                    result += checkOnes(tens);
                                    break;
                            }
                            break;
                    }
                    switch (classOfNumber > 0) // Names of number classes
                    {
                        case true:
                            result += Ordinal.getClassName(classOfNumber);
                            switch (Number.getLastClass() == classOfNumber)
                            {
                                case true:
                                    result += "th";
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