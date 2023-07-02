using TechTalk.SpecFlow;
using Web.LifePos.Tests.Core;

namespace Web.LifePos.Tests.Steps
{
	[Binding]
	public class DriverConfigurationSteps : WebSteps
	{
		[StepDefinition("DriverManager. Открыть браузер")]
		public void SetDriverConfiguration()
		{
			DriversManager.Current.Manage().Window.Maximize();
			DriversManager.Current.Url = "https://my.life-pos.ru/auth/login";
		}

		[StepDefinition("DriverManager. Сменить время клиента на (.*)")]
		public void ChangeClientTime(string period)
		{
			//Из-за неточности пиковых временных зон в критические часы (смена утра на день и т.д.) - возможна некорректная проверка.
			TimeSpan dayPoint = new TimeSpan(12, 0, 0);
			TimeSpan eveningPoint = new TimeSpan(18, 0, 0);
			TimeSpan nightPoint = new TimeSpan(0, 0, 0);
			TimeSpan morningPoint = new TimeSpan(6, 0, 0);
			var now = DateTime.Now.TimeOfDay;

			string realEvening = string.Empty;
			string realMorning = string.Empty;
			string realDay = string.Empty;
			string realNight = string.Empty;
			
			if (now >= nightPoint && now < morningPoint)
			{
				//Ночь
				realNight = "Europe/Moscow";
				realMorning = "Asia/Tokyo";
				realEvening = "America/Argentina/Buenos_Aires";
				realDay = "America/Adak";
			}
			else if (now >= morningPoint && now < dayPoint)
			{
				//Утро
				realMorning = "Europe/Moscow";
				realDay = "Asia/Tokyo";
				realEvening = "America/Adak";
				realNight = "America/Argentina/Buenos_Aires";
			}
			else if (now >= dayPoint && now < eveningPoint)
			{
				//День
				realDay = "Europe/Moscow";
				realEvening = "Asia/Tokyo";
				realMorning = "America/Argentina/Buenos_Aires";
				realNight = "America/Adak";
			}
			else if (now >= eveningPoint)
			{
				//Вечер
				realEvening = "Europe/Moscow";
				realDay = "America/Argentina/Buenos_Aires";
				realMorning = "America/Adak";
				realNight = "Asia/Tokyo";
			}

			switch (period)
			{
				case "дневное":
					DriversManager.ChangeTimeZone(realDay);
					break;

				case "вечернее":
					DriversManager.ChangeTimeZone(realEvening);
					break;

				case "утреннее":
					DriversManager.ChangeTimeZone(realMorning);
					break;

				case "ночное":
					DriversManager.ChangeTimeZone(realNight);
					break;

				default:
					throw new Exception("Временного периода не существует.");
			}
			DriversManager.Current.Navigate().Refresh();
		}

		public DriverConfigurationSteps(ScenarioContext scContext) : base(scContext) { }
	}
}
