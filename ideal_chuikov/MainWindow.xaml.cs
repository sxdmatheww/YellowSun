using ideal_chuikov.Classes;
using ideal_chuikov.Pages;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
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
using System.Windows.Threading;

namespace ideal_chuikov
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MainFrame.Navigate(new EditOrders());
            Manager.MainFrame = MainFrame;
        }
        private void Autorization(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new Auth());
        }
        private void Vihod(object sender, RoutedEventArgs e)
        {
            Close();
        }
        private void MainFrame_Navigated(object sender, NavigationEventArgs e)
        {

        }
        private void OpenSite(object sender, RoutedEventArgs e)
        {
            Process.Start(new ProcessStartInfo
            {
                FileName = "https://zoon.ru/msk/fitness/fitnes-klub_zheltoe_solntse_v_oktyabrskom/",
                UseShellExecute = true
            });
        }
    }
}
