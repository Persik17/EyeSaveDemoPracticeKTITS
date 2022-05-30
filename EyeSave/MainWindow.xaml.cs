using EyeSave_Demo.Model;
using EyeSave_Demo.Pages.DataPages;
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

namespace EyeSave_Demo
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        //db conn
        public static EyeSaveEntities ent = new EyeSaveEntities();

        public MainWindow()
        {
            InitializeComponent();

            NavFrame.Navigate(new AgentsPage());
        }
    }
}
