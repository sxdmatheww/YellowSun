using ideal_chuikov.Classes;
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
    /// Логика взаимодействия для Auth.xaml
    /// </summary>
    public partial class Auth : Page
    {
        
        public Auth()
        {
            InitializeComponent();
            Connect.modeldb = new Models.yellowsEntities2();
        }


        /// <summary>
        /// Метод для авторизации
        /// </summary>
        private async void Vxod(object sender, RoutedEventArgs e)
        {
            try
            {
                string login = Login.Text;
                string password = Password.Password;

                if (string.IsNullOrEmpty(login) || string.IsNullOrEmpty(password))
                {
                    throw new Exception("Поля логин и пароль не могут быть пустыми.");
                }

                

                var userObj = Connect.modeldb.users.FirstOrDefault(x =>
                    x.login == Login.Text && x.password == Password.Password);

                if (userObj == null)
                {
                    MessageBox.Show("Такого пользователя нет!", "Ошибка при авторизации",
                        MessageBoxButton.OK, MessageBoxImage.Error);
                }
                else
                {
                    
                    CurrentUser.UserRole = userObj.type_user.role;
                    switch (userObj.id_type)
                    {
                        case 1:
                            MessageBox.Show("Добро пожаловать в программу! ", "Уведомление",
                        MessageBoxButton.OK, MessageBoxImage.Information);
                            Manager.MainFrame.Navigate(new RootMerch());
                            break;
                        
                        default:
                            MessageBox.Show("Данные не обнаружены!", "Уведомление",
                                MessageBoxButton.OK, MessageBoxImage.Warning);
                            break;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message.ToString(), "Критическая работа приложения",
                       MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        
    }
}
