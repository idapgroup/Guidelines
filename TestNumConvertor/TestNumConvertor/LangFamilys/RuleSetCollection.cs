using System;
using System.Collections;
using System.Collections.Generic;

namespace TestNumConvertor.LangFamilys
{
    class RuleSetCollection : IDictionary<string, RuleSet>
    {
        private readonly Dictionary<string, RuleSet> ruleSets;

        public RuleSetCollection() => ruleSets = new Dictionary<string, RuleSet>();

        public void AddBaseRule(string setName, LanguageRule rule)
        {
            if (rule == null)
                throw new ArgumentNullException("rule");

            ruleSets.Add(setName, new RuleSet(rule));
        }

        public void AddBaseRule(string setName, RulePredicate rulePred, RuleFunc ruleFunc)
        {
            if (rulePred == null || ruleFunc == null)
                throw new ArgumentNullException();

            ruleSets.Add(setName, new RuleSet(new LanguageRule(rulePred, ruleFunc)));
        }

        #region IDictionary<string, RuleSet> Members
        public ICollection<string> Keys => ((IDictionary<string, RuleSet>)ruleSets).Keys;

        public ICollection<RuleSet> Values => ((IDictionary<string, RuleSet>)ruleSets).Values;

        public int Count => ruleSets.Count;

        public bool IsReadOnly => ((IDictionary<string, RuleSet>)ruleSets).IsReadOnly;

        public bool ContainsKey(string key) => ruleSets.ContainsKey(key);

        public void Add(string key, RuleSet value) => ruleSets.Add(key, value);

        public bool Remove(string key) => ruleSets.Remove(key);

        public bool TryGetValue(string key, out RuleSet value) => ruleSets.TryGetValue(key, out value);

        public void Clear() => ruleSets.Clear();

        public void Add(KeyValuePair<string, RuleSet> item)
        {
            ((IDictionary<string, RuleSet>)ruleSets).Add(item);
        }

        public bool Contains(KeyValuePair<string, RuleSet> item)
        {
            return ((IDictionary<string, RuleSet>)ruleSets).Contains(item);
        }

        public void CopyTo(KeyValuePair<string, RuleSet>[] array, int arrayIndex)
        {
            ((IDictionary<string, RuleSet>)ruleSets).CopyTo(array, arrayIndex);
        }

        public bool Remove(KeyValuePair<string, RuleSet> item)
        {
            return ((IDictionary<string, RuleSet>)ruleSets).Remove(item);
        }

        public IEnumerator<KeyValuePair<string, RuleSet>> GetEnumerator()
        {
            return ((IDictionary<string, RuleSet>)ruleSets).GetEnumerator();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return ((IDictionary<string, RuleSet>)ruleSets).GetEnumerator();
        }

        public RuleSet this[string key]
        {
            get => ruleSets[key];
            set => ruleSets[key] = value;
        }
        #endregion
    }
}
