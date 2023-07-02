using FluentAssertions;
using TechTalk.SpecFlow;
using Web.LifePos.Tests.Pages;

namespace Web.LifePos.Tests.SpecflowSteps
{
	[Binding]
	public class LoginPageSteps : WebSteps
	{
		[Then("LoginPage. Проверить (дневное|ночное|вечернее|утреннее) приветствие на экране")]
		public void OpenLoginPage(string period)
		{
			var loginPage = new LoginPage();
			var titles = scContext.Get<List<string>>(Context.Title);

			loginPage.CheckHelloNotice(titles[0]).Should().BeTrue("Приветствие на экране соответствет временному периоду.");
			titles.RemoveAt(0);
			scContext[Context.Title] = titles;
		}

		public class Context
		{
			public const string Title = "Title";
		}

		public LoginPageSteps(ScenarioContext scContext) : base(scContext) { }
	}
}
