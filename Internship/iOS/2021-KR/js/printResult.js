import refs from './refs.js';

// result output in form
export default function printResult(input, result) {
  refs.outputNumber.textContent = `${input}:`;
  refs.outputResult.textContent = result;
}
