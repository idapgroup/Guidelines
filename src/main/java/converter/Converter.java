package converter;

import converter.util.Node;
import converter.util.Parser;
import dictionary.DictionaryManager;
import dictionary.de.DictionaryManagerDE;
import dictionary.en.DictionaryManagerEN;
import dictionary.ua.DictionaryManagerUA;

import java.util.List;

/**
 * Converts given number in digital form
 * to an ordinal number in a written form.
 */
public class Converter implements IConverter {

    /**
     * Works with available dictionaries to convert given number to written form.
     */
    private DictionaryManager dictionaryManager;

    /**
     * Parses a number into "nodes" according to its base.
     */
    private final Parser parser = new Parser();

    /**
     * Converts given number in digital form
     * to an ordinal number in a written form.
     *
     * <>
     *     Chooses a dictionary according to given language and
     *     converts a number. </>
     *
     * @param lang - language chosen by user.
     * @param number - a number to convert.
     * @return - an ordinal number.
     */
    public String convert(String lang, long number) {
        switch (lang.toLowerCase()) {
            case "en": {
                dictionaryManager = new DictionaryManagerEN();
                break;
            }
            case "ua": {
                dictionaryManager = new DictionaryManagerUA();
                break;
            }
            case "de": {
                dictionaryManager = new DictionaryManagerDE();
                break;
            }
            case default:
                return "Wrong language";
        }

        List<Node> triads = parser.parseToTriads(number);

        return dictionaryManager.convert(triads);
    }
}
