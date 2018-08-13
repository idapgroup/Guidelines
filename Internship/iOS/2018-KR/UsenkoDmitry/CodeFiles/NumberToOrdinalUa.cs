using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IDAP_TEST
{
    public class NumberToOrdinalUa : NumberToOrdinal
    {
        string result;
        private void onesInLastThousandsToOrdinal(int tens) // для числівників, що закінчуються на "тисячний, мільйонний, мільярдний, трильйонний"
        {
            switch (tens)
            {
                case 0:
                    break;
                case 1:
                    result += Ordinal.getOnes(tens) + "но";
                    break;
                case 2:
                    result += Ordinal.getOnes(tens) + "ох";
                    break;
                case 3:
                    result += "трьох";
                    break;
                case 4:
                    result += "чотирьох";
                    break;
                case 6:
                    result += "шести";
                    break;
                case 7:
                    result += "семи";
                    break;
                case 8:
                    result += "восьми";
                    break;
                default:
                    result += Ordinal.getOnes(tens) + "и";
                    break;
            }
        }

        private void onesToOrdinal(int tens)
        {
            switch (tens != 8 && tens != 7)
            {
                case true:
                    result += Ordinal.getOnes(tens) + "ь ";
                    break;
                case false:
                    result += Ordinal.getOnes(tens);
                    break;
            }
        }

        private void tensToOrdinal(int tens)
        {
            result += Ordinal.getTens(tens);
            switch (tens)
            {
                case 1:
                    break;
                case 2:
                    result += "ь ";
                    break;
                case 3:
                    result += "ь ";
                    break;
                case 9:
                    result += "о ";
                    break;
                default:
                    result += " ";
                    break;
            }
        }

        private void hundredsToOrdinal(int hundreds)
        {
            switch (hundreds)
            {
                case 0:
                    break;
                case 1:
                    result = "сто ";
                    break;
                case 2:
                    result = Ordinal.getOnes(hundreds) + "істі ";
                    break;
                case 3:
                    result = Ordinal.getOnes(hundreds) + "ста ";
                    break;
                case 4:
                    result = Ordinal.getOnes(hundreds) + "ста ";
                    break;
                default:
                    result = Ordinal.getOnes(hundreds) + "сот ";
                    break;
            }
        }

        private void onesInLastHundredToOrdinal(int tens) // для сотні
        {
            switch (tens)
            {
                case 1:
                    result += Ordinal.getLastOnes(tens);
                    break;
                case 2:
                    result += Ordinal.getLastOnes(tens);
                    break;
                case 3:
                    result += Ordinal.getLastOnes(tens);
                    break;
                case 4:
                    result += Ordinal.getLastOnes(tens);
                    break;
                case 6:
                    result += "шостий";
                    break;
                case 7:
                    result += "сьомий";
                    break;
                case 8:
                    result += "восьмий";
                    break;
                default:
                    result += Ordinal.getOnes(tens) + "ий";
                    break;
            }
        }

        private string lastHundred(int hundreds, int tens) // сотня
        {
            switch (tens == 0)
            {
                case true:
                    switch (hundreds)
                    {
                        case 1:
                            result = "сотий";
                            break;
                        default:
                            onesInLastThousandsToOrdinal(hundreds);
                            result += "сотий";
                            break;
                    }
                    break;
                case false:
                    hundredsToOrdinal(hundreds);
                    switch (tens > 19)
                    {
                        case true:
                            switch (tens % 10 == 0)
                            {
                                case true:
                                    result += Ordinal.getTens(tens / 10);
                                    switch (tens / 10)
                                    {
                                        case 2:
                                            result += "ий";
                                            break;
                                        case 3:
                                            result += "тий";
                                            break;
                                        case 4:
                                            result += "овий";
                                            break;
                                        default:
                                            result += "ий";
                                            break;
                                    }
                                    break;
                                case false:
                                    tensToOrdinal(tens / 10);
                                    onesInLastHundredToOrdinal(tens % 10);
                                    break;
                            }
                            break;
                        case false:
                            onesInLastHundredToOrdinal(tens % 10);
                            break;
                    }
                    break;
            }
            return result;
        }

        protected override string convertHundreds(int hundreds, int tens, int classOfNumber)
        {
            result = "";
            switch (!Number.isNull(classOfNumber))
            {
                case true:
                    switch (classOfNumber == 0)
                    {
                        case true:
                            lastHundred(hundreds, tens);
                            break;
                        case false:
                            switch (classOfNumber == Number.getLastClass())
                            {
                                case true: // якщо клас числа є останнім (Складні порядові числівники, що закінчуються на "тисячний, мільйонний, мільярдний, трильйонний" пишуться разом та всі частини відмінюються)
                                    switch (hundreds)
                                    {
                                        case 0:
                                            break;
                                        case 1:
                                            result += "ста";
                                            break;
                                        default:
                                            onesInLastThousandsToOrdinal(hundreds);
                                            result += "сот";
                                            break;
                                    }
                                    switch (tens > 19)
                                    {
                                        case true:
                                            switch (tens / 10)
                                            {
                                                case 4:
                                                    result += Ordinal.getTens(tens / 10) + "а";
                                                    break;
                                                case 9:
                                                    result += Ordinal.getTens(tens / 10) + "о";
                                                    break;
                                                default:
                                                    result += Ordinal.getTens(tens / 10) + "и";
                                                    break;
                                            }
                                            onesInLastThousandsToOrdinal(tens % 10); // винесено у метод для уникнення повторення
                                            break;
                                        case false:
                                            switch (tens)
                                            {
                                                case 1:
                                                    break;
                                                default:
                                                    onesInLastThousandsToOrdinal(tens); // винесено у метод для уникнення повторення
                                                    break;
                                            }
                                            break;
                                    }
                                    result += Ordinal.getClassName(classOfNumber) + "ний";
                                    break;
                                case false: // Не останній класс числа
                                    hundredsToOrdinal(hundreds);
                                    tensToOrdinal(tens / 10);
                                    switch (classOfNumber) // для корректного роду числівників
                                    {
                                        case 1:
                                            switch (tens > 19 || tens < 4)
                                            {
                                                case true: // одна тисяча, дві-три-чотири тисячі... тисяч
                                                    switch (tens % 10)
                                                    {
                                                        case 1:
                                                            result += Ordinal.getOnes(tens % 10) + "нa " + Ordinal.getClassName(classOfNumber) + "а ";
                                                            break;
                                                        case 2:
                                                            result += Ordinal.getOnes(tens % 10) + "і " + Ordinal.getClassName(classOfNumber) + "і ";
                                                            break;
                                                        case 3:
                                                            result += Ordinal.getOnes(tens % 10) + " " + Ordinal.getClassName(classOfNumber) + "і ";
                                                            break;
                                                        case 4:
                                                            result += Ordinal.getOnes(tens % 10) + " " + Ordinal.getClassName(classOfNumber) + "і ";
                                                            break;
                                                        default:
                                                            onesToOrdinal(tens % 10);
                                                            result += " " + Ordinal.getClassName(classOfNumber) + " ";
                                                            break;
                                                    }
                                                    break;
                                                case false:
                                                    onesToOrdinal(tens);
                                                    result += Ordinal.getClassName(classOfNumber) + " ";
                                                    break;
                                            }
                                            break;
                                        default:
                                            switch (tens > 19 || tens < 4)
                                            {
                                                case true: // один мільйон-мільярд... і тд. два мільйони-мільярди...
                                                    switch (tens % 10)
                                                    {
                                                        case 1:
                                                            result += Ordinal.getOnes(tens % 10) + "ин " + Ordinal.getClassName(classOfNumber) + " ";
                                                            break;
                                                        case 2:
                                                            result += Ordinal.getOnes(tens % 10) + "а " + Ordinal.getClassName(classOfNumber) + "и ";
                                                            break;
                                                        case 3:
                                                            result += Ordinal.getOnes(tens % 10) + " " + Ordinal.getClassName(classOfNumber) + "и ";
                                                            break;
                                                        case 4:
                                                            result += Ordinal.getOnes(tens % 10) + " " + Ordinal.getClassName(classOfNumber) + "и ";
                                                            break;
                                                        default:
                                                            onesToOrdinal(tens % 10);
                                                            result += Ordinal.getClassName(classOfNumber) + "ів ";
                                                            break;
                                                    }
                                                    break;
                                                case false:
                                                    onesToOrdinal(tens);
                                                    result += Ordinal.getClassName(classOfNumber) + "iв ";
                                                    break;
                                            }
                                            break;
                                    }
                                    break;
                            }
                            break;
                    }
                    break;
            }
            return result;
        }
    }
}