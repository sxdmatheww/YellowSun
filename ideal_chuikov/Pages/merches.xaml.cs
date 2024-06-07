using ideal_chuikov.Classes;
using ideal_chuikov.Models;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ideal_chuikov.Pages
{
    /// <summary>
    /// Логика взаимодействия для merches.xaml
    /// </summary>
    public partial class merches : Page
    {
        public merches()
        {
            InitializeComponent();
            var merchik = yellowsEntities2.GetContext().merch.ToList();
            MerchBD.ItemsSource = merchik;

            SetVisibility(CurrentUser.UserRole);
        }

        private void SetVisibility(string role)
        {
            if (role == "Администратор")
            {
                RootPanel.Visibility = Visibility.Visible;
                ClientPanel.Visibility = Visibility.Collapsed;
            }
            else if (role == "Клиент")
            {
                ClientPanel.Visibility = Visibility.Visible;
                RootPanel.Visibility = Visibility.Collapsed;
            }
            else
            {
                ClientPanel.Visibility = Visibility.Collapsed;
                RootPanel.Visibility = Visibility.Collapsed;
            }
        }

        private void OneOrder(object sender, RoutedEventArgs e)
        {
            OneOrder oneOrder = new OneOrder();
            oneOrder.Show();
        }

        private void Add(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new EditMerch(null));
        }

        private void Orders(object sender, RoutedEventArgs e)
        {
            OrdersWindow ordersWindow = new OrdersWindow();
            this.Visibility = Visibility.Hidden;
            ordersWindow.Show();
        }
        

    }
}
