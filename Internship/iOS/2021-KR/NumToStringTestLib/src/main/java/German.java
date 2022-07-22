import java.util.HashMap;

public class German extends Language{

    int wordCount;
    int wordLoopSize;
    boolean twoWordHundreds;
    boolean doubleDigitReverse;
    boolean spacesBetweenWords;
    HashMap<Integer, String> cardinalNums = new HashMap<>();
    HashMap<Integer, String> ordinalNums = new HashMap<>();
    String [] degreeNames = {"Tausend", "Million", "Milliarde", "Billion", "Billiarde"};
    String [] feminineNums = {"", ""};
    String [] articles = {"der"};
    String [] conjunctions = {"und", "", "", " "};
    String [] endings = {"ste", "", "", "", "", ""};
    public German() {
        this.wordCount = 21;
        this.wordLoopSize = (wordCount - 1) / 5;
        this.twoWordHundreds = true;
        this.doubleDigitReverse = true;
        this.spacesBetweenWords = false;
        fillingMap();
    }

    @Override
    public HashMap<Integer, String> getCardinalNums() {
        return cardinalNums;
    }
    @Override
    public HashMap<Integer, String> getOrdinalNums() {
        return ordinalNums;
    }
    @Override
    public String[] getDegreeNames() {
        return degreeNames;
    }
    @Override
    public int getWordCount() {
        return wordCount;
    }
    @Override
    public int getWordLoopSize() {
        return wordLoopSize;
    }
    @Override
    public String[] getArticles() {
        return articles;
    }
    @Override
    public String[] getConjunctions() {
        return conjunctions;
    }
    @Override
    public String[] getEndings() {
        return endings;
    }
    @Override
    public String[] getFeminineNums() {
        return feminineNums;
    }
    @Override
    public boolean isTwoWordHundreds() {
        return twoWordHundreds;
    }
    @Override
    public boolean isDoubleDigitReverse() {
        return doubleDigitReverse;
    }
    @Override
    public boolean isSpacesBetweenWords() {
        return spacesBetweenWords;
    }

    public void fillingMap() {
        cardinalNums.put(1, "ein");
        cardinalNums.put(2, "zwei");
        cardinalNums.put(3, "drei");
        cardinalNums.put(4, "vier");
        cardinalNums.put(5, "funf");
        cardinalNums.put(6, "sechs");
        cardinalNums.put(7, "sieben");
        cardinalNums.put(8, "acht");
        cardinalNums.put(9, "neun");
        cardinalNums.put(10, "zehn");
        cardinalNums.put(11, "elf");
        cardinalNums.put(12, "zwolf");
        cardinalNums.put(13, "dreizehn");
        cardinalNums.put(14, "vierzehn");
        cardinalNums.put(15, "fünfzehn");
        cardinalNums.put(16, "sechzehn");
        cardinalNums.put(17, "siebzehn");
        cardinalNums.put(18, "achtzehn");
        cardinalNums.put(19, "neunzehn");
        cardinalNums.put(20, "zwanzig");
        cardinalNums.put(30, "dreiBig");
        cardinalNums.put(40, "vierzig");
        cardinalNums.put(50, "funfzig");
        cardinalNums.put(60, "sechzig");
        cardinalNums.put(70, "siebzig");
        cardinalNums.put(80, "achtzig");
        cardinalNums.put(90, "neunzig");
        cardinalNums.put(100, "hundert");

        ordinalNums.put(1, "erste");
        ordinalNums.put(2, "zweite");
        ordinalNums.put(3, "dritte");
        ordinalNums.put(4, "vierte");
        ordinalNums.put(5, "funfte");
        ordinalNums.put(6, "sechste");
        ordinalNums.put(7, "sieb(en)te");
        ordinalNums.put(8, "achte");
        ordinalNums.put(9, "neunte");
        ordinalNums.put(10, "zehnte");
        ordinalNums.put(11, "elfte");
        ordinalNums.put(12, "zwolfte");
        ordinalNums.put(13, "dreizehnte");
        ordinalNums.put(14, "vierzehnte");
        ordinalNums.put(15, "funfzehnte");
        ordinalNums.put(16, "sechzehnte");
        ordinalNums.put(17, "siebzehnte");
        ordinalNums.put(18, "achtzehnte");
        ordinalNums.put(19, "neunzehnte");
        ordinalNums.put(20, "zwanzigste");
        ordinalNums.put(30, "dreiBigste");
        ordinalNums.put(40, "vierzigste");
        ordinalNums.put(50, "funfzigste");
        ordinalNums.put(60, "sechzigste");
        ordinalNums.put(70, "siebzigste");
        ordinalNums.put(80, "achtzigste");
        ordinalNums.put(90, "neunzigste");
        ordinalNums.put(100, "hundertste");
    }
}
