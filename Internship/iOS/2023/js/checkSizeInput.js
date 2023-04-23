// function to check and correct size in px; range is from 2px to 200px
export default function checkSizeInput(value) {
  if (value < 2) {
    return 2;
  }
  if (value > 200) {
    return 200;
  }
  return value;
}
