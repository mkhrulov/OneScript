﻿Перем юТест;

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт
	
	юТест = ЮнитТестирование;
	
	ВсеТесты = Новый Массив;
	
	ВсеТесты.Добавить("ТестДолжен_УбедитьсяЧтоВыводитсяВерсия");
	
	Возврат ВсеТесты;
КонецФункции

Функция ПутьОСкрипт()

	Возврат ОбъединитьПути(КаталогПрограммы(), "oscript.exe");

КонецФункции


Процедура ТестДолжен_УбедитьсяЧтоВыводитсяВерсия() Экспорт

	Перем Процесс;

	Процесс = СоздатьПроцесс(ПутьОСкрипт() + " -version", , Истина);
	Процесс.Запустить();
	Процесс.ОжидатьЗавершения();

	ДанныеВывода = Процесс.ПотокВывода.Прочитать();
	ДанныеВывода = СокрП(ДанныеВывода);

	СистемнаяИнформация = Новый СистемнаяИнформация;

	юТест.ПроверитьРавенство(ДанныеВывода, СистемнаяИнформация.Версия, "Версия вывода не совпадает с системной информацией!");

КонецПроцедуры


