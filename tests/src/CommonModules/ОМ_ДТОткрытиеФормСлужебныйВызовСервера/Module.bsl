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
	
	ЮТТесты
		.ДобавитьТест("ТипыТестов")
		.ДобавитьТест("ТипыТестов_ТипыФорм")
		.ДобавитьТест("ТипыТестов_Исключения")
	;
	
КонецПроцедуры

Процедура ПослеКаждогоТеста() Экспорт
	
	КлиентскиеПараметрыЗапуска = ЮТКонтекстСлужебный.ПараметрыЗапуска();
	ЮТКонтекстСлужебныйВызовСервера.УстановитьЗначениеКонтекста("КонтекстПараметрыЗапуска", КлиентскиеПараметрыЗапуска);
	
КонецПроцедуры

Процедура ТипыТестов() Экспорт
	
	ПараметрыЗапуска = ПараметрыЗапуска();
	УстановитьПараметрыДымовыхТестов(ПараметрыЗапуска);
	
	ДеревоТестов = ДТОткрытиеФормСлужебныйВызовСервера.ТипыТестов();
	
	ЮТест.ОжидаетЧто(ДеревоТестов)
		.Заполнено()
		.Содержит(ЮТест.Предикат().Реквизит("ИмяКоллекции").Равно("Справочники"))
		.Содержит(ЮТест.Предикат().Реквизит("ИмяКоллекции").Равно("Документы"))
		.Содержит(ЮТест.Предикат().Реквизит("ИмяКоллекции").Равно("ПланыВидовХарактеристик"))
		.Содержит(ЮТест.Предикат().Реквизит("ИмяКоллекции").Равно("ПланыСчетов"))
//		.Содержит(ЮТест.Предикат().Реквизит("ИмяКоллекции").Равно("ПланыВидовРасчета"))
		.Содержит(ЮТест.Предикат().Реквизит("ИмяКоллекции").Равно("ПланыОбмена"))
//		.Содержит(ЮТест.Предикат().Реквизит("ИмяКоллекции").Равно("БизнесПроцессы"))
//		.Содержит(ЮТест.Предикат().Реквизит("ИмяКоллекции").Равно("Задачи"))
		.Содержит(ЮТест.Предикат().Реквизит("ИмяКоллекции").Равно("РегистрыСведений"))
		.Содержит(ЮТест.Предикат().Реквизит("ИмяКоллекции").Равно("РегистрыНакопления"))
		.Содержит(ЮТест.Предикат().Реквизит("ИмяКоллекции").Равно("РегистрыБухгалтерии"))
//		.Содержит(ЮТест.Предикат().Реквизит("ИмяКоллекции").Равно("РегистрыРасчета"))
//		.Содержит(ЮТест.Предикат().Реквизит("ИмяКоллекции").Равно("Перечисления"))
		.Содержит(ЮТест.Предикат().Реквизит("ИмяКоллекции").Равно("Отчеты"))
		.Содержит(ЮТест.Предикат().Реквизит("ИмяКоллекции").Равно("Обработки"))
//		.Содержит(ЮТест.Предикат().Реквизит("ИмяКоллекции").Равно("ЖурналыДокументов"))
		.ИмеетДлину(10)
	;
	
	ТестыСправочников = ДеревоТестов[0];
	
	ЮТест.ОжидаетЧто(ТестыСправочников.Объекты, "Справочники.")
		.Заполнено()
		.Свойство("[0].Имя").Равно("Банки")
		.Свойство("[0].ТипыТестов")
			.Содержит("Новый")
			.Содержит("Существующий")
	.Объект()
		.НеСодержит(ЮТест.Предикат().Реквизит("Имя").Равно("ВидыЦен"))
		.Свойство("[2].Имя").Равно("Встречи")
		.Свойство("[2].ТипыТестов")
			.Содержит("Список")
			.Содержит("Выбор", "Форма списка указана как форма выбора")
			.ИмеетДлину(4)
		.Свойство("[3].Имя").Равно("ВходящиеПисьма")
		.Свойство("[3].ТипыТестов")
			.Содержит("Список")
			.НеСодержит("Выбор", "Нет формы выбора")
			.ИмеетДлину(3)
		.Свойство("[5].Имя").Равно("Контрагенты")
		.Свойство("[5].ТипыТестов")
			.Содержит("НоваяГруппа")
			.Содержит("СуществующаяГруппа")
			.Содержит("СкопированнаяГруппа")
			.НеСодержит("ВыборГруппы")
			.ИмеетДлину(8)
	;
#Если ТолстыйКлиентОбычноеПриложение Или ТолстыйКлиентУправляемоеПриложение Тогда
	ЮТест.ОжидаетЧто(ТестыСправочников.Объекты[0].ТипыТестов, "Не включены обычные формы")
		.Содержит("Список")
		.Содержит("Выбор")
		.ИмеетДлину(4);
#Иначе
	ЮТест.ОжидаетЧто(ТестыСправочников.Объекты[0].ТипыТестов, "Не исключены обычные формы в тонком клиенте")
		.ИмеетДлину(2);
