using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media;

namespace EyeSave_Demo.Model
{
    public partial class Agent
    {
        public string GetImage
        {
            get
            {
                //if image is null then getting default logo
                return string.IsNullOrEmpty(Logo) ? @"C:\Users\kraic\OneDrive\Рабочий стол\EyeSave_Demo\EyeSave_Demo\Images\Agents\picture.png" : Logo;
            }
        }

        public int GetDiscount
        {
            get
            {
                decimal count = 0;

                foreach (ProductSale ps in ProductSale.Where(x => !x.IsDeleted))
                {
                    count += ps.ProductCount * ps.Product.MinCostForAgent;
                }

                //discount conditions
                if (count >= 0 && count < 10000)
                    return 0;
                if (count >= 10000 && count < 50000)
                    return 5;
                if (count >= 50000 && count < 150000)
                    return 10;
                if (count >= 150000 && count < 500000)
                    return 20;
                if (count >= 500000)
                    return 25;
                else
                    return 0;
            }
        }

        public string GetDiscountColor
        {
            get
            {
                return GetDiscount >= 25 ? Colors.LightGreen.ToString() : Colors.White.ToString();
            }
        }
    }
}
