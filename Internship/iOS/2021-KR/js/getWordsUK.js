import library from './library.js';
import indexValues from './indexValues.js';
const { ORDINDX, CARINDX, GENINDX, EXCINDX } = indexValues;

export default function getWordsUK(number, lang, index) {
  if (number === 0) {
    return '';
  }

  // exceptions for UK ordinal 1_000 1_000_000 1_000_000_000 1_000_000_000_000
  if (index === GENINDX) {
    let base = 1000;
    let level = 1;
    do {
      if (number / base === 1) {
        return [library[lang].levels[level][ORDINDX]];
      }
      base *= 1000;
      level += 1;
    } while (number / base >= 1);
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
      let curInder = index;
      // switch current index for first word in array in genitive case
      if (words.length === 0 && index === GENINDX) {
        curInder = ORDINDX;
      }

      // twoDigits - is number that consists of ones and tens
      const twoDigits = numberFromPart % 100;
      const ones = twoDigits % 10;
      const tens = twoDigits - ones;
      const hundreds = numberFromPart - twoDigits;

      // CARqtyINDX - level quantity index in vocabulary array only in cardinal case levels
      let CARqtyINDX = curInder;
      if (index === CARINDX) {
        // if index is bigger than last element then take index of the last element in array
        CARqtyINDX =
          ones && ones < library[lang].levels[i].length
            ? ones
            : library[lang].levels[i].length - 1;
      }

      // to avoid pushing empty strings to words array
      const elementToPush = library[lang].levels[i][CARqtyINDX];
      if (elementToPush) {
        words.push(elementToPush);
      }

      // switch current index if array is not empty in genitive case
      if (words.length > 0 && index === GENINDX) {
        curInder = GENINDX;
      }
      const CARorGEN = index === GENINDX && number > 1000 ? GENINDX : CARINDX;
      // from 1 to 19
      if (0 < twoDigits && twoDigits < 20) {
        // except for UK 1 and 2 thousand
        if (twoDigits < 3 && i === 1 && index === CARINDX) {
          words.push(library[lang][twoDigits][EXCINDX]);
        } else {
          words.push(library[lang][twoDigits][i ? CARorGEN : curInder]); // if level > 0 then digits only cardinal
        }
      }
      // from 20 to 99 only tens
      else if (twoDigits > 19 && twoDigits < 100 && ones === 0) {
        words.push(library[lang][tens][i ? CARorGEN : curInder]); // if level > 0 then digits only cardinal
      }
      // from 20 to 99 with ones > 0
      else if (twoDigits > 19 && twoDigits < 100) {
        words.push(library[lang][ones][i ? CARorGEN : curInder]); // if level > 0 then digits only cardinal
        words.push(library[lang][tens][CARorGEN]);
      }
      // hundreds
      if (hundreds) {
        words.push(library[lang][hundreds][i ? CARorGEN : curInder]);
      }
    }
  }

  // filter array to remove empty elements
  const result = words.filter(el => el).reverse();

  return result;
}
