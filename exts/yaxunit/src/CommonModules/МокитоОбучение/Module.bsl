//©///////////////////////////////////////////////////////////////////////////©//
//
//  Copyright 2021-2023 BIA-Technologies Limited Liability Company
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

///////////////////////////////////////////////////////////////////
// Содержит методы для обучения (настройки) Мокито.
// Вы можете настроить какие методы и как подменять, а за которыми просто наблюдать
///////////////////////////////////////////////////////////////////

#Область ПрограммныйИнтерфейс

// Начинает обучение мокито для регистрации правил подмены вызовов методов.
// 
// Параметры:
//  Объект - Произвольный - Обучаемый объект, с методами которого хотим работать.
//  СброситьСтарыеНастройки - Булево - Необходимо удалить старые настройки по объекту.
//        + `Истина` - все предыдущие настройки мокирования объекта будут забыты.
//        + `Ложь` - будет выполнено дообучение объекта.
// 
// Возвращаемое значение:
//  ОбщийМодуль - Этот же модуль, для замыкания
Функция Обучение(Объект, СброситьСтарыеНастройки = Истина) Экспорт
	
	УстановитьПараметрыОбучения(Объект);
	МокитоСлужебный.ЗарегистрироватьПерехватОбъекта(Объект, СброситьСтарыеНастройки);
	
	Возврат МокитоОбучение;
	
КонецФункции

// Включает наблюдение за вызовами метода, при необходимости можно настроить фильтр по параметрам вызова.
// 
// Параметры:
//  ИмяМетода - Строка - Имя метода обучаемого объекта, см. Обучение.
//            - Произвольный - Вызов метода обучаемого объекта.
//  ПараметрыВызова - Массив из Произвольный - Параметры вызова метода обучаемого объекта.
// Варианты вызова:
//  Мокито.Обучение(Произвольный).Когда(Строка, Массив); // Вызов через указание имени метода и параметров
//  Мокито.Обучение(Произвольный).Когда(Произвольный); // Вызов через явное выполнение наблюдаемого метода
// 
// Возвращаемое значение:
//  ОбщийМодуль - Этот же модуль, для замыкания
// Примеры:
//  Мокито.Обучение(ОбщегоНазначения).Наблюдать("ЭтоДопустимоеИмяПеременной", Мокито.МассивПараметров(""));
//  Мокито.Обучение(ОбщегоНазначения).Наблюдать(ОбщегоНазначения.ЭтоДопустимоеИмяПеременной(""));
Функция Наблюдать(ИмяМетода, ПараметрыВызова = Неопределено) Экспорт
	
	ЗарегистрироватьПерехватВыражения(ИмяМетода, ПараметрыВызова);
	
	Возврат МокитоОбучение;
	
КонецФункции

// Задает условие "подмены" поведения метода.
// 
// Параметры:
//  ИмяМетода - Строка - Имя метода обучаемого объекта.
//            - Произвольный - Вызов метода обучаемого объекта.
//  ПараметрыВызова - Массив из Произвольный - Параметры вызова метода обучаемого объекта.
// Варианты вызова:
//  Мокито.Обучение(Произвольный).Когда(Строка, Массив); // Вызов через указание имени метода и параметров
//  Мокито.Обучение(Произвольный).Когда(Произвольный); // Вызов через явное выполнение наблюдаемого метода
// 
// Возвращаемое значение:
//  ОбщийМодуль - Этот же модуль, для замыкания.
// Примеры:
//  Мокито.Обучение(ОбщегоНазначения).Когда("ЭтоДопустимоеИмяПеременной", Мокито.МассивПараметров(""));
//  Мокито.Обучение(ОбщегоНазначения).Когда(ОбщегоНазначения.ЭтоДопустимоеИмяПеременной(""));
Функция Когда(ИмяМетода, ПараметрыВызова = Неопределено) Экспорт
	
	Возврат Наблюдать(ИмяМетода, ПараметрыВызова);
	
КонецФункции

// Указывает, что при соблюдении условий (см. Когда) метод должен вернуть указанный результат.
// 
// При этом сам метод не исполняется.
// 
// Параметры:
//  Результат - Произвольный - Результат, который должен вернуть метод.
// 
// Возвращаемое значение:
//  ОбщийМодуль - Этот же модуль, для замыкания
Функция Вернуть(Результат) Экспорт
	
	ЗарегистрироватьРеакцию(Новый Структура("ТипДействия, Результат", МокитоСлужебный.ТипыДействийРеакций().ВернутьРезультат, Результат));
	
	Возврат МокитоОбучение;
	
КонецФункции

//  Указывает, что при соблюдении условий (см. Когда) метод должен выбросить исключение.
//  
//  При этом сам метод не исполняется.
// 
// Параметры:
//  ТекстИсключения - Строка
// 
// Возвращаемое значение:
//  ОбщийМодуль - Этот же модуль, для замыкания
Функция ВыброситьИсключение(ТекстИсключения) Экспорт
	
	ЗарегистрироватьРеакцию(Новый Структура("ТипДействия, Ошибка", МокитоСлужебный.ТипыДействийРеакций().ВыброситьИсключение, ТекстИсключения));
	
	Возврат МокитоОбучение;
	
КонецФункции

