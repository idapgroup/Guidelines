import getSymbolCollection from './getSymbolCollection.js';
import transformFigure from './transformFigure.js';
import spinnerOn from './spinnerOn.js';
import spinnerOff from './spinnerOff.js';

export default function generate_qr(text, size, symbol) {
  spinnerOn();
  const qr_ref = document.getElementById('qrcode');
  // clear previous result markup elements
  qr_ref.innerHTML = '';

  const qrcode = new QRCode('qrcode', {
    text: text,
    width: size,
    height: size,
  });

  setTimeout(() => {
    // canvas reference
    const qrCanvas = qr_ref.firstChild; // canvas
    const qrImg = qr_ref.lastChild; // img

    // create image element
    const img = new Image();
    img.crossOrigin = 'anonymous';
    img.src = qrImg.src;

    // get access to pixel data
    const context2d = qrCanvas.getContext('2d');

    // wait for image and transform image via canvas
    img.onload = () => {
      // load image into canvas
      context2d.drawImage(img, 0, 0);
      // access to pixel data
      const imageData = context2d.getImageData(
        0,
        0,
        qrCanvas.width,
        qrCanvas.height,
      );
      const data = imageData.data;
      // create array with symbols from pixel data
      const symbolCollection = getSymbolCollection(data, symbol);

      // create result multiline string
      const figure = transformFigure(qrCanvas, symbolCollection);

      spinnerOff();

      // deploy result to the page
      const outputArea = document.getElementById('output');
      outputArea.textContent = figure;
    };
  }, 400);
}
