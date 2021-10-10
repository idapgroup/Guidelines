/**
 * This program allows you to translate the number entered
 * by the user into text format in one of the proposed languages
 */

public class IdapTest {
    public static void main(String[] args) {

        Requester requester = new Requester();
        long number = requester.getNumberFromUser();
        String languageCode = requester.getLanguageCodeFromUser();

        Converter converter = new Converter();
        converter.chooseLanguage(number, languageCode);
    }
}