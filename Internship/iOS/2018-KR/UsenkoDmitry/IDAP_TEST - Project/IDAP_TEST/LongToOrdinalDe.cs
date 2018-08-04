using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IDAP_TEST
{
    public class LongToOrdinalDe
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

        private static string convertHundreds(long number, string unit)
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
                    if (tens % 10 != 0)
                        result += onesMap[tens % 10] + "und";
                    result += tensMap[tens / 10];
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

            ordinal += convertHundreds(trillions, unitsMap[4]);

            ordinal += convertHundreds(billions, unitsMap[3]);

            ordinal += convertHundreds(millions, unitsMap[2]);

            ordinal += convertHundreds(thousands, unitsMap[1]);

            ordinal += convertHundreds(hundreds, "");
            return ordinal;
        }
    }
}
