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

/////////////////////////////////////////////////////////////////////////////////
// Содержит методы создания тестов и тестовых наборов
/////////////////////////////////////////////////////////////////////////////////

#Область ПрограммныйИнтерфейс

// Создает и регистрирует тестовый набор, в который будут добавляться последующие тесты
// Параметры:
//  Имя - Строка -  Имя набора тестов
//  ТегиСтрокой - Строка - Теги относящиеся к набору и вложенным тестам. Это строка разделенная запятыми
//
// Возвращаемое значение:
//  ОбщийМодуль - Этот же модуль
Функция ДобавитьТестовыйНабор(Имя, ТегиСтрокой = "") Экспорт
	
	ЮТТестыСлужебный.ДобавитьТестовыйНабор(Имя, ТегиСтрокой);
	
	Возврат ЮТТесты;
	
КонецФункции

// Регистрирует тест, исполняемый в контекстах, в которых доступен тестовый модуль.
//  Например
//
//  * Если модуль с тестами клиент-серверный, то тест будет вызван и на клиенте и на сервере.
//  * Если клиентский, то только на клиенте.
//  * Если клиент обычное приложение, то только при запуске в режиме обычного приложения.
//
// Параметры:
//  ИмяТестовогоМетода - Строка - Имя тестового метода
//  ПредставлениеТеста - Строка - Представление теста
//  ТегиСтрокой - Строка - Теги строкой. Это строка разделенная запятыми
//  Контексты - Строка - Контексты, строка перечисления контекстов вызова, разделенных запятой.
//                       Возможные значения см. ЮТФабрика.КонтекстыВызова
// Возвращаемое значение:
//  ОбщийМодуль - Этот же модуль
Функция ДобавитьТест(ИмяТестовогоМетода, ПредставлениеТеста = "", ТегиСтрокой = "", Контексты = Неопределено) Экспорт
	
	ЮТТестыСлужебный.ДобавитьТест(ИмяТестовогоМетода, ПредставлениеТеста, ТегиСтрокой, Контексты);
	
	Возврат ЮТТесты;
	
КонецФункции

// Регистрирует тест исполняемый на клиенте.
//
// Параметры:
//  ИмяТестовогоМетода - Строка - Имя тестового метода
//  ПредставлениеТеста - Строка - Представление теста
//  ТегиСтрокой - Строка - Теги строкой. Это строка разделенная запятыми
//
// Возвращаемое значение:
//  ОбщийМодуль - Этот же модуль
Функция ДобавитьКлиентскийТест(ИмяТестовогоМетода, ПредставлениеТеста = "", ТегиСтрокой = "") Экспорт
	
	ЮТТестыСлужебный.ДобавитьТест(ИмяТестовогоМетода, ПредставлениеТеста, ТегиСтрокой, ЮТТестыСлужебный.КонтекстыВызоваКлиента());
	
	Возврат ЮТТесты;
	
КонецФункции

// Регистрирует тест исполняемый на сервере.
//
// Параметры:
//  ИмяТестовогоМетода - Строка - Имя тестового метода
//  ПредставлениеТеста - Строка - Представление теста
//  ТегиСтрокой - Строка - Теги строкой. Это строка разделенная запятыми
//
// Возвращаемое значение:
//  ОбщийМодуль - Этот же модуль
Функция ДобавитьСерверныйТест(ИмяТестовогоМетода, ПредставлениеТеста = "", ТегиСтрокой = "") Экспорт
	
	КонтекстыВызова = ЮТФабрика.КонтекстыВызова();
	ЮТТестыСлужебный.ДобавитьТест(ИмяТестовогоМетода, ПредставлениеТеста, ТегиСтрокой, КонтекстыВызова.Сервер);
	
	Возврат ЮТТесты;
	
КонецФункции

// Устанавливает настройку выполнения тестового метода.
//
// Параметры:
//  ИмяПараметра - Строка
//  Значение - Произвольный - Значение настройки
//
// Возвращаемое значение:
//  ОбщийМодуль - Этот же модуль
Функция НастройкаИсполнения(ИмяПараметра, Значение) Экспорт
	
	ЮТТестыСлужебный.НастройкаИсполнения(ИмяПараметра, Значение);
	
	Возврат ЮТТесты;
	
КонецФункции

