using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task_solution
{
   public class Number_converter_to_Eng : IConvert, IParseXml
    {
        private delegate string ConvertDelegate(string str, int dischar, int dischar2);
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

        public Number_converter_to_Eng(Parse_Xml obj)
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
            Arr_Dischar[4] = Third_discharge_Func;
            Arr_Dischar[5] = Fifth_discharge_Func;
            Arr_Dischar[6] = Sixth_discharge_Func;
            Arr_Dischar[7] = Third_discharge_Func;
            Arr_Dischar[8] = Fifth_discharge_Func;
            Arr_Dischar[9] = Sixth_discharge_Func;
            Arr_Dischar[10] = Third_discharge_Func;
            Arr_Dischar[11] = Fifth_discharge_Func;
            Arr_Dischar[12] = Sixth_discharge_Func;
            Arr_Dischar[13] = Third_discharge_Func;
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
                if (textboxNum.Length < 3)
                    textboxNum = Arr_Dischar[textboxNum.Length](textboxNum, 0,0);
                else if (textboxNum.Length == 3)
                    textboxNum = Arr_Dischar[textboxNum.Length](textboxNum, 1,0);
                else if (textboxNum.Length < 6)
                    textboxNum = Arr_Dischar[textboxNum.Length](textboxNum, 2,0);
                else if (textboxNum.Length == 6)
                    textboxNum = Arr_Dischar[textboxNum.Length](textboxNum, 1,2);
                else if (textboxNum.Length < 9)
                    textboxNum = Arr_Dischar[textboxNum.Length](textboxNum, 3,0);
                else if (textboxNum.Length == 9)
                    textboxNum = Arr_Dischar[textboxNum.Length](textboxNum, 1,3);
                else if (textboxNum.Length < 12)
                    textboxNum = Arr_Dischar[textboxNum.Length](textboxNum, 4,0);
                else if (textboxNum.Length == 12)
                    textboxNum = Arr_Dischar[textboxNum.Length](textboxNum, 1, 4);
                else if (textboxNum.Length < 15)
                    textboxNum = Arr_Dischar[textboxNum.Length](textboxNum, 5, 0);
                else textboxNum = Arr_Dischar[textboxNum.Length](textboxNum,1, 5);
                
                return Numbers_transform(textboxNum);
            }
        }

        private string First_discharge_Func(string str, int dischar, int dischar2)
        {
            index = str.IndexOf('0');
            if (index == 0)
            {
                Form1.answer = Form1.answer.Substring(0, Form1.answer.Length - 1) + ending[1];
                str = "";
                return str;
            }
            Form1.answer += first_ten_numbers[int.Parse(str)];
            str = "";
            return str;
        }
        private string Second_discharge_Func(string str, int dischar, int dischar2)
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
        private string Third_discharge_Func(string str, int dischar, int dischar2)
        {
            number = int.Parse(str.Substring(0, 1));
            index = str.IndexOf('0');
            if (index == 0)
            {
                str = str.Substring(1);
            }
            else
            {
                Form1.answer += ten_numbers[number] + discharge[dischar] + " ";
                str = str.Substring(1);
            }
            return str;
        }
        private string Fifth_discharge_Func(string str, int dischar, int dischar2)
        {
            number = int.Parse(str.Substring(0, 1));
            number2 = int.Parse(str.Substring(0, 2));
            index = str.IndexOf('0');
            if (index == 0)
            {
                str = str.Substring(1);
            }
            else if (number2 < 20) // числа меньше 20
            {
                Form1.answer += ten_numbers[number2] + discharge[dischar] + " ";
                str = str.Substring(2);
            }
            else if (index == 1) // когда 0 после первой цифры
            {
                Form1.answer += tens[number] + " " + discharge[dischar] + " ";
                str = str.Substring(1);
            }
            else //числа больше 19
            {
                Form1.answer += tens[number] + " ";
                str = str.Substring(1);
            }
            return str;
        }
        private string Sixth_discharge_Func(string str, int dischar, int dischar2)
        {
            number = int.Parse(str.Substring(0, 1));
            index = str.IndexOf('0');
            if (index == 0)
            {
                str = str.Substring(1);
            }
            else if (str[1] == '0' && str[2] == '0')
            {
                Form1.answer += ten_numbers[number] + discharge[dischar] + " " + discharge[dischar2] + " ";
                str = str.Substring(1);
            }
            else
            {
                Form1.answer += ten_numbers[number] + discharge[dischar] + " ";
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
    }
}
