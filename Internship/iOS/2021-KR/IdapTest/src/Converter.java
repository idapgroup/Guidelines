/**
 * The class implements methods for converting a number to a string format
 */
public class Converter {
    private Language langObj;

    /**
     * Creates an object of the language selected by the user and
     * passes the number for conversion in this language
     * @param number - user entered number
     * @param code - user entered language code
     */
    public void chooseLanguage(long number, String code) {
        switch (code) {
            case "RU" -> {
                langObj = new Russian();
                intoWords(number, langObj);
            }
            case "UA" -> {
                langObj = new Ukrainian();
                intoWords(number, langObj);
            }
            case "EN" -> {
                langObj = new English();
                intoWords(number, langObj);
            }
            case "DE" -> {
                langObj = new German();
                intoWords(number, langObj);
            }
        }
    }

    /**
     * Converts a user-entered number to string format
     * @param number - user entered number
     * @param langObj - user entered language code
     */
    private void intoWords(long number, Language langObj) {
        /* Number converted to string format */
        String numberInString = "";

        /* Current digit of the number to be converted */
        int currentDigit = 0;

        /* Digit number converted for use in an array with string representation of numbers */
        int currDigitInArray;

        /* The number represented in this digit */
        int numberInDigit;

        /* The number represented in previous digit */
        int prevNumberInDigit;

        if (number == 0) numberInString = langObj.numbToWord[1][0];
        while(number != 0) {
            numberInDigit = (int) (number % 10);
            currentDigit++;
            currDigitInArray = (currentDigit - 4) / 3 + 4;
            number /= 10;
            if((currentDigit - 1) % 3 == 0 && number != 0) {
                prevNumberInDigit = (int) (number % 10);
                numberInString = getDigitInWord(langObj, currentDigit, numberInDigit, prevNumberInDigit) +
                        langObj.separator[currDigitInArray] + numberInString;
                currentDigit++;
                number /= 10;
            }
            else numberInString = getDigitInWord(langObj, currentDigit, numberInDigit) +
                    langObj.separator[currDigitInArray] + numberInString;
        }
        System.out.println(numberInString);
    }

    /**
     *
     * @param langObj - object storing data for conversion
     * @param digit - current digit of number
     * @param currentNumber - current number in digit for conversion
     * @return digit in string format
     */
    private String getDigitInWord(Language langObj, int digit, int currentNumber) {
        String digitInString;
        int digInArray = (digit - 4) / 3 + 4;

        if (digit % 3 == 0) digitInString = langObj.numbToWord[3][currentNumber];
        else if (langObj.variations[digInArray].length > currentNumber) {
            digitInString = langObj.variations[digInArray][currentNumber];
        } else digitInString = langObj.numbToWord[1][currentNumber];
        if (digit > 3 && digit % 3 != 0) {
            digitInString = addTitleOfDigit(currentNumber, digInArray, digitInString);
        }
        return digitInString;
    }

    /**
     *
     * @param langObj - object storing data for conversion
     * @param digit - current digit of number
     * @param currentNumber - current number in digit for conversion
     * @param mostSignificantNumber - number in the next digit
     * @return digit in string format
     */
    private String getDigitInWord(Language langObj, int digit, int currentNumber, int mostSignificantNumber){
        String digitInString;
        int digInArray = (digit - 4) / 3 + 4;

        if (mostSignificantNumber > 1) {
            if (currentNumber == 0) digitInString = langObj.numbToWord[2][mostSignificantNumber];
            else if (!langObj.reverseSequence) {
                if (langObj.variations[digInArray].length > currentNumber) {
                    digitInString = langObj.numbToWord[2][mostSignificantNumber] +
                            langObj.separator[2] + langObj.variations[digInArray][currentNumber];
                } else {
                    digitInString = langObj.numbToWord[2][mostSignificantNumber] +
                            langObj.separator[2] + langObj.numbToWord[1][currentNumber];
                }
            } else {
                if (langObj.variations[digInArray].length > currentNumber) {
                    digitInString = langObj.variations[digInArray][currentNumber] +
                            langObj.separator[2] + langObj.numbToWord[2][mostSignificantNumber];
                } else {
                    digitInString = langObj.numbToWord[1][currentNumber] +
                            langObj.separator[2] + langObj.numbToWord[2][mostSignificantNumber];
                }
            }
        } else if (mostSignificantNumber == 0) {
            if (currentNumber != 0) digitInString = langObj.numbToWord[1][currentNumber];
            else digitInString = "";
        } else digitInString = langObj.numbToWord[2][currentNumber + 10];
        if (digit > 3 && digit % 3 != 0) {
            digitInString = addTitleOfDigit(currentNumber, digInArray, digitInString);
        }
        return digitInString;
    }

    /**
     *
     * @param currentNumber - current number in digit for conversion
     * @param digit - current digit of number
     * @param digWithoutTitle - number in string format without title of digit
     * @return number in string format with title of digit
     */
    private String addTitleOfDigit(int currentNumber, int digit, String digWithoutTitle) {
        if (currentNumber >= langObj.numbToWord[digit].length) {
            if (digWithoutTitle.equals("")) digWithoutTitle = langObj.numbToWord[digit][langObj.numbToWord[digit].length - 1];
            else digWithoutTitle += langObj.separator[digit] + langObj.numbToWord[digit][langObj.numbToWord[digit].length - 1];
        } else if (digWithoutTitle.equals("")) digWithoutTitle += langObj.numbToWord[digit][currentNumber];
        else digWithoutTitle += langObj.separator[digit] + langObj.numbToWord[digit][currentNumber];
        return digWithoutTitle;
    }
}
