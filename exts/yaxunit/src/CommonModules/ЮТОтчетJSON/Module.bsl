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

Функция РеализуетФормат(ФорматОтчета) Экспорт
	
	Возврат СтрСравнить(ФорматОтчета, "dumpjson") = 0;
	
КонецФункции

Функция ПараметрыГенерацииОтчета() Экспорт
	
	Параметры = ЮТФабрика.ПараметрыГенератораОтчета();
	
	ОписаниеФормата = ЮТФабрика.ОписаниеФорматаОтчета("dumpjson", "Дамп результата тестирования в json");
	ОписаниеФормата.ИмяФайлаПоУмолчанию = "report.json";
	ОписаниеФормата.ФильтрВыбораФайла = "Дамп результата тестирования (*.json)|*.json";
	Параметры.Форматы.Вставить(ОписаниеФормата.Идентификатор, ОписаниеФормата);
	
	Возврат Параметры;
	
КонецФункции

// Формирует отчет в формате JSON
// 
// Параметры:
//  РезультатВыполнения - Массив из см. ЮТФабрика.ОписаниеИсполняемогоТестовогоМодуля
// 
// Возвращаемое значение:
//  ДвоичныеДанные - Данные отчета
Функция ДанныеОтчета(РезультатВыполнения) Экспорт
	
#Если ВебКлиент Тогда
	ВызватьИсключение "Формирование отчета в формате JSON не поддерживается в web-клиенте";
#Иначе
	Поток = Новый ПотокВПамяти();
	Запись = Новый ЗаписьJSON();
	Запись.ОткрытьПоток(Поток, "UTF-8", Ложь);
	
	ЗаписатьJSON(Запись, РезультатВыполнения);
	
	Запись.Закрыть();
	
	Возврат Поток.ЗакрытьИПолучитьДвоичныеДанные();
#КонецЕсли
	
КонецФункции

#КонецОбласти
