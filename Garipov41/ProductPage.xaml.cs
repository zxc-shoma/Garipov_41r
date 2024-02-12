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
    /// Логика взаимодействия для ProductPage.xaml
    /// </summary>
    public partial class ProductPage : Page
    {
        public ProductPage(User user)
        {
            InitializeComponent();
            var currentProduct = garipov41Entities.GetContext().Product.ToList();
            ProductListView.ItemsSource = currentProduct;

            Combo.SelectedIndex = 0;
            

            if (user != null)
            {
                FIOTb.Text = user.UserSurname + " " + user.UserName + " " + user.UserPatronymic;
                switch (user.UserRole)
                {
                    case 1:
                        RoleTb.Text = "Администратор"; break;

                    case 2:
                        RoleTb.Text = "Клиент"; break;

                    case 3:
                        RoleTb.Text = "Менеджер"; break;

                }

            }
            else
            {
                RoleTb.Text = "Гость";
                FIOTb.Text = "Гость";
                
                
            }
           


            Update();
        }





        private void Update()
        {
            var currentProduct = garipov41Entities.GetContext().Product.ToList();
            var productCount = currentProduct.Count;

            if (Combo.SelectedIndex == 0)
            {
                currentProduct = currentProduct.Where(p => (p.ProductDiscountAmount >=0 && p.ProductDiscountAmount <=100 )).ToList();

            }
            if (Combo.SelectedIndex == 1)
            {
                currentProduct = currentProduct.Where(p => (p.ProductDiscountAmount >= 0 && p.ProductDiscountAmount <= 9.99)).ToList();

            }
            if (Combo.SelectedIndex == 2)
            {
                currentProduct = currentProduct.Where(p => (p.ProductDiscountAmount >= 10 && p.ProductDiscountAmount <= 14.99)).ToList();

            }
            if (Combo.SelectedIndex == 3)
            {
                currentProduct = currentProduct.Where(p => (p.ProductDiscountAmount >= 15)).ToList();

            }



            currentProduct = currentProduct.Where(p=> p.ProductName.ToLower().Contains(TBoxSearch.Text.ToLower())).ToList();


            if (RbuttonDown.IsChecked.Value)

            {
                currentProduct = currentProduct.OrderByDescending(p => p.ProductCost).ToList();
                
            }

            if (RButtonUp.IsChecked.Value)

            {
                currentProduct = currentProduct.OrderBy(p => p.ProductCost).ToList();

            }

            ProductListView.ItemsSource = currentProduct;
            TBCount.Text = currentProduct.Count.ToString();
            TBAll.Text=productCount.ToString();


        }







        private void TBoxSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();

        }

        private void Combo_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();

        }

        private void RadioButton_Checked(object sender, RoutedEventArgs e)
        {
            Update();

        }

        private void RButtonUp_Checked(object sender, RoutedEventArgs e)
        {
            Update();

        }

        private void RbuttonDown_Checked(object sender, RoutedEventArgs e)
        {
            Update();

        }
    }
}
