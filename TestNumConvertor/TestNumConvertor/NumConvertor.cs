using System;
using System.Collections.Generic;
using TestNumConvertor.Langs;

namespace TestNumConvertor
{
    static class NumConvertor
    {
        public static readonly ulong MaxConvertibleValue = System.Convert.ToUInt64(Math.Pow(10, 15) - 1);

        private static readonly Dictionary<Languages, ILanguage> cache = new Dictionary<Languages, ILanguage>();

        public static string Convert(ulong num, Languages lang)
        {
            if (num > MaxConvertibleValue)
                return "Out of convertible range (10^15-1)";

            string ConvertNum() => cache[lang].ToText(num);

            if (cache.ContainsKey(lang))
                return ConvertNum();

            switch (lang)
            {
                case Languages.DEFAM:
                    cache.Add(lang, new DeByFamily());
                    return ConvertNum();
                case Languages.ENGFAM:
                    cache.Add(lang, new EngByFamily());
                    return ConvertNum();
                case Languages.ENG:
                    cache.Add(lang, new ENG());
                    return ConvertNum();
                case Languages.DE:
                    cache.Add(lang, new DE());
                    return ConvertNum();
                case Languages.UK:
                    cache.Add(lang, new UK());
                    return ConvertNum();
                default: return "Err!";
            }
        }
    }
}
