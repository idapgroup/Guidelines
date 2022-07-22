import java.util.HashMap;

public class Language {

    int wordCount;
    int wordLoopSize;
    boolean twoWordHundreds;
    boolean doubleDigitReverse;
    boolean spacesBetweenWords;

    HashMap<Integer, String> cardinalNums;
    HashMap<Integer, String> ordinalNums;
    HashMap<Integer, String> ordinalComponentNums = new HashMap<>();
    String [] degreeNames;
    String [] feminineNums;
    String [] articles;
    String [] conjunctions;
    String [] endings;

    public HashMap<Integer, String> getCardinalNums() {
        return cardinalNums;
    }
    public HashMap<Integer, String> getOrdinalNums() {
        return ordinalNums;
    }
    public String[] getDegreeNames() {
        return degreeNames;
    }
    public int getWordCount() {
        return wordCount;
    }
    public int getWordLoopSize() {
        return wordLoopSize;
    }
    public String[] getArticles() {
        return articles;
    }
    public String[] getConjunctions() {
        return conjunctions;
    }
    public String[] getEndings() {
        return endings;
    }
    public HashMap<Integer, String> getOrdinalComponentNums() {
        return ordinalComponentNums;
    }
    public String[] getFeminineNums() {
        return feminineNums;
    }
    public boolean isTwoWordHundreds() {
        return twoWordHundreds;
    }
    public boolean isDoubleDigitReverse() {
        return doubleDigitReverse;
    }
    public boolean isSpacesBetweenWords() {
        return spacesBetweenWords;
    }
}
