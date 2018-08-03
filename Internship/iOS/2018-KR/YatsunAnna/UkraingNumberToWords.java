public class UkraingNumberToWords extends ConvertLessThanOneThousand {
    public String convert(long number) {
        if (number == 0) {
            return "нуль";
        }
        convertin(number);
        String result = getStringMiliard(getBillions());
        result = getStringMilion(getMillions(), result);
        result = getStringThouthend(getThousands(), result);
        String tradThousand;
        tradThousand = convertLessThanOneThousandUkr(getThousands());
        result = result + tradThousand;
        return result.replaceAll("^\\s+", "").replaceAll("\\b\\s{2,}\\b", " ");
    }

    private String getStringMiliard(int billions) {
        String tradBillions;
        String miliard = " мiльярд";
        String sufixMiliard = "и";
        String sufixMiliard2 = "iв";
        switch (billions) {
            case 0:
                tradBillions = "";
                break;
            case 1:
                tradBillions = convertLessThanOneThousandUkr(billions)
                        + miliard;
                break;
            case 2:
                tradBillions = convertLessThanOneThousandUkr(billions)
                        + miliard + sufixMiliard;
                break;
            case 3:
                tradBillions = convertLessThanOneThousandUkr(billions)
                        + miliard + sufixMiliard;
                break;
            case 4:
                tradBillions = convertLessThanOneThousandUkr(billions)
                        + miliard + sufixMiliard;
                break;
            default:
                tradBillions = convertLessThanOneThousandUkr(billions)
                        + miliard + sufixMiliard2;
        }
        return tradBillions;
    }

    public String getStringThouthend(int hundredThousands, String result) {
        String tradHundredThousands;
        String southend = "тисяч";
        String sufictToStringsouth = "a";
        String sufictToStringsouth1 = "i";
        switch (hundredThousands) {
            case 0:
                tradHundredThousands = "";
                break;
            case 1:
                tradHundredThousands = "oдна" + southend + sufictToStringsouth;
                break;
            case 2:
                tradHundredThousands = "двi " + southend + sufictToStringsouth1;
                break;
            case 3:
                tradHundredThousands = "три " + southend + sufictToStringsouth1;
                break;
            case 4:
                tradHundredThousands = "чотири " + southend + sufictToStringsouth1;
                ;
                break;
            default:
                tradHundredThousands = convertLessThanOneThousandUkr(hundredThousands)
                        + " тисяч ";
        }
        result = result + tradHundredThousands;
        return result;
    }

    private String getStringMilion(int millions, String result) {
        String tradMillions;
        String million = " мiльйон";
        String sufictToString = "и";
        String sufictToString2 = "iв";
        switch (millions) {
            case 0:
                tradMillions = "";
                break;
            case 1:
                tradMillions = convertLessThanOneThousandUkr(millions)
                        + million;
                break;
            case 2:
                tradMillions = convertLessThanOneThousandUkr(millions)
                        + million + sufictToString;
                break;
            case 3:
                tradMillions = convertLessThanOneThousandUkr(millions)
                        + million + sufictToString;
                break;
            case 4:
                tradMillions = convertLessThanOneThousandUkr(millions)
                        + million + sufictToString;
                break;
            default:
                tradMillions = convertLessThanOneThousandUkr(millions)
                        + million + sufictToString2;
        }
        result = result + tradMillions;
        return result;
    }

}


