using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Task_solution
{
    public partial class Form1 : Form
    {
        public static string answer;
        public delegate void Number_Transform_Delegate(object sender, EventArgs e);
        Number_Transform_Delegate TextChenged;
        Parse_Xml obj;
        Number_converter_to_Ukr ConvertUkr;
        Number_converter_to_Eng ConvertEng;
        Number_converter_to_Ger ConvertGer;
        
        public Form1()
        {
            InitializeComponent();
            TextChenged = textBox1_TextChanged;
            Ukr.Checked = true; // при запуске программы устанавливаем язык
            textBox1.Select(); // установка курсора

            obj = new Parse_Xml();

            ConvertUkr = new Number_converter_to_Ukr(obj);
            ConvertEng = new Number_converter_to_Eng(obj);
            ConvertGer = new Number_converter_to_Ger(obj);

            ConvertUkr.Parse_from_Xml("Ukr.xml");
            ConvertEng.Parse_from_Xml("Eng.xml");
            ConvertGer.Parse_from_Xml("Ger.xml");
        }
        private void button1_Click(object sender, EventArgs e) // кнопка выход
        {
            this.Close();
        }
        private void textBox1_TextChanged(object sender, EventArgs e) // обработчик ввода числа
        {
            textBox2.Text = null;
            answer = null;
            if (textBox1.Text != string.Empty) 
            {
                    long res;
                    Int64.TryParse(textBox1.Text, out res);
                if (textBox1.Text.Length > 15 || res == 0) // проверка на 16-й символ
                {
                    try
                    {
                        throw new Exception("Введите целое число от 1 до 10^15-1");
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                    finally
                    {
                        for (int i=0; i < textBox1.Text.Length; i++)
                        {
                            if (!Char.IsDigit(textBox1.Text[i]))
                                textBox1.Text = textBox1.Text.Remove(i,1);
                            if (i == 15)
                            {
                                textBox1.Text = textBox1.Text.Substring(0, i);
                                break;
                            }
                        }
                    }
                }
                else
                {
                    if (Eng.Checked)
                        textBox2.Text = ConvertEng.Numbers_transform(textBox1.Text);
                    else if (Ukr.Checked)
                        textBox2.Text = ConvertUkr.Numbers_transform(textBox1.Text);
                    else textBox2.Text = ConvertGer.Numbers_transform(textBox1.Text);
                }
            }
        }
        private void radioButton1_CheckedChanged(object sender, EventArgs e) // обработчик выбора языка для преобразования
        {
            TextChenged.Invoke(sender,e); // вызов события textBox1_TextChanged
        }
    }
}