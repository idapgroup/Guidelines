package converter.util;

/**
 * Stores a number and calculates its hundreds, tens and ones.
 */
public class Number {

    /**
     * Initial number.
     */
    long number;

    /**
     * Hundreds of a number.
     */
    long hundreds;

    /**
     * Tens of a number.
     */
    long tens;

    /**
     * Ones of a number.
     */
    long ones;

    /**
     * Constructor of a number class.
     *
     * <>
     *     Takes a number and calculates its hundreds,
     *     tens and ones.
     * </>
     */
    public Number(long number) {
        this.number = number;
        hundreds = number/100 * 100;
        tens = ((number%100)/10) * 10;
        ones = number%10;
    }

    /**
     * Returns hundreds of a number.
     *
     * @return hundreds of a number.
     */
    public long getHundreds() {
        return hundreds;
    }

    /**
     * Returns tens of a number.
     *
     * @return tens of a number.
     */
    public long getTens() {
        return tens;
    }

    /**
     * Returns ones of a number.
     *
     * @return ones of a number.
     */
    public long getOnes() {
        return ones;
    }

    /**
     * Returns initial number.
     *
     * @return initial number.
     */
    public long getInitialNumber() {
        return number;
    }
}
