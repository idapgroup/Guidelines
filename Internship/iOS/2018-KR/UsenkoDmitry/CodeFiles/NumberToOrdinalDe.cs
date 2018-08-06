using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IDAP_TEST
{
    class NumberToOrdinalDe : NumberToOrdinal
    {

        public NumberToOrdinalDe()//Ordinal ordinalObject)
        {
            //ordinal = ordinalObject;
        }

        string hundredsToOrdinal;


        private string checkOnes(int tens)
        {
            switch (tens)
            {
                case 0:
                    return "";
                case 7:
                    return Ordinal.getOnes(tens) + "en"; // Sieb - en -  te
                case 8:
                    return hundredsToOrdinal = Ordinal.getOnes(tens) + "t"; // Ach - t - te
                default:
                    return hundredsToOrdinal = Ordinal.getOnes(tens);
            }
        }


        protected override string convertHundreds(int hundreds, int tens, int classOfNumber)
        {
            hundredsToOrdinal = "";

            //hundreds
            if (!Number.isNull(classOfNumber))
            {
                switch (hundreds != 0)
                {
                    case true:
                        hundredsToOrdinal += checkOnes(hundreds) + Ordinal.getClass(0);
                        switch (classOfNumber == 0 && tens == 0)
                        {
                            case true:
                                hundredsToOrdinal += "ste ";
                                break;
                        }
                        break;
                }

                //tens
                if (tens > 19)
                {
                    if (tens % 10 != 0)
                    {
                        hundredsToOrdinal += Ordinal.getOnes(tens % 10) + "und";
                    }
                        hundredsToOrdinal += Ordinal.getTens(tens / 10);
                    if (tens % 10 == 0 || classOfNumber == 0)
                    {
                        hundredsToOrdinal += "ste ";
                    }
                }
                else
                {
                    if (classOfNumber == 0)
                    {
                        switch (tens)
                        {
                            case 1:
                                hundredsToOrdinal += Ordinal.getLastOnes(tens);
                                break;
                            case 3:
                                hundredsToOrdinal += Ordinal.getLastOnes(tens);
                                break;
                            default:
                                hundredsToOrdinal += Ordinal.getOnes(tens) + "te";
                                break;
                        }
                    }
                    else 
                        hundredsToOrdinal += Ordinal.getOnes(tens);
                }

                // classes
                switch (classOfNumber > 0)
                {
                    case true:
                        hundredsToOrdinal += Ordinal.getClass(classOfNumber);
                        switch (Number.getLastClass() == classOfNumber)
                        {
                            case true:
                                hundredsToOrdinal += "ste ";
                                break;
                            case false:
                                switch (classOfNumber)
                                {
                                    case 3:
                                        hundredsToOrdinal += "en"; // milliard - en
                                        break;
                                }
                                hundredsToOrdinal += " ";
                                break;
                        }
                        break;
                }
            }
            return hundredsToOrdinal;
        }
    }
}
