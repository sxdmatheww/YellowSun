using ideal_chuikov.Classes;
using ideal_chuikov.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ideal_chuikov.Pages
{
    /// <summary>
    /// Логика взаимодействия для RootMerch.xaml
    /// </summary>
    public partial class RootMerch : Page, INotifyPropertyChanged
    {
        private ObservableCollection<merch> merchCollection;

        public RootMerch()
        {
            InitializeComponent();
            merchCollection = new ObservableCollection<merch>(yellowsEntities2.GetContext().merch.ToList());
            MerchBD.ItemsSource = merchCollection;

            // Установка контекста данных для страницы
            DataContext = this;
        }

        // Добавленное свойство для хранения скидки
        private double _discount;
        public double discount
        {
            get { return _discount; }
            set
            {
                _discount = value;
                OnPropertyChanged(nameof(discount));
            }
        }

        private void Add(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new EditMerch(null));

            merch newMerch = new merch();
            // Установка начального значения для quantity
            newMerch.quantity = 0;
            merchCollection.Add(newMerch);
        }

        private void Edit(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new EditMerch((sender as Button).DataContext as merch));
        }

        private void Delete(object sender, RoutedEventArgs e)
        {
            var MerchDell = MerchBD.SelectedItems.Cast<merch>().ToList();
            if (MessageBox.Show($"Вы точно хотите удалить следующие {MerchDell.Count()} элементов?", "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    yellowsEntities2.GetContext().merch.RemoveRange(MerchDell);
                    yellowsEntities2.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");

                    // Обновление ObservableCollection, что автоматически обновит DataGrid
                    foreach (var merch in MerchDell)
                    {
                        merchCollection.Remove(merch);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }

            }
        }






        private void RefreshPage()
        {
            try
            {
                merchCollection.Clear();
                // Обновляем только данные в коллекции, не загружая их заново из базы данных
                foreach (var merch in yellowsEntities2.GetContext().merch)
                {
                    merchCollection.Add(merch);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка при обновлении данных: " + ex.Message);
            }
        }

        private void Ref(object sender, RoutedEventArgs e)
        {
            RefreshPage();
        }

        private void Rega(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new Registration());
        }

        private void IncreaseQuantity(object sender, RoutedEventArgs e)
        {
            var item = (sender as Button).DataContext as merch;
            if (item != null)
            {
                item.quantity++;
                SaveChanges();
            }
        }

        private void DecreaseQuantity(object sender, RoutedEventArgs e)
        {
            var item = (sender as Button).DataContext as merch;
            if (item != null && item.quantity > 0)
            {
                item.quantity--;
                SaveChanges();
            }
        }

        private void SaveChanges()
        {
            try
            {
                yellowsEntities2.GetContext().SaveChanges();
                RefreshPage(); // Обновление страницы после сохранения изменений
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка при сохранении данных: " + ex.Message);
            }
        }

        private int _quantity;

        public int quantity
        {
            get { return _quantity; }
            set
            {
                _quantity = value;
                OnPropertyChanged(nameof(quantity));
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        private void OpenLink(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;
            var merchItem = button.DataContext as merch;
            if (merchItem != null && !string.IsNullOrEmpty(merchItem.url))
            {
                Process.Start(new ProcessStartInfo
                {
                    FileName = merchItem.url,
                    UseShellExecute = true
                });
            }
        }

        // Метод для обработки запроса навигации по ссылке
        private void Hyperlink_RequestNavigate(object sender, RequestNavigateEventArgs e)
        {
            Process.Start(new ProcessStartInfo(e.Uri.AbsoluteUri) { UseShellExecute = true });
            e.Handled = true;
        }
    }
}
