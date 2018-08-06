using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IDAP_TEST
{
    public class NumberToOrdinalEng : NumberToOrdinal
    {

        string hundredsToOrdinal;

        private string checkOnes(int tens)
        {
            switch (tens)
            {
                case 0:
                    return "";
                case 8:
                    return Ordinal.getOnes(tens) + "t "; // eigh - t - th
                case 9:
                    return hundredsToOrdinal = Ordinal.getOnes(tens) + "e"; // nin - e - th
                default:
                    return hundredsToOrdinal = Ordinal.getOnes(tens);
            }
        }

        protected override string convertHundreds(int hundreds, int tens, int classOfNumber)
        {
            hundredsToOrdinal = "";
            // Hundreds
            if (!Number.isNull(classOfNumber))
            {
                switch (hundreds != 0)
                {
                    case true:
                        hundredsToOrdinal += checkOnes(hundreds) + Ordinal.getClass(0);
                        switch (classOfNumber == 0 && tens == 0)
                        {
                            case true:
                                hundredsToOrdinal += "th";
                                break;
                        }
                        break;
                }
                //Tens
                if (tens > 19)
                {
                    hundredsToOrdinal += Ordinal.getTens(tens / 10);
                    if (classOfNumber == 0) // if last hundred
                    {
                        if (tens % 10 != 0)
                        {
                            hundredsToOrdinal += "y";
                            if (tens % 10 < 5)
                            {
                                hundredsToOrdinal += Ordinal.getLastOnes(tens % 10);
                            }
                            else
                                hundredsToOrdinal += Ordinal.getOnes(tens % 10) + "th";
                        }
                        else
                            hundredsToOrdinal += "ieth";
                    }
                    else
                    {
                        hundredsToOrdinal += "y";
                        hundredsToOrdinal += checkOnes(tens % 10);
                    }
                }
                else
                {
                    if (classOfNumber == 0) // if last hundred
                    {
                        if (tens < 5)
                        {
                            hundredsToOrdinal += Ordinal.getLastOnes(tens);
                        }
                        else
                            hundredsToOrdinal += Ordinal.getOnes(tens) + "th";
                    }
                    else
                    {
                        hundredsToOrdinal += checkOnes(tens);
                    }
                }
                // Names of number classes
                switch (classOfNumber > 0)
                {
                    case true:
                        hundredsToOrdinal += Ordinal.getClass(classOfNumber);
                        switch (Number.getLastClass() == classOfNumber)
                        {
                            case true:
                                hundredsToOrdinal += "th";
                                break;
                        }
                        break;
                }
            }
            return hundredsToOrdinal;
        }
    }
}
