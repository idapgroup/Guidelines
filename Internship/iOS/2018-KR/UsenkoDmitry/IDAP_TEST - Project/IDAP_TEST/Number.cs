using System;

namespace IDAP_TEST
{
    public static class Number
    {
        private static int[] classesOfNumber = new int[5];
        private static int hundred;
        private static int tens;

        public static void convertNumberToClasses(long number)
        {
            for (int i = 0; i < 5; i++)
            {
                classesOfNumber[i] = Convert.ToInt16(number % 1000);
                number /= 1000;
            }
        }

        public static bool isNull(int classOfNumber)
        {
            if (classesOfNumber[classOfNumber] == 0)
                return true;
            else return false;
        }

        public static int getHundred(int classOfNuber)
        {
            hundred = classesOfNumber[classOfNuber] / 100;
            return hundred;
        }

        public static int getTens(int classOfNuber)
        {
            tens = classesOfNumber[classOfNuber] % 100;
            return tens;
        }

        public static int getLastClass()
        {
            if (classesOfNumber[0] == 0)
            {
                if(classesOfNumber[1] == 0)
                {
                    if (classesOfNumber[2] == 0)
                    {
                        if (classesOfNumber[3] == 0)
                        {
                            if (classesOfNumber[4] == 0)
                                return 10;
                            else return 4;
                        }
                        else return 3;
                    }
                    else return 2;
                }
                else return 1;
            }
            else return 0;
        }
    }
}