// Устанавливает настройку выполнения тестового метода в транзакции.
//
// Параметры:
//  ВыполнятьВТранзакции - Булево
//
// Возвращаемое значение:
//  ОбщийМодуль - Этот же модуль
Функция ВТранзакции(ВыполнятьВТранзакции = Истина) Экспорт
	
	ЮТТестыСлужебный.НастройкаИсполнения(ЮТФабрика.ПараметрыИсполненияТеста().ВТранзакции, ВыполнятьВТранзакции);
	
	Возврат ЮТТесты;
	
КонецФункции

// Устанавливает настройку удаления созданных тестовых данных
// В отличии от использования транзакции:
//
//  * Умеет работать с данными созданными на клиенте
//  * Только удаляет созданные данные и не откатывает изменения объектов
//  * Работает с данными созданными через API работы с тестовыми данными
//  * Удаляет данные созданные вне теста (в обработчиках событий, например, ПередВсемиТестами и ПередТестовымНабором)
//
// Параметры:
//  УдалятьСозданныеДанные - Булево
//
// Возвращаемое значение:
//  ОбщийМодуль - Этот же модуль
Функция УдалениеТестовыхДанных(УдалятьСозданныеДанные = Истина) Экспорт
	
	ЮТТестыСлужебный.НастройкаИсполнения(ЮТФабрика.ПараметрыИсполненияТеста().УдалениеТестовыхДанных, УдалятьСозданныеДанные);
	
	Возврат ЮТТесты;
	
КонецФункции

// Устанавливает настройку переопределения обработчика события Перед...
//
// Параметры:
//  ВыполнитьПеред - Строка - Имя обработчика события, который будет выполнен вместо основного
//
// Возвращаемое значение:
//  ОбщийМодуль - Этот же модуль
Функция Перед(ВыполнитьПеред = "") Экспорт
	
	ЮТТестыСлужебный.НастройкаИсполнения(ЮТФабрика.ПараметрыИсполненияТеста().Перед, ВыполнитьПеред);
	
	Возврат ЮТТесты;
	
КонецФункции

// Устанавливает настройку переопределения обработчика события После...
//
// Параметры:
//  ВыполнитьПосле - Строка - Имя обработчика события, который будет выполнен вместо основного
//
// Возвращаемое значение:
//  ОбщийМодуль - Этот же модуль
Функция После(ВыполнитьПосле = "") Экспорт
	
	ЮТТестыСлужебный.НастройкаИсполнения(ЮТФабрика.ПараметрыИсполненияТеста().После, ВыполнитьПосле);
	
	Возврат ЮТТесты;
	
КонецФункции

// Устанавливает параметры вызова теста.
//
// * Если метод вызывается первый раз, то он устанавливает параметры теста.
// * Если второй и последующие, то добавляет новый тест с параметрами.
//
// Параметры:
//  Параметр1 - Произвольный
//  Параметр2 - Произвольный
//  Параметр3 - Произвольный
//  Параметр4 - Произвольный
//  Параметр5 - Произвольный
//  Параметр6 - Произвольный
//  Параметр7 - Произвольный
//  Параметр8 - Произвольный
//  Параметр9 - Произвольный
//  Параметр10 - Произвольный
//
// Возвращаемое значение:
//  ОбщийМодуль - Этот же модуль
//
// Примеры:
//
// ЮТТесты.ДобавитьТест("Тест1").СПараметрами(1, 2); // Будет зарегистрирован один тест с параметрами 1, 2
// ЮТТесты.ДобавитьТест("Тест1")
// 	.СПараметрами(1)
// 	.СПараметрами(2); // Будет зарегистрировано два теста, первый с параметром 1 и второй с параметром 2
//
//@skip-check method-too-many-params
Функция СПараметрами(Параметр1 = "_!%*",
					 Параметр2 = "_!%*",
					 Параметр3 = "_!%*",
					 Параметр4 = "_!%*",
					 Параметр5 = "_!%*",
					 Параметр6 = "_!%*",
					 Параметр7 = "_!%*",
					 Параметр8 = "_!%*",
					 Параметр9 = "_!%*",
					 Параметр10 = "_!%*") Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(Параметр1,
											 Параметр2,
											 Параметр3,
											 Параметр4,
											 Параметр5,
											 Параметр6,
											 Параметр7,
											 Параметр8,
											 Параметр9,
											 Параметр10);
	
	ЮТТестыСлужебный.СПараметрами(Параметры, Неопределено);
	
	Возврат ЮТТесты;
	
