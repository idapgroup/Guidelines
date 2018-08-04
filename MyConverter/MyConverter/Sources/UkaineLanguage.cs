using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyConverter.Sources
{
    class UkraineLanguage : iConverter
    {
        public string convertedValue(UInt64 Value)
        {
            string[] mass1_19Ukr = { "", " перший", " другий", " третій", " четвертий", " п'ятий", " шостий", " сьомий", " восьмий", " дев'ятий", " десятий", " одинадцятий", " дванадцятий", " тринадцятий", " чотирнадцятий", " п'ятнадцятий", " шістнадцятий", " сімнадцятий", " вісімнадцятий", " дев'ятнадцятий" };
            string[] massRah1_19Ukr = { "", " один", " два", " три", " чотири", " п'ять", " шість", " сім", " вісім", " дев'ять", " десять", " одинадцять", " дванадцять", " тринадцять", " чотирнадцять", " п'тянадцять", " шістнадцять", " сімнадцять", " вісімнадцять", " дев'ятнадцять" };
            string[] massRah1_19SotniUkr = { "", "", " дві", " три", " чотири", " п'ят", " шіст", " сім", " вісім", " дев'ят", " десять", " одинадцять", " дванадцять", " тринадцять", " чотирнадцять", " п'тянадцять", " шістнадцять", " сімнадцять", " вісімнадцять", " дев'ятнадцять" };
            string[] mass20_90Ukr = { "", " десятий", " двадцятий", " тридцятий", " сороковий", " п'ятдесятий", " шістдесятий", " сімдесятий", " восьмидесятий", " дев'яностий" };
            string[] massRah20_90Ukr = { "", " десять", " двадцять", " тридцять", " сорок", " п'ятдесят", " шістдесят", " сімдесят", " вісімдесят", " дев'яносто" };
            string[] hundredUkr = { " сто", "сті", "ста", "сот", "сотий" };
            string[] thousandUkr = { " тисяча", " тисячі", " тисяч", " тисячний" };
            string[] millionUkr = { " мільйон", " мільйони", " мільйонів", " мільйонний" };
            string[] billionUkr = { " мільярд", " мільядри", " мільярдів", " мільярдний" };
            string[] trillionUkr = { " трильйон", " трильйони", " трильйонів", " трильйонний" };
            string[] massPerRah1_19Ukr = { "", " одно", " двох", " трьох", " чотирьох", " п'яти", " шести", " семи", " восьми", " дев'яти", " десяти", " одинадцяти", " дванадцяти", " тринадцяти", " чотирнадцяти", " п'ятнадцяти", " шістнадцяти", " сімнадцяти", " вісімнадцяти", " дев'ятнадцяти" };
            string[] massPerRah20_90Ukr = { "", " десяти", " двадцяти", " тридцяти", " сорока", " п'ятдесяти", " шістдесяти", " сімдесяти", " восьмидесяти", " дев'яносто" };

            string[] mass1_19 = new string[mass1_19Ukr.Length];
            string[] massRah1_19 = new string[massRah1_19Ukr.Length];
            string[] mass20_90 = new string[mass20_90Ukr.Length];
            string[] massRah20_90 = new string[massRah20_90Ukr.Length];
            string[] hundred = new string[hundredUkr.Length];
            string[] thousand = new string[thousandUkr.Length];
            string[] million = new string[millionUkr.Length];
            string[] billion = new string[billionUkr.Length];
            string[] trillion = new string[trillionUkr.Length];

            string res = "";
            string resultat = "";
            bool Check = false;

            mass1_19 = mass1_19Ukr;
            massRah1_19 = massRah1_19Ukr;
            mass20_90 = mass20_90Ukr;
            massRah20_90 = massRah20_90Ukr;
            hundred = hundredUkr;
            thousand = thousandUkr;
            million = millionUkr;
            billion = billionUkr;
            trillion = trillionUkr;

            if (Value < 1000)
            {
                res = GetResult0_999Ukr(resultat, Value);

            }
            else if (Value >= 1000 && Value < 1000000)
            {
                getThousandsUkr(Value);

            }
            else if (Value >= 1000000 && Value < 1000000000)
            {
                getMillionsUkr(Value);

            }
            else if (Value >= 1000000000 && Value < 1000000000000)
            {
                getBillionsUkr(Value);

            }
            else if (Value >= 1000000000000 && Value < 1000000000000000)
            {
                getTrillionsUkr(Value);
            }

            string checkUkrNumb(UInt64 ukrNum, string ukrNumName, string[] numNames)
            {
                if (ukrNum > 0 && ukrNum < 19)
                {
                    switch (ukrNum)
                    {
                        case 1:
                            ukrNumName = numNames[0];
                            break;
                        case 2:
                        case 3:
                        case 4:
                            ukrNumName = numNames[1];
                            break;
                        case UInt64 Sotni:
                            ukrNumName = numNames[2];
                            break;
                    }

                }
                else if (ukrNum >= 20 && ukrNum < 100)
                {
                    Console.WriteLine(ukrNum);
                    ukrNum = ukrNum % 100;

                    switch (ukrNum)
                    {
                        case 1:
                            ukrNumName = numNames[0];
                            break;
                        case 2:
                        case 3:
                        case 4:
                            ukrNumName = numNames[1];
                            break;
                        case UInt64 Sotni:
                            ukrNumName = numNames[2];
                            break;
                    }

                }
                else if (ukrNum >= 100 && ukrNum < 1000)
                {
                    ukrNum = ukrNum % 100;
                    if (ukrNum > 19)
                    {
                        ukrNum = ukrNum % 10;
                    }

                    if (ukrNum / 10 < 10)
                    {
                        switch (ukrNum)
                        {
                            case 1:
                                ukrNumName = numNames[0];
                                break;
                            case 2:
                            case 3:
                            case 4:
                                ukrNumName = numNames[1];
                                break;
                            case UInt64 Sotni:
                                ukrNumName = numNames[2];
                                break;
                        }
                    }
                    else
                    {
                        ukrNumName = trillion[2];
                    }
                }
                return ukrNumName;
            }

            void getTrillionsUkr(UInt64 trillon)
            {
                UInt64 trillions = trillon / 1000000000000;
                UInt64 billions = trillon % 1000000000000;
                string trillionStr = "";
                UInt64 newTrillions = trillions;
                trillionStr = checkUkrNumb(newTrillions, trillionStr, trillion);

                if (billions == 0)
                {
                    massRah1_19 = massPerRah1_19Ukr;
                    res += GetResult1000_1000000Ukr(resultat, trillions) + trillion[3];

                }
                else
                {
                    if (trillions != 0)
                    {
                        res += GetResult1000_1000000Ukr(resultat, trillions) + trillionStr;
                    }
                    getBillionsUkr(billions);
                }
            }

            void getBillionsUkr(UInt64 billon)
            {
                UInt64 billions = billon / 1000000000;
                UInt64 millions = billon % 1000000000;
                string billionStr = "";
                UInt64 newBillions = billions;
                billionStr = checkUkrNumb(newBillions, billionStr, billion);

                if (millions == 0)
                {
                    massRah1_19 = massPerRah1_19Ukr;
                    res += GetResult1000_1000000Ukr(resultat, billions) + billion[3];

                }
                else
                {
                    if (billions != 0)
                    {
                        res += GetResult1000_1000000Ukr(resultat, billions) + billionStr;
                    }
                    getMillionsUkr(millions);
                }
            }

            void getMillionsUkr(UInt64 milon)
            {
                UInt64 millions = milon / 1000000;
                UInt64 tisyachi = milon % 1000000;
                string millionStr = "";
                UInt64 newMillions = millions;
                millionStr = checkUkrNumb(newMillions, millionStr, million);

                if (tisyachi == 0)
                {
                    massRah1_19 = massPerRah1_19Ukr;
                    res += GetResult1000_1000000Ukr(resultat, millions) + million[3];

                }
                else
                {
                    if (millions != 0)
                    {
                        res += GetResult1000_1000000Ukr(resultat, millions) + millionStr;
                    }
                    getThousandsUkr(tisyachi);
                }
            }

            void getThousandsUkr(UInt64 thousands)
            {
                UInt64 numThousands = thousands / 1000;
                UInt64 sotni = thousands % 1000;
                UInt64 thous = numThousands;
                string thousandStr = "";
                massRah1_19[1] = " одна";
                thousandStr = checkUkrNumb(thous, thousandStr, thousand);

                if (sotni == 0)
                {
                    massRah1_19 = massPerRah1_19Ukr;
                    res += GetResult1000_1000000Ukr(resultat, thous) + thousand[3];

                }
                else
                {
                    Check = true;
                    if (thous != 0)
                    {
                        res += GetResult1000_1000000Ukr(resultat, thous) + thousandStr;
                    }
                    res += GetResult0_999Ukr(resultat, sotni);
                }
            }

            string GetResult1000_1000000Ukr(string result, UInt64 valu)
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
                        result = mass20_90[desyatkil] + massRah1_19[odinicil];

                    }
                    else
                    {
                        result = massRah20_90[desyatkil] + massRah1_19[odinicil];
                    }

                }
                else if (valu >= 100 && valu < 1000)
                {
                    val = Convert.ToInt32(valu);
                    odinicil = val % 10;
                    desyatkil = val % 100;
                    sotni = val / 100;
                    string sto = "";

                    switch (sotni)
                    {
                        case 1:
                            sto = hundred[0];
                            break;
                        case 2:
                            sto = hundred[1];
                            break;
                        case 3:
                        case 4:
                            sto = hundred[2];
                            break;
                        case int hundreds:
                            sto = hundred[3];
                            break;
                    }

                    if (odinicil == 0 && desyatkil == 0)
                    {
                        if (sotni == 1)
                        {
                            result = hundred[0];

                        }
                        else
                        {
                            if (!Check)
                            {
                                sto = hundred[3];
                            }
                            result = massRah1_19[sotni] + sto;
                        }

                    }
                    else if (odinicil == 0)
                    {
                        desyatkil = desyatkil / 10;
                        result = massRah1_19SotniUkr[sotni] + sto + massRah20_90[desyatkil];

                    }
                    else if (desyatkil / 10 == 0)
                    {
                        result = massRah1_19SotniUkr[sotni] + sto + massRah1_19[odinicil];

                    }
                    else if (desyatkil / 10 == 1)
                    {
                        result = massRah1_19SotniUkr[sotni] + sto + massRah1_19[desyatkil];

                    }
                    else
                    {
                        desyatkil = desyatkil / 10;
                        result = massRah1_19SotniUkr[sotni] + sto + massPerRah20_90Ukr[desyatkil] + massRah1_19[odinicil];
                    }
                }
                return result;
            }

            string GetResult0_999Ukr(string result, UInt64 valu)
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
                        result = mass20_90[desyatkil] + massRah1_19[odinicil];

                    }
                    else
                    {
                        result = massRah20_90[desyatkil] + mass1_19[odinicil];
                    }

                }
                else if (valu >= 100 && valu < 1000)
                {
                    val = Convert.ToInt32(valu);
                    odinicil = val % 10;
                    desyatkil = val % 100;
                    sotni = val / 100;
                    string sto = "";

                    switch (sotni)
                    {
                        case 1:
                            sto = hundred[0];
                            break;
                        case 2:
                            sto = hundred[1];
                            break;
                        case 3:
                        case 4:
                            sto = hundred[2];
                            break;
                        case int Sotni:
                            sto = hundred[3];
                            break;
                    }

                    if (odinicil == 0 && desyatkil == 0)
                    {
                        if (sotni == 1)
                        {
                            result = hundred[4];
                        }
                        else
                        {
                            result = massPerRah1_19Ukr[sotni] + hundred[4];
                        }

                    }
                    else if (odinicil == 0)
                    {
                        desyatkil = desyatkil / 10;
                        result = massRah1_19SotniUkr[sotni] + sto + mass20_90[desyatkil] + mass1_19[odinicil];

                    }
                    else if (desyatkil / 10 == 0)
                    {
                        result = massRah1_19SotniUkr[sotni] + sto + mass1_19[odinicil];

                    }
                    else if (desyatkil / 10 == 1)
                    {
                        result = massRah1_19SotniUkr[sotni] + sto + mass1_19[desyatkil];

                    }
                    else
                    {
                        desyatkil = desyatkil / 10;
                        result = massRah1_19SotniUkr[sotni] + sto + massRah20_90[desyatkil] + mass1_19[odinicil];
                    }
                }
                return result;
            }
            return res;
        }
    }
}