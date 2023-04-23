// ASCII symbol collection
export default function getSymbol(index) {
  // collection is full for grayscale case
  const ASCII = [' ', '.', ':', '-', '=', '+', '\\', '*', '#', '%', '@'];
  return ASCII[index];
}
