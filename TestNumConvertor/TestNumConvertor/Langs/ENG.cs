using System;
using System.Linq;

namespace TestNumConvertor.Langs
{
    class ENG : ILanguage
    {
        private struct Endings
        {
            public const string betweenTenAndTwenty = "teen",
                                tensAboveNineteen = "ty",
                                ordinal = "th";

            public const char space = ' ';
        }
        private struct ExceptionsToRules
        {
            public const string firste = "firste",
                                second = "second",
                                third = "third",
                                twen = "twen",
                                thir = "thir",
                                eFor = "for",
                                fif = "fif",
                                eigh = "eigh";
        }

        private static readonly string[] nums = {"zero", "one", "two", "three", "four", "five",
                "six", "seven", "eight", "nine", "ten", "eleven", "twelve"};
        private static readonly string[] scales = { "hundred", "thousand", "million", "billion", "trillion" };

        public string ToText(ulong num) => num == 0 ? nums[0] : ToTextRealiz(num);

        private string ToTextRealiz(ulong x, bool lastDigit = true)
        {
            string res = String.Empty;

            for (int i = scales.Length - 1; i >= 0; --i)
                res = ScaleNum(ref x, i, res);

            if (x >= 20)
            {
                res = Declension(x / 10, res, Endings.tensAboveNineteen);
                x %= 10;
            }
            if (x >= 13)
                res = Declension(x % 10, res, Endings.betweenTenAndTwenty);
            else if (x > 0)
            {
                if (lastDigit)
                {
                    switch (x)
                    {
                        case 1: return res + ExceptionsToRules.firste;
                        case 2: return res + ExceptionsToRules.second;
                        case 3: return res + ExceptionsToRules.third;
                        default: res += nums[x]; break;
                    }
                }
                else
                    return res + nums[x] + Endings.space;
            }

            if (lastDigit)
            {
                if (res.Last() == Endings.space)
                    res = res.Remove(res.Length - 1, 1);
                res += Endings.ordinal;
            }
            return res;
        }

        private string ScaleNum(ref ulong x, int digit, string str)
        {
            var scale = digit == 0 ? 100 : Convert.ToUInt64(Math.Pow(1000, digit));
            if (x >= scale)
            {
                str += ToTextRealiz(x / scale, false) + scales[digit] + Endings.space;
                x %= scale;
            }
            return str;
        }

        private string Declension(ulong x, string str, string endding)
        {
            switch (x)
            {
                case 2: str += ExceptionsToRules.twen; break;
                case 3: str += ExceptionsToRules.thir; break;
                case 4: str += ExceptionsToRules.eFor; break;
                case 5: str += ExceptionsToRules.fif; break;
                case 8: str += ExceptionsToRules.eigh; break;
                default: str += nums[x]; break;
            }
            return str + endding + Endings.space;
        }
    }
}
