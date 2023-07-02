Feature: RecoverPasswordTests
Тесты на восстановление пароля

    @BeforeRecoverPassword
    Scenario: Восстановление пароля пользователя
      Given DriverManager. Открыть браузер
      And LoginPage. Восстановить пароль
      And RecoverPasswordPage. Ввести номер телефона
      When RecoverPasswordPage. Отправить код
      Then RecoverPasswordPage. Появился хинт с сообщением Код успешно отправлен
      And RecoverPasswordPage. Ввести код из SMS
      When RecoverPasswordPage. Нажать на кнопку продолжить
      Then MainPage. Пользователь вошёл в систему 

    @BeforeRecoverPassword
    Scenario: Валидация полей страницы восстановления пароля
      Given DriverManager. Открыть браузер
      And LoginPage. Восстановить пароль
      When RecoverPasswordPage. Выделить поле Номер телефона
      And RecoverPasswordPage. Переключить фокус
      Then RecoverPasswordPage. Поле Номер телефона выделено красным и является обязательным для заполнения
      When RecoverPasswordPage. Ввести несуществующий номер телефона
      Then RecoverPasswordPage. Полее Номер телефона выделено красным. Номер не зарегистрирован
      When RecoverPasswordPage. Выделить поле Код из SMS
      And RecoverPasswordPage. Переключить фокус
      Then RecoverPasswordPage. Поле Код из SMS выделено красным и является обязательным для заполнения