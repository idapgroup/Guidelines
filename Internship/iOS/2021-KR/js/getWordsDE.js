import library from './library.js';
import indexValues from './indexValues.js';
const { ORDINDX, CARINDX, GENINDX, EXCINDX } = indexValues;

export default function getWordsDE(number, lang, index) {
  if (number === 0) {
    return '';
  }

  // split number into parts by 3 or less digits in array to get levels
  const parts = [];
  const arrToSplit = number.toString().split('');
  let endIndex = arrToSplit.length;
  let startIndex;
  for (let i = 0; i < Math.ceil(arrToSplit.length / 3); i++) {
    startIndex = endIndex - 3 < 0 ? 0 : endIndex - 3;
    parts.push(arrToSplit.slice(startIndex, endIndex).join(''));
    endIndex -= 3;
  }

  const words = [];
  const partsQty = parts.length;

  for (let i = 0; i < partsQty; i++) {
    // i - is level
    const numberFromPart = parseInt(parts[i]);
    // skip if part === 0
    if (numberFromPart > 0) {
      // twoDigits - is number that consists of ones and tens
      const twoDigits = numberFromPart % 100;
      const ones = twoDigits % 10;
      const tens = twoDigits - ones;
      const hundreds = numberFromPart - twoDigits;

      // in cardinal case index === CARINDX (singular) or CARINDX + 1 (plural) only for level > 1
      let LEVELINDX = index;
      let space = '';
      if (index === CARINDX && i > 1 && twoDigits !== 1) {
        LEVELINDX = CARINDX + 1;
      }
      // space around word level > 1 in cardinal case
      if (index === CARINDX && i > 1) {
        space = ' ';
      }
      words.push(space + library[lang].levels[i][LEVELINDX] + space);

      // from 1 to 19
      if (0 < twoDigits && twoDigits < 20) {
        // except for DE 'ein' to 'eine' for levels > 1
        if (numberFromPart === 1 && i > 1 && index === CARINDX) {
          words.push(library[lang][twoDigits][EXCINDX]);
        } else {
          words.push(library[lang][twoDigits][i ? CARINDX : index]); // if level > 0 then digits only cardinal
        }
      }
      // from 20 to 99 only tens
      else if (twoDigits > 19 && twoDigits < 100 && ones === 0) {
        words.push(library[lang][tens][i ? CARINDX : index]); // if level > 0 then digits only cardinal
      }
      // from 20 to 99 with ones > 0
      else if (twoDigits > 19 && twoDigits < 100) {
        words.push(library[lang][tens][i ? CARINDX : index]);
        words.push('und');
        words.push(library[lang][ones][CARINDX]); // if level > 0 then digits only cardinal
      }
      // hundreds
      if (hundreds) {
        words.push(
          library[lang][hundreds / 100][CARINDX] +
            library[lang][100][i ? CARINDX : index], // if level > 0 then digits only cardinal
        );
      }
    }
  }

  // filter array to remove empty elements
  const result = words.filter(el => el).reverse();

  return result;
}
