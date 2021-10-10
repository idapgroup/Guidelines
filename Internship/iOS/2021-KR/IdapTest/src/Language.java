/**
 * This abstract class declares all the necessary components
 * that each class of a particular language must contain.
 */

abstract class Language {
    /* An array with the listed string interpretations of numbers */
    public String[][] numbToWord;

    /* Array with variations to the rule */
    public String[][] variations;

    /* Array with separators between digits */
    public String[] separator;

    /* Reverse digit ordering pointer in text format */
    boolean reverseSequence;
}
