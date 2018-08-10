namespace TestNumConvertor.LangFamilys
{
    class RuleSet
    {
        public LanguageRule BeforeBaseRule { get; set; }
        public LanguageRule BaseRule { get; set; }
        public LanguageRule AfterBaseRule { get; set; }

        public RuleSet(LanguageRule baseRule) => BaseRule = baseRule;
    }
}
