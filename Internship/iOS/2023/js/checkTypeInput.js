// enable or disable line width input
export default function checkTypeInput() {
  const typeValue = document.getElementById('type-options').value;
  const lineLabel = document.getElementById('line-label');
  const lineInput = document.getElementById('line-options');
  if (typeValue === 'BAR') {
    lineInput.disabled = false;
    lineLabel.classList.remove('disabled');
  } else {
    lineInput.disabled = true;
    lineLabel.classList.add('disabled');
  }
}
