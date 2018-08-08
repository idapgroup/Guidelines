using System.Collections.Generic;
using TestNumConvertor.Langs;

namespace TestNumConvertor
{
    static class NumConvertor
    {
        private static readonly Dictionary<Languages, ILanguage> cache = new Dictionary<Languages, ILanguage>();

        public static string Convert(ulong num, Languages lang)
        {
            string ConvertNum() => cache[lang].ToText(num);

            if (cache.ContainsKey(lang))
                return ConvertNum();

            switch (lang)
            {
                case Languages.ENG:
                    cache.Add(lang, new eng2());
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
