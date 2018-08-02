using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IDAP_TEST
{
    public class LongToOrdinalUkr
    {

        private static string[] tensMap = new string[] {
            "",
            "",
            " двадцять",
            " тридцять",
            " сорок",
            " п'ятдесят",
            " шістдесят",
            " сімдесят",
            " вісімдесят",
            " дев'яносто"
        };

        private static string[] hundredsMap = new string[] {
            "",
            " сто",
            " двісті",
            " триста",
            " чотириста",
            " п'ятсот",
            " шістсот",
            " сімсот",
            " вісімсот",
            " дев'ятсот"
        };

        private static string[] unitsMap = new string[] {
            "",
            " тисяч",
            " мільон",
            " мільярд",
            " трильйон"
        };

        private static string[] onesMap = new string[] {
            "",
            " один",
            " два",
            " три",
            " чотири",
            " п’ять",
            " шість",
            " сім",
            " вісім ",
            " дев’ять",
            " десять",
            " одинадцять",
            " дванадцять",
            " тринадцять",
            " чотирнадцять",
            " п'ятнадцять",
            " шістнадцять",
            " сімнадцять",
            " вісімнадцять",
            " дев’ятнадцять"
        };

        private static string[] thousendsMap = new string[]
        {
            " одна",
            " дві"
        };

        private static string[] endings = new string[]
        {
            "и",
            "ів",
            "а",
            "і"
        };

        private static string convertHundreds(long number)
        {
            string result = "";

            if (number != 0)
            {
                long tens = number % 100;
                result = hundredsMap[number / 100];
                result += tensMap[tens/10];

                if (tens > 19)
                {
                    result += onesMap[tens % 10];
                }
                else
                {
                    result += onesMap[tens];
                }
            }
            return result;
        }

        public static string createEnd(long number, string unit)
        {
            long tens = number % 100;

            if (number != 0)
            {

                if (tens/10 != 1 && tens%10 < 5 && tens % 10 != 0)
                {
                    if (tens%10 != 1)
                        return unit + endings[0];
                    else
                        return unit;
                }
                else
                {
                    return unit + endings[1];
                }
            }
            else return "";
        }

        public static string convertThousends(long number)
        {
            string result = "";

            if (number != 0)
            {
                long tens = number % 100;

                result = hundredsMap[number / 100];
                result += tensMap[tens / 10];

                if (tens / 10 != 1)
                {
                    if (tens % 10 < 5)
                    {
                        switch (tens % 10)
                        {
                            case 0:
                                result += unitsMap[1];
                                break;
                            case 1:
                                result += thousendsMap[0] + unitsMap[1] + endings[2];
                                break;
                            case 2:
                                result += thousendsMap[1] + unitsMap[1] + endings[3];
                                break;
                            default:
                                result += onesMap[tens % 10] + unitsMap[1] + endings[3];
                                break;
                        };
                    }
                    else result += onesMap[tens % 10] + unitsMap[1];
                }
                else result += onesMap[tens] + unitsMap[1];
            }
            return result;
        }

        public static string convert(long number)
        {
            string ordinal = "";
            if (number == 0) { return "нуль"; }
            long hundreds = number % 1000;
            number /= 1000;
            long thousands = number % 1000;
            number /= 1000;
            long millions = number % 1000;
            number /= 1000;
            long billions = number % 1000;
            number /= 1000;
            long trillions = number % 1000;
            ordinal += convertHundreds(trillions) + createEnd(trillions, unitsMap[4]);
            ordinal += convertHundreds(billions) + createEnd(billions, unitsMap[3]);
            ordinal += convertHundreds(millions) + createEnd(millions, unitsMap[2]);
            ordinal += convertThousends(thousands);
            ordinal += convertHundreds(hundreds);
            return ordinal;
        }
    }
}
