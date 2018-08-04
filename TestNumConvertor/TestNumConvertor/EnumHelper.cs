using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;

namespace TestNumConvertor
{
    public static class EnumHelper
    {
        private static string GetDescription(this Enum val)
        {
            var attrs = val.GetType()
                .GetField(val.ToString())
                .GetCustomAttributes(typeof(DescriptionAttribute), false);

            if (attrs.Any())
                return (attrs.First() as DescriptionAttribute).Description;

            return val.ToString();
        }

        public static IEnumerable<Tuple<object, object>> GetAllDescription(Type t)
        {
            return Enum.GetValues(t)
                .Cast<Enum>()
                .Select(val => new Tuple<object, object>(val, val.GetDescription()))
                .ToList();
        }

    }
}