#КонецЕсли
	ТестыДокументов = ДеревоТестов[1];
	ЮТест.ОжидаетЧто(ТестыДокументов.Объекты, "Документы.")
		.Заполнено()
		.Свойство("[0].Имя").Равно("Заказ")
		.Свойство("[0].ТипыТестов")
			.Содержит("Существующий")
			.Содержит("Скопированный")
			.Содержит("Список")
			.НеСодержит("Новый")
			.ИмеетДлину(3)
	.Объект()
		.НеСодержит(ЮТест.Предикат().Реквизит("Имя").Равно("ОперацияПоУчетуТоваров"))
	.Объект()
		.НеСодержит(ЮТест.Предикат().Реквизит("Имя").Равно("ПоступлениеДенег"))
	.Объект()
		.НеСодержит(ЮТест.Предикат().Реквизит("Имя").Равно("РасходТовара"))
		.Свойство("[1].Имя").Равно("Оплата")
		.Свойство("[1].ТипыТестов")
			.Содержит("Список")
			.ИмеетДлину(1)
		.Свойство("[2].Имя").Равно("ПриходТовара")
		.Свойство("[2].ТипыТестов")
			.Содержит("Список")
			.ИмеетДлину(1)
	;
КонецПроцедуры

Процедура ТипыТестов_ТипыФорм() Экспорт
	
	// Глобально
	БазоваяНастройка = БазоваяНастройка();
	БазоваяНастройка.ДымовыеТесты.ОткрытиеФорм.Вставить("УправляемыеФормы", Ложь);
	УстановитьПараметрыДымовыхТестов(БазоваяНастройка);
	
	ДеревоТестов = ДТОткрытиеФормСлужебныйВызовСервера.ТипыТестов();
	
	Если НЕ ЮТест.Окружение().ТолстыйКлиент Тогда
		ЮТест.ОжидаетЧто(ДеревоТестов, "Глобальная настройка (Тонкий клиент)")
			.НеЗаполнено();
	Иначе
		Утверждение = ЮТест.ОжидаетЧто(ДеревоТестов, "Глобальная настройка (Толстый клиент)")
			.Заполнено()
			.ИмеетДлину(1)
			.Свойство("[0].ИмяКоллекции").Равно("Справочники")
			.Свойство("[0].Объекты").ИмеетДлину(1)
			.Свойство("[0].Объекты[0].Имя").Равно("Банки");
#Если ТолстыйКлиентОбычноеПриложение Тогда
	Утверждение
		.Свойство("[0].Объекты[0].ТипыТестов").ИмеетДлину(5);
#Иначе
	Утверждение
		.Свойство("[0].Объекты[0].ТипыТестов").ИмеетДлину(2);
#КонецЕсли
	КонецЕсли;
	// Для коллекции метаданных
	БазоваяНастройка = БазоваяНастройка();
	БазоваяНастройка.ДымовыеТесты.ОткрытиеФорм.Вставить("Документы", Новый Структура("УправляемыеФормы", Ложь));
	УстановитьПараметрыДымовыхТестов(БазоваяНастройка);
	
	ДеревоТестов = ДТОткрытиеФормСлужебныйВызовСервера.ТипыТестов();
	
	ЮТест.ОжидаетЧто(ДеревоТестов, "Настройка для коллекции метаданных")
		.Заполнено()
		.Содержит(ЮТест.Предикат().Реквизит("ИмяКоллекции").Равно("Справочники"))
		.НеСодержит(ЮТест.Предикат().Реквизит("ИмяКоллекции").Равно("Документы"))
	;
	
	// Для объекта метаданных
	БазоваяНастройка = БазоваяНастройка();
	БазоваяНастройка.ДымовыеТесты.ОткрытиеФорм.Вставить("Справочники", Новый Структура("Банки", Новый Структура("УправляемыеФормы", Ложь)));
	УстановитьПараметрыДымовыхТестов(БазоваяНастройка);
	
	ДеревоТестов = ДТОткрытиеФормСлужебныйВызовСервера.ТипыТестов();
	
	Утверждение = ЮТест.ОжидаетЧто(ДеревоТестов, "Настройка для объекта метаданных")
		.Заполнено()
		.Содержит(ЮТест.Предикат().Реквизит("ИмяКоллекции").Равно("Справочники"))
		.Свойство("[0].Объекты");
	Утверждение.Содержит(ЮТест.Предикат().Реквизит("Имя").Равно("Валюты"));
#Если ТонкийКлиент Тогда
	Утверждение.НеСодержит(ЮТест.Предикат().Реквизит("Имя").Равно("Банки"));
