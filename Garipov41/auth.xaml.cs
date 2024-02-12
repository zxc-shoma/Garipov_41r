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

namespace Garipov41
{
    /// <summary>
    /// Логика взаимодействия для auth.xaml
    /// </summary>
    public partial class auth : Page
    {
        public auth()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {

        }

        private async void loginBtn_Click(object sender, RoutedEventArgs e)
        {
            string login = LoginBox.Text;
            string password = PassBox.Text;

            if (login == "" || password == "")
            {
                MessageBox.Show("Есть пустые поля");
                return;
            }

            User user = garipov41Entities.GetContext().User.ToList().Find(p=> p.UserLogin == login && p.UserPassword == password);
            if (user!=null)
            {
                manager.MainFrame.Navigate(new ProductPage(user));
                LoginBox.Text = "";
                PassBox.Text = "";
            }
            else
            {
                MessageBox.Show("Введены неверные данные");
                loginBtn.IsEnabled = false;
                await Task.Delay(TimeSpan.FromSeconds(10));

                loginBtn.IsEnabled = true; 

            }

        }

        private void noLoginBtn_Click(object sender, RoutedEventArgs e)
        {
            string login = LoginBox.Text;
            string password = PassBox.Text;
            User user = garipov41Entities.GetContext().User.ToList().Find(p => p.UserLogin == login && p.UserPassword == password);
            if (user == null)
            {
                manager.MainFrame.Navigate(new ProductPage(user));
                LoginBox.Text = "";
                PassBox.Text = "";
            }


        }
    }
}
