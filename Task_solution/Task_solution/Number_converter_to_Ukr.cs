using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task_solution
{
    public class Number_converter_to_Ukr : IConvert, IParseXml
    {
        private delegate string ConvertDelegate(string str, int dischar);
        ConvertDelegate[] Arr_Dischar; // массив делегатов для методов

        Dictionary<int, string> first_ten_numbers;
        Dictionary<int, string> ten_numbers;
        Dictionary<int, string> tens;
        Dictionary<int, string> ordinal_ten;
        Dictionary<int, string> discharge;
        Dictionary<int, string> hundreds;
        Dictionary<int, string> ending;
        Parse_Xml Pars;

        int index;
        int number;
        int number2;

        public Number_converter_to_Ukr(Parse_Xml obj)
        {
            Pars = obj;
            first_ten_numbers = new Dictionary<int, string>();
            ten_numbers = new Dictionary<int, string>(); 
            tens = new Dictionary<int, string>();
            discharge = new Dictionary<int, string>();
            ordinal_ten = new Dictionary<int, string>();
            hundreds = new Dictionary<int, string>();
            ending = new Dictionary<int, string>();
            // заполняем массив методами
            Arr_Dischar = new ConvertDelegate[16];
            Arr_Dischar[1] = First_discharge_Func;
            Arr_Dischar[2] = Second_discharge_Func;
            Arr_Dischar[3] = Third_discharge_Func;
            Arr_Dischar[4] = Fourth_discharge_Func;
            Arr_Dischar[5] = Fifth_discharge_Func;
            Arr_Dischar[6] = Sixth_discharge_Func;
            Arr_Dischar[7] = Seventh_discharge_Func;
            Arr_Dischar[8] = Fifth_discharge_Func;
            Arr_Dischar[9] = Sixth_discharge_Func;
            Arr_Dischar[10] = Seventh_discharge_Func;
            Arr_Dischar[11] = Fifth_discharge_Func;
            Arr_Dischar[12] = Sixth_discharge_Func;
            Arr_Dischar[13] = Seventh_discharge_Func;
            Arr_Dischar[14] = Fifth_discharge_Func;
            Arr_Dischar[15] = Sixth_discharge_Func;
        }

        public string Numbers_transform(string textboxNum)
        {
            if (textboxNum == "")
            {
                return Form1.answer;
            }
            else
            {
                if(textboxNum.Length < 4)
                    textboxNum = Arr_Dischar[textboxNum.Length](textboxNum, 0);
                else if(textboxNum.Length < 7)
                    textboxNum = Arr_Dischar[textboxNum.Length](textboxNum, 2);
                else if (textboxNum.Length == 7)
                    textboxNum = Arr_Dischar[textboxNum.Length](textboxNum, 6);
                else if (textboxNum.Length < 10)
                    textboxNum = Arr_Dischar[textboxNum.Length](textboxNum, 3);
                else if (textboxNum.Length == 10)
                    textboxNum = Arr_Dischar[textboxNum.Length](textboxNum, 7);
                else if (textboxNum.Length < 13)
                    textboxNum = Arr_Dischar[textboxNum.Length](textboxNum, 4);
                else if (textboxNum.Length == 13)
                    textboxNum = Arr_Dischar[textboxNum.Length](textboxNum, 8);
                else textboxNum = Arr_Dischar[textboxNum.Length](textboxNum, 5);
                
                return Numbers_transform(textboxNum);
            }
        }

        private string First_discharge_Func(string str, int dischar) // 1 разряд
        {
            Form1.answer += first_ten_numbers[int.Parse(str)];
            str = "";
            return str;
        }
        private string Second_discharge_Func(string str, int dischar) // 2 разряд
        {
            number = int.Parse(str);
            index = str.IndexOf('0');
            if (index == 0)
            {
                str = str.Substring(1);
            }
            else if (index == 1)
            {
                Form1.answer += ordinal_ten[number / 10];
                str = "";
            }
            else if (number < 20)
            {
                Form1.answer += first_ten_numbers[number] + " ";
                str = "";
            }
            else
            {
                Form1.answer += tens[number / 10] + " ";
                str = str.Substring(1);
            }
            return str;
        }
        private string Third_discharge_Func(string str, int dischar) // 3 разряд
        {
            number = int.Parse(str.Substring(0, 1));
            index = str.IndexOf('0');
            if (index == 0)
            {
                str = str.Substring(1);
            }
            else if (Is_Null_ToEnd(str, 1))
            {
                Form1.answer += ordinal_ten[number + 9];
                str = "";
            }
            else
            {
                Form1.answer += hundreds[number] + " ";
                str = str.Substring(1);
            }
            return str;
        }
        private string Fourth_discharge_Func(string str, int dischar) // 4 разряд
        {
            number = int.Parse(str.Substring(0, 1));
            index = str.IndexOf('0');
            if (index == 0)
            {
                str = str.Substring(1);
            }
            else if (Is_Null_ToEnd(str, 1))
            {
                Form1.answer += ordinal_ten[number + 18] + discharge[dischar + 4];
                str = "";
            }
            else
            {
                if (number > 1 && number < 5)
                    Form1.answer += ten_numbers[number] + ending[dischar + 3] + " "; //тисячі
                else if (number > 4)
                    Form1.answer += ten_numbers[number] + ending[dischar - 1] + " "; //тисяч
                else
                    Form1.answer += ten_numbers[number] + discharge[dischar] + " ";
                str = str.Substring(1);
            }
            return str;
        }
        private string Fifth_discharge_Func(string str, int dischar) // 5 разряд
        {
            number = int.Parse(str.Substring(0, 1));
            number2 = int.Parse(str.Substring(0, 2));
            index = str.IndexOf('0');
            if (index == 0)
            {
                str = str.Substring(1);
            }
            else if (Is_Null_ToEnd(str, 1) || Is_Null_ToEnd(str, 2)) // все что заканчивается на 000
            {
                if (index == 1)
                {
                    Form1.answer += tens[number + 9] + discharge[dischar + 4]; //тисячний
                    str = "";
                }
                else if (number2 < 20)
                {
                    Form1.answer += ten_numbers[number2].Replace('ь', 'и') + discharge[dischar + 4];
                    str = "";
                }
                else
                {
                    Form1.answer += tens[number + 9]; // все что > 19 и не десяток (50,60).
                    str = str.Substring(1);
                }
            }
            else if (index == 1) // когда 0 после первой цифры "пример 10 121"
            {
                Form1.answer += tens[number] + " " + ending[dischar - 1] + " "; //
                str = str.Substring(1);
            }
            else if (number2 < 20) // числа меньше 20
            {
                Form1.answer += ten_numbers[number2] + " " + ending[dischar - 1] + " ";
                str = str.Substring(2);
            }
            else //числа больше 19
            {
                Form1.answer += tens[number] + " ";
                str = str.Substring(1);
            }
            return str;
        }
        private string Sixth_discharge_Func(string str, int dischar) // 6 разряд
        {
            number = int.Parse(str.Substring(0, 1));
            index = str.IndexOf('0');
            if (index == 0)
            {
                str = str.Substring(1);
            }
            else if (Is_Null_ToEnd(str, 1)) // когда все 0
            {
                if (number > 1)
                    Form1.answer += ordinal_ten[number + 9].Substring(0, ordinal_ten[number + 9].Length - 2) + discharge[dischar + 4];
                else Form1.answer += discharge[1] + discharge[dischar + 4];
                str = "";
            }
            else if (str[1] == '0' && str[2] == '0') // когда два ноля после первой цифры
            {
                Form1.answer += hundreds[number] + " " + ending[dischar - 1] + " ";
                str = str.Substring(1);
            }
            else
            {
                Form1.answer += hundreds[number];
                str = str.Substring(1);
            }
            return str;
        }
        private string Seventh_discharge_Func(string str, int dischar) // 7 разряд
        {   
            number = int.Parse(str.Substring(0, 1));
            index = str.IndexOf('0');
            if (index == 0)
            {
                str = str.Substring(1);
            }
            else if (Is_Null_ToEnd(str, 1)) // мільйонний
            {
                if (number != 1)
                {
                    Form1.answer += ordinal_ten[number + 18] + discharge[dischar + 1];
                }
                else Form1.answer += discharge[dischar + 1];
                str = "";
            }
            else
            {
                if (number == 1)
                    Form1.answer += ending[number + 8] + " " + discharge[dischar - 3] + " "; //мільйон, мільярд
                else if (number == 2)
                    Form1.answer += ending[number + 8] + " " + ending[dischar] + " "; //мільйони, мільярди
                else if (number < 5)
                    Form1.answer += ten_numbers[number] + " " + ending[dischar] + " "; //мільйони, мільярди
                else
                    Form1.answer += ten_numbers[number] + " " + ending[dischar - 4] + " "; //мільйонів, мільярдів 
                str = str.Substring(1);
            }
            return str;
        }

        public void Parse_from_Xml(string name_Xml)
        {
            first_ten_numbers = Pars.Parser(name_Xml, "first_ten_numbers", first_ten_numbers);
            ten_numbers = Pars.Parser(name_Xml, "ten_numbers", ten_numbers);
            tens = Pars.Parser(name_Xml, "tens", tens);
            discharge = Pars.Parser(name_Xml, "discharge", discharge);
            ordinal_ten = Pars.Parser(name_Xml, "ordinal_ten", ordinal_ten);
            hundreds = Pars.Parser(name_Xml, "hundreds", hundreds);
            ending = Pars.Parser(name_Xml, "ending", ending);
        }

        private bool Is_Null_ToEnd(string str, int start) // проверка строки на ноли
        {
            int count = 0;
            for (int i = start; i < str.Length; i++)
            {
                if (str[i] == '0')
                    count++;
            }
            if (count == str.Length - start)
                return true;
            else return false;
        }
    }
}
