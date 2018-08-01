import java.text.DecimalFormat;
public class UkraingNumberToWords {
    public static final String[] tensNames = {
            "",
            " десять",
            " двадцять",
            " тридцять",
            " сорок",
            " п'ятдесят",
            " шістдесят",
            " сімдесят",
            " вісімдесять",
            " дев'яносто"
    };

    public static final String[] numNames = {
            "",
            " один",
            " два",
            " три",
            " чотири",
            " п'ять",
            " шість",
            " сім",
            " вісім",
            " дев'ять",
            " десять",
            " одинадцять",
            " дванадцять",
            " тринадцять",
            " чотирнадцять",
            " п'ятнадцять",
            " шістнадцять",
            " сімнадцять",
            " вісімнадцять",
            " дев'ятнадцять"
    };


    public static final String[] numNames4 = {
            "",
            " сто",
            " двісті",
            " триста",
            " чотириста",
            " п'ятьсот",
            " шістьсот",
            " сімсот",
            " вісімсот",
            " дев'ятьсот"

    };


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
        if (number == 0) { return "zero"; }
        String snumber = Long.toString(number);
        String mask = "000000000000";
        DecimalFormat df = new DecimalFormat(mask);
        snumber = df.format(number);
        int billions = Integer.parseInt(snumber.substring(0,3));
        int millions  = Integer.parseInt(snumber.substring(3,6));
        int hundredThousands = Integer.parseInt(snumber.substring(6,9));
        int thousands = Integer.parseInt(snumber.substring(9,12));
        String result = getStringMiliard(billions);
        result = getStringMilion(millions, result);
        result = getStringThouthend(hundredThousands, result);
        String tradThousand;
        tradThousand = convertLessThanOneThousand(thousands);
        result =  result + tradThousand;
        return result.replaceAll("^\\s+", "").replaceAll("\\b\\s{2,}\\b", " ");
    }

    private static String getStringMiliard(int billions) {
        String tradBillions;
        String miliard=" мiльярд";
        String sufixMiliard="и";
        String sufixMiliard2="iв";
        switch (billions) {
            case 0:
                tradBillions = "";
                break;
            case 1 :
                tradBillions = convertLessThanOneThousand(billions)
                        + miliard;
                break;
            case 2 :
                tradBillions = convertLessThanOneThousand(billions)
                        + miliard+sufixMiliard;
                break;
            case 3 :
                tradBillions = convertLessThanOneThousand(billions)
                        + miliard+sufixMiliard;
                break;
            case 4 :
                tradBillions = convertLessThanOneThousand(billions)
                        + miliard+sufixMiliard;
                break;
            default :
                tradBillions = convertLessThanOneThousand(billions)
                       +miliard+sufixMiliard2;
        }
        return tradBillions;
    }


    public static void main(String[] args) {
        System.out.println("  " + UkraingNumberToWords.convert(9111000010L));
    }

    private static String getStringThouthend(int hundredThousands, String result) {
        String tradHundredThousands;
        String southend="тисяч";
        String sufictToStringsouth="a";
        String sufictToStringsouth1="i";

        switch (hundredThousands) {
            case 0:
                tradHundredThousands = "";
                break;
            case 1 :
                tradHundredThousands = "oдна"+southend+sufictToStringsouth;
                break;
            case 2 :
                tradHundredThousands ="двi "+southend+sufictToStringsouth1;
                break;
            case 3 :
                tradHundredThousands = "три "+southend+sufictToStringsouth1;
                break;
            case 4 :
                tradHundredThousands = "чотири "+southend+sufictToStringsouth1;  ;
                break;
            default :
                tradHundredThousands = convertLessThanOneThousand(hundredThousands)
                        + " тисяч ";
        }
        result =  result + tradHundredThousands;
        return result;
    }

    private static String getStringMilion(int millions, String result) {
        String tradMillions;
        String million=" мiльйон";
        String sufictToString="и";
        String sufictToString2="iв";
        switch (millions) {
            case 0:
                tradMillions = "";
                break;
            case 1 :
                tradMillions = convertLessThanOneThousand(millions)
                        +million;
                break;
            case 2 :
                tradMillions = convertLessThanOneThousand(millions)
                        +million+sufictToString;
                break;
            case 3 :
                tradMillions = convertLessThanOneThousand(millions)
                        +million+sufictToString;
                break;
            case 4 :
                tradMillions = convertLessThanOneThousand(millions)
                        +million+sufictToString;
                break;

            default :
                tradMillions = convertLessThanOneThousand(millions)
                        +million+sufictToString2;
        }
        result =  result + tradMillions;
        return result;
    }
}
