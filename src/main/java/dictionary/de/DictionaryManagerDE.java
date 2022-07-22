package dictionary.de;

import converter.util.Number;
import dictionary.DictionaryManager;

/**
 * Uses German dictionary to convert a number into an ordinal form.
 */
public class DictionaryManagerDE extends DictionaryManager {

    /**
     * Uses German dictionary to convert hundreds into written cardinal form.
     *
     * @param number a number in a form of a Number class.
     * @return a converted number in a written cardinal form.
     */
    @Override
    protected String getCardinalHundreds(Number number) {
        if (number.getHundreds() != 0) {
            return DictionaryDE.findCardinalNumber(number.getHundreds()/100)
                    + DictionaryDE.findCardinalNumber(100);
        }
        return "";
    }

    /**
     * Uses German dictionary to convert tens into written cardinal form.
     *
     * @param number a number in a form of a Number class.
     * @return a converted number in a written cardinal form.
     */
    @Override
    protected String getCardinalTens(Number number) {
        if (number.getTens() != 0) {
            if (number.getTens() < 20 || number.getOnes() == 0) {
                return DictionaryDE.findCardinalNumber(number.getTens() + number.getOnes());
            } else {
                return DictionaryDE.findCardinalNumber(number.getOnes())
                            + "und" + DictionaryDE.findCardinalNumber(number.getTens());
            }
        }
        return "";
    }

    /**
     * Uses German dictionary to convert ones into written cardinal form.
     *
     * @param number a number in a form of a Number class.
     * @return a converted number in a written cardinal form.
     */
    @Override
    protected String getCardinalOnes(Number number) {
        if (number.getTens() == 0) {
            return DictionaryDE.findCardinalNumber(number.getOnes());
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
            return DictionaryDE.findCardinalNumber(power);
        }
        return "";
    }

    /**
     * Uses German dictionary to convert hundreds into written ordinal form.
     *
     * @param number a number in a form of a Number class.
     * @return a converted number in a written ordinal form.
     */
    @Override
    protected String getOrdinalHundreds(Number number) {
        if (number.getHundreds() != 0)
            return DictionaryDE.findCardinalNumber(number.getHundreds()/100)
                + DictionaryDE.findOrdinalNumber(100);
        return "";
    }

    /**
     * Uses German dictionary to convert tens into written ordinal form.
     *
     * @param number a number in a form of a Number class.
     * @return a converted number in a written ordinal form.
     */
    @Override
    protected String getOrdinalTens(Number number) {
        if (number.getTens() == 0) return "";

        if (number.getTens() <= 10 || number.getOnes() == 0) {
            return DictionaryDE.findOrdinalNumber(number.getTens()+number.getOnes());
        }

        return DictionaryDE.findCardinalNumber(number.getOnes())
                + "und" + DictionaryDE.findOrdinalNumber(number.getTens());
    }

    /**
     * Uses German dictionary to convert ones into written ordinal form.
     *
     * @param number a number in a form of a Number class.
     * @return a converted number in a written ordinal form.
     */
    @Override
    protected String getOrdinalOnes(Number number) {
        if (number.getTens() == 0) {
            return DictionaryDE.findOrdinalNumber(number.getOnes());
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
    protected String getOrdinalPower(Number number, long power) {
        return DictionaryDE.findOrdinalNumber(power);
    }

}
