public class DeutscheNumberToWords extends ConvertLessThanOneThousand {

    public String convert(long number) {

        if (number == 0) {
            return "null";
        }
        convertin(number);
        String result = getStringMiliard(getBillions());
        result = getStringMilion(getMillions(), result);
        result = getStringThouthend(getHundredThousands(), result);
        String tradThousand;
        tradThousand = convertLessThanOneThousandGerm(getThousands());
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
                tradHundredThousands = "tausend";

                break;
            default:
                tradHundredThousands = convertLessThanOneThousandGerm(hundredThousands)
                        + " tausend";
        }
        result = result + tradHundredThousands;
        return result;
    }

    private String getStringMilion(int millions, String result) {
        String tradMillions;
        switch (millions) {
            case 0:
                tradMillions = "";
                break;
            case 1:
                tradMillions = convertLessThanOneThousandGerm(millions)
                        + " Million ";
                break;
            case 2:
                tradMillions = convertLessThanOneThousandGerm(millions)
                        + " Million ";
                break;
            case 3:
                tradMillions = convertLessThanOneThousandGerm(millions)
                        + " Million ";
                break;
            case 4:
                tradMillions = convertLessThanOneThousandGerm(millions)
                        + " Million ";
                break;
            default:
                tradMillions = convertLessThanOneThousandGerm(millions)
                        + " Millionen ";
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
                tradBillions =convertLessThanOneThousandGerm(billions)
                        + " Milliarde ";
                break;
            case 2:
                tradBillions = convertLessThanOneThousandGerm(billions)
                        + " Milliarde ";
                break;
            case 3:
                tradBillions = convertLessThanOneThousandGerm(billions)
                        + " Milliarde ";
                break;
            case 4:
                tradBillions = convertLessThanOneThousandGerm(billions)
                        + " Milliarde ";
                break;
            default:
                tradBillions = convertLessThanOneThousandGerm(billions)
                        + " Milliarden ";
        }
        return tradBillions;
    }
}