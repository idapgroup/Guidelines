using System;

namespace TestNumConvertor.LangFamilys
{
    public class RuleResult
    {
        public Tuple<string, ulong, object> Tuple => new Tuple<string, ulong, object>(String, Num, Param);

        public string String { get; private set; }

        public ulong Num { get; private set; }

        public object Param { get; private set; }

        public RuleResult(string resStr, ulong num, object param)
        {
            String = resStr;
            Num = num;
            Param = param;
        }

        public static RuleResult EmptyString(ulong num, object param) => new RuleResult(String.Empty, num, param);

        public static RuleResult operator +(RuleResult l, RuleResult r)
        {
            r.String = l.String + r.String;
            return r;
        }
    }
}
