Feature: ReportTests
Тесты в модуле Отчеты
	
	@BeforeReportTests
	Scenario: Экспорт отчета в формате Excel
		Given DriverManager. Открыть браузер
		And LoginPage. Войти в систему с номером телефона +78888888888. Пароль 123456
		And Explorer. Открыть вкладку Период модуля Каталог в дереве
		When ReportCard. Выгрузить отчет в формате Excel
		Then BaseCard. Появился хинт Формирования отчета
		And BaseCard. Появился хинт Отчета по выручке
		When ReportCard. Скачать отчет
		Then Проверить, что отчет скачался

	@BeforeReportTests
	Scenario: Экспорт отчета в формате CSV
	  Given DriverManager. Открыть браузер
		And LoginPage. Войти в систему с номером телефона +78888888888. Пароль 123456
		And Explorer. Открыть вкладку Период модуля Каталог в дереве
		When ReportCard. Выгрузить отчет в формате CSV
		Then BaseCard. Появился хинт Формирования отчета
		And BaseCard. Появился хинт Отчета по выручке
		When ReportCard. Скачать отчет
		Then Проверить, что отчет скачался

	@BeforeReportTests
	Scenario: Добавление единицы изменения
		Given DriverManager. Открыть браузер
		And LoginPage. Войти в систему с номером телефона +78888888888. Пароль 123456
		And Explorer. Открыть вкладку Ед. измерения модуля Каталог в дереве
		And DimensionCard. Добавить новую единицу измерения
		And DimensionDialog. Заполнить реквизиты
		When DimensionDialog. Нажать кнопку Добавить
		Then DimensionCard. Проверить, что новая единица измерения добавлена

