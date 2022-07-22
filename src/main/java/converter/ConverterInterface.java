package converter;

import dictionary.en.DictionaryEN;

import java.util.Scanner;

/**
 * User interface
 */
public class ConverterInterface {
    /**
     * Reads input data from console
     */
    private static final Scanner sc = new Scanner(System.in);

    /**
     * Converts given number in digital form
     * to an ordinal number in a written form.
     */
    private IConverter converter = new Converter();

    /**
     * Starts user dialog, uses Converter to convert
     * a given number and prints result to the console.
     */
    public void run() {
        long number = 0;

        System.out.print("Enter any number from 0 to " + DictionaryEN.getMaxValue() + "\t-->\t");
        try {
            number = Long.parseLong(sc.nextLine());
        }
        catch (NumberFormatException ex) {
            System.out.println("Number is too big. Try again");
            run();
        }

        System.out.print("Choose a language [en,ua,de]\t-->\t");
        String language = sc.nextLine();

        if (language.matches("en|de|ua|EN|DE|UA")) {
            System.out.println("\nYour ordinary number\t->\t" + converter.convert(language, number));
        }
        else {
            System.out.println("Wrong language. Please, try again");
            run();
        }
    }
}
