// create multiline string from symbol collection
export default function transformFigure(canvasReference, symbolCollection) {
  let figure = '';
  let collection = [...symbolCollection];
  for (let i = 0; i < canvasReference.height; i += 1) {
    // row
    for (let j = 0; j < canvasReference.width; j += 1) {
      figure += collection.shift();
    }
    // row end with new row start
    figure += '\n';
  }
  return figure;
}
