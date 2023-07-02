using Allure.Commons;
using TechTalk.SpecFlow;
using Web.LifePos.Tests.Core;

namespace Web.LifePos.Tests.GeneralHooks
{
	[Binding]
	public class Hooks : WebSteps
	{
		public static AllureLifecycle allure = AllureLifecycle.Instance;

		[BeforeTestRun]
		public static void BeforeTestRun()
		{
			allure.CleanupResultDirectory();
		}

		[AfterTestRun]
		public static void AfterTestRun()
		{
			DriversManager.Current.Quit();
		}


		public Hooks(ScenarioContext scContext) : base(scContext) { }
	}
}
