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

Процедура ИсполняемыеСценарии() Экспорт
	
	ЮТТесты.Тег("ТестовыеДанные")
		.ДобавитьТест("Установить")
		.ДобавитьТест("УстановитьРеквизиты")
		.ДобавитьТест("Фикция")
		.ДобавитьТест("ФикцияОбязательныхПолей")
		.ДобавитьТест("ФикцияНезаполненных")
		.ДобавитьТест("ДобавитьНовый")
		.ДобавитьТест("ПерейтиКВладельцу")
		.ДобавитьТест("ФикцияРеквизитов")
	;
	
КонецПроцедуры

Процедура Установить() Экспорт
	
	Номер = ЮТест.Данные().СлучайнаяСтрока(9);
	Сумма = ЮТест.Данные().СлучайноеЧисло();
	Покупатель = ЮТест.Данные().СоздатьЭлемент(Справочники.Контрагенты);
	
	Объект = НовыйКонструктор()
		.Установить("Number", Номер)
		.Установить("Сумма", Сумма)
		.Установить("Покупатель", Покупатель)
		.ДанныеОбъекта();
	
	ЮТест.ОжидаетЧто(Объект)
		.ИмеетТип(Тип("ОбъектXDTO"))
		.Свойство("Number").Равно(Номер)
		.Свойство("Сумма").Равно(Сумма)
		.Свойство("Покупатель").Равно(Покупатель)
	;
	
КонецПроцедуры

Процедура УстановитьРеквизиты() Экспорт
	
	Номер = ЮТест.Данные().СлучайнаяСтрока(9);
	Сумма = ЮТест.Данные().СлучайноеЧисло();
	Реквизиты = Новый Структура("Number, Сумма", Номер, Сумма);
	
	Объект = НовыйКонструктор()
		.УстановитьРеквизиты(Реквизиты)
		.ДанныеОбъекта();
	
	ЮТест.ОжидаетЧто(Объект)
		.ИмеетТип(Тип("ОбъектXDTO"))
		.Свойство("Number").Равно(Номер)
		.Свойство("Сумма").Равно(Сумма);
	
КонецПроцедуры

Процедура Фикция() Экспорт
	
	Объект = НовыйКонструктор()
		.Фикция("Number")
		.Фикция("Сумма")
		.Фикция("Покупатель")
		.ДанныеОбъекта();
	
	ЮТест.ОжидаетЧто(Объект)
		.ИмеетТип(Тип("ОбъектXDTO"))
		.Свойство("Number").Заполнено()
		.Свойство("Сумма").Заполнено()
		.Свойство("Покупатель").Заполнено()
	;
	
КонецПроцедуры

Процедура ФикцияОбязательныхПолей() Экспорт
	
	Дата = ЮТест.Данные().СлучайнаяДата();
	
	Объект = НовыйКонструктор()
		.Установить("Date", Дата)
		.ФикцияОбязательныхПолей()
		.ДанныеОбъекта();
	
	ЮТест.ОжидаетЧто(Объект)
		.ИмеетТип(Тип("ОбъектXDTO"))
		.Свойство("Number").Заполнено()
		.Свойство("Date").Равно(Дата)
		.Свойство("Сумма").Заполнено()
		.Свойство("Покупатель").Заполнено()
		.Свойство("Товары").Заполнено()
	;
	
КонецПроцедуры

Процедура ФикцияНезаполненных() Экспорт
	
	Дата = ЮТест.Данные().СлучайнаяДата();
	
	Объект = НовыйКонструктор()
		.Установить("Date", Дата)
		.ФикцияНезаполненных()
		.ДанныеОбъекта();
	
	ЮТест.ОжидаетЧто(Объект)
		.ИмеетТип(Тип("ОбъектXDTO"))
		.Свойство("Number").Заполнено()
		.Свойство("Date").Равно(Дата)
		.Свойство("Сумма").Заполнено()
		.Свойство("Покупатель").Заполнено()
		.Свойство("Товары").Заполнено()
	;
	
КонецПроцедуры

Процедура ДобавитьНовый() Экспорт
	
	Объект = НовыйКонструктор()
		.ДобавитьНовый("Товары")
			.Фикция("Цена")
			.Фикция("Количество")
			.ПерейтиКВладельцу()
		.ДобавитьНовый("Товары")
			.Фикция("Цена")
			.Фикция("Количество")
		.ДанныеОбъекта();
	
	ЮТест.ОжидаетЧто(Объект)
		.ИмеетТип(Тип("ОбъектXDTO"))
		.Свойство("Товары").ИмеетДлину(2)
		.Свойство("Товары[0].Цена").Заполнено()
		.Свойство("Товары[0].Сумма").НеЗаполнено();
	
КонецПроцедуры

Процедура ПерейтиКВладельцу() Экспорт
	
	Объект = НовыйКонструктор()
		.ДобавитьНовый("Товары")
			.ПерейтиКВладельцу()
		.Фикция("Сумма")
		.ДанныеОбъекта();
	
	ЮТест.ОжидаетЧто(Объект)
		.ИмеетТип(Тип("ОбъектXDTO"))
		.Свойство("Товары").ИмеетДлину(1)
		.Свойство("Товары[0].Сумма").НеЗаполнено()
		.Свойство("Сумма").Заполнено()
	;
	
КонецПроцедуры

Процедура ФикцияРеквизитов() Экспорт
	
	Объект = НовыйКонструктор()
		.ФикцияРеквизитов("Number, Сумма, Покупатель")
		.ДанныеОбъекта();
	
	ЮТест.ОжидаетЧто(Объект)
		.ИмеетТип(Тип("ОбъектXDTO"))
		.Свойство("Number").Заполнено()
		.Свойство("Сумма").Заполнено()
		.Свойство("Покупатель").Заполнено()
	;
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция НовыйКонструктор()
	
	Тип = СериализаторXDTO.XMLТип(Тип("ДокументОбъект.Заказ"));
	
	Возврат ЮТест.Данные().КонструкторОбъектаXDTO(Тип.ИмяТипа, Тип.URIПространстваИмен);
	
КонецФункции

#КонецОбласти
