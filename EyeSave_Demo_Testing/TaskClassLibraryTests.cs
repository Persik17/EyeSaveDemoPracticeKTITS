using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using EyeSave_Demo;
using System.Linq;

namespace EyeSave_Demo_Testing
{
    [TestClass]
    public class TaskClassLibraryTests
    {
        [TestMethod]
        public void Email_Check_1SpecialSymbol()
        {
            string a = "qwerty@mail.ru";
            int expected = 1;

            int actual = a.Where(x => x == '@').Count();

            Assert.AreEqual(expected, actual);
        }

        [TestMethod]
        public void Priority_Check_OnlyDigits()
        {
            string a = "123";
            bool expected = true;
            bool actual;

            try
            {
                int.Parse(a);

                actual = true;
            }
            catch (Exception)
            {
                actual = false;
            }

            Assert.AreEqual(expected, actual);
        }
    }
}
