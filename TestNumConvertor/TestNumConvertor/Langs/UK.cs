using System;
using System.Collections.Generic;

namespace TestNumConvertor.Langs
{
    class UK : ILanguage
    {
        private enum NumForms
        {
            Ordinal, Cardinal, InGenitive
        }

        private struct Endings
        {
            public const string betweenTenAndTwenty = "надцят",
                                tensBelowForty = "дцят",
                                forForty = "ов",
                                tensAboveForty = "десят",
                                ordinal = "ий",
                                lettersIB = "ів";

            public const char softSign = 'ь',
                              letterA = 'а',
                              letterH = 'н',
                              letterO = 'о',
                              letterI = 'і',
                              letterN = 'и',
                              space = ' ';
        }

        private struct ExceptionsToRules
        {
            public const string forty = "сорок",
                                ninety = "дев'яност";
        }

        private struct Nums
        {
            public const string zero = "нульовий",
                                one = "один",
                                two = "два",
                                three = "три",
                                four = "чотири",
                                seven = "сім",
                                eight = "вісім";
        }

        private readonly Dictionary<ulong, string[]> dic = new Dictionary<ulong, string[]>
            {
                {1, new[] { "перший", "один", "одно" }},
                {2, new[] { "другий", "два", "двох" }},
                {3, new[] { "третій", "три", "трьох" }},
                {4, new[] { "четвертий", "чотири", "чотирьох" }},
                {5, new[] { "п'ятий", "п'ять", "п'яти" }},
                {6, new[] { "шостий", "шість", "шести" }},
                {7, new[] { "сьомий", "сім", "семи" }},
                {8, new[] { "восьмий", "вісім", "восьми" }},
                {9, new[] { "дев'ятий", "дев'ять", "дев'яти" }},
                {10, new[] { "десятий", "десять", "десяти" }},
                {100, new[] { "сотий", "сто" }}
            };

        private readonly string[] scales = { "", "тисячний", "мільйонний", "мільярдний", "трильярдний" };

        private string ToTextRealiz(ulong x, NumForms numForm = NumForms.Ordinal, bool masculineGender = true)
        {
            var res = String.Empty;
            var toOrdinal = numForm == NumForms.Ordinal;

            for (int i = scales.Length - 1; i > 1; --i)
                res = ScaleNum(ref x, i, res, numForm);

            if (x >= 1000)
            {
                var high = x / 1000;
                x %= 1000;

                if (x == 0 && toOrdinal)
                {
                    if (high > 1)
                        res += ToTextRealiz(high, NumForms.InGenitive) + Endings.space;
                    return res + scales[1];
                }

                res += ToTextRealiz(high, NumForms.Cardinal, false) + Endings.space + ToShort(scales[1], 3);
                high %= 100;

                if (high % 10 > 0 && high % 10 < 5 && high / 10 != 1)
                    res += high % 10 > 1 ? Endings.letterI : Endings.letterA;

                res += Endings.space;
            }
            if (x >= 100)
            {
                var hund = x / 100;
                x %= 100;

                if (x == 0 && toOrdinal)
                {
                    if (hund > 1)
                        res += dic[hund][2];
                    return res + dic[100][0];
                }
                if (hund == 1)
                    res += dic[100][1];
                else if (numForm != NumForms.InGenitive)
                {
                    var form = hund < 5 ? 1 : 0;
                    if (hund > 1)
                        res += TryToFemGender(ToShortByRules(dic[hund][1]));
                    res = ConcatWithDeclension(res, dic[100][form]);
                    if (hund > 4)
                        res = ToShort(res, 2);
                }
                else
                {
                    var form = 0;
                    if (hund > 1)
                        res += TryToFemGender(dic[hund][2]);
                    else
                        form = 1;
                    res += dic[100][form];
                    if (hund > 1)
                        res = ToShort(res, 2);
                }

                res += Endings.space;
            }
            if (x >= 20)
            {
                var toInGen = numForm == NumForms.InGenitive;
                var dec = x / 10;
                var form = (toInGen && dec > 4) ? 2 : 1;
                x %= 10;

                switch (dec)
                {
                    case 4: res += ExceptionsToRules.forty; break;
                    case 9: res += ExceptionsToRules.ninety; break;
                    default: res += ToShortByRules(dic[dec][form], toInGen); break;
                }

                if (dec < 4)
                    res += Endings.tensBelowForty;
                else if (dec != 4 && dec != 9)
                    res += Endings.tensAboveForty;

                if (x == 0 && toOrdinal)
                {
                    if (dec == 4)
                        res += Endings.forForty;

                    return res + Endings.ordinal;
                }

                if (dec < 4)
                    res += toInGen ? Endings.letterN : Endings.softSign;
                else if (dec == 9)
                    res += Endings.letterO;
                else if (toInGen)
                    res += dec != 4 ? Endings.letterN : Endings.letterA;

                res += Endings.space;
            }
            if (x > 10)
            {
                res += ToShortByRules(dic[x % 10][1]) + Endings.betweenTenAndTwenty;

                switch (numForm)
                {
                    case NumForms.Ordinal: return res + Endings.ordinal;
                    case NumForms.Cardinal: return res + Endings.softSign;
                    case NumForms.InGenitive: return res + Endings.letterN;
                }
            }
            else if (x > 0)
                res += TryToFemGender(dic[x][(int)numForm], masculineGender);

            return res;
        }

        private string ToShort(string str, int count = 1) => str.Remove(str.Length - count, count);

        private string SwapEnding(string str, char ending) => ToShort(str) + ending;

        private string ToShortByRules(string str, bool off = false)
        {
            if (off)
                return str;

            switch (str)
            {
                case Nums.two:
                case Nums.three:
                case Nums.four:
                case Nums.seven:
                case Nums.eight: return str;
                default: return ToShort(str);
            }
        }

        private string TryToFemGender(string str, bool off = false)
        {
            if (off)
                return str;

            switch (str)
            {
                case Nums.one: return ToShort(str, 2) + Endings.letterH + Endings.letterA;
                case Nums.two: return SwapEnding(str, Endings.letterI);
                default: return str;
            }
        }

        private string ConcatWithDeclension(string destin, string source)
        {
            string Concat(char ending) => destin + SwapEnding(source, ending);

            if (destin.Length == 0)
                return source;

            var destEnding = destin[destin.Length - 1];

            switch (destEnding)
            {
                case Endings.letterI: return Concat(Endings.letterI);
                case Endings.letterN: return Concat(Endings.letterA);
                default: return destin + source;
            }
        }

        private string ScaleNum(ref ulong x, int digit, string str, NumForms numForm)
        {
            var scale = Convert.ToUInt64(Math.Pow(1000, digit));
            if (x >= scale)
            {
                var high = x / scale;
                x %= scale;

                if (x == 0 && numForm == NumForms.Ordinal)
                {
                    if (high > 1)
                        str += ToTextRealiz(high, NumForms.InGenitive) + Endings.space;
                    return str + scales[digit];
                }
                str += ToTextRealiz(high, NumForms.Cardinal, true) + Endings.space + ToShort(scales[digit], 3);
                high %= 100;

                if (high % 10 > 0 && high % 10 < 5 && high / 10 != 1)
                {
                    if (high % 10 > 1)
                        str += Endings.letterA;
                }
                else
                    str += Endings.lettersIB;

                str += Endings.space;
            }
            return str;
        }

        public string ToText(ulong num) => num == 0 ? Nums.zero : ToTextRealiz(num);
    }
}
