// function to check and correct size in px; range is from 1px to 4px
export default function checkLineInput(value) {
  if (value < 1) {
    return 1;
  }
  if (value > 4) {
    return 4;
  }
  return value;
}
