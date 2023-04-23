import getSymbol from './getSymbol.js';

export default function getSymbolCollection(data, symbol) {
  const symbolCollection = [];
  for (let i = 0; i < data.length; i += 4) {
    // find average pixel RGB value
    const averageRGB = Math.floor(
      255 - (data[i] + data[i + 1] + data[i + 2]) / 3,
    );
    // fill symbolCollection with symbol from ASCII symbol collection

    let index;
    if (symbol === 0) {
      // grayscale case
      index = Math.floor(averageRGB / 23.2);
    } else {
      // black and white
      index = averageRGB < 128 ? 0 : symbol;
    }

    symbolCollection.push(getSymbol(index));
  }
  return symbolCollection;
}
