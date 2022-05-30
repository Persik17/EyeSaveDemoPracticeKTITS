using EyeSave_Demo.Model;
using EyeSave_Demo.Pages.AddEditPages;
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

namespace EyeSave_Demo.Pages.DataPages
{
    /// <summary>
    /// Логика взаимодействия для AgentsPage.xaml
    /// </summary>
    public partial class AgentsPage : Page
    {
        private List<Agent> agents = new List<Agent>();
        private readonly List<Button> buttons = new List<Button>();

        private static readonly int take = 10;
        private static int skip = 0;

        public AgentsPage()
        {
            InitializeComponent();

            //selected non deleted agents
            agents = MainWindow.ent.Agent.Where(x => !x.IsDeleted).ToList();

            FillComboBox();
            AgentsList.ItemsSource = agents.Take(take);    

            GenerateNavigationButtons();
        }

        private void SearchTb_GotKeyboardFocus(object sender, KeyboardFocusChangedEventArgs e)
        {
            if (SearchTb.Text == "Введите для поиска")
                SearchTb.Text = "";
        }

        private void SearchTb_LostKeyboardFocus(object sender, KeyboardFocusChangedEventArgs e)
        {
            if (string.IsNullOrEmpty(SearchTb.Text))
                SearchTb.Text = "Введите для поиска";
        }

        private void NavButton_Click(object sender, RoutedEventArgs e)
        {
            skip = (int)(sender as Button).Content * 10 - 10;
            AgentsList.ItemsSource = agents.Skip(skip).Take(take);

            //hide buttons
            for (int i = 0; i < (int)(sender as Button).Content - 2; i++)
            {
                buttons[i].Width = 0;
                buttons[i].Height = 0;
                buttons[i].Margin = new Thickness(0);
            }
        }

        //generate numeric navigation buttons
        private void GenerateNavigationButtons()
        {
            int count;

            count = agents.Count % 10 == 0 ? agents.Count / 10 : (agents.Count / 10) + 1;

            for (int i = 1; i <= count; i++)
            {
                Button button = new Button
                {
                    Content = i,
                    BorderBrush = new SolidColorBrush(Colors.White),
                    Background = new SolidColorBrush(Colors.White),
                    BorderThickness = new Thickness(0, 0, 0, 0),
                    Margin = new Thickness(5),
                    Width = 25,
                    Height = 25
                };
                button.Click += new RoutedEventHandler(NavButton_Click);

                buttons.Add(button);
                NavButtonsSt.Children.Add(button);
            }
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            int checkSkip = skip - take;

            if (checkSkip >= 0)
            {
                skip -= take;
                AgentsList.ItemsSource = agents.Skip(skip).Take(take);

                if (checkSkip != 0)
                {
                    buttons[skip / 10 - 1].Width = 25;
                    buttons[skip / 10 - 1].Height = 25;
                    buttons[skip / 10 - 1].Margin = new Thickness(5);
                }
            }
        }

        private void NextBtn_Click(object sender, RoutedEventArgs e)
        {
            int checkSkip = skip + take;

            if (checkSkip < agents.Count - take)
            {
                skip += take;
                AgentsList.ItemsSource = agents.Skip(skip).Take(take);

                buttons[skip / 10 - 1].Width = 0;
                buttons[skip / 10 - 1].Height = 0;
                buttons[skip / 10 - 1].Margin = new Thickness(0);
            }
        }

        private void Filter()
        {
            try
            {
                agents = MainWindow.ent.Agent.Where(x => !x.IsDeleted).ToList();

                List<Agent> agentsList = new List<Agent>();
                List<Agent> agentsTitle = new List<Agent>();
                List<Agent> agentsType = new List<Agent>();

                if (!string.IsNullOrEmpty(SearchTb.Text) && SearchTb.Text != "Введите для поиска")
                    agentsTitle = agents.Where(x => x.Title.StartsWith(SearchTb.Text) || x.Email.StartsWith(SearchTb.Text) || x.Phone.StartsWith(SearchTb.Text)).ToList();

                if (AgentTypeCb.SelectedIndex != -1 && AgentTypeCb.SelectedIndex != 0)
                    agentsType = agents.Where(x => x.AgentTypeID == AgentTypeCb.SelectedIndex).ToList();
                else if (AgentTypeCb.SelectedIndex == 0)
                    agentsType = agents.ToList();

                agents = agentsList.Concat(agentsTitle).Concat(agentsType).Distinct().ToList().Count == 0 ? agents : agentsList.Concat(agentsTitle).Concat(agentsType).Distinct().ToList();

                if (FilterCb.SelectedIndex != -1)
                {
                    if ((FilterCb.SelectedIndex + 1) % 2 == 0)
                    {
                        if (FilterCb.SelectedIndex + 1 == 2)
                            agents = agents.OrderByDescending(x => x.Title).ToList();
                        else if (FilterCb.TabIndex == 4)
                            agents = agents.OrderByDescending(x => x.GetDiscount).ToList();
                        else
                            agents = agents.OrderByDescending(x => x.Priority).ToList();
                    }
                    else
                    {
                        if (FilterCb.SelectedIndex + 1 == 1)
                            agents = agents.OrderBy(x => x.Title).ToList();
                        else if (FilterCb.TabIndex == 3)
                            agents = agents.OrderBy(x => x.GetDiscount).ToList();
                        else
                            agents = agents.OrderBy(x => x.Priority).ToList();
                    }
                }

                AgentsList.ItemsSource = agents.ToList();

                buttons.Clear();
                NavButtonsSt.Children.Clear();
                GenerateNavigationButtons();
            }
            catch (Exception)
            {
                AgentsList.ItemsSource = agents.Take(take);
                MessageBox.Show("Ошибка сортировки!");
                return;
            }
        }

        private void SearchTb_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Filter();
        }

        private void AgentTypeCb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Filter();
        }

        private void FilterCb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Filter();
        }

        //fill cb with custom element
        private void FillComboBox()
        {
            AgentTypeCb.Items.Add("Все типы");
            foreach (var item in MainWindow.ent.AgentType)
            {
                AgentTypeCb.Items.Add(item.Title);
            }
        }

        private void AgentsList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ChangePriorityBtn.Visibility = AgentsList.SelectedItems.Count > 1 ? Visibility.Visible : Visibility.Hidden;
        }

        private void ChangePriorityBtn_Click(object sender, RoutedEventArgs e)
        {
            List<Agent> agents = new List<Agent>();
            foreach (var item in AgentsList.SelectedItems)
            {
                agents.Add(item as Agent);
            }
                
            NavigationService.Navigate(new AddEditPriorityPage(agents));
        }

        private void Border_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ClickCount == 2)
                NavigationService.Navigate(new AddEditAgentPage((sender as Border).DataContext as Agent, true));
        }

        private void AddAgentBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddEditAgentPage(new Agent(), false));
        }
    }
}
