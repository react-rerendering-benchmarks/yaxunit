//©///////////////////////////////////////////////////////////////////////////©//
//
//  Copyright 2021-2024 BIA-Technologies Limited Liability Company
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//©///////////////////////////////////////////////////////////////////////////©//

#Область СлужебныйПрограммныйИнтерфейс

// Проверяет существование ссылки в информационной базе
// 
// Параметры:
//  Ссылка - ЛюбаяСсылка
// 
// Возвращаемое значение:
//  Булево - Ссылка существует
Функция СсылкаСуществует(Знач Ссылка) Экспорт
	
	ИмяТаблицы = Ссылка.Метаданные().ПолноеИмя();
	
	ТекстЗапроса = СтрШаблон("ВЫБРАТЬ ПЕРВЫЕ 1 1 ИЗ %1 ГДЕ Ссылка = &Ссылка", ИмяТаблицы);
	Запрос = Новый Запрос(ТекстЗапроса);
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	
	Возврат НЕ Запрос.Выполнить().Пустой();
	
КонецФункции

// Создает полную "глубокую" копию значения
// 
// Параметры:
//  Значение -Произвольный
// 
// Возвращаемое значение:
//  Произвольный - Коипя значения
Функция СоздатьКопию(Знач Значение) Экспорт
	
	Возврат ЗначениеИзСтрокиВнутр(ЗначениеВСтрокуВнутр(Значение));
	
КонецФункции

Функция НовыйТовар(Знач Код = Неопределено) Экспорт
	
	Если Код = Неопределено Тогда
		Код = ЮТОбщий.ЧислоВСтроку(ЮТест.Данные().СлучайноеПоложительноеЧисло(999999999));
	КонецЕсли;
	
	Возврат ЮТест.Данные().КонструкторОбъекта("Справочники.Товары")
		.Установить("Наименование", Код)
		.Установить("Код", Код)
		.Записать();
	
КонецФункции

Процедура УстановитьРеквизит(Ссылка, ИмяРеквизита, ЗначениеРеквизита) Экспорт
	
	Объект = Ссылка.ПолучитьОбъект();
	Объект[ИмяРеквизита] = ЗначениеРеквизита;
	Объект.Записать();
	
КонецПроцедуры

Функция ТестовыеДанныеДляОписаниеОбъектаМетаданных(ДляСервера) Экспорт
	
	Данные = Новый Массив();
	
	Вид = "Справочник";
	
	Для Каждого Справочник Из Метаданные.Справочники Цикл
		
		Данные.Добавить(Справочник.ПолноеИмя());
		Данные.Добавить(Тип(СтрШаблон("%1Ссылка.%2", Вид, Справочник.Имя)));
		Данные.Добавить(Новый(СтрШаблон("%1Ссылка.%2", Вид, Справочник.Имя)));
		
		Если ДляСервера Тогда
			Данные.Добавить(Справочник);
			Данные.Добавить(Новый(СтрШаблон("%1Менеджер.%2", Вид, Справочник.Имя)));
			Данные.Добавить(Новый(СтрШаблон("%1Объект.%2", Вид, Справочник.Имя)));
			Данные.Добавить(Тип(СтрШаблон("%1Объект.%2", Вид, Справочник.Имя)));
			Данные.Добавить(Тип(СтрШаблон("%1Менеджер.%2", Вид, Справочник.Имя)));
		КонецЕсли;
		
	КонецЦикла;
	
	Количество = Данные.Количество();
	Для Инд = 0 По Количество - 1 Цикл
		Данные.Добавить(Данные[Инд]);
		Данные.Добавить(Данные[Инд]);
		Данные.Добавить(Данные[Инд]);
	КонецЦикла;
	
	Возврат Данные;
	
КонецФункции

Процедура ИнициализироватьПредопределенные() Экспорт
	
	ИнициализироватьПредопределенныеДанные();
	
КонецПроцедуры

Процедура ПервичнаяНастройка() Экспорт
	
	ИнициализироватьПредопределенныеДанные();
	ОбновитьНумерациюОбъектов();
	
КонецПроцедуры

#КонецОбласти
