using System.Globalization;
using System.Text.RegularExpressions;
using System.Windows.Controls;

namespace TestNumConvertor
{
    class InputByRegexRule : ValidationRule
    {
        public string RegexExp { get; set; }
        public string ErrorMessage { get; set; }

        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            var reg = new Regex(RegexExp);

            if (reg.IsMatch((string)value))
                return ValidationResult.ValidResult;
            else
                return new ValidationResult(false, ErrorMessage);
        }
    }
}
