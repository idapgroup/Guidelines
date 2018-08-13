using System;

namespace TestNumConvertor.LangFamilys
{
    class RuleSet
    {
        private LanguageRule beforeBaseRule;
        public LanguageRule BeforeBaseRule
        {
            get => beforeBaseRule;
            set => beforeBaseRule = value ?? throw new ArgumentNullException("BeforeBaseRule");
        }

        private LanguageRule baseRule;
        public LanguageRule BaseRule
        {
            get => baseRule;
            set => baseRule = value ?? throw new ArgumentNullException("BaseRule");
        }

        private LanguageRule afterBaseRule;
        public LanguageRule AfterBaseRule
        {
            get => afterBaseRule;
            set => afterBaseRule = value ?? throw new ArgumentNullException("AfterBaseRule");
        }

        public RuleSet(LanguageRule rule)
        {
            BaseRule = rule;
            BeforeBaseRule = LanguageRule.EmptyRule;
            AfterBaseRule = LanguageRule.EmptyRule;
        }

        public RuleSet(LanguageRule rule, LanguageRule beforeRule)
        {
            BaseRule = rule;
            BeforeBaseRule = beforeRule;
            AfterBaseRule = LanguageRule.EmptyRule;
        }

        public RuleSet(LanguageRule rule, LanguageRule beforeRule, LanguageRule afterRule)
        {
            BaseRule = rule;
            BeforeBaseRule = beforeRule;
            AfterBaseRule = afterRule;
        }

        public RuleResult ApplyRuleSet(ulong num, object param)
        {
            RuleResult res = BeforeBaseRule.TryApplyRule(num, param);
            res += BaseRule.TryApplyRule(res.Num, res.Param);
            return res + AfterBaseRule.TryApplyRule(res.Num, res.Param);
        }
    }
}
