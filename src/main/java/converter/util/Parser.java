package converter.util;

import dictionary.en.DictionaryEN;

import java.util.ArrayList;
import java.util.List;

/**
 * Parses a number into "nodes" according to its base.
 */
public class Parser {
    /**
     * Parses a number into "nodes" according to its base.
     *
     * @param number a given number.
     */
    public List<Node> parseToTriads(long number) {
        List<Node> triads = new ArrayList<>();

        long divider = DictionaryEN.getMaxValue();

        while (divider >= 1000) {
            if (number/divider != 0) {
                triads.add(new Node((number / divider), divider));
            }
            number = number % divider;
            divider/=1000;
        }

        if (number != 0) {
            triads.add(new Node((number / divider), -1));
        }

        return triads;
    }
}
