using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyConverter.Sources
{
    class GermanyLanguage : iConverter
    {
        public string convertedValue(UInt64 Value)
        {
            string[] mass1_19Ger = { "", "erste", "zweite", "dritte", "vierte", "fünfte", "Sechste", "siebte", "achte", "neunte", "zehnte", "elfte", "Zwölfte", "dreizehnte", "vierzehnte", "fünfzehnte", "sechzehnte", "Siebzehnte", "achtzehnte", "neunzehnte" };
            string[] massRah1_19Ger = { "", "ein", "zwei", "drei", "vier", "fünf", "sechs", "sieben", "acht", "neun", "zehn", "elf", "zwölf", "dreizehn", "vierzehn", "fünfzehn", "sechzehn", "siebzehn", "achtzehn", "neunzehn" };
            string[] mass20_90Ger = { "", "zehnte", "zwanzigste", "dreibigste", "vierzigste", "fünfzigste", "sechzigste", "siebzigste", "achtzigste", "neunzigste" };
            string[] massRah20_90Ger = { "", "zehn", "zwanzig", "dreibig", "vierzig", "fünfzig", "sechzig", "siebzig", "achtzig", "neunzig" };
            string[] hundredGer = { "hundert", "hundertste" };
            string[] thousandGer = { "tausend", "tausendste" };
            string[] millionGer = { "million", "millionste" };
            string[] billionGer = { "milliarde", "Milliardste" };
            string[] trillionGer = { "billion", "billionste" };

            string[] mass1_19 = new string[mass1_19Ger.Length];
            string[] massRah1_19 = new string[massRah1_19Ger.Length];
            string[] mass20_90 = new string[mass20_90Ger.Length];
            string[] massRah20_90 = new string[massRah20_90Ger.Length];
            string[] hundred = new string[hundredGer.Length];
            string[] thousand = new string[thousandGer.Length];
            string[] million = new string[millionGer.Length];
            string[] billion = new string[billionGer.Length];
            string[] trillion = new string[trillionGer.Length];

            string res = "";
            string resultat = "";

            mass1_19 = mass1_19Ger;
            massRah1_19 = massRah1_19Ger;
            mass20_90 = mass20_90Ger;
            massRah20_90 = massRah20_90Ger;
            hundred = hundredGer;
            thousand = thousandGer;
            million = millionGer;
            billion = billionGer;
            trillion = trillionGer;

            if (Value < 1000)
            {
                res = GetResult0_999(resultat, Value);

            }
            else if (Value >= 1000 && Value < 1000000)
            {
                getThousands(Value);

            }
            else if (Value >= 1000000 && Value < 1000000000)
            {
                getMillions(Value);

            }
            else if (Value >= 1000000000 && Value < 1000000000000)
            {
                getBillions(Value);

            }
            else if (Value >= 1000000000000 && Value < 1000000000000000)
            {
                getTrillions(Value);
            }

            void getTrillions(UInt64 trillon)
            {
                UInt64 trillions = trillon / 1000000000000;
                UInt64 billions = trillon % 1000000000000;

                if (billions == 0)
                {
                    res += GetResult1000_1000000(resultat, trillions) + trillion[1];

                }
                else
                {
                    if (trillions != 0)
                    {
                        res += GetResult1000_1000000(resultat, trillions) + trillion[0];
                    }
                    getBillions(billions);
                }
            }

            void getBillions(UInt64 billon)
            {
                UInt64 billions = billon / 1000000000;
                UInt64 millions = billon % 1000000000;

                if (millions == 0)
                {
                    res += GetResult1000_1000000(resultat, billions) + billion[1];

                }
                else
                {
                    if (billions != 0)
                    {
                        res += GetResult1000_1000000(resultat, billions) + billion[0];
                    }
                    getMillions(millions);
                }
            }

            void getMillions(UInt64 milon)
            {
                UInt64 millions = milon / 1000000;
                UInt64 tisyachi = milon % 1000000;

                if (tisyachi == 0)
                {
                    res += GetResult1000_1000000(resultat, millions) + million[1];

                }
                else
                {
                    if (millions != 0)
                    {
                        res += GetResult1000_1000000(resultat, millions) + million[0];
                    }
                    getThousands(tisyachi);
                }
            }

            void getThousands(UInt64 thousands)
            {
                UInt64 tisyachi = thousands / 1000;
                UInt64 sotni = thousands % 1000;

                if (sotni == 0)
                {
                    res += GetResult1000_1000000(resultat, tisyachi) + thousand[1];

                }
                else
                {
                    if (tisyachi != 0)
                    {
                        res += GetResult1000_1000000(resultat, tisyachi) + thousand[0];
                    }
                    res += GetResult0_999(resultat, sotni);
                }
            }

            string GetResult1000_1000000(string result, UInt64 valu)
            {
                int odinicil = 0;
                int desyatkil = 0;
                int sotni = 0;
                int val;

                if (valu < 20)
                {
                    result = massRah1_19[valu];

                }
                else if (valu >= 20 && valu < 100)
                {
                    val = Convert.ToInt32(valu);
                    odinicil = val % 10;
                    desyatkil = val / 10;

                    if (odinicil == 0)
                    {
                        result = mass20_90[desyatkil];

                    }
                    else
                    {
                        result = massRah1_19[odinicil] + "und" + massRah20_90[desyatkil];
                    }

                }
                else if (valu >= 100 && valu < 1000)
                {
                    val = Convert.ToInt32(valu);
                    odinicil = val % 10;
                    desyatkil = val % 100;
                    sotni = val / 100;

                    if (odinicil == 0 && desyatkil == 0)
                    {
                        result = massRah1_19[sotni] + hundred[1];

                    }
                    else if (odinicil == 0)
                    {
                        desyatkil = desyatkil / 10;
                        result = massRah1_19[sotni] + hundred[0] + mass20_90[desyatkil];

                    }
                    else if (desyatkil / 10 == 0)
                    {
                        result = massRah1_19[sotni] + hundred[0] + mass1_19[odinicil];

                    }
                    else if (desyatkil / 10 == 1)
                    {
                        result = massRah1_19[sotni] + hundred[0] + "und" + mass1_19[desyatkil];

                    }
                    else
                    {
                        desyatkil = desyatkil / 10;
                        result = massRah1_19[sotni] + hundred[0] + massRah1_19[odinicil] + "und" + massRah20_90[desyatkil];
                    }
                }
                return result;
            }

            string GetResult0_999(string result, UInt64 valu)
            {
                int odinicil = 0;
                int desyatkil = 0;
                int sotni = 0;
                int val;

                if (valu < 20)
                {
                    result = mass1_19[valu];

                }
                else if (valu >= 20 && valu < 100)
                {
                    val = Convert.ToInt32(valu);
                    odinicil = val % 10;
                    desyatkil = val / 10;

                    if (odinicil == 0)
                    {
                        result = mass20_90[desyatkil];
                    }
                    else
                    {
                        result = massRah1_19[odinicil] + "und" + mass20_90[desyatkil];
                    }

                }
                else if (valu >= 100 && valu < 1000)
                {
                    val = Convert.ToInt32(valu);
                    odinicil = val % 10;
                    desyatkil = val % 100;
                    sotni = val / 100;

                    if (odinicil == 0 && desyatkil == 0)
                    {
                        result = massRah1_19[sotni] + hundred[1];

                    }
                    else if (odinicil == 0)
                    {
                        desyatkil = desyatkil / 10;
                        result = massRah1_19[sotni] + hundred[0] + mass20_90[desyatkil];

                    }
                    else if (desyatkil / 10 == 0)
                    {
                        result = massRah1_19[sotni] + hundred[0] + mass1_19[odinicil];

                    }
                    else if (desyatkil / 10 == 1)
                    {
                        result = massRah1_19[sotni] + hundred[0] + "und" + mass1_19[desyatkil];

                    }
                    else
                    {
                        desyatkil = desyatkil / 10;
                        result = massRah1_19[sotni] + hundred[0] + massRah1_19[odinicil] + "und" + mass20_90[desyatkil];
                    }
                }
                return result;
            }
            return res;
        }
    }
}
