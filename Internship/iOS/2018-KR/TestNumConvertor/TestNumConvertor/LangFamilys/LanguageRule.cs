using System;

namespace TestNumConvertor.LangFamilys
{
    public delegate bool RulePredicate(ulong num, object param);
    public delegate RuleResult RuleFunc(ulong num, object param);

    class LanguageRule
    {
        private RulePredicate predicate;
        public RulePredicate Predicate
        {
            get => predicate;
            set => predicate = value ?? throw new ArgumentNullException("Predicate");
        }

        private RuleFunc func;
        public RuleFunc Func
        {
            get => func;
            set => func = value ?? throw new ArgumentNullException("Rule");
        }

        public LanguageRule(RulePredicate rulePred, RuleFunc ruleFunc)
        {
            Predicate = rulePred;
            Func = ruleFunc;
        }

        public static LanguageRule EmptyRule
        {
            get => new LanguageRule(
                (num, par) => false,
                (num, par) => RuleResult.EmptyString(num, par));
        }

        public RuleResult TryApplyRule(ulong num, object param)
        {
            return Predicate(num, param)
                ? Func(num, param)
                : RuleResult.EmptyString(num, param);
        }
    }
}
