import converter.ConverterInterface;

/**
 * Starting point of a program
 */
public class Main {

    /**
     * Starts the program
     *
     * @param args java command line arguments
     */
    public static void main(String[] args) {
        ConverterInterface converterInterface = new ConverterInterface();
        converterInterface.run();
    }
}
