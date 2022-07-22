package converter;

/**
 * Converts given number in digital form
 * to an ordinal number in a written form.
 */
public interface IConverter {
    String convert(String lang, long number);
}
