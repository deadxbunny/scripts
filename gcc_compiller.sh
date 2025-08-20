#!/bin/bash
# Для компиляции файла по требуемым стандартам
gcc -std=c11 -Wall -Werror -Wextra $1

# Форматирование кода по стандарту
clang-format -i $1

# Проверка на memory leak
cppcheck --enable=all --suppress=missingIncludeSystem $1