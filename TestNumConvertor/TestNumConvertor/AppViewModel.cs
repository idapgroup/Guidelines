using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace TestNumConvertor
{
    public class AppViewModel : INotifyPropertyChanged
    {
        public Languages Lang { get; set; }

        public ulong Num { get; set; }

        private string result;
        public string Result
        {
            get { return result; }
            private set
            {
                if (result != value)
                {
                    result = value;
                    OnPropertyChanged("Result");
                }
            }
        }

        private RelayCommand convertCmd;
        public RelayCommand ConvertCmd
        {
            get
            {
                return convertCmd ??
                    (
                        convertCmd = new RelayCommand(obj =>
                            Result = NumConvertor.Convert(Num, Lang))
                    );
            }
        }

        #region INotifyPropertyChanged members
        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(prop));
        }
        #endregion
    }
}
