# Калькулятор для преобразования математических выражений в обратную польскую запись (ОПЗ)

**Обратная польская запись** — форма записи математических и логических выражений, в которой операнды расположены перед знаками операций. 

**Моя реализация** - это  простой калькулятор, написанный на Ruby с использованием библиотеки Tk для создания графического пользовательского интерфейса. Калькулятор может принимать математические выражения и переводить их в ОПЗ.


<div align="center">
  <div style="display: inline-block; text-align: center; margin-right: 20px;">
    <p><em>Первоначальное выражение:</em></p>
    <img src="https://github.com/SabinaGamidova/ReversePolishNotation/assets/89641296/aee2bf62-8f5e-44a7-bcf9-e06362f64b3b" width="400" />
  </div>
  <div style="display: inline-block; text-align: center;">
    <br><br><br>
    <p><em>ОПЗ выражения:</em></p>
    <img src="https://github.com/SabinaGamidova/ReversePolishNotation/assets/89641296/8e3ff8d3-7438-44cd-9226-a9e35d3241e2" width="400" />
  </div>
</div>


# Особенности
1. Калькулятор поддерживает следующие операции: сложение (+), вычитание (-), умножение (*), деление (/), возведение в степень (^).
2. Ввод чисел и операторов происходит с помощью кнопок на экранной клавиатуре.
3. Кнопка "DEL" позволяет удалять последний введенный символ.
4. Кнопка "CLR" очищает весь ввод.
5. Кнопка "=" выполняет вычисления в ОПЗ.
6. Максимальная длина вводимого выражения ограничена для избегания переполнения.

# Установка и запуск

1. Убедитесь, что у вас установлен Ruby.

2. Установите библиотеку Tk, выполнив следующую команду:

```bash
gem install tk
```

3. Склонируйте репозиторий или загрузите исходный код в виде ZIP-архива на свое устройство.

4. Запустите приложение без предварительных данных с помощью следующей команды:

```bash
ruby gui.rb
```

После этого должно открыться окно калькулятора.

5. Вы также можете запустить калькулятор с предварительными данными, передав их как аргумент командной строки, например:

```bash
ruby gui.rb "2+1*4"
```

Это позволит вам начать работу с калькулятором, уже имея введенное выражение.

# Модуль CalcLogic
В коде калькулятора используется модуль **CalcLogic**, который содержит логику для преобразования выражения в ОПЗ. Вот функции данного модуля:

1. **convert_to_rpn(expression):** данный метод принимает выражение в виде строки и возвращает его эквивалент в ОПЗ.
2. **compare_and_return_necessary_key(first_pair, second_pair):** данный метод сравнивает операторы и возвращает оператор с более высоким приоритетом.

# Структура проекта
* **"rpn.rb:"** модуль с логикой калькулятора.
* **"gui.rb:"** основной файл, который запускает калькулятор и создает графический интерфейс.

# Завершение
Надеюсь, вам понравится моя реализация ОПЗ калькулятора!
<br>
<br>

---
<br>

# RPN Calculator

**Reverse Polish notation (RPN)** is a mathematical notation in which operators follow their operands.

**My realisation** is a simple calculator application built using Ruby and the Tk library for creating a graphical user interface. The calculator can take mathematical expressions and convert them into RPN.


<div align="center">
  <div style="display: inline-block; text-align: center; margin-right: 20px;">
    <p><em>Initial expression:</em></p>
    <img src="https://github.com/SabinaGamidova/ReversePolishNotation/assets/89641296/aee2bf62-8f5e-44a7-bcf9-e06362f64b3b" width="400" />
  </div>
  <div style="display: inline-block; text-align: center;">
    <br><br><br>
    <p><em>RPN expression:</em></p>
    <img src="https://github.com/SabinaGamidova/ReversePolishNotation/assets/89641296/8e3ff8d3-7438-44cd-9226-a9e35d3241e2" width="400" />
  </div>
</div>


# Features
1. The calculator supports the following operations: addition (+), subtraction (-), multiplication (*), division (/), exponentiation (^).
2. Numbers and operators can be input using on-screen keyboard buttons.
3. The "DEL" button allows you to delete the last entered character.
4. The "CLR" button clears the entire input.
5. The "=" button performs calculations in Reverse Polish Notation (RPN).
6. The maximum length of input expression is limited to avoid overflow.

# Installation and Usage

1. Ensure that you have Ruby installed on your device.

2. Install the Tk library by running the following command:

```bash
gem install tk
```

3. Clone the repository or download the source code as a ZIP archive to your device.

4. Run the application without any initial data using the following command:

```bash
ruby gui.rb
```

After this, the calculator window should open.

5. You can also run the calculator with initial data by passing it as a command line argument, like this:

```bash
ruby gui.rb "2+1*4"
```

This will allow you to start working with the calculator already having the expression entered.

# CalcLogic Module
The calculator code uses the **CalcLogic** module, which contains the logic to convert an expression to an RPN. Here are the functions of this module:

1. **convert_to_rpn(expression):** this method takes an expression as a string and returns its equivalent in RPN.
2. **compare_and_return_necessary_key(first_pair, second_pair):** this method compares operators and returns the operator with higher priority.

# Project structure
* **"rpn.rb:"** module with calculator logic.
* **"gui.rb:"** main file that runs the calculator and creates the GUI.

# Conclusion
I hope you enjoy my realisation of "RPN calculator"!
