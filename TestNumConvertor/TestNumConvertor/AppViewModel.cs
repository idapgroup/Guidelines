using System;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace TestNumConvertor
{
    public class AppViewModel : INotifyPropertyChanged
    {
        public Languages Lang { get; set; }

        private ulong num;
        private bool validNum;
        private string strNum;
        public string StrNum
        {
            get { return strNum; }
            set
            {
                validNum = UInt64.TryParse(value, out num);
                strNum = value;
                OnPropertyChanged("StrNum");
            }
        }

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
                        {
                            Result = num > Math.Pow(10, 15) 
                            ? "Диапазон превышен" 
                            : NumConvertor.Convert(num, Lang);
                        }, o => validNum)
                    );
            }
        }

        public AppViewModel()
        {
            Result = "Результат преобразования отобразиться здесь";
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(prop));
        }
    }
}
