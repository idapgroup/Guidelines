import checkTypeInput from './js/checkTypeInput.js';
import checkSizeInput from './js/checkSizeInput.js';
import checkLineInput from './js/checkLineInput.js';
import inputCharFilter from './js/inputCharFilter.js';
import generate_qr from './js/generate_qr.js';
import generate_bar from './js/generate_bar.js';

// only digits on input 
const sizeInput = document.getElementById('size-options');
const lineInput = document.getElementById('line-options');
sizeInput.addEventListener('keypress', inputCharFilter);
lineInput.addEventListener('keypress', inputCharFilter);

// check code type to enable or disable line width input
checkTypeInput();
document
  .getElementById('type-options')
  .addEventListener('change', checkTypeInput);

document.getElementById('generate-btn').addEventListener('click', generate);
window.addEventListener('keypress', event => {
  if (event.code === 'Enter' || event.code === 'NumpadEnter') {
    generate();
  }
});

function generate() {
  const textValue = document.getElementById('user-input').value;
  // in case input is empty
  if (textValue === '') {
    return;
  }

  // clear previous result on the page
  const outputArea = document.getElementById('output');
  outputArea.textContent = '';

  const sizeValue = checkSizeInput(Number(sizeInput.value)).toString();
  // update size value in user interface
  sizeInput.value = sizeValue;

  const lineValue = checkLineInput(Number(lineInput.value)).toString();
  // update line value in user interface
  lineInput.value = lineValue;

  // get type of code: qr or bar and generate figure
  const codeType = document.getElementById('type-options').value;

  // get symbol type to be displayed in result picture
  const symbolType = Number(document.getElementById('symbol-options').value);

  if (codeType === 'QR') {
    generate_qr(textValue, sizeValue, symbolType);
  }
  if (codeType === 'BAR') {
    generate_bar(textValue, sizeValue, symbolType, lineValue);
  }
}
