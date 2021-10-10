import java.util.Scanner;

/**
 * This class implements a request for data from the user
 */

public class Requester {
    Scanner console = new Scanner(System.in);
    private String[] supportedLanguages = {"UA", "RU", "EN", "DE"};

    /**
     * Allows you to get a number from the user
     * and return it if the number is correct
     * @return a positive number without a fractional part
     */
    public long getNumberFromUser() {
        long number;
        do {
            System.out.print("Please enter a number without a fractional part  to convert to text: ");
            while (!console.hasNextLong()) {
                System.out.print("This is an incorrect number. Please, try again: ");
                console.next();
            }
            number = console.nextLong();
        } while (number < 0);
        return number;
    }

    /**
     * Allows you to get the language code from the user and
     * return it if this language is supported by the program
     * @return the supported language code in uppercase
     */
    public String getLanguageCodeFromUser() {
        String languageCode;
        boolean isSupported = false;
        do {
            System.out.print("Please enter the language code for translation " +
                    "into the text(currently supported by UA, RU, EN and DE): ");
            languageCode = console.next().toUpperCase();
            for (int i = 0; i < supportedLanguages.length; i++) {
                if (languageCode.equals(supportedLanguages[i])) isSupported = true;
            }
            if (!isSupported) System.out.println("Sorry, this language is not supported yet." +
                    "Enter from the suggested list: ");
        } while (!isSupported);
        return languageCode;
    }
}
