using System;
using TestNumConvertor.LangFamilys;

namespace TestNumConvertor.Langs
{
    class EngByFamily : EngDeFamily, ILanguage
    {
        public EngByFamily()
        {
            nums = new[] {"zero", "one", "two", "three", "four", "five",
                    "six", "seven", "eight", "nine", "ten", "eleven", "twelve"};
            scales = new[] { "hundred", "thousand", "million", "billion", "trillion" };

            Endings = new EndingsStuct()
            {
                betweenTenAndTwenty = "teen",
                tensAboveNineteen = "ty",
                ordinal = "th",
                space = " "
            };

            Rules[1].BeforeBaseRule = new LanguageRule(
                (x, par) => x >= 20,
                (x, par) =>
                {                          
                    var ending = String.Empty;                         
                                                                       
                    if (x % 10 > 0)                                                                              
                        ending = Endings.tensAboveNineteen + Endings.space;                                                                                 
                    else                                               
                        ending = LocalEndings.tensAboveNineteenNotComposite;

                    return new Tuple<string, ulong, object>(String.Empty, x, new Tuple<object, string>(par, ending));
                });
        }

        private struct LocalEndings
        {
            public const string tensAboveNineteenNotComposite = "tie";
        }

        private struct LocalExceptionsToRules
        {
            public const string firste = "firste",
                                second = "second",
                                third = "third",
                                fif = "fif",
                                eigh = "eigh",
                                nin = "nin",
                                twelf = "twelf",
                                twen = "twen",
                                thir = "thir",
                                eFor = "for";
        }

        public string ToText(ulong num) => num == 0 ? nums[0] : RunAllRules(num, true);

        protected override string GetOrdinalExceptions(ulong x)
        {
            switch (x)
            {
                case 1: return LocalExceptionsToRules.firste; 
                case 2: return LocalExceptionsToRules.second; 
                case 3: return LocalExceptionsToRules.third;
                case 5: return LocalExceptionsToRules.fif;
                case 8: return LocalExceptionsToRules.eigh;
                case 9: return LocalExceptionsToRules.nin;
                case 12: return LocalExceptionsToRules.twelf; 
                default: return nums[x];
            }                                                      
        }

        protected override string Declension(ulong x, string endding)
        {
            var res = String.Empty;
            switch (x)
            {
                case 2: res += LocalExceptionsToRules.twen; break;
                case 3: res += LocalExceptionsToRules.thir; break;
                case 4: res += LocalExceptionsToRules.eFor; break;
                case 5: res += LocalExceptionsToRules.fif; break;
                case 8: res += LocalExceptionsToRules.eigh; break;
                default: res += nums[x]; break;
            }
            return res + endding;
        }
    }
}
