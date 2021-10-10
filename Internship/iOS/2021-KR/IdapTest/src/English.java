public class English extends Language{
    public English() {
        numbToWord = new String[][]{
                {},
                {"zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"},
                {"", "", "twenty", "thirty", "fourty", "fifty", "sixty", "seventy", "eighty", "ninety", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"},
                {"", "one hundred", "two hundred", "three hundred", "four hundred", "five hundred", "six hundred", "seven hundred", "eight hundred", "nine hundred"},
                {"thousand"},
                {"million"},
                {"billion"},
                {"trillion"},
                {"quadrillion"}
        };

        variations = new String[][]{
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {},
                {}
        };

        separator = new String[] {" ", " ", "-", " ", " ", " ", " ", " ", " "};

        reverseSequence = false;
    }
}