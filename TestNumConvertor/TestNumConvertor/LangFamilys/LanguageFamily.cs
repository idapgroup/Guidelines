using System;
using System.Collections.Generic;

namespace TestNumConvertor.LangFamilys
{
    abstract class LanguageFamily
    {
        protected readonly List<RuleSet> Rules;

        protected string RunAllRules(ulong num, object param)
        {
            var res = String.Empty;

            void TryApplyRule(LanguageRule rule)
            {
                if (rule != null && rule.Predicate(num, param))
                {
                    Tuple<string, ulong, object> tuple = rule.Rule(num, param);
                    res += tuple.Item1;
                    num = tuple.Item2;
                    param = tuple.Item3;
                }
            }

            foreach (var ruleSet in Rules)
            {
                TryApplyRule(ruleSet.BeforeBaseRule);
                TryApplyRule(ruleSet.BaseRule);
                TryApplyRule(ruleSet.AfterBaseRule);
            }

            return res;
        }

        protected LanguageFamily() => Rules = new List<RuleSet>();
    }
}
