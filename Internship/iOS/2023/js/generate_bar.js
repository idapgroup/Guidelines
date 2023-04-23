import getSymbolCollection from './getSymbolCollection.js';
import transformFigure from './transformFigure.js';
import spinnerOn from './spinnerOn.js';
import spinnerOff from './spinnerOff.js';

export default function generate_bar(text, size, symbol, line) {
  spinnerOn();

  JsBarcode('#barcode', text, {
    width: line,
    height: size,
    margin: 0,
    displayValue: false,
    textMargin: 0,
    marginTop: 0,
    marginBottom: 0,
    marginLeft: 0,
    marginRight: 0,
  });

  setTimeout(() => {
    // get access to pixel data
    const barCanvas = document.getElementById('barcode');
    const context2d = barCanvas.getContext('2d');
    const imageData = context2d.getImageData(
      0,
      0,
      barCanvas.width,
      barCanvas.height,
    );
    const data = imageData.data;

    // create array with symbols from pixel data
    const symbolCollection = getSymbolCollection(data, symbol);

    // create result multiline string
    const figure = transformFigure(barCanvas, symbolCollection);

    spinnerOff();

    // deploy result to the page
    const outputArea = document.getElementById('output');
    outputArea.textContent = figure;
  }, 400);
}
