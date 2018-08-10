using System;

namespace TestNumConvertor.LangFamilys
{
    class LanguageRule
    {
        public delegate Tuple<string, ulong, object> RuleFunc(ulong num, object param);

        public Func<ulong, object, bool> Predicate { get; set; }
        public RuleFunc Rule { get; set; }

        public LanguageRule(Func<ulong, object, bool> pred, RuleFunc rule)
        {
            Predicate = pred;
            Rule = rule;
        }
    }
}
