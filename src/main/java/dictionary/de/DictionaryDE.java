package dictionary.de;

/**
 * Enum that stores a list of numbers and their written German cardinal/ordinal forms.
 */
public enum DictionaryDE {
    ONE (1, "ein", "erste"),
    TWO (2, "zwei","zweite"),
    THREE (3, "drei", "dritte"),
    FOURTH (4, "vier", "vierte"),
    FIVE (5, "fünf", "fünfte"),
    SIX (6, "sechs", "sechste"),
    SEVEN (7, "sieben", "siebte"),
    EIGHT (8, "acht", "achte"),
    NINE (9, "neun","neunte"),
    TEN (10, "zehn", "zehnte"),
    ELEVEN (11, "elf", "elfte"),
    TWELVE (12, "zwölf", "zwölfte"),
    THIRTEEN (13, "dreizehn", "dreizehnte"),
    FOURTEEN (14, "vierzehn", "vierzehnte"),
    FIFTEEN (15, "fünfzehn", "fünfzehnte"),
    SIXTEEN (16, "sechzehn", "sechzehnte"),
    SEVENTEEN (17, "siebzehn","siebzehnte"),
    EIGHTEEN (18, "achtzehn","achtzehnte"),
    NINETEEN (19, "neunzehn", "neunzehnte"),
    TWENTY (20, "zwanzig", "zwanzigste"),
    THIRTY (30, "dreizig", "dreizigste"),
    FORTY (40, "vierzig","vierzigste"),
    FIFTY (50, "fünfzig", "fünfzigste"),
    SIXTY (60, "sechzig", "sechzigste"),
    SEVENTY (70, "siebzig", "siebzigste"),
    EIGHTY (80, "achtzig", "achtzigste"),
    NINETY (90, "neunzig", "neunzigste"),
    HUNDRED (100, "hundert","hundertste"),
    THOUSAND (1000, "tausend","tausendste"),
    MILLION (1_000_000, "million","millionste"),
    BILLION (1_000_000_000, "milliarde", "milliardste"),
    QUADRILLION (1_000_000_000_000L, "billiarde", "billiardste");

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
    DictionaryDE(long number, String cardinalNumberName, String ordinalNumberName) {
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
        for (DictionaryDE n: DictionaryDE.values()) {
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
        for (DictionaryDE n: DictionaryDE.values()) {
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
