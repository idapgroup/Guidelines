import java.util.*;

public class Main {

    public static void main(String[] args) {
        callConsole();
    }

    /**
     * This method calls the console for the user to enter a number.
     */
    private static void callConsole() {
        Scanner in = new Scanner(System.in);
        System.out.print("Input a number: ");
        Long inputValue = in.nextLong();
        System.out.printf("Your number is: " + transformLongToOrdinalString(inputValue, new English()));
        System.out.printf("Your number is: " + transformLongToOrdinalString(inputValue, new Ukrainian()));
        System.out.printf("Your number is: " + transformLongToOrdinalString(inputValue, new German()));
        in.close();
    }

    /**
     * This method transforms input Long number into ordinal strings.
     * @param inputValue input Long number.
     * @param language language class.
     * @return array of int digits.
     */
    private static String transformLongToOrdinalString(Long inputValue, Language language) {

        int nullCounter = 0;
        boolean degreeDeclension = false;

        //language settings
        String[] degreeNames = language.getDegreeNames();
        HashMap<Integer, String> cardinalNums = language.getCardinalNums();
        HashMap<Integer, String> ordinalNums = language.getOrdinalNums();
        HashMap<Integer, String> ordinalComponentNums = language.getOrdinalComponentNums();

        //int to string array
        String[] strDigits = inputValue.toString().split("");

        //digits array
        int[] digits = stringArrayToIntArray(strDigits);

        //words array
        String[] words = new String[language.getWordCount()];

        //words iterator
        int j = words.length - 1;

        //degree array iterator
        int degreeNamesNum = -1;

        String spacer = "";
        if (language.isSpacesBetweenWords()) {
            spacer = " ";
        }

        //transformation logic
        for (int i = digits.length - 1; i > -1; j--) {

            /* first number */
            if (digits[i] != 0) {
                //general algorithm
                if (i != digits.length - 1)
                    words[j] = cardinalNums.get(digits[i]);
                if (i == digits.length - 1)
                    words[j] = ordinalNums.get(digits[i]);
                if (degreeDeclension && ordinalComponentNums.containsKey(digits[i])) {
                    words[j] = ordinalComponentNums.get(digits[i]);
                } else {
                    words[j] += spacer;
                }
                // handling declension (ukrainian)
                if (i == digits.length - 4 && !degreeDeclension && !language.getFeminineNums()[0].isEmpty()) {
                    if (digits[i] == 1)
                        words[j] = language.getFeminineNums()[0];
                    if (digits[i] == 2)
                        words[j] = language.getFeminineNums()[1];
                }
                // handling word reverse (german)
                if (language.isDoubleDigitReverse()) {
                    if (digits.length == 1) {
                        words[j] = ordinalNums.get(digits[i]);
                    } else {
                        words[j] = cardinalNums.get(digits[i]);
                        if (i == digits.length - 1 && digits[i - 1] == 0)
                            words[j] = ordinalNums.get(digits[i]);
                        if (i != 0 && digits[i - 1] != 0)
                            words[j] += language.getConjunctions()[0];
                    }
                }
                if ((degreeNamesNum + 1) == nullCounter / 3 && digits[i] == 1 && digits.length > 1 && i == 0) {
                    words[j] = null;
                }
            } else {
                nullCounter++;
            }
            i--;
            j--;

            if (i == -1)
                break;
            /* second number */
            if (digits[i] != 0) {
                //general algorithm
                if (digits[i] == 1) {
                    words[j + 1] = null;
                    if (i == digits.length - 2) {
                        words[j] = ordinalNums.get(digits[i + 1] + 10);
                    } else {
                        words[j] = cardinalNums.get(digits[i + 1] + 10);
                    }
                } else {
                    if (digits[i + 1] == 0) {
                        words[j] = cardinalNums.get(digits[i] * 10);
                        if (i == digits.length - 2)
                            words[j] = ordinalNums.get(digits[i] * 10);
                    }
                    if (digits[i + 1] > 0)
                        words[j] = cardinalNums.get(digits[i] * 10) + (language.getConjunctions())[1];
                }
                // handling declension (ukrainian)
                if (degreeDeclension && ordinalComponentNums.containsKey(digits[i] * 10)) {
                    words[j] = ordinalComponentNums.get(digits[i] * 10);
                } else {
                    words[j] += spacer;
                }
                // handling word reverse (german)
                if (language.isDoubleDigitReverse()) {
                    String buffer = words[j + 1];
                    if (digits[i + 1] == 0 || digits[i] == 1) {
                        words[j + 1] = words[j];
                    } else {
                        words[j + 1] = words[j];
                        if (i == digits.length - 2) {
                            words[j + 1] += language.getEndings()[0];
                        }
                    }
                    words[j] = buffer;
                }
            } else {
                nullCounter++;
            }
            i--;
            j--;

            if (i == -1)
                break;
            /* third number */
            if (digits[i] != 0) {
                //general algorithm
                if (!language.isTwoWordHundreds()) {
                    words[j] = cardinalNums.get(digits[i] * 100);
                } else {
                    words[j] = cardinalNums.get(digits[i]) + language.getConjunctions()[2] + cardinalNums.get(100);
                    if (i == digits.length - 3 && nullCounter == 2)
                        words[j] += language.getEndings()[0];
                }
                //conjunctions (english)
                if (!language.isDoubleDigitReverse() && (digits[i + 1] != 0 || digits[i + 2] != 0)) {
                    words[j] += language.getConjunctions()[2] + language.getConjunctions()[0];
                }
                //ordinal hundreds handling (ukrainian)
                if (ordinalComponentNums.containsKey(digits[i]) && i == digits.length - 3 && nullCounter == 2) {
                    if (digits[i] != 1) {
                        words[j] = ordinalComponentNums.get(digits[i]) + ordinalNums.get(100);
                    } else {
                        words[j] = ordinalNums.get(100);
                    }
                }
                if (!degreeDeclension) {
                    words[j] += spacer;
                }
                if (language.isDoubleDigitReverse()) {
                    if (digits[i] == 1)
                        words[j] = cardinalNums.get(digits[i]) + cardinalNums.get(100);
                }
            } else {
                nullCounter++;
            }
            i--;
            j--;

            if (i == -1)
                break;
            /* next three digits check */
            degreeDeclension = false;
            for (int k = 0; k < 3; k++) {
                if (i - k >= 0 && digits[i - k] != 0) {
                    degreeNamesNum = ((language.getWordCount() - j) / language.getWordLoopSize()) - 1;
                    words[j] = degreeNames[degreeNamesNum];
                    degreeDeclension = degreeNameHandling(i, j, digits, words, language, degreeNamesNum, nullCounter, degreeDeclension);

                    break;
                }
            }
        }
        return stringFormation(words, language);
    }

