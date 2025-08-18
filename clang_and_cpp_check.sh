#!/bin/bash

echo -e "Введите имя файла для проверки через clang-format"
read file
clang-format -n $file

echo -e "Сделать автоформатирование? [Y/N]"
read -r user_choise
if [ "${user_choise^^}" = "Y" ]
then
    echo "Форматирую...ОК"
    clang-format -i $file
elif [ "${user_choise^^}" = "N" ]
then
    echo "Продолжаем..."
else
    echo "Не понимаю...идем дальше"
fi

echo -e "Провести проверку файла через cppcheck? [Y/N]"
read -r user_choise2
if [ "${user_choise2^^}" = "Y" ]
then
    echo "Проверяю..."
    cppcheck --enable=all --suppress=missingIncludeSystem $file
elif [ "${user_choise2^^}" = "N" ]
then
    echo "Пока!"
fi
exit 0