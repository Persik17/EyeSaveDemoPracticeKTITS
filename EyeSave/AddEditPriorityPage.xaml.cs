using EyeSave_Demo.Model;
using EyeSave_Demo.Pages.DataPages;
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

namespace EyeSave_Demo.Pages.AddEditPages
{
    /// <summary>
    /// Логика взаимодействия для AddEditPriorityPage.xaml
    /// </summary>
    public partial class AddEditPriorityPage : Page
    {
        private static List<Agent> _agents = new List<Agent>();
        public AddEditPriorityPage(List<Agent> agents)
        {
            InitializeComponent();

            _agents = agents;

            LoadMaxValue();
        }

        private void SaveChangesBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                foreach (var item in _agents)
                {
                    item.Priority = int.Parse(PriorityTb.Text);
                }

                MainWindow.ent.SaveChanges();
                NavigationService.Navigate(new AgentsPage());
            }
            catch (Exception)
            {
                MessageBox.Show("Ошибка");
            }
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        //select max value from _agents
        private void LoadMaxValue()
        {
            PriorityTb.Text = _agents.Max(x => x.Priority).ToString();
        }

        private void PriorityTb_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }
    }
}
