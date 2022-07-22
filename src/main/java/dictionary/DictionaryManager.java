package dictionary;

import converter.util.Node;
import converter.util.Number;

import java.util.List;

/**
 * Uses dictionaries to convert a number into written cardinal form.
 */
public abstract class DictionaryManager {

    /**
     * Converts a number into written cardinal form.
     *
     * @param nodes - list of number "nodes"
     * @return a converted number in a written cardinal form.
     */
    protected String convertToCardinalString(List<Node> nodes) {
        StringBuilder numberInStrFormat = new StringBuilder();

        for (Node node: nodes) {
            Number number = new Number(node.number());

            numberInStrFormat.append(getCardinalHundreds(number))
                    .append(getCardinalTens(number))
                    .append(getCardinalOnes(number))
                    .append(getCardinalPower(number, node.power()));
        }

        return numberInStrFormat.toString();
    }

    /**
     * Convert a number into written ordinal form.
     *
     * @param node - the last "node" of a number
     * @return a converted number in a written ordinal form.
     */
    protected String convertToOrdinalString(Node node) {
        Number number = new Number(node.number());

        if (node.power() >= 1000) {
            return getCardinalHundreds(number)
                    + getCardinalTens(number) + getCardinalOnes(number) + getOrdinalPower(number, node.power());
        }

        if (number.getInitialNumber() % 100 == 0) {
            return getOrdinalHundreds(number);
        }

        return getCardinalHundreds(number) + getOrdinalTens(number) + getOrdinalOnes(number);
    }

    /**
     * Converts hundreds into written cardinal form.
     *
     * @param number a number in a form of a Number class.
     * @return a converted number in a written cardinal form.
     */
    protected abstract String getCardinalHundreds(Number number);

    /**
     * Converts tens into written cardinal form.
     *
     * @param number a number in a form of a Number class.
     * @return a converted number in a written cardinal form.
     */
    protected abstract String getCardinalTens(Number number);

    /**
     * Converts ones into written cardinal form.
     *
     * @param number a number in a form of a Number class.
     * @return a converted number in a written cardinal form.
     */
    protected abstract String getCardinalOnes(Number number);

    /**
     * Gets a part of a number in a digital form
     * and its place in initial number and returns its written form.
     *
     * @param number - a part of a number in a digital form.
     * @param power - a place of a part in the initial number.
     * @return - written form of a number.
     */
    protected abstract String getCardinalPower(Number number, long power);

    /**
     * Converts hundreds of a number into written ordinal form.
     *
     * @param number a number in a form of a Number class.
     * @return a converted number in a written ordinal form.
     */
    protected abstract String getOrdinalHundreds(Number number);

    /**
     * Converts tens of a number into written ordinal form.
     *
     * @param number a number in a form of a Number class.
     * @return a converted number in a written ordinal form.
     */
    protected abstract String getOrdinalTens(Number number);

    /**
     * Converts ones of a number into written ordinal form.
     *
     * @param number a number in a form of a Number class.
     * @return a converted number in a written ordinal form.
     */
    protected abstract String getOrdinalOnes(Number number);

    /**
     * Gets a part of a number in a digital form
     * and its place in initial number and returns its written form.
     *
     * @param number - a part of a number in a digital form.
     * @param power - a place of a part in the initial number.
     * @return - written form of a number.
     */
    protected abstract String getOrdinalPower(Number number, long power);

    /**
     * Converts given number in digital form
     * to an ordinal number in a written form.
     *
     * <>
     *     Users a chosen dictionary to represent a number
     *     in a written ordinal form. </>
     *
     * @param nodes - parts of a number.
     * @return - an ordinal number.
     */
    public String convert(List<Node> nodes) {
        String capitalNumbers = convertToCardinalString(nodes.subList(0,nodes.size()-1));

        String ordinalNumbers = convertToOrdinalString(nodes.get(nodes.size()-1));

        return (capitalNumbers + ordinalNumbers).trim();
    }
}
