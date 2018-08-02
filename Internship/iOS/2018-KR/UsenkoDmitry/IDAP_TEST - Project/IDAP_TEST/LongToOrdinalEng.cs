using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IDAP_TEST
{
    public class LongToOrdinal
    {

        private static string[] tensMap = {
            "",
            "",
            LanguageSettings.twenty,
            LanguageSettings.thirty,
            LanguageSettings.forty,
            LanguageSettings.fifty,
            LanguageSettings.sixty,
            LanguageSettings.seventy,
            LanguageSettings.eighty,
            LanguageSettings.ninety
        };

        private static string[] unitsMap = {
            LanguageSettings.hundred,
            LanguageSettings.thousand,
            LanguageSettings.million,
            LanguageSettings.billion,
            LanguageSettings.trillion
        };

        private static string[] onesMap = {
            "",
            LanguageSettings.one,
            LanguageSettings.two,
            LanguageSettings.three,
            LanguageSettings.four,
            LanguageSettings.five,
            LanguageSettings.six,
            LanguageSettings.seven,
            LanguageSettings.eight,
            LanguageSettings.nine,
            LanguageSettings.ten,
            LanguageSettings.eleven,
            LanguageSettings.twelve,
            LanguageSettings.thirteen,
            LanguageSettings.fourteen,
            LanguageSettings.fifteen,
            LanguageSettings.sixteen,
            LanguageSettings.seventeen,
            LanguageSettings.eighteen,
            LanguageSettings.nineteen
        };

        private static string[] onesLastMap = {
            "",
            LanguageSettings.first,
            LanguageSettings.second,
            LanguageSettings.third,
            LanguageSettings.fourth,
            LanguageSettings.fifth
        };

        private static string[] ending = {
            LanguageSettings.eding0, // th
            LanguageSettings.eding1, // y
            LanguageSettings.eding2 // ieth
        };

        private static string convertLastThousand(long number, string unit)
        {
            string result = "";
            long hundred = number / 100;
            long tens = number % 100;

            if(hundred != 0)
            {
                result += onesMap[hundred] + unitsMap[0];
                if (tens == 0)
                    result += ending[0];
            }
            if (tens > 20)
            {
                if (tens % 10 != 0)
                {
                    result += tensMap[tens / 10] + ending[1];
                    if (tens % 10 < 6)
                        result += onesLastMap[tens % 10];
                    else
                        result += onesMap[tens % 10] + ending[0];
                }
                else
                {
                    result += tensMap[tens / 10] + ending[2];
                }
            }
            else if (tens < 6)
            {
                result += onesLastMap[tens];
            }
            else
                result += onesMap[tens] + ending[0];
           
            return result += unit;
        }

        private static string convertThousand(long number, string unit)
        {
            string result = "";

            if (number != 0)
            {
                long hundred = number / 100;
                long tens = number % 100;

                if (hundred != 0)
                {
                    result = onesMap[number / 100] + unitsMap[0];
                }

                if (tens > 19)
                {
                    result += tensMap[tens / 10] + ending[1];
                    result += onesMap[tens % 10];
                }
                else
                {
                    result += onesMap[tens];
                }

                result += unit;
            }
            return result;
        }

        public static string convert(long number)
        {
            string ordinal = "";
            if (number == 0) { return LanguageSettings.zero; }
            long hundreds = number % 1000;
            number /= 1000;
            long thousands = number % 1000;
            number /= 1000;
            long millions = number % 1000;
            number /= 1000;
            long billions = number % 1000;
            number /= 1000;
            long trillions = number % 1000;
            if (hundreds == 0)
            {
                if(thousands != 0)
                {
                    ordinal += convertThousand(trillions, unitsMap[4]);

                    ordinal += convertThousand(billions, unitsMap[3]);

                    ordinal += convertThousand(millions, unitsMap[2]);

                    ordinal += convertThousand(thousands, unitsMap[1] + ending[0]);
                }
                else
                {
                    if(millions != 0)
                    {
                        ordinal += convertThousand(trillions, unitsMap[4]);

                        ordinal += convertThousand(billions, unitsMap[3]);

                        ordinal += convertThousand(millions, unitsMap[2] + ending[0]);
                    }
                    else if (billions != 0)
                    {
                        ordinal += convertThousand(trillions, unitsMap[4]);
                        ordinal += convertThousand(billions, unitsMap[3] + ending[0]);
                    }
                    else ordinal += convertThousand(trillions, unitsMap[4] + ending[0]);
                }
            }
            else
            {
                ordinal += convertThousand(trillions, unitsMap[4]);

                ordinal += convertThousand(billions, unitsMap[3]);

                ordinal += convertThousand(millions, unitsMap[2]);

                ordinal += convertThousand(thousands, unitsMap[1]);

                ordinal += convertLastThousand(hundreds, "");
            }
            return ordinal;
        }
    }
}
