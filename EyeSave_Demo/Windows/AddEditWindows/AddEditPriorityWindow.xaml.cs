using EyeSave_Demo.Model;
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
using System.Windows.Shapes;

namespace EyeSave_Demo.Windows.AddEditWindows
{
    /// <summary>
    /// Логика взаимодействия для AddEditPriorityWindow.xaml
    /// </summary>
    public partial class AddEditPriorityWindow : Window
    {
        private static List<Agent> _agents = new List<Agent>();

        public AddEditPriorityWindow(List<Agent> agents)
        {
            InitializeComponent();
            _agents = agents;

            LoadMaxProirity();
        }

        private void PriorityTb_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void LoadMaxProirity()
        {
            PriorityTb.Text = _agents.Max(c => c.Priority).ToString();
        }

        private void CloseBtn_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                foreach (var item in _agents)
                {
                    item.Priority = int.Parse(PriorityTb.Text);
                }

                MainWindow.ent.SaveChanges();
                this.Close();
            }
            catch (Exception)
            {

                MessageBox.Show("Приоритет введен неверно");
            }
        }
    }
}
