package dictionary;


import converter.Converter;
import org.junit.jupiter.api.Test;

import static junit.framework.TestCase.assertEquals;

class DictionaryManagerTest {
    final Converter languageManager = new Converter();

    @Test
    void testConvertToEnglish() {
        assertEquals("first",languageManager.convert("en", 1));
        assertEquals("fifth",languageManager.convert("en", 5));
        assertEquals("tenth",languageManager.convert("en", 10));
        assertEquals("fifteenth",languageManager.convert("en", 15));
        assertEquals("twenty-fifth",languageManager.convert("en", 25));
        assertEquals("ninetieth",languageManager.convert("en", 90));
        assertEquals("one hundredth",languageManager.convert("en", 100));
        assertEquals("one hundred first",languageManager.convert("en", 101));
        assertEquals("one hundred twentieth",languageManager.convert("en", 120));
        assertEquals("four hundred ninety-first",languageManager.convert("en", 491));
        assertEquals("five hundredth",languageManager.convert("en", 500));
        assertEquals("two thousandth",languageManager.convert("en", 2000));
        assertEquals("two thousand eighth",languageManager.convert("en", 2008));
        assertEquals("two thousand fourteenth",languageManager.convert("en", 2014));
        assertEquals("three thousand seven hundredth",languageManager.convert("en", 3700));
        assertEquals("ten thousandth",languageManager.convert("en", 10_000));
        assertEquals("seventy-one thousandth",languageManager.convert("en", 71_000));
        assertEquals("one hundred forty-five thousandth",languageManager.convert("en", 145_000));
        assertEquals("nine hundred three thousandth",languageManager.convert("en", 903_000));
        assertEquals("one million two hundred ninety thousandth",
                languageManager.convert("en", 1_290_000));
        assertEquals("nine millionth",languageManager.convert("en", 9_000_000));
        assertEquals("ten million four thousandth",languageManager.convert("en", 10_004_000));
        assertEquals("one hundred millionth",languageManager.convert("en", 100_000_000));
        assertEquals("one billion one hundred seventy thousandth",
                languageManager.convert("en", 1_000_170_000));
        assertEquals("fifteen billion nine hundred twelve million fifty thousandth",
                languageManager.convert("en", 15_912_050_000L));
        assertEquals("twenty-three billionth",languageManager.convert("en", 23_000_000_000L));
        assertEquals("one hundred billionth",languageManager.convert("en", 100_000_000_000L));
        assertEquals("two hundred eight billionth",languageManager.convert("en", 208_000_000_000L));
        assertEquals("one quadrillionth",languageManager.convert("en", 1_000_000_000_000L));
    }

    @Test
    void testConvertToGerman() {
        assertEquals("erste",languageManager.convert("de", 1));
        assertEquals("fünfte",languageManager.convert("de", 5));
        assertEquals("zehnte",languageManager.convert("de", 10));
        assertEquals("fünfzehnte",languageManager.convert("de", 15));
        assertEquals("fünfundzwanzigste",languageManager.convert("de", 25));
        assertEquals("neunzigste",languageManager.convert("de", 90));
        assertEquals("einundneunzigste",languageManager.convert("de", 91));
        assertEquals("einhunderterste",languageManager.convert("de", 101));
        assertEquals("einhundertzwanzigste",languageManager.convert("de", 120));
        assertEquals("einhundertzweiundzwanzigste",languageManager.convert("de", 122));
        assertEquals("zweihundertste",languageManager.convert("de", 200));
        assertEquals("vierhundertste",languageManager.convert("de", 400));
        assertEquals("vierhunderterste",languageManager.convert("de", 401));
        assertEquals("vierhunderteinundneunzigste",languageManager.convert("de", 491));
        assertEquals("eintausendste",languageManager.convert("de", 1000));
        assertEquals("eintausendzweite",languageManager.convert("de", 1002));
        assertEquals("eintausendfünfzigste",languageManager.convert("de", 1050));
        assertEquals("eintausendeinhundertste",languageManager.convert("de", 1100));
        assertEquals("eintausendzweihundertfünfzigste",languageManager.convert("de", 1250));
        assertEquals("eintausendzweihunderteinundfünfzigste",languageManager.convert("de", 1251));
        assertEquals("eintausendsiebenhundertachte",languageManager.convert("de", 1708));
        assertEquals("zweitausendste",languageManager.convert("de", 2000));
        assertEquals("zweitausendachte",languageManager.convert("de", 2008));
        assertEquals("zweitausendvierzehnte",languageManager.convert("de", 2014));
        assertEquals("dreitausendsiebenhundertste",languageManager.convert("de", 3700));
        assertEquals("zehntausendste",languageManager.convert("de", 10_000));
        assertEquals("einundsiebzigtausendste",languageManager.convert("de", 71_000));
        assertEquals("einhunderttausendste",languageManager.convert("de", 100_000));
        assertEquals("einhundertfünfundvierzigtausendste",languageManager.convert("de", 145_000));
        assertEquals("einhundertfünfundvierzigtausenderste",languageManager.convert(
                "de", 145_001));
        assertEquals("einhundertfünfundvierzigtausendeinhunderterste",languageManager.convert(
                "de", 145_101));
        assertEquals("achthundertachttausendeinunddreizigste",languageManager.convert(
                "de", 808_031));
        assertEquals("neunhundertdreitausendste",languageManager.convert("de", 903_000));
        assertEquals("einmillionste", languageManager.convert("de", 1_000_000));
        assertEquals("dreimillionste", languageManager.convert("de", 3_000_000));
        assertEquals("dreimillionerste", languageManager.convert("de", 3_000_001));
        assertEquals("dreimillionzehnte", languageManager.convert("de", 3_000_010));
        assertEquals("dreimillionzweitausendste", languageManager.convert("de", 3_002_000));
        assertEquals("siebenmillionzweiunddreizigtausendste", languageManager.convert("de", 7_032_000));
        assertEquals("einhundertmillionste", languageManager.convert("de", 100_000_000));
        assertEquals("zehnmillionviertausendste",languageManager.convert("de", 10_004_000));
        assertEquals("einmilliardeeinhundertsiebzigtausendste",
                languageManager.convert("de", 1_000_170_000));
        assertEquals("fünfzehnmilliardeneunhundertzwölfmillionfünfzigtausendste",
                languageManager.convert("de", 15_912_050_000L));
        assertEquals("dreiundzwanzigmilliardste",languageManager.convert("de", 23_000_000_000L));
        assertEquals("einhundertmilliardste",languageManager.convert("de", 100_000_000_000L));
        assertEquals("zweihundertachtmilliardste",languageManager.convert("de", 208_000_000_000L));
        assertEquals("einbilliardste",languageManager.convert("de", 1_000_000_000_000L));
    }

