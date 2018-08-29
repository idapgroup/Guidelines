using System;
using System.Globalization;
using System.Windows.Data;
using System.Windows.Markup;

namespace TestNumConvertor
{
    public class EnumConvertor : MarkupExtension, IValueConverter
    {
        public object Convert(object val, Type targetType, object param, CultureInfo culture)
        {
            return EnumHelper.GetAllDescription(val.GetType());
        }

        public object ConvertBack(object val, Type targetType, object param, CultureInfo culture) => null;

        public override object ProvideValue(IServiceProvider serviceProvider) => this;
    }
}
