import java.text.DecimalFormat;

public class DeutscheNumberToWords {
    public static final String[] tensNames = {
            "",
            " zehn",
            " zwanzig",
            " dreißig",
            " vierzig",
            " fünfzig",
            " sechzig",
            " siebzig",
            " achtzig",
            " neunzig"

    };
    public static final String[] numNames = {
            "",
            " eins",
            " zwei",
            " drei",
            " vier",
            " fünf",
            " sechs",
            " sieben",
            " acht",
            " neun",
            " zehn",
            " elf",
            "zwölf",
            "dreizehn",
            "vierzehn",
            "fünfzehn",
            "sechzehn",
            "siebzehn",
            "achtzehn",
            "neunzehn"

    };
    public static final String[] numNames4 = {
            "",
            " hundert",
            " zweihundert",
            " dreihundert",
            " vierhundert",
            " fünfhundert",
            " siebenhundert",
            " achthundert",
            " achthundert",
            " neunhundert"
    };
    public static void main(String[] args) {
        System.out.println("  " + DeutscheNumberToWords.convert(2000000000));
    }




    private static String convertLessThanOneThousand(int number) {
        String soFar;

        if (number % 100 < 20){
            soFar = numNames[number % 100];
            number /= 100;
        }
        else {
            soFar = numNames[number % 10];
            number /= 10;

            soFar = tensNames[number % 10] + soFar;
            number /= 10;
        }
        if (number == 0) return soFar;
        return numNames4[number]  + soFar;
    }

    public static String convert(long number) {

        if (number == 0) {
            return "null";
        }

        String snumber = Long.toString(number);

        // pad with "0"
        String mask = "000000000000";
        DecimalFormat df = new DecimalFormat(mask);
        snumber = df.format(number);

        // XXXnnnnnnnnn
        int billions = Integer.parseInt(snumber.substring(0, 3));
        // nnnXXXnnnnnn
        int millions = Integer.parseInt(snumber.substring(3, 6));
        // nnnnnnXXXnnn
        int hundredThousands = Integer.parseInt(snumber.substring(6, 9));
        // nnnnnnnnnXXX
        int thousands = Integer.parseInt(snumber.substring(9, 12));

        String tradBillions;
        switch (billions) {
            case 0:
                tradBillions = "";
                break;
            case 1:
                tradBillions = convertLessThanOneThousand(billions)
                        + " Milliarde ";
                break;
            case 2:
                tradBillions = convertLessThanOneThousand(billions)
                        + " Milliarde ";
                break;
            case 3:
                tradBillions = convertLessThanOneThousand(billions)
                        + " Milliarde ";
                break;
            case 4:
                tradBillions = convertLessThanOneThousand(billions)
                        + " Milliarde ";
                break;
            default:
                tradBillions = convertLessThanOneThousand(billions)
                        + " Milliarden ";
        }
        String result = tradBillions;

        String tradMillions;
        switch (millions) {
            case 0:
                tradMillions = "";
                break;
            case 1:
                tradMillions = convertLessThanOneThousand(millions)
                        + " Million ";
                break;
            case 2:
                tradMillions = convertLessThanOneThousand(millions)
                        + " Million ";
                break;
            case 3:
                tradMillions = convertLessThanOneThousand(millions)
                        + " Million ";
                break;
            case 4:
                tradMillions = convertLessThanOneThousand(millions)
                        + " Million ";
                break;
            default:
                tradMillions = convertLessThanOneThousand(millions)
                        + " Millionen ";
        }
        result = result + tradMillions;

        String tradHundredThousands;
        switch (hundredThousands) {
            case 0:
                tradHundredThousands = "";
                break;
            case 1:
                tradHundredThousands = "tausend";

                break;
            default:
                tradHundredThousands = convertLessThanOneThousand(hundredThousands)
                        + " tausend";
        }
        result = result + tradHundredThousands;

        String tradThousand;
        tradThousand = convertLessThanOneThousand(thousands);
        result = result + tradThousand;
        return result.replaceAll("^\\s+", "").replaceAll("\\b\\s{2,}\\b", " ");
    }
}