using EyeSave_Demo.Model;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
using System.Net.Mail;
using EyeSave_Demo.Pages.DataPages;

namespace EyeSave_Demo.Pages.AddEditPages
{
    /// <summary>
    /// Логика взаимодействия для AddEditAgentPage.xaml
    /// </summary>
    public partial class AddEditAgentPage : Page
    {
        private static Agent _agent;
        private static bool _isEdit;
        private static string _logoPath;

        public AddEditAgentPage(Agent agent, bool isEdit)
        {
            InitializeComponent();

            AgentTypeCb.ItemsSource = MainWindow.ent.AgentType.ToList();

            _agent = agent;
            _isEdit = isEdit;

            _logoPath = _agent.Logo;

            DataContext = _agent;

            if (_logoPath != null)
                SaveImageBtn.Content = "Изменить";
            else
                SaveImageBtn.Content = "Добавить";

            if (_isEdit)
                DeleteAgentBtn.Visibility = Visibility.Visible;
            else
                DeleteAgentBtn.Visibility = Visibility.Hidden;

            HistorySalesDg.ItemsSource = MainWindow.ent.ProductSale.Where(o => o.AgentID == _agent.ID && !o.IsDeleted).ToList();
        }

        private void SaveImageBtn_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFile = new OpenFileDialog()
            {
                Filter = "*.jpeg|*.png"
            };

            if (openFile.ShowDialog().GetValueOrDefault())
            {
                LogoImg.Source = new BitmapImage(new Uri(openFile.FileName));
                _logoPath = new BitmapImage(new Uri(openFile.FileName)).ToString();
            }
        }

        private void AddSalesBtn_Click(object sender, RoutedEventArgs e)
        {
            if (_agent.ID != 0)
            {
                NavigationService.Navigate(new AddProductSalePage(_agent));
            }
            else
                MessageBox.Show("Перед добавлением реализации, заполните поля и сохраните пользователя!");
        }

        private void DeleteSalesBtn_Click(object sender, RoutedEventArgs e)
        {
            if (HistorySalesDg.SelectedItem is ProductSale sale)
            {
                var res = MessageBox.Show("Вы действительно хотите удалить выбранный элемент?", "Внимаение!", MessageBoxButton.YesNo);
                if (res == MessageBoxResult.Yes)
                {
                    sale.IsDeleted = true;
                    MainWindow.ent.SaveChanges();

                    HistorySalesDg.ItemsSource = MainWindow.ent.ProductSale.Where(o => o.AgentID == _agent.ID && !o.IsDeleted).ToList();
                }
            }
        }

        private void SaveAgentBtn_Click(object sender, RoutedEventArgs e)
        {
            if (GetValidate())
            {
                _agent.Logo = _logoPath;

                if (!_isEdit)
                    MainWindow.ent.Agent.Add(_agent);

                MainWindow.ent.SaveChanges();

                NavigationService.Navigate(new AgentsPage());
            }
            else
                MessageBox.Show("Некоторые поля введены некорректно!");
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AgentsPage());
        }

        private void TitleTb_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex(@"[^А-Яа-я\s-()]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void PriorityTb_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void INNTb_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex(@"[^0-9\s]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void KPPTb_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex(@"[^0-9\s]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void DirNameTb_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex(@"[^А-Яа-я\s-]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void PhoneTb_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex(@"[^0-9\s-()]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void AddressTb_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex(@"[^А-ЯА-я0-9\s-().,:]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        //try to generate and check on validate email
        private bool CheckEmail()
        {
            try
            {
                MailAddress mail = new MailAddress(EmailTb.Text);

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        //get validation from all fields
        private bool GetValidate()
        {
            if (string.IsNullOrEmpty(TitleTb.Text))
                return false;

            if (AgentTypeCb.SelectedIndex == -1)
                return false;

            if (string.IsNullOrEmpty(PriorityTb.Text))
                return false;

            if (string.IsNullOrEmpty(AddressTb.Text))
                return false;

            if (string.IsNullOrEmpty(INNTb.Text) || INNTb.MaxLength > INNTb.Text.Length)
                return false;

            if (string.IsNullOrEmpty(KPPTb.Text) || KPPTb.MaxLength > KPPTb.Text.Length)
                return false;

            if (string.IsNullOrEmpty(DirNameTb.Text))
                return false;

            if (string.IsNullOrEmpty(PhoneTb.Text))
                return false;

            return CheckEmail();
        }

        private void DeleteAgentBtn_Click(object sender, RoutedEventArgs e)
        {
            if (HistorySalesDg.Items.Count == 0)
            {
                var res = MessageBox.Show("Вы действительно хотите удалить данного агента?", "Внимание!", MessageBoxButton.YesNo);
                if (res == MessageBoxResult.Yes)
                {
                    List<Shop> shops = MainWindow.ent.Shop.Where(x => x.AgentID == _agent.ID).ToList();
                    List<AgentPriorityHistory> histories = MainWindow.ent.AgentPriorityHistory.Where(x => x.AgentID == _agent.ID).ToList();

                    if (shops.Count != 0)
                    {
                        foreach (var item in shops)
                        {
                            item.IsDeleted = true;
                        }
                    }

                    if (histories.Count != 0)
                    {
                        foreach (var item in histories)
                        {
                            item.IsDeleted = true;
                        }
                    }

                    _agent.IsDeleted = true;

                    MainWindow.ent.SaveChanges();
                    NavigationService.Navigate(new AgentsPage());
                }
            }
            else
            {
                MessageBox.Show("Удаление невозможно, у данного агента числятся продажи!");
            }
        }
    }
}
