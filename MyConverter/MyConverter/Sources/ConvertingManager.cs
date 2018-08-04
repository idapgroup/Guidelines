using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyConverter.Sources
{
    public enum Languages { en, ger, ua };
    public class ConvertingManager
    {
        public static iConverter converter(Languages value) {
            iConverter converter = null;
            switch (value)
            {
                case Languages.en:
                    converter = new EnglishLanguage();
                    break;
                case Languages.ger:
                    converter = new GermanyLanguage();
                    break;
                case Languages.ua:
                    converter = new UkraineLanguage();
                    break;
            }
            return converter;
        }
    }
}
