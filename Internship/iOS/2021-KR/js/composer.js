import refs from './refs.js';
import findOrdinalNumber from './findOrdinalNumber.js';
import getWordsEN from './getWordsEN.js';
import getWordsUK from './getWordsUK.js';
import getWordsDE from './getWordsDE.js';
import clearInput from './clearInput.js';
import printResult from './printResult.js';
import indexValues from './indexValues.js';
const { ORDINDX, CARINDX, GENINDX, EXCINDX } = indexValues;

// get words, compose and output result
export default function composer() {
    // remove leading zeros
    const inputNumber = parseInt(refs.userInput.value, 10);
    // if input is zero or empty
    if (inputNumber === 0 || isNaN(inputNumber)) {
      clearInput();
      return;
    }
    // current language
    const curLang = refs.language.value;
    // split input number
    const ordinalEndingNumber = findOrdinalNumber(inputNumber, curLang);
    const cardinalNumber = inputNumber - ordinalEndingNumber;
  
    let outputValue;
    // compose EN or DE result
    if (curLang === 'EN') {
      const fullCardinalWords = getWordsEN(inputNumber, curLang, CARINDX);
      const ordinalEndingWords = getWordsEN(
        ordinalEndingNumber,
        curLang,
        ORDINDX,
      );
      const limitIndex = fullCardinalWords.length - ordinalEndingWords.length;
      outputValue = [
        ...fullCardinalWords.filter((el, ind) => ind < limitIndex),
        ...ordinalEndingWords,
      ].join(' ');
    }
    // compose UK result
    if (curLang === 'UK') {
      const cardinalWords = getWordsUK(cardinalNumber, curLang, CARINDX);
      // if ordinalNumber > 999 then ordinal number is in genitive case
      const ordinalEndingWords = getWordsUK(
        ordinalEndingNumber,
        curLang,
        ordinalEndingNumber > 999 ? GENINDX : ORDINDX,
      );
      // connector for ordinal words
      const ordConnector = ordinalEndingNumber > 1000 ? '' : ' ';
      outputValue = (
        [...cardinalWords].join(' ') +
        ' ' +
        [...ordinalEndingWords].join(ordConnector)
      ).trim();
    }
    // compose DE result
    if (curLang === 'DE') {
      const fullCardinalWords = getWordsDE(inputNumber, curLang, CARINDX);
      const ordinalEndingWords = getWordsDE(
        ordinalEndingNumber,
        curLang,
        ORDINDX,
      );
      const limitIndex = fullCardinalWords.length - ordinalEndingWords.length;
      outputValue = [
        ...fullCardinalWords.filter((el, ind) => ind < limitIndex),
        ...ordinalEndingWords,
      ].join('');
    }
    printResult(inputNumber, outputValue);
    clearInput();
  }