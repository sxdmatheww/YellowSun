using ideal_chuikov.Classes;
using ideal_chuikov.Models;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Data.Entity;
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
using System.Text.RegularExpressions;
using System.Collections.ObjectModel;
using System.Data.Entity.Validation;

namespace ideal_chuikov.Pages
{
    /// <summary>
    /// Логика взаимодействия для EditMerch.xaml
    /// </summary>
    public partial class EditMerch : Page
    {
        public OpenFileDialog ofd = new OpenFileDialog();
        private string newsourthpath = string.Empty;
        string path = "";
        private bool flag = false;
        private merch currentmerch = new merch();
        public EditMerch(merch sellectedMerch)

        {
            InitializeComponent();

            if (sellectedMerch != null)
            {
                currentmerch = sellectedMerch;
            }
            DataContext = currentmerch;

        }



        private void Save(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (string.IsNullOrWhiteSpace(currentmerch.name))
                errors.AppendLine("Укажите название!");
            if (string.IsNullOrWhiteSpace(currentmerch.dexcription))
                errors.AppendLine("Укажите описание!");
            if (string.IsNullOrWhiteSpace(currentmerch.manufacturer))
                errors.AppendLine("Укажите производителя!");
            if (currentmerch.quantity < 0)
                errors.AppendLine("Количество товара не может быть отрицательным!");

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            DbContextTransaction dbContextTransaction = null;

            try
            {
                if (currentmerch.id == 0)
                {
                    yellowsEntities2.GetContext().merch.Add(currentmerch);
                }

                dbContextTransaction = yellowsEntities2.GetContext().Database.BeginTransaction();

                yellowsEntities2.GetContext().SaveChanges();

                MessageBox.Show("Информация сохранена!");
                dbContextTransaction.Commit();
                Manager.MainFrame.GoBack();
            }
            catch (DbEntityValidationException ex)
            {
                if (dbContextTransaction != null)
                {
                    dbContextTransaction.Rollback();
                }

                foreach (var validationError in ex.EntityValidationErrors)
                {
                    foreach (var error in validationError.ValidationErrors)
                    {
                        MessageBox.Show($"Property: {error.PropertyName} Error: {error.ErrorMessage}");
                    }
                }

                MessageBox.Show("Ошибка при сохранении изменений. Проверьте данные и попробуйте снова.");
            }
            catch (Exception ex)
            {
                if (dbContextTransaction != null)
                {
                    dbContextTransaction.Rollback();
                }

                MessageBox.Show($"Ошибка при обновлении записей. Дополнительные сведения: {ex.Message}");
            }
            finally
            {
                dbContextTransaction?.Dispose();
            }
        }

        private void Foto(object sender, RoutedEventArgs e)
        {
            string Source = Environment.CurrentDirectory;
            if (ofd.ShowDialog() == true)
            {
                flag = true;
                string sourthpath = ofd.SafeFileName;
                newsourthpath = Source.Replace("/bin/Debug", "/photo/") + sourthpath;
                PreviewImage.Source = new BitmapImage(new Uri(ofd.FileName));
                path = ofd.FileName;
                currentmerch.photo = $"/photo/{ofd.SafeFileName}";
            }
        }
    }
}
