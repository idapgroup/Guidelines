using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IDAP_TEST
{
    public class NumberToOrdinalUa : NumberToOrdinal
    {
        // Временное решение, в течении 2 дней заменю
        string result = "";
        protected override string convertHundreds(int hundreds, int tens, int classOfNumber)
        {
            if (!Number.isNull(classOfNumber))
            {
                switch (hundreds)
                {
                    case 0:
                        break;
                    case 1:
                        result = "сто";
                        break;
                    case 2:
                        result = Ordinal.getOnes(hundreds) + "істі";
                        break;
                    case 3:
                        result = Ordinal.getOnes(hundreds) + "ста";
                        break;
                    case 4:
                        result = Ordinal.getOnes(hundreds) + "ста";
                        break;
                    default:
                        result = Ordinal.getOnes(hundreds) + "сот";
                        break;
                }
                result += Ordinal.getTens(tens/10);
                if (tens > 19)
                {
                    result += Ordinal.getOnes(tens % 10);
                    createEndClasses(tens % 10, classOfNumber);
                }
                else
                {
                    result += Ordinal.getOnes(tens);
                    createEndClasses(tens, classOfNumber);
                    
                }
            }
            return result;
        }

        private void createEndClasses(int tens, int classOfNumber)
        {
            
            if(tens == 5 || tens == 6 || tens == 9)
            {
                result += "ь";
            }
            if (classOfNumber != 1)
            {
                if (classOfNumber == 0)
                {
                    switch (tens)
                    {
                        case 1:
                            result += "ин";
                            break;
                        case 2:
                            result += "а";
                            break;
                    }
                }
                else
                {
                    switch (tens)
                    {
                        case 1:
                            result += "ин" + Ordinal.getClass(classOfNumber);
                            break;
                        case 2:
                            result += "а" + Ordinal.getClass(classOfNumber) + "a";
                            break;
                        case 3:
                            result += Ordinal.getClass(classOfNumber) + "а";
                            break;
                        case 4:
                            result += Ordinal.getClass(classOfNumber) + "а";
                            break;
                        default:
                            result += Ordinal.getClass(classOfNumber) + "ів";
                            break;
                    }
                }
            }
            else
            {
                switch (tens)
                {
                    case 1:
                        result += "на " + Ordinal.getClass(classOfNumber) + "a";
                        break;
                    case 2:
                        result += "і " + Ordinal.getClass(classOfNumber) + "і";
                        break;
                    case 3:
                        result += Ordinal.getClass(classOfNumber) + "і";
                        break;
                    case 4:
                        result += Ordinal.getClass(classOfNumber) + "і";
                        break;
                    default:
                        result += Ordinal.getClass(classOfNumber);
                        break;
                }
            }
        }
    }
}
