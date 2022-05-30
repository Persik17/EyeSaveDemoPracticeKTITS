using EyeSave_Demo.Model;
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

namespace EyeSave_Demo.Pages.AddEditPages
{
    /// <summary>
    /// Логика взаимодействия для AddProductSalePage.xaml
    /// </summary>
    public partial class AddProductSalePage : Page
    {
        private static Agent _agent;

        public AddProductSalePage(Agent agent)
        {
            InitializeComponent();

            _agent = agent;

            SaleCb.ItemsSource = MainWindow.ent.Product.ToList();
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
                NavigationService.Navigate(new AddEditAgentPage(_agent, true));
        }

        private void AddSaleBtn_Click(object sender, RoutedEventArgs e)
        {
            if (SaleCb.SelectedIndex != -1)
            {
                ProductSale sale = new ProductSale()
                {
                    AgentID = _agent.ID,
                    ProductID = (SaleCb.SelectedItem as Product).ID,
                    SaleDate = DateTime.Now,
                    IsDeleted = false,
                    ProductCount = 0,
                };

                MainWindow.ent.ProductSale.Add(sale);
                MainWindow.ent.SaveChanges();

                NavigationService.Navigate(new AddEditAgentPage(_agent, true));
            }
            else
            {
                MessageBox.Show("Такого товара не существует!");
            }
        }
    }
}