    /**
     * This method handles the nominal form of the powers of a thousand.
     * @param i digits iterator.
     * @param j words iterator.
     * @param digits array of digits.
     * @param words array of words.
     * @param language language class.
     * @param nullCounter counter of null digits before current digit.
     * @return a boolean value indicating whether to change the word form of the next 3 digits.
     */
    private static boolean degreeNameHandling(int i, int j, int[]digits, String[]words, Language language, int degreeNamesNum, int nullCounter, boolean degreeDeclension) {
        String [] degreeNames = language.getDegreeNames();
        if ((degreeNamesNum + 1) == nullCounter / 3) {
            words[j] = degreeNames[degreeNamesNum] + language.getEndings()[0];
            degreeDeclension = true;
        } else {
            if (digits.length > 4 && digits[i - 1] == 1) {
                words[j] += language.getEndings()[5];
            } else {
                if (i == digits.length - 4 && digits[i] == 1)
                    words[j] += language.getEndings()[1];
                if (i == digits.length - 4 && digits[i] >= 2 && digits[i] <= 4)
                    words[j] += language.getEndings()[2];
            }
            if (i < digits.length - 4 && digits[i] >= 2 && digits[i] <= 4)
                words[j] += language.getEndings()[3];
            if (i < digits.length - 4 && digits[i] >= 5)
                words[j] += language.getEndings()[4];
        }
        words[j] += " ";
        //thousands conjunctions
        if (digits[i + 1] == 0 && (digits[i + 2] != 0 || digits[i + 3] != 0)) {
            words[j] += language.getConjunctions()[0];
        }
        if (i != 0)
            words[j] = language.getConjunctions()[3] + words[j];
        return degreeDeclension;
    }

    /**
     * This method converts string array to int array.
     * @param strDigits array of string digits.
     * @return array of int digits.
     */
    private static int[] stringArrayToIntArray(String[] strDigits) {
        int[] digits = new int[strDigits.length];
        for (int i = 0; i < strDigits.length; i++) {
            digits[i] = Integer.parseInt(strDigits[i]);
        }
        return digits;
    }

    /**
     * This method creates a ready-made string from an array of words.
     * @param words array of words
     * @param language language class.
     * @return string with ordinal number.
     */
    private static String stringFormation(String[] words, Language language) {
        //removing null elements
        List<String> wordsWithoutNull = new ArrayList<>();
        for (String word : words) {
            if (word != null)
                wordsWithoutNull.add(word);
        }
        //string creation
        String result = "";
        for (String word : wordsWithoutNull) {
            result += word + "";
        }
        result = language.getArticles()[0] + language.getConjunctions()[3] + result + "\n";

        return result;
    }

}
