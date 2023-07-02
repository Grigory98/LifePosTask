Feature: RegistrationTests
Тесты на регистрацию пользователей

	  @BeforeRegisterWithCorrectFields
    @BeforeRegistrationTests
    Scenario: Регистрация пользователя
      Given DriverManager. Открыть браузер
      And RegistrationPage. Заполнить поля регистрации
      When RegistrationPage. Нажать на кнопку Отправить код
      Then RegistrationPage. Появился таймер повторной отправки кода
      When RegistrationPage. Создать личный кабинет
      Then MainPage. Создан личный кабинет

    @BeforeRegistrationTests
    Scenario: Валидация полей регистрации пользователя
      Given DriverManager. Открыть браузер
      When RegistrationPage. Выделить поле Имя и Фамилия
      And RegistrationPage. Переключить фокус
      Then RegistrationPage. Поле Имя и Фамилия выделеном красным и является обязательным для заполнения
      When RegistrationPage. Выделить поле Пароль
      And RegistrationPage. Переключить фокус
      Then RegistrationPage. Поле Пароль выделено красным и является обязательным для заполнения
      When RegistrationPage. Выделить поле Код из SMS
      And RegistrationPage. Переключить фокус
      Then RegistrationPage. Поле Код из SMS выделено красным и является обязательным для заполнения
      When RegistrationPage. Выделить поле Номер телефона
      And RegistrationPage. Переключить фокус
      Then RegistrationPage. Поле Номер телефона выделено красным и является обязательным для заполнения
      And RegistrationPage. Кнопка создания личного документа не доступна