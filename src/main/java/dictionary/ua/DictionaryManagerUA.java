package dictionary.ua;

import converter.util.Node;
import converter.util.Number;
import dictionary.DictionaryManager;

/**
 * Uses Ukrainian dictionary to convert a number into an ordinal form.
 */
public class DictionaryManagerUA extends DictionaryManager {

    /**
     * Overrides method of parent class and converts a part of a number
     * into a written ordinal form according to rules of Ukrainian grammar.
     *
     * @param node - a part of initial number
     * @return - a part of a number in a written form.
     */
    protected String convertToOrdinalString(Node node) {
        if (node.power() < 1000) {
            return super.convertToOrdinalString(node);
        }
        else {
            Number number = new Number(node.number());
            if (number.getInitialNumber() == 1) {
                return DictionaryUA.findOrdinalNumber(node.power());
            }
            else {
                return (getCardinalHundreds(number) +
                        DictionaryUA.findCardinalNumberInGenitivePlural(number.getTens())
                        + DictionaryUA.findCardinalNumberInGenitivePlural(number.getOnes())
                        + DictionaryUA.findOrdinalNumber(node.power())).replaceAll(" ", "");
            }
        }
    }

    /**
     * Uses Ukrainian dictionary to convert hundreds into written cardinal form.
     *
     * @param number a number in a form of a Number class.
     * @return a converted number in a written cardinal form.
     */
    @Override
    protected String getCardinalHundreds(Number number) {
        if (number.getHundreds() != 0)
            return DictionaryUA.findCardinalNumber(number.getHundreds()) + " ";
        return "";
    }

    /**
     * Uses Ukrainian dictionary to convert tens into written cardinal form.
     *
     * @param number a number in a form of a Number class.
     * @return a converted number in a written cardinal form.
     */
    @Override
    protected String getCardinalTens(Number number) {
        if (number.getTens() != 0) {
            if (number.getTens() < 20 || number.getOnes() == 0) {
                return DictionaryUA.findCardinalNumber(number.getTens() + number.getOnes()) + " ";
            } else {
                return DictionaryUA.findCardinalNumber(number.getTens() ) + " ";
            }
        }
        return "";
    }

    /**
     * Uses Ukrainian dictionary to convert ones into written cardinal form.
     *
     * @param number a number in a form of a Number class.
     * @return a converted number in a written cardinal form.
     */
    @Override
    protected String getCardinalOnes(Number number) {

        if (number.getOnes() == 2) {
            return DictionaryUA.findCardinalNumberInGenitive(number.getOnes()) + " ";
        }

        if (number.getOnes() != 0 && number.getTens() != 10) {
            return DictionaryUA.findCardinalNumber(number.getOnes()) + " ";
        }

        return "";
    }

    /**
     * Gets a part of a number in a digital form
     * and its place in initial number and returns its written form.
     *
     * @param number - a part of a number in a digital form.
     * @param power - a place of a part in the initial number.
     * @return - written form of a number.
     */
    @Override
    protected String getCardinalPower(Number number, long power) {
        if (power >= 1000) {
            if (number.getOnes() == 1)
                return DictionaryUA.findCardinalNumber(power) + " ";

            if (number.getOnes() >= 2 && number.getOnes() <= 4)
                return DictionaryUA.findCardinalNumberInGenitive(power) + " ";

            if (number.getOnes() >= 5 || number.getOnes() == 0)
                return DictionaryUA.findCardinalNumberInGenitivePlural(power) + " ";
        }
        return "";
    }

    /**
     * Uses Ukrainian dictionary to convert hundreds into written ordinal form.
     *
     * @param number a number in a form of a Number class.
     * @return a converted number in a written ordinal form.
     */
    @Override
    protected String getOrdinalHundreds(Number number) {
        return DictionaryUA.findOrdinalNumber(number.getHundreds());
    }

    /**
     * Uses Ukrainian dictionary to convert tens into written ordinal form.
     *
     * @param number a number in a form of a Number class.
     * @return a converted number in a written ordinal form.
     */
    @Override
    protected String getOrdinalTens(Number number) {
        if (number.getTens() <= 10 || number.getOnes() == 0) {
            return DictionaryUA.findOrdinalNumber(number.getTens()+number.getOnes());
        }
        return DictionaryUA.findCardinalNumber(number.getTens()) + " ";
    }

    /**
     * Uses Ukrainian dictionary to convert ones into written ordinal form.
     *
     * @param number a number in a form of a Number class.
     * @return a converted number in a written ordinal form.
     */
    @Override
    protected String getOrdinalOnes(Number number) {
        if (number.getTens() <= 10 || number.getOnes() == 0) {
            return "";
        }
        return DictionaryUA.findOrdinalNumber(number.getOnes());
    }

    /**
     * Gets a part of a number in a digital form
     * and its place in initial number and returns its written form.
     *
     * @param number - a part of a number in a digital form.
     * @param power - a place of a part in the initial number.
     * @return - written form of a number.
     */
    @Override
    protected String getOrdinalPower(Number number, long power) {
        return DictionaryUA.findOrdinalNumber(power);
    }

}
