import java.util.HashMap;

public class English extends Language {

    int wordCount;
    int wordLoopSize;
    boolean twoWordHundreds;
    boolean doubleDigitReverse;
    boolean spacesBetweenWords;
    HashMap<Integer, String> cardinalNums = new HashMap<>();
    HashMap<Integer, String> ordinalNums = new HashMap<>();
    String [] degreeNames = {"thousand", "million", "billion", "trillion", "quadrillion"};
    String [] feminineNums = {"", ""};
    String [] articles = {"the"};
    String [] conjunctions = {"and ", "-", " ", " "};
    String [] endings = {"th", "", "", "", "", ""};
    public English() {
        this.wordCount = 21;
        this.wordLoopSize = (wordCount - 1) / 5;
        this.twoWordHundreds = true;
        this.doubleDigitReverse = false;
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
        cardinalNums.put(1, "one");
        cardinalNums.put(2, "two");
        cardinalNums.put(3, "three");
        cardinalNums.put(4, "four");
        cardinalNums.put(5, "five");
        cardinalNums.put(6, "six");
        cardinalNums.put(7, "seven");
        cardinalNums.put(8, "eight");
        cardinalNums.put(9, "nine");
        cardinalNums.put(10, "ten");
        cardinalNums.put(11, "eleven");
        cardinalNums.put(12, "twelve");
        cardinalNums.put(13, "thirteen");
        cardinalNums.put(14, "fourteen");
        cardinalNums.put(15, "fifteen");
        cardinalNums.put(16, "sixteen");
        cardinalNums.put(17, "seventeen");
        cardinalNums.put(18, "eighteen");
        cardinalNums.put(19, "nineteen");
        cardinalNums.put(20, "twenty");
        cardinalNums.put(30, "thirty");
        cardinalNums.put(40, "forty");
        cardinalNums.put(50, "fifty");
        cardinalNums.put(60, "sixty");
        cardinalNums.put(70, "seventy");
        cardinalNums.put(80, "eighty");
        cardinalNums.put(90, "ninety");
        cardinalNums.put(100, "hundred");

        ordinalNums.put(1, "first");
        ordinalNums.put(2, "second");
        ordinalNums.put(3, "third");
        ordinalNums.put(4, "fourth");
        ordinalNums.put(5, "fifth");
        ordinalNums.put(6, "sixth");
        ordinalNums.put(7, "seventh");
        ordinalNums.put(8, "eighth");
        ordinalNums.put(9, "ninth");
        ordinalNums.put(10, "tenth");
        ordinalNums.put(11, "eleventh");
        ordinalNums.put(12, "twelfth");
        ordinalNums.put(13, "thirteenth");
        ordinalNums.put(14, "fourteenth");
        ordinalNums.put(15, "fifteenth");
        ordinalNums.put(16, "sixteenth");
        ordinalNums.put(17, "seventeenth");
        ordinalNums.put(18, "eighteenth");
        ordinalNums.put(19, "nineteenth");
        ordinalNums.put(20, "twentieth");
        ordinalNums.put(30, "thirtieth");
        ordinalNums.put(40, "fortieth");
        ordinalNums.put(50, "fiftieth");
        ordinalNums.put(60, "sixtieth");
        ordinalNums.put(70, "seventieth");
        ordinalNums.put(80, "eightieth");
        ordinalNums.put(90, "ninetieth");
        ordinalNums.put(100, "hundredth");
    }
}
