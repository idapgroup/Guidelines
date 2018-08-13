using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IDAP_TEST
{
    public static class Ordinal
    {
        private static string[] tens = {
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

        private static string[] lastOnes =
        {
            "",
            LanguageSettings.first,
            LanguageSettings.second,
            LanguageSettings.third,
            LanguageSettings.fourth,
            LanguageSettings.fifth,
        };

        private static string[] classes = {
            LanguageSettings.hundred,
            LanguageSettings.thousand,
            LanguageSettings.million,
            LanguageSettings.billion,
            LanguageSettings.trillion
        };

        private static string[] ones = {
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

        public static string getTens(int ten)
        {
            return tens[ten];
        }

        public static string getOnes(int one)
        {
            return ones[one];
        }

        public static string getClassName(int numberOfClass)
        {
            return classes[numberOfClass];
        }

        public static string getLastOnes(int one)
        {
            return lastOnes[one];
        }
    }
}
