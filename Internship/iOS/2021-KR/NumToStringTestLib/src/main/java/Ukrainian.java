import java.util.HashMap;

public class Ukrainian extends Language {

    int wordCount;
    int wordLoopSize;
    boolean twoWordHundreds;
    boolean doubleDigitReverse;
    boolean spacesBetweenWords;
    HashMap<Integer, String> cardinalNums = new HashMap<>();
    HashMap<Integer, String> ordinalNums = new HashMap<>();
    HashMap<Integer, String> ordinalComponentNums = new HashMap<>();
    String [] degreeNames = {"тисяч", "мільон", "мільярд", "тріліон", "квадріліон"};
    String [] feminineNums = {"одна ", "дві "};
    String [] articles = {""};
    String [] conjunctions = {"", "", "", ""};
    String [] endings = {"ний", "a", "і", "а", "ів", "", ""};
    public Ukrainian() {
        this.wordCount = 21;
        this.wordLoopSize = (wordCount - 1) / 5;
        this.twoWordHundreds = false;
        this.doubleDigitReverse = false;
        this.spacesBetweenWords = true;
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
    public HashMap<Integer, String> getOrdinalComponentNums() {
        return ordinalComponentNums;
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
        cardinalNums.put(1, "один");
        cardinalNums.put(2, "два");
        cardinalNums.put(3, "три");
        cardinalNums.put(4, "чотири");
        cardinalNums.put(5, "п'ять");
        cardinalNums.put(6, "шість");
        cardinalNums.put(7, "сім");
        cardinalNums.put(8, "вісім");
        cardinalNums.put(9, "дев'ять");
        cardinalNums.put(10, "десять");
        cardinalNums.put(11, "одинадцять");
        cardinalNums.put(12, "дванадцять");
        cardinalNums.put(13, "тринадцять");
        cardinalNums.put(14, "чотирнадцять");
        cardinalNums.put(15, "п'ятнадцять");
        cardinalNums.put(16, "шістнадцять");
        cardinalNums.put(17, "сімнадцять");
        cardinalNums.put(18, "вісімнадцять");
        cardinalNums.put(19, "дев'ятнадцять");
        cardinalNums.put(20, "двадцять");
        cardinalNums.put(30, "тридцять");
        cardinalNums.put(40, "сорок");
        cardinalNums.put(50, "п'ятдесят");
        cardinalNums.put(60, "шістдесят");
        cardinalNums.put(70, "сімдесят");
        cardinalNums.put(80, "вісімдесят");
        cardinalNums.put(90, "дев'яносто");
        cardinalNums.put(100, "сто");
        cardinalNums.put(200, "двісті");
        cardinalNums.put(300, "триста");
        cardinalNums.put(400, "чотириста");
        cardinalNums.put(500, "п'ятсот");
        cardinalNums.put(600, "шістсот");
        cardinalNums.put(700, "сімсот");
        cardinalNums.put(800, "вісімсот");
        cardinalNums.put(900, "дев'ятсот");

        ordinalNums.put(1, "перший");
        ordinalNums.put(2, "другий");
        ordinalNums.put(3, "третій");
        ordinalNums.put(4, "четвертий");
        ordinalNums.put(5, "п'ятий");
        ordinalNums.put(6, "шостий");
        ordinalNums.put(7, "сьомий");
        ordinalNums.put(8, "восьмий");
        ordinalNums.put(9, "дев'ятий");
        ordinalNums.put(10, "десятий");
        ordinalNums.put(11, "одинадцятий");
        ordinalNums.put(12, "дванадцятий");
        ordinalNums.put(13, "тринадцятий");
        ordinalNums.put(14, "чотирнадцятий");
        ordinalNums.put(15, "п'ятнадцятий");
        ordinalNums.put(16, "шістнадцятий");
        ordinalNums.put(17, "сімнадцятий");
        ordinalNums.put(18, "вісімнадцятий");
        ordinalNums.put(19, "дев'ятнадцятий");
        ordinalNums.put(20, "двадцятий");
        ordinalNums.put(30, "тридцятий");
        ordinalNums.put(40, "сороковий");
        ordinalNums.put(50, "п'ятдесятий");
        ordinalNums.put(60, "шістдесятий");
        ordinalNums.put(70, "сімдесятий");
        ordinalNums.put(80, "вісімдесятий");
        ordinalNums.put(90, "дев'яностий");
        ordinalNums.put(100, "сотий");

        ordinalComponentNums.put(1, "одно");
        ordinalComponentNums.put(2, "двох");
        ordinalComponentNums.put(3, "трьох");
        ordinalComponentNums.put(4, "чотирьох");
        ordinalComponentNums.put(5, "п'яти");
        ordinalComponentNums.put(6, "шести");
        ordinalComponentNums.put(7, "семи");
        ordinalComponentNums.put(8, "восьми");
        ordinalComponentNums.put(9, "дев'яти");
        ordinalComponentNums.put(10, "десяти");
        ordinalComponentNums.put(11, "одинадцяти");
        ordinalComponentNums.put(12, "дванадцяти");
        ordinalComponentNums.put(13, "тринадцяти");
        ordinalComponentNums.put(14, "чотирнадцяти");
        ordinalComponentNums.put(15, "п'ятнадцяти");
        ordinalComponentNums.put(16, "шістнадцяти");
        ordinalComponentNums.put(17, "сімнадцяти");
        ordinalComponentNums.put(18, "вісімнадцяти");
        ordinalComponentNums.put(19, "дев'ятнадцяти");
        ordinalComponentNums.put(20, "двадцяти");
        ordinalComponentNums.put(30, "тридцяти");
        ordinalComponentNums.put(40, "сорока");
        ordinalComponentNums.put(50, "пятидесяти");
        ordinalComponentNums.put(60, "шестидесяти");
        ordinalComponentNums.put(70, "семидесяти");
        ordinalComponentNums.put(80, "восьмидесяти");
        ordinalComponentNums.put(90, "дев'яносто");
    }
}
