using TechTalk.SpecFlow;
using Web.LifePos.Tests.SpecflowSteps;

namespace Web.LifePos.Tests.Hooks
{
	[Binding]
	public class Hooks : WebSteps
	{
		[BeforeScenario("BeforeПроверкаОтображенияПриветствияНаГлавнойСтранице")]
		public void BeforeCheckVisionTitleOnLoginPage()
		{
			var messages = new List<string>()
			{
				"Добрый день!",
				"Добрый вечер!",
				"Доброе утро!",
				"Доброй ночи!"
			};

			scContext[LoginPageSteps.Context.Title] = messages;
		}

		public Hooks(ScenarioContext scContext) : base(scContext) { }
	}
}
