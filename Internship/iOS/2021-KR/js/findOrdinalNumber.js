export default function findOrdinalNumber(number, language) {
    // ordinal for UK and DE
    if (language === 'UK' || language === 'DE') {
      let base = 100;
      let level = 0;
      let ordinal = number % base;
      while (ordinal === 0) {
        // ordinal number search formats are: xx, xxx, xxx_xxx, xxx_xxx_xxx, xxx_xxx_xxx_xxx, xxx_xxx_xxx_xxx_xxx
        base *= level ? 1000 : 10;
        level += 1;
        ordinal = number % base;
      }
      return ordinal;
    }
    // ordinal for EN
    let base = 100;
    let ordinal = number % base;
    while (ordinal === 0) {
      // ordinal number search formats are: xx, xxx, x_xxx, xx_xxx, xxx_xxx etc.
      base *= 10;
      ordinal = number % base;
    }
    return ordinal;
  }