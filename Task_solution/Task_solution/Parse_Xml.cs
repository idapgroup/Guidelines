using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Task_solution
{
    public class Parse_Xml
    {
        public Dictionary<int, string> Parser(string name_Xml, string name_Element, Dictionary<int, string> name_Dict)
        {
            XDocument xdoc = XDocument.Load(name_Xml);
            int count = 1;
            foreach (XElement digit_number in xdoc.Element("numbers").Elements(name_Element))
            {
                foreach (XElement number in digit_number.Nodes())
                {
                    name_Dict.Add(count++, number.Value);
                }
            }
            return name_Dict;
        }
    }
}