// Указывает, что при соблюдении условий (см. Когда) метод не должен выполняться, его вызов пропускается.
// 
// Если это функция, то будет возвращено `Неопределено`.
// 
// Возвращаемое значение:
//  ОбщийМодуль - Этот же модуль, для замыкания
Функция Пропустить() Экспорт
	
	ЗарегистрироватьРеакцию(Новый Структура("ТипДействия", МокитоСлужебный.ТипыДействийРеакций().Пропустить));
	
	Возврат МокитоОбучение;
	
КонецФункции

// Указывает, что при соблюдении условий (см. Когда) метод должен выполняться.
// Используется для случаев, когда необходимо задать исключения для другого правила на этом методе.
// 
// TODO: Нужны примеры
// 
// Возвращаемое значение:
//  ОбщийМодуль - Этот же модуль, для замыкания
Функция ВыполнитьМетод() Экспорт
	
	ЗарегистрироватьРеакцию(Новый Структура("ТипДействия", МокитоСлужебный.ТипыДействийРеакций().ВызватьОсновнойМетод));
	
	Возврат МокитоОбучение;
	
КонецФункции

//  Переводит мокито в режим прогона тестов.
//  
//  Вызов этого метода обязателен перед выполнением тестового прогона метода. 
Процедура Прогон() Экспорт
	
	Мокито.Прогон();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ЗарегистрироватьПерехватВыражения(ИмяМетода, ПараметрыВызова)
	
	Объект = ОбучаемыйОбъект();
	ДанныеПерехвата = МокитоСлужебный.ДанныеПерехвата(Объект);
	
	Если ДанныеПерехвата = Неопределено Тогда
		Сообщение = СтрШаблон("Не найдены настройки перехвата для %1. Необходимо предварительно вызвать метод Мокито.Обучение(Объект)", Объект);
		ВызватьИсключение Сообщение;
	КонецЕсли;
	
	Если МокитоСлужебный.ЭтоСтруктураВызоваМетода(ИмяМетода) Тогда
		СтруктураВызоваМетода = ИмяМетода;
	Иначе
		СтруктураВызоваМетода = МокитоСлужебный.СтруктураВызоваМетода(Объект, ИмяМетода, ПараметрыВызова);
	КонецЕсли;
	
	Методы = ДанныеПерехвата.Методы;
	
	Если НЕ Методы.Свойство(СтруктураВызоваМетода.ИмяМетода) Тогда
		Методы.Вставить(СтруктураВызоваМетода.ИмяМетода, ОписаниеПараметровПерехватаМетода());
	КонецЕсли;
	
	Реакция = СоздатьОписаниеУсловнойРеакции(СтруктураВызоваМетода);
	
	Методы[СтруктураВызоваМетода.ИмяМетода].Реакции.Добавить(Реакция);
	
	ПараметрыОбучения().РеакцияТекущегоВыражения = Реакция;
	
КонецПроцедуры

Функция ОписаниеПараметровПерехватаМетода()
	
	Возврат Новый Структура("Реакции", Новый Массив);
	
КонецФункции

#Область Реакции

Функция СоздатьОписаниеУсловнойРеакции(СтруктураВызоваМетода)
	
	Возврат Новый Структура("УсловиеРеакции, Действие", УсловиеРеакции(СтруктураВызоваМетода), Неопределено);
	
КонецФункции

Функция УсловиеРеакции(СтруктураВызоваМетода)
	
	Параметры = СтруктураВызоваМетода.Параметры;
	
	Если Параметры = Неопределено Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	Условия = Новый Массив;
	
	ТипыУсловий = МокитоСлужебный.ТипыУсловийПараметров();
	
	Для Каждого Параметр Из Параметры Цикл
		
		Если МокитоСлужебный.ЭтоМаскаПарамера(Параметр) Тогда
			
			Условия.Добавить(Параметр);
			
		ИначеЕсли ЮТПредикатыКлиентСервер.ЭтоПредикат(Параметр) Тогда
			
			Маска = МокитоСлужебный.ОписаниеМаскиПараметра(ТипыУсловий.Предикат, 90);
			Маска.Вставить("Предикат", ЮТПредикатыКлиентСервер.НаборПредикатов(Параметр));
			Условия.Добавить(Маска);
			
		Иначе
			
			Маска = МокитоСлужебный.ОписаниеМаскиПараметра(ТипыУсловий.Значение, 100);
			Маска.Вставить("Значение", Параметр);
			Условия.Добавить(Маска);
			
		КонецЕсли;
		
	КонецЦикла;
	
	Возврат Условия;
	
КонецФункции

#КонецОбласти

#Область Параметры

Функция ОбучаемыйОбъект()
	
	ПараметрыОбучения = ПараметрыОбучения();
	
	Возврат ПараметрыОбучения.ОбучаемыйОбъект;
	
КонецФункции

Функция ПараметрыОбучения()
	
	Параметры = МокитоСлужебный.Настройки().ПараметрыОбучения;
	
	Возврат Параметры;
	
КонецФункции

Процедура УстановитьПараметрыОбучения(Объект)
	
	ПараметрыОбучения = Новый Структура("ОбучаемыйОбъект, РеакцияТекущегоВыражения", Объект, Неопределено);
	
	МокитоСлужебный.Настройки().ПараметрыОбучения = ПараметрыОбучения;
	
КонецПроцедуры

Процедура ЗарегистрироватьРеакцию(Действие)
	
	Действие.Вставить("Обработано", Ложь);
	
	ПараметрыОбучения().РеакцияТекущегоВыражения.Действие = Действие;

КонецПроцедуры

#КонецОбласти

#КонецОбласти
