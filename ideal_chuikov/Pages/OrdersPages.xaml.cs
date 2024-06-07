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
    /// Логика взаимодействия для OrdersPages.xaml
    /// </summary>
    public partial class OrdersPages : Page
    {
        public OrdersPages()
        {
            InitializeComponent();
            var merchik = yellowsEntities2.GetContext().orders.ToList();
            OrderBD.ItemsSource = merchik;
        }
    }
}