КонецФункции

// Устанавливает параметры вызова теста и новый контекст исполнения (клиентский).
//
// * Если метод вызывается первый раз, то он устанавливает параметры теста.
// * Если второй и последующие, то добавляет новый тест с параметрами.
//
// Параметры:
//  Параметр1 - Произвольный
//  Параметр2 - Произвольный
//  Параметр3 - Произвольный
//  Параметр4 - Произвольный
//  Параметр5 - Произвольный
//  Параметр6 - Произвольный
//  Параметр7 - Произвольный
//  Параметр8 - Произвольный
//  Параметр9 - Произвольный
//  Параметр10 - Произвольный
//
// Возвращаемое значение:
//  ОбщийМодуль - Этот же модуль
//
//@skip-check method-too-many-params
Функция СПараметрамиНаКлиенте(Параметр1 = "_!%*",
							  Параметр2 = "_!%*",
							  Параметр3 = "_!%*",
							  Параметр4 = "_!%*",
							  Параметр5 = "_!%*",
							  Параметр6 = "_!%*",
							  Параметр7 = "_!%*",
							  Параметр8 = "_!%*",
							  Параметр9 = "_!%*",
							  Параметр10 = "_!%*") Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(Параметр1,
											 Параметр2,
											 Параметр3,
											 Параметр4,
											 Параметр5,
											 Параметр6,
											 Параметр7,
											 Параметр8,
											 Параметр9,
											 Параметр10);
	
	ЮТТестыСлужебный.СПараметрами(Параметры, ЮТТестыСлужебный.КонтекстыВызоваКлиента());
	
	Возврат ЮТТесты;
	
КонецФункции

// Устанавливает параметры вызова теста и новый контекст исполнения (серверный).
// 
// * Если метод вызывается первый раз, то он устанавливает параметры теста.
// * Если второй и последующие, то добавляет новый тест с параметрами.
//
// Параметры:
//  Параметр1 - Произвольный
//  Параметр2 - Произвольный
//  Параметр3 - Произвольный
//  Параметр4 - Произвольный
//  Параметр5 - Произвольный
//  Параметр6 - Произвольный
//  Параметр7 - Произвольный
//  Параметр8 - Произвольный
//  Параметр9 - Произвольный
//  Параметр10 - Произвольный
//
// Возвращаемое значение:
//  ОбщийМодуль - Этот же модуль
//
//@skip-check method-too-many-params
Функция СПараметрамиНаСервере(Параметр1 = "_!%*",
							  Параметр2 = "_!%*",
							  Параметр3 = "_!%*",
							  Параметр4 = "_!%*",
							  Параметр5 = "_!%*",
							  Параметр6 = "_!%*",
							  Параметр7 = "_!%*",
							  Параметр8 = "_!%*",
							  Параметр9 = "_!%*",
							  Параметр10 = "_!%*") Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(Параметр1,
											 Параметр2,
											 Параметр3,
											 Параметр4,
											 Параметр5,
											 Параметр6,
											 Параметр7,
											 Параметр8,
											 Параметр9,
											 Параметр10);
	
	КонтекстыВызова = ЮТФабрика.КонтекстыВызова();
	ЮТТестыСлужебный.СПараметрами(Параметры, КонтекстыВызова.Сервер);
	
	Возврат ЮТТесты;
	
КонецФункции

// Устанавливает представление объекта, может использоваться как для теста, так и для набора.
// 
// Параметры:
//  Представление - Строка
//  ИспользуяИмя - Булево - Необходимо ли использовать имя объекта при формировании представления.
//  						Ложь - По умолчанию, представление будет установлено по параметру.
//  						Истина - Новое представление объекта = `<ИмяОбъект>. <Параметр Представление>`
// 
// Возвращаемое значение:
//  ОбщийМодуль - Этот же модуль
Функция Представление(Представление, ИспользуяИмя = Ложь) Экспорт
	
	ЮТТестыСлужебный.УстановитьПредставление(Представление, ИспользуяИмя);
	
	Возврат ЮТТесты;
	
КонецФункции

// Возвращает модуль установки зависимостей теста.
// 
// Возвращаемое значение:
//  CommonModule
Функция ЗависитОт() Экспорт
	
	Возврат ЮТЗависимости;
	
КонецФункции

#КонецОбласти
