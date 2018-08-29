namespace TestNumConvertor.LangFamilys
{
    abstract class LanguageFamily
    {
        protected RuleSetCollection RuleSets { get; private set; }

        protected string RunAllRules(ulong num, object param)
        {
            var ruleRes = RuleResult.EmptyString(num, param);

            foreach (RuleSet ruleSet in RuleSets.Values)
                ruleRes += ruleSet.ApplyRuleSet(ruleRes.Num, ruleRes.Param);

            return ruleRes.String;
        }

        protected LanguageFamily() => RuleSets = new RuleSetCollection();
    }
}