#КонецЕсли
	// Для переопределение настройки
	БазоваяНастройка = БазоваяНастройка();
	БазоваяНастройка.ДымовыеТесты.ОткрытиеФорм.Вставить("УправляемыеФормы", Ложь);
	БазоваяНастройка.ДымовыеТесты.ОткрытиеФорм.Вставить("Справочники", Новый Структура("Банки", Новый Структура("УправляемыеФормы", Истина)));
	УстановитьПараметрыДымовыхТестов(БазоваяНастройка);
	
	ДеревоТестов = ДТОткрытиеФормСлужебныйВызовСервера.ТипыТестов();
	
	ЮТест.ОжидаетЧто(ДеревоТестов, "Переопределение настройки")
		.Заполнено()
		.ИмеетДлину(1)
		.Содержит(ЮТест.Предикат().Реквизит("ИмяКоллекции").Равно("Справочники"))
		.Свойство("[0].Объекты")
			.Содержит(ЮТест.Предикат().Реквизит("Имя").Равно("Банки"))
			.ИмеетДлину(1)
	;
	
КонецПроцедуры

Процедура ТипыТестов_Исключения() Экспорт
	
	// Глобально
	БазоваяНастройка = БазоваяНастройка();
	БазоваяНастройка.ДымовыеТесты.ОткрытиеФорм.Вставить("Исключения", "*Товар*");
	БазоваяНастройка.ДымовыеТесты.ОткрытиеФорм.Вставить("Справочники", Новый Структура("Исключения", ЮТКоллекции.ЗначениеВМассиве("*Письма", "*Писем")));
	УстановитьПараметрыДымовыхТестов(БазоваяНастройка);
	
	ДеревоТестов = ДТОткрытиеФормСлужебныйВызовСервера.ТипыТестов();
	
	ЮТест.ОжидаетЧто(ДеревоТестов, "Исключение по шаблону ""*Товар*""")
		.Заполнено()
		.Свойство("[0].Объекты", "Справочники")
			.Содержит(ЮТест.Предикат().Реквизит("Имя").Равно("Товары"))
			.НеСодержит(ЮТест.Предикат().Реквизит("Имя").Равно("ИсходящиеПисьма"))
			.НеСодержит(ЮТест.Предикат().Реквизит("Имя").Равно("ВходящиеПисьма"))
		.Свойство("[1].ИмяКоллекции").Равно("Документы")
		.Свойство("[1].Объекты", "Документы")
			.Заполнено()
			.НеСодержит(ЮТест.Предикат().Реквизит("Имя").Равно("ОперацияПоУчетуТоваров"))
			.НеСодержит(ЮТест.Предикат().Реквизит("Имя").Равно("ПриходТовара"))
			.НеСодержит(ЮТест.Предикат().Реквизит("Имя").Равно("РасходТовара"))
		.Свойство("[5].ИмяКоллекции").Равно("РегистрыСведений")
		.Свойство("[5].Объекты", "Регистры сведений")
			.Заполнено()
			.Содержит(ЮТест.Предикат().Реквизит("Имя").Равно("СостояниеВходящихПисем"))
			.НеСодержит(ЮТест.Предикат().Реквизит("Имя").Равно("ЦеныТоваров"))
		.Свойство("[8].ИмяКоллекции").Равно("Отчеты")
		.Свойство("[8].Объекты", "Отчеты")
			.Заполнено()
			.НеСодержит(ЮТест.Предикат().Реквизит("Имя").Равно("ОстаткиТоваровНаСкладах"))
			.Содержит(ЮТест.Предикат().Реквизит("Имя").Равно("ОтчетПоВзаиморасчетам"))
	;
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция БазоваяНастройка()
	
	ОткрытиеФорм = Новый Структура("Использовать", Истина);
	ДымовыеТесты = Новый Структура("Использовать, ОткрытиеФорм", Истина, ОткрытиеФорм);
	Возврат Новый Структура("ДымовыеТесты", ДымовыеТесты);
	
КонецФункции

Функция ПараметрыЗапуска()
	
	Возврат ЮТОбщий.ЗначениеИзJSON("{
	|  ""ДымовыеТесты"": {
	|      ""Использовать"": true,
	|      ""ОткрытиеФорм"": {
	|          ""Использовать"": true,
	|          ""Перечисления"": false,
	|          ""Исключения"": ""Расход*"",
	|          ""Документы"": {
	|              ""Скопированный"": true,
	|              ""Заказ"": {
	|                  ""Новый"": false
	|              },
	|              ""ОперацияПоУчетуТоваров"": false,
	|              ""Оплата"": {
	|                  ""ФормаДокумента"": false
	|              },
	|              ""ПоступлениеДенег"": {
	|                  ""УправляемыеФормы"": false
	|              },
	|              ""ПриходТовара"": {
	|                  ""ФормаОбъекта"": false
	|              },
	|          },
	|          ""Справочники"": {
	|              ""Контрагенты"": {
	|                  ""Скопированный"": true
	|              }
	|          },
	|          ""Скопированный"": false
	|      }
	|  }
	|}");
	
КонецФункции

Процедура УстановитьПараметрыДымовыхТестов(ПараметрыЗапуска)
	
	ЮТКонтекстСлужебныйВызовСервера.УстановитьЗначениеКонтекста("КонтекстПараметрыЗапуска", ПараметрыЗапуска);
	
КонецПроцедуры
#КонецОбласти
