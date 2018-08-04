using System;

namespace TestNumConvertor.Langs
{
    class DE : ILanguage
    {
        private struct Endings
        {
            public const string tensAboveNineteen = "zig",
                                ordinal = "te",
                                und = "und";

            public const char letterS = 's';
        }
        private struct ExceptionsToRules
        {
            public const string erste = "erste",
                                zwan = "zwan",
                                dritte = "dritte",
                                dreiBig = "dreißig",
                                sech = "sech",
                                sieb = "sieb",
                                achte = "achte";
        }

        private readonly string[] nums = { "null", "ein", "zwei", "drei", "vier", "fünf",
                "sechs", "sieben", "acht", "neun", "zehn", "elf", "zwölf"};
        private readonly string[] scales = { "hundert", "tausend", "million", "milliarde", "trillion" };

        public string ToText(ulong x) => x == 0 ? nums[0] : ToTextRealiz(x);

        private string ToTextRealiz(ulong x, bool lastDigit = true)
        {
            var res = String.Empty;
            var ending = Endings.ordinal;
            if (x >= 20)
                ending = Endings.letterS + ending;

            for (int i = scales.Length - 1; i >= 0; --i)
                res = ScaleNum(ref x, i, res);

            if (x >= 20)
            {
                if (x % 10 != 0)
                    res += nums[x % 10] + Endings.und;

                res = Declension(x / 10, res, Endings.tensAboveNineteen);
                x %= 10;
            }
            else if (x >= 13)
            {
                res = Declension(x % 10, res, nums[10]);
            }
            else if (x > 0)
            {
                if (lastDigit)
                {
                    switch (x)
                    {
                        case 1: return res + ExceptionsToRules.erste;
                        case 3: return res + ExceptionsToRules.dritte;
                        case 8: return res + ExceptionsToRules.achte;
                        default: return res + nums[x] + ending;
                    }
                }
                return res + nums[x];
            }

            if (lastDigit)
                res += ending;

            return res;
        }

        private string ScaleNum(ref ulong x, int digit, string str)
        {
            var scale = digit == 0 ? 100 : Convert.ToUInt64(Math.Pow(1000, digit));
            if (x >= scale)
            {
                str += ToTextRealiz(x / scale, false) + scales[digit];
                x %= scale;
            }
            return str;
        }

        private string Declension(ulong x, string str, string endding)
        {
            if (endding == Endings.tensAboveNineteen && x == 3)
                return str + ExceptionsToRules.dreiBig;

            switch (x)
            {
                case 2: str += ExceptionsToRules.zwan; break;
                case 6: str += ExceptionsToRules.sech; break;
                case 7: str += ExceptionsToRules.sieb; break;
                default: str += nums[x]; break;
            }
            return str + endding;
        }
    }
}