public class German extends Language{
    public German() {
        numbToWord = new String[][]{
                {},
                {"null", "eins", "zwei", "drei", "vier", "fünf", "sechs", "sieben", "acht", "neun"},
                {"", "", "zwanzig", "dreißig", "vierzig", "fünfzig", "sechzig", "siebzig", "achtzig", "neunzig", "zehn", "elf", "zwölf", "dreizehn", "vierzehn", "fünfzehn", "sechzehn", "sechzehn", "sechzehn", "sechzehn"},
                {"", "einhundert", "zweihundert", "dreihundert", "vierhundert", "fünfhundert", "sechshundert", "siebenhundert", "achthundert", "neunhundert"},
                {"tausend"},
                {"Millionen", "Million", "Millionen"},
                {"Milliarden", "Milliarde", "Milliarden"},
                {"Billionen", "Billion", "Billionen"},
                {"Billiarden", "Billiarde", "Billiarden"}
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

        separator = new String[] {"", "", "und", "", "", " ", " ", " ", " "};

        reverseSequence = true;
    }
}
