#!/bin/bash

echo ""
echo "Что вы хотите сделать?"
echo "1 Сделать запись"
echo "2 Открыть список всех записей"
echo "3 Открыть корзину"
echo "4 Закончить работу"
echo "Введите соответствующую цифру (1 2 3 4)"
read comand

if [ "$comand" == "1" ]; then
	nano $HOME/$DIARYFILE/diary.txt
	echo ""
	echo ""
	echo "Введите 'save' чтобы сохранить запись"
	echo "Введите 'delete' чтобы удалить запись"
	read ans

	while [  $ans != save -a $ans != delete ]; do
		echo ""
		echo "Команда не распознана. Введите save или delete"
		echo ""
		read ans
	done

	if [ "$ans" == "save" ]; then

		cat $HOME/$DIARYFILE/newsms.txt >> $HOME/$DIARYFILE/alldiary.txt
		cat $HOME/$DIARYFILE/diary.txt >> $HOME/$DIARYFILE/alldiary.txt
		rm $HOME/$DIARYFILE/diary.txt
		touch diary.txt
		echo "Запись сохранена успешно!"
		./mainscript.sh
	elif [ "$ans" == "delete" ]; then
		cat $HOME/$DIARYFILE/newsms.txt >> $HOME/$DIARYFILE/basket.txt
                cat $HOME/$DIARYFILE/diary.txt >> $HOME/$DIARYFILE/basket.txt
                rm $HOME/$DIARYFILE/diary.txt
		touch diary.txt
		echo "Запись удалена успешно!"
		./mainscript.sh
	fi

elif [ "$comand" == "2" ]; then
	nano alldiary.txt
	./mainscript.sh
elif [ "$comand" == "3" ]; then
	nano basket.txt
	./mainscript.sh
elif [ "$comand" == "4" ]; then
	echo "Работа завершена"
else echo "Команда не распознана. Повторите попытку и введите цифру от 1 до 4"
     ./mainscript.sh
fi
