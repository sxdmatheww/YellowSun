using ideal_chuikov.Classes;
using ideal_chuikov.Pages;
using System;
using System.Collections.Generic;
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
using System.Windows.Shapes;

namespace ideal_chuikov
{
    /// <summary>
    /// Логика взаимодействия для OneOrder.xaml
    /// </summary>
    public partial class OneOrder : Window
    {
        public OneOrder()
        {
            InitializeComponent();
            Manager.MainFrame = MainFrame;
        }


        private void OpenTalonPage(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Оплата прошла успешно", "Оплата",
                    MessageBoxButton.OK, MessageBoxImage.Information);

            Manager.MainFrame.Navigate(new TalonOrder());
        }
    }
}
