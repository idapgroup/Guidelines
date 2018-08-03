public class EnglishNumberToWords extends ConvertLessThanOneThousand {
    public String convert(long number) {

        if (number == 0) {
            return "zero";
        }
        convertin(number);
        String result = getStringMiliard(getBillions());
        result = getStringMilion(getMillions(), result);
        result = getStringThouthend(getHundredThousands(), result);
        String tradThousand;
        tradThousand = convertLessThanOneThousandEng(getThousands());
        result = result + tradThousand;
        return result.replaceAll("^\\s+", "").replaceAll("\\b\\s{2,}\\b", " ");
    }

    private  String getStringThouthend(int hundredThousands, String result) {
        String tradHundredThousands;
        switch (hundredThousands) {
            case 0:
                tradHundredThousands = "";
                break;
            case 1:
                tradHundredThousands = "one thousand ";
                break;
            default:
                tradHundredThousands = convertLessThanOneThousandEng(hundredThousands)
                        + " thousand ";
        }
        result = result + tradHundredThousands;
        return result;
    }

    private  String getStringMilion(int millions, String result) {
        String tradMillions;
        switch (millions) {
            case 0:
                tradMillions = "";
                break;
            case 1:
                tradMillions = convertLessThanOneThousandEng(millions)
                        + " million ";
                break;
            default:
                tradMillions = convertLessThanOneThousandEng(millions)
                        + " million ";
        }
        result = result + tradMillions;
        return result;
    }

    private  String getStringMiliard(int billions) {
        String tradBillions;
        switch (billions) {
            case 0:
                tradBillions = "";
                break;
            case 1:
                tradBillions = convertLessThanOneThousandEng(billions)
                        + " billion ";
                break;
            default:
                tradBillions = convertLessThanOneThousandEng(billions)
                        + " billion ";
        }
        return tradBillions;
    }

}