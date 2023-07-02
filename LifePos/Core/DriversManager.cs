using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;

namespace Web.LifePos.Tests.Core
{
	public class DriversManager
	{
		private static ChromeDriver _current;

		public static WebDriver Current => _current ?? (_current = new ChromeDriver());

		public static void ChangeTimeZone(string timeZoneName)
		{
			var timeZone = new Dictionary<string, object>();
			timeZone.Add("timezoneId", timeZoneName);
			((ChromeDriver)Current).ExecuteCdpCommand("Emulation.setTimezoneOverride", timeZone);
		}
	}
}
