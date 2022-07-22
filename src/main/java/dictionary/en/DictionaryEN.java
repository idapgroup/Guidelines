package dictionary.en;


/**
 * Enum that stores a list of numbers and their written English cardinal/ordinal forms.
 */
public enum DictionaryEN {
    ONE (1, "one","first"),
    TWO (2, "two", "second"),
    THREE (3, "three", "third"),
    FOURTH (4, "four", "fourth"),
    FIVE (5, "five", "fifth"),
    SIX (6, "six", "sixth"),
    SEVEN (7, "seven", "seventh"),
    EIGHT (8, "eight", "eighth"),
    NINE (9, "nine","ninth"),
    TEN (10, "ten", "tenth"),
    ELEVEN (11, "eleven", "eleventh"),
    TWELVE (12, "twelve", "twelfth"),
    THIRTEEN (13, "thirteen", "thirteenth"),
    FOURTEEN (14, "fourteen", "fourteenth"),
    FIFTEEN (15, "fifteen", "fifteenth"),
    SIXTEEN (16, "sixteen", "sixteenth"),
    SEVENTEEN (17, "seventeen","seventeenth"),
    EIGHTEEN (18, "eighteen","eighteenth"),
    NINETEEN (19, "nineteen", "nineteenth"),
    TWENTY (20, "twenty", "twentieth"),
    THIRTY (30, "thirty", "thirtieth"),
    FORTY (40, "forty","fortieth"),
    FIFTY (50, "fifty", "fiftieth"),
    SIXTY (60, "sixty", "sixtieth"),
    SEVENTY (70, "seventy", "seventieth"),
    EIGHTY (80, "eighty", "eightieth"),
    NINETY (90, "ninety", "ninetieth"),
    HUNDRED (100, "hundred","hundredth"),
    THOUSAND (1000, "thousand","thousandth"),
    MILLION (1_000_000, "million","millionth"),
    BILLION (1_000_000_000, "billion", "billionth"),
    QUADRILLION (1_000_000_000_000L, "quadrillion", "quadrillionth");

    /**
     * Number in a digital form.
     */
    private final long number;

    /**
     * Cardinal number in a written form.
     */
    private final String cardinalNumberName;

    /**
     * Ordinal number in a written form.
     */
    private final String ordinalNumberName;

    /**
     * Constructor of Dictionary Enum.
     *
     * @param number - number in a digital form.
     * @param cardinalNumberName - cardinal number in a written form.
     * @param ordinalNumberName - ordinal number in a written form.
     */
    DictionaryEN(long number, String cardinalNumberName, String ordinalNumberName) {
        this.number = number;
        this.cardinalNumberName = cardinalNumberName;
        this.ordinalNumberName = ordinalNumberName;
    }

    /**
     * Gets a number in a digital form and returns
     * it in a written cardinal form.
     *
     * @param number - number in a digital form.
     * @return - written form of a cardinal number.
     */
    static String findCardinalNumber(long number) {
        for (DictionaryEN n: DictionaryEN.values()) {
            if (n.number == number)
                return n.cardinalNumberName;
        }
        return "";
    }

    /**
     * Gets a number in a digital form and returns
     * it in a written ordinal form.
     *
     * @param number - number in a digital form.
     * @return - written form of an ordinal number.
     */
    static String findOrdinalNumber(long number) {
        for (DictionaryEN n: DictionaryEN.values()) {
            if (n.number == number)
                return n.ordinalNumberName;
        }
        return "";
    }

    /**
     * Returns maximum number in a dictionary.
     *
     * @return - maximum number.
     */
    public static long getMaxValue() {
        return QUADRILLION.number;
    }
}
