Feature: CatalogTestsFeature
Тесты в модуле Каталог

	@BeforeCatalogTests
	Scenario: Проверка записи об успешности экспорта файла
		Given DriverManager. Открыть браузер
		And LoginPage. Войти в систему с номером телефона +78888888888. Пароль 123456
		And Explorer. Открыть вкладку Экспорт модуля Каталог в дереве
		When CatalogExportCard. Открыть запись
		Then ModalDialog. Появился диалог Экспорта
		And ExportModalDialog. Сообщение в диалоге Каталог успешно экспортирован
		And ModalDialog. Закрыть диалог

	@BeforeCatalogTests
	Scenario: Проверить запись об успешности импорта файла
		Given DriverManager. Открыть браузер
		And LoginPage. Войти в систему с номером телефона +78888888888. Пароль 123456
		And Explorer. Открыть вкладку Импорт модуля Каталог в дереве
		When CatalogExportCard. Открыть запись
		Then ModalDialog. Появился диалог Импорта
		And ImportModalDialog. Сообщение в диалоге Файл успешно импортирован
		And ModalDialog. Закрыть диалог

	@BeforeCatalogTests
	Scenario: Проверить запись о неудачно попытки импорта файла
		Given DriverManager. Открыть браузер
		And LoginPage. Войти в систему с номером телефона +78888888888. Пароль 123456
		And Explorer. Открыть вкладку Импорт модуля Каталог в дереве
		When CatalogExportCard. Открыть запись
		Then ModalDialog. Появился диалог Импорта
		And ImportModalDialog. Сообщение в диалоге Не удалось импортировать файл
		And ImportModalDialog. Проверить сообщения с ошибками
		And ModalDialog. Закрыть диалог