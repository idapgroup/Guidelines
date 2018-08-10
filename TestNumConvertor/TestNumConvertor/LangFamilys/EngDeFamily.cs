using System;

namespace TestNumConvertor.LangFamilys
{
    abstract class EngDeFamily : LanguageFamily
    {
        protected struct EndingsStuct
        {
            public string betweenTenAndTwenty,
                          tensAboveNineteen,
                          ordinal,
                          space;
        }

        protected string[] nums,
                           scales;

        protected EndingsStuct Endings { get; set; }

        protected virtual Tuple<string, ulong> ScaleNum(ulong x, int digit)
        {
            var res = String.Empty;
            var scale = digit == 0 ? 100 : Convert.ToUInt64(Math.Pow(1000, digit));

            if (x >= scale)
            {
                res += RunAllRules(x / scale, false) + scales[digit];
                if (x % scale > 0)
                    res += Endings.space;

                x %= scale;
            }
            return new Tuple<string, ulong>(res, x);
        }

        protected abstract string Declension(ulong x, string endding);

        protected abstract string GetOrdinalExceptions(ulong x);

        protected EngDeFamily()
        {
            Rules.Add(new RuleSet(new LanguageRule(
                (x, par) => x >= 100,
                (x, par) =>
                {
                    var res = String.Empty;
                    Tuple<string, ulong> tuple = null;

                    for (int i = scales.Length - 1; i >= 0; --i)
                    {
                        tuple = ScaleNum(x, i);
                        res += tuple.Item1;
                        x = tuple.Item2;
                    }

                    return new Tuple<string, ulong, object>(res, x, par);
                })));

            Rules.Add(new RuleSet(new LanguageRule(
                (x, par) => x >= 20,
                (x, par) =>
                {
                    var ending = Endings.tensAboveNineteen;
                    if (par is Tuple<object, string> tuple)
                    {
                        par = tuple.Item1;
                        ending = tuple.Item2;
                    }

                    var res = Declension(x / 10, ending);
                    return new Tuple<string, ulong, object>(res, x % 10, par);
                })));

            Rules.Add(new RuleSet(new LanguageRule(
                (x, par) => x >= 13,
                (x, par) =>
                {
                    var res = Declension(x % 10, Endings.betweenTenAndTwenty);
                    return new Tuple<string, ulong, object>(res, x, par);
                })));

            Rules.Add(new RuleSet(new LanguageRule(
                (x, par) => x > 0 && x < 13,
                (x, par) =>
                {
                    var res = (bool)par 
                        ? GetOrdinalExceptions(x) 
                        : nums[x] + Endings.space;

                    return new Tuple<string, ulong, object>(res, x, par);
                })));

            Rules.Add(new RuleSet(new LanguageRule(
                (x, par) => (bool)par && (x == 0 || x > 3),
                (x, par) => new Tuple<string, ulong, object>(Endings.ordinal, x, par))));
        }
    }
}
