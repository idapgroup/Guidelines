import java.text.DecimalFormat;

public class ConvertLessThanOneThousand implements Languge {
    private  int billions;
    private  int millions;
    private  int hundredThousands;
    private  int thousands;
    private  String result;


    public  String convertin(long number) {
        String snumber = Long.toString(number);
        String mask = "000000000000";
        DecimalFormat df = new DecimalFormat(mask);
        snumber = df.format(number);
        billions = Integer.parseInt(snumber.substring(0, 3));
        millions = Integer.parseInt(snumber.substring(3, 6));
        hundredThousands = Integer.parseInt(snumber.substring(6, 9));
        thousands = Integer.parseInt(snumber.substring(9, 12));
        return result;
    }

    public  String convertLessThanOneThousandUkr(int number) {
        String soFar;
        if (number % 100 < 20) {
            soFar = numNamesUkr[number % 100];
            number /= 100;
        } else {
            soFar = numNamesUkr[number % 10];
            number /= 10;
            soFar = tensNamesUkr[number % 10] + soFar;
            number /= 10;
        }
        if (number == 0) return soFar;
        return numNames2Ukr[number] + soFar;
    }

    public String convertLessThanOneThousandEng(int number) {
        String soFar;

        if (number % 100 < 20) {
            soFar = numNamesEng[number % 100];
            number /= 100;
        } else {
            soFar = numNamesEng[number % 10];
            number /= 10;

            soFar = tensNamesEng[number % 10] + soFar;
            number /= 10;
        }
        if (number == 0) return soFar;
        return numNamesEng[number] + " hundred" + soFar;
    }

    public  String convertLessThanOneThousandGerm(int number) {
        String soFar;

        if (number % 100 < 20){
            soFar = numNamesGerm[number % 100];
            number /= 100;
        }
        else {
            soFar = numNamesGerm[number % 10];
            number /= 10;

            soFar =soFar+ tensNamesGerm[number % 10] ;
            number /= 10;
        }
        if (number == 0) return soFar;
        return numNames4Germ[number]  + soFar;
    }

    public int getBillions() {
        return billions;
    }

    public void setBillions(int billions) {
        this.billions = billions;
    }

    public int getMillions() {
        return millions;
    }

    public void setMillions(int millions) {
        this.millions = millions;
    }

    public int getHundredThousands() {
        return hundredThousands;
    }

    public void setHundredThousands(int hundredThousands) {
        this.hundredThousands = hundredThousands;
    }

    public int getThousands() {
        return thousands;
    }

    public void setThousands(int thousands) {
        this.thousands = thousands;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
}

