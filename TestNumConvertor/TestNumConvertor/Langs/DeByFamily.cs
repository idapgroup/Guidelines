using System;
using TestNumConvertor.LangFamilys;

namespace TestNumConvertor.Langs
{
    class DeByFamily : EngDeFamily, ILanguage
    {
        public DeByFamily()
        {
            nums = new[] { "null", "ein", "zwei", "drei", "vier", "fünf",
                "sechs", "sieben", "acht", "neun", "zehn", "elf", "zwölf"};
            scales = new[] { "hundert", "tausend", "million", "milliarde", "trillion" };

            Endings = new EndingsStuct()
            {
                betweenTenAndTwenty = "zehn",
                tensAboveNineteen = "zig",
                ordinal = "te",
                space = ""
            };

            bool modifOrdinalEnding = false;
            Rules[0].BeforeBaseRule = new LanguageRule(
                (x, par) => (bool)par && (x % 100 >= 20 || x % 100 == 0),
                (x, par) =>
                {
                    modifOrdinalEnding = true;
                    return new Tuple<string, ulong, object>(String.Empty, x, par);
                });

            bool endConver = false;
            Rules[1].BeforeBaseRule = new LanguageRule(
                (x, par) => x >= 20,
                (x, par) =>
                {
                    if (x < 100)
                        endConver = true;

                    var res = String.Empty;
                    if (x % 10 != 0)
                        res = nums[x % 10] + LocalEndings.und;

                    return new Tuple<string, ulong, object>(res, x, par);
                });

            Rules[3].BaseRule.Predicate = (x, par) => x > 0 && x < 13 && !endConver;

            Rules[3].AfterBaseRule = new LanguageRule(
                (x, par) => endConver,
                (x, par) =>
                {
                    endConver = false;
                    return new Tuple<string, ulong, object>(string.Empty, x, par);
                });

            Rules[4].BaseRule.Predicate = (x, par) => (bool)par;

            Rules[4].BeforeBaseRule = new LanguageRule(
                (x, par) => (bool)par && modifOrdinalEnding,
                (x, par) =>
                {
                    modifOrdinalEnding = false;
                    return new Tuple<string, ulong, object>(LocalEndings.letterS, x, par);
                });
        }

        private struct LocalEndings
        {
            public const string und = "und",
                                letterS = "s";
        }

        private struct LocalExceptionsToRules
        {
            public const string erste = "ers",
                                dritte = "drit",
                                sech = "sech",
                                sieb = "sieb",
                                achte = "ach",
                                zwan = "zwan",
                                dreiBig = "dreißig";
        }

        public string ToText(ulong num) => num == 0 ? nums[0] : RunAllRules(num, true);

        protected override string Declension(ulong x, string endding)
        {
            var res = String.Empty;
            if (endding == Endings.tensAboveNineteen && x == 3)
                return res + LocalExceptionsToRules.dreiBig;

            switch (x)
            {
                case 2: res += LocalExceptionsToRules.zwan; break;
                case 6: res += LocalExceptionsToRules.sech; break;
                case 7: res += LocalExceptionsToRules.sieb; break;
                default: res += nums[x]; break;
            }
            return res + endding;
        }

        protected override string GetOrdinalExceptions(ulong x)
        {
            switch (x)
            {
                case 1: return LocalExceptionsToRules.erste;
                case 3: return LocalExceptionsToRules.dritte;
                case 8: return LocalExceptionsToRules.achte;
                default: return nums[x];
            }
        }
    }
}