    @Test
    void testConvertToUkrainian() {
        assertEquals("перший",languageManager.convert("ua", 1));
        assertEquals("п'ятий",languageManager.convert("ua", 5));
        assertEquals("десятий",languageManager.convert("ua", 10));
        assertEquals("п'ятнадцятий",languageManager.convert("ua", 15));
        assertEquals("двадцять перший",languageManager.convert("ua", 21));
        assertEquals("двадцять п'ятий",languageManager.convert("ua", 25));
        assertEquals("тридцятий",languageManager.convert("ua", 30));
        assertEquals("сорок восьмий",languageManager.convert("ua", 48));
        assertEquals("дев'яностий",languageManager.convert("ua", 90));
        assertEquals("сотий",languageManager.convert("ua", 100));
        assertEquals("сто перший",languageManager.convert("ua", 101));
        assertEquals("сто двадцятий",languageManager.convert("ua", 120));
        assertEquals("двісті двадцять четвертий",languageManager.convert("ua", 224));
        assertEquals("двісті сороковий",languageManager.convert("ua", 240));
        assertEquals("чотирьохсотий",languageManager.convert("ua", 400));
        assertEquals("чотириста третій",languageManager.convert("ua", 403));
        assertEquals("чотириста дев'яносто перший",languageManager.convert("ua", 491));
        assertEquals("п'ятисотий",languageManager.convert("ua", 500));
        assertEquals("тисячний",languageManager.convert("ua", 1000));
        assertEquals("двохтисячний",languageManager.convert("ua", 2000));
        assertEquals("дві тисячі перший",languageManager.convert("ua", 2001));
        assertEquals("дві тисячі чотирнадцятий",languageManager.convert("ua", 2014));
        assertEquals("три тисячі семисотий",languageManager.convert("ua", 3700));
        assertEquals("вісім тисяч сотий",languageManager.convert("ua", 8100));
        assertEquals("десятитисячний",languageManager.convert("ua", 10_000));
        assertEquals("сімдесятиоднотисячний",languageManager.convert("ua", 71_000));
        assertEquals("сімдесятидвохтисячний",languageManager.convert("ua", 72_000));
        assertEquals("сімдесятип'ятитисячний",languageManager.convert("ua", 75_000));
        assertEquals("стотисячний",languageManager.convert("ua", 100_000));
        assertEquals("стосорокап'ятитисячний",languageManager.convert("ua", 145_000));
        assertEquals("сто сорок п'ять тисяч перший",languageManager.convert(
                "ua", 145_001));
        assertEquals("сто сорок п'ять тисяч сто перший",languageManager.convert(
                "ua", 145_101));
        assertEquals("вісімсот вісім тисяч тридцять дев'ятий",languageManager.convert(
                "ua", 808_039));
        assertEquals("дев'ятсоттрьохтисячний",languageManager.convert("ua", 903_000));
        assertEquals("мільйонний", languageManager.convert("ua", 1_000_000));
        assertEquals("один мільйон перший", languageManager.convert("ua", 1_000_001));
        assertEquals("один мільйон перший", languageManager.convert("ua", 1_000_001));
        assertEquals("трьохмільйонний", languageManager.convert("ua", 3_000_000));
        assertEquals("три мільйони перший", languageManager.convert("ua", 3_000_001));
        assertEquals("дев'ять мільйонів тридцятидвохтисячний", languageManager.convert("ua", 9_032_000));
        assertEquals("чотири мільйони сотий", languageManager.convert("ua", 4_000_100));
        assertEquals("три мільйони двохтисячний", languageManager.convert("ua", 3_002_000));
        assertEquals("п'ять мільйонів десятий", languageManager.convert("ua", 5_000_010));
        assertEquals("сім мільйонів десятий", languageManager.convert("ua", 7_000_010));
        assertEquals("вісім мільйонів двадцять тисяч одинадцятий",
                languageManager.convert("ua", 8_020_011));
        assertEquals("чотири мільйони сотий", languageManager.convert("ua", 4_000_100));
        assertEquals("стомільйонний", languageManager.convert("ua", 100_000_000));
        assertEquals("сто мільйонів чотирьохтисячний", languageManager.convert("ua", 100_004_000));
        assertEquals("мільярдний", languageManager.convert("ua", 1_000_000_000));
        assertEquals("один мільярд двадцятий", languageManager.convert("ua", 1_000_000_020));
        assertEquals("квадрильйонний", languageManager.convert("ua", 1_000_000_000_000L));
    }
}