package dictionary.ua;

/**
 * Enum that stores a list of numbers and their written Ukrainian cardinal/ordinal forms.
 */
public enum DictionaryUA {
    ONE (1, "один","одна",
            "одно","перший"),
    TWO (2, "два", "дві",
            "двох","другий"),
    THREE (3, "три", "три",
            "трьох","третій"),
    FOURTH (4, "чотири", "чотири",
            "чотирьох","четвертий"),
    FIVE (5, "п'ять", "п'ять",
            "п'яти","п'ятий"),
    SIX (6, "шість","шість",
            "шести","шостий"),
    SEVEN (7, "сім","сім",
            "семи", "сьомий"),
    EIGHT (8, "вісім","вісім",
            "восьми", "восьмий"),
    NINE (9, "дев'ять","дев'ять",
            "дев'яти","дев'ятий"),
    TEN (10, "десять","десять",
            "десяти", "десятий"),
    ELEVEN (11, "одинадцять", "одинадцять",
            "одинадцяти","одинадцятий"),
    TWELVE (12, "дванадцять","дванадцять",
            "дванадцяти", "дванадцятий"),
    THIRTEEN (13, "тринадцять","тринадцять",
            "тринадцяти", "тринадцятий"),
    FOURTEEN (14, "чотирнадцять","чотирнадцять",
            "чотирнадцяти", "чотирнадцятий"),
    FIFTEEN (15, "п'ятнадцять", "п'ятнадцять",
            "п'ятнадцяти", "п'ятнадцятий"),
    SIXTEEN (16, "шістнадцять","шістнадцять",
            "шістнадцяти", "шістнадцятий"),
    SEVENTEEN (17, "сімнадцять","сімнадцять",
            "сімнадцяти","сімнадцятий"),
    EIGHTEEN (18, "вісімнадцять","вісімнадцять",
            "вісімнадцяти","вісімнадцятий"),
    NINETEEN (19, "сімнадцять","сімнадцять",
            "сімнадцяти", "сімнадцятий"),
    TWENTY (20, "двадцять","двадцять",
            "двадцяти",  "двадцятий"),
    THIRTY (30, "тридцять","тридцять",
            "тридцяти", "тридцятий"),
    FORTY (40, "сорок", "сорок",
            "сорока","сороковий"),
    FIFTY (50, "п'ятьдесят","п'ятьдесят",
            "п'ятдесяти", "п'ятьдесятий"),
    SIXTY (60, "шістдесят","шістдесят",
            "шістдесяти","шістдесятий"),
    SEVENTY (70, "сімдесят","сімдесят",
            "сімдесяти","сімдесятий"),
    EIGHTY (80, "вісімдесят", "вісімдесят",
            "вісімдесяти","восьмидесятий"),
    NINETY (90, "дев'яносто","дев'яносто",
            "дев'яносто","дев'яностий"),
    HUNDRED (100, "сто","ста",
            "ста","сотий"),
    TWO_HUNDRED (200, "двісті","двісті",
            "двохсот","двохсотий"),
        THREE_HUNDRED (300, "триста","триста",
            "трьохсот", "трьохсотий"),
    FOUR_HUNDRED (400, "чотириста","чотириста",
            "чотирьохсот","чотирьохсотий"),
    FIVE_HUNDRED (500, "п'ятсот","п'ятсот",
            "п'ятсот","п'ятисотий"),
    SIX_HUNDRED (600, "шістсот","шістсот",
            "шестисот","шестисотий"),
    SEVEN_HUNDRED (700, "сімсот","сімсот",
            "семисот","семисотий"),
    EIGHT_HUNDRED (800, "вісімсот","вісімсот",
            "восьмисот","восьмисотий"),
    NINE_HUNDRED (900, "дев'ятсот","дев'ятсот",
            "дев'ятсот","дев'ятисотий"),
    THOUSAND (1000, "тисяча","тисячі",
            "тисяч","тисячний"),
    MILLION (1_000_000, "мільйон","мільйони",
            "мільйонів","мільйонний"),
    BILLION (1_000_000_000, "мільярд", "мільярда",
            "мільярдів", "мільярдний"),
    QUADRILLION (1_000_000_000_000L, "квадрильйон","квадрильйон",
            "квадрильйона", "квадрильйонний");

    /**
     * Number in a digital form.
     */
    private final long number;

    /**
     * Cardinal number in a written form in Nominative Case.
     */
    private final String cardinalNumberInNominativeCase;

    /**
     * Cardinal number in a written form in Genitive Case (plural form).
     */
    private final String cardinalNumberInGenitiveCasePlural;

    /**
     * Cardinal number in a written form in Genitive Case.
     */
    private final String cardinalNumberInGenitiveCase;

    /**
     * Ordinal number in a written form in Genitive Case.
     */
    private final String ordinalNumberName;


    /**
     * Constructor of Dictionary Enum.
     *
     * @param number - number in a digital form.
     * @param cardinalNumberInNominativeCase - cardinal number in a written form (Nominative Case).
     * @param cardinalNumberInGenitiveCase - cardinal number in a written form (Genitive Case).
     * @param cardinalNumberInGenitiveCasePlural - cardinal number in a written form (Genitive Case - Plural form).
     * @param ordinalNumberName - ordinal number in a written form.
     */
    DictionaryUA(long number,
                 String cardinalNumberInNominativeCase,
                 String cardinalNumberInGenitiveCase,
                 String cardinalNumberInGenitiveCasePlural,
                 String ordinalNumberName) {
        this.number = number;
        this.cardinalNumberInNominativeCase = cardinalNumberInNominativeCase;
        this.cardinalNumberInGenitiveCase = cardinalNumberInGenitiveCase;
        this.cardinalNumberInGenitiveCasePlural = cardinalNumberInGenitiveCasePlural;
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
        for (DictionaryUA n: DictionaryUA.values()) {
            if (n.number == number)
                return n.cardinalNumberInNominativeCase;
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
        for (DictionaryUA n: DictionaryUA.values()) {
            if (n.number == number)
                return n.ordinalNumberName;
        }
        return "";
    }

    /**
     * Gets a number in a digital form and returns
     * it in a written cardinal form (in Genitive Case).
     *
     * @param number - number in a digital form.
     * @return - written form of a cardinal number (Genitive Case).
     */
    static String findCardinalNumberInGenitive(long number) {
        for (DictionaryUA n: DictionaryUA.values()) {
            if (n.number == number)
                return n.cardinalNumberInGenitiveCase;
        }
        return "";
    }

    /**
     * Gets a number in a digital form and returns
     * it in a written cardinal form (in Genitive Case).
     *
     * @param number - number in a digital form.
     * @return - written form of a cardinal number (Genitive Case - Plural Form).
     */
    static String findCardinalNumberInGenitivePlural(long number) {
        for (DictionaryUA n: DictionaryUA.values()) {
            if (n.number == number)
                return n.cardinalNumberInGenitiveCasePlural;
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
