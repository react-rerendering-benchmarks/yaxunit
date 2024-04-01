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

Функция ФайлыПроекта(ПутьКФайламПроекта) Экспорт
	
	ПолныйПуть = ПутьКФайламПроекта(ПутьКФайламПроекта);
	
	Файлы = НайтиФайлы(ПолныйПуть, , Истина);
	РезультатПередачиФайлов = ОбработкаНайденныхФайлов(Файлы, ПутьКФайламПроекта);
	
	Результат = ЮТФабрикаСлужебный.РезультатРазрешенияЗависимости();
	Результат.Успешно = РезультатПередачиФайлов <> Неопределено;
	
	Если Результат.Успешно Тогда
		Результат.СохраняемыйКонтекстКлиент = Новый Структура("РабочийКаталог, ПолноеИмя", ЮТНастройкиВыполнения.КаталогПроекта(), ПолныйПуть);
		Результат.СохраняемыйКонтекстСервер = РезультатПередачиФайлов;
		Результат.СохраняемыйКонтекстСервер.Вставить("ПолноеИмя", ЮТФайлы.ОбъединитьПути(Результат.СохраняемыйКонтекстСервер.РабочийКаталог, ПутьКФайламПроекта));
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ПутьКФайламПроекта(ИмяФайла) Экспорт
	
	Возврат ЮТФайлы.ОбъединитьПути(ЮТНастройкиВыполнения.КаталогПроекта(), ИмяФайла);
	
КонецФункции

Функция ОбработкаНайденныхФайлов(НайденныеФайлы, ПутьКФайламПроекта) Экспорт
	
	ФайлыДляПеремещения = Новый Массив();
	
	Для Каждого Файл Из НайденныеФайлы Цикл
		ФайлыДляПеремещения.Добавить(Новый ОписаниеПередаваемогоФайла(Файл.ПолноеИмя));
	КонецЦикла;
	
	ПомещенныеФайлы = Новый Массив();;
	Если ПоместитьФайлы(ФайлыДляПеремещения, ПомещенныеФайлы, , Ложь) Тогда
		Возврат ЮТРазрешениеЗависимостейСлужебныйВызовСервера.ПоместитьФайлыВРабочийКаталог(ПомещенныеФайлы);
	КонецЕсли;
	
КонецФункции

#КонецОбласти
