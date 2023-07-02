using OpenQA.Selenium;
using Web.LifePos.Tests.Core;

namespace Web.LifePos.Tests.Pages
{
	public class LoginPage
	{
		#region Поля и свойства

		private IWebDriver driver = DriversManager.Current;

		public By titleLocator = By.CssSelector(".title");


		#endregion


		#region Методы

		public bool CheckHelloNotice(string incText)
		{
			var text = driver.FindElement(titleLocator).Text;
			return text.Contains(incText);
		}

		#endregion

	}
}
