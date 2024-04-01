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

// Поместить файлы в рабочий каталог.
// 
// Параметры:
//  ПереданныеФайлы - Массив Из ОписаниеПереданногоФайла
// 
// Возвращаемое значение:
//  
Функция ПоместитьФайлыВРабочийКаталог(Знач ПереданныеФайлы) Экспорт
	
	Контекст = Новый Структура();
	Контекст.Вставить("РабочийКаталог", ФайлыПроектаРабочийКаталог());
	
	ЮТФайлы.СоздатьКаталогРекурсивно(Контекст.РабочийКаталог);
	
	КаталогПроекта = ЮТНастройкиВыполнения.КаталогПроекта();
	
	Для Каждого Файл Из ПереданныеФайлы Цикл
		
		ИмяВКаталоге = СтрЗаменить(Файл.Имя, КаталогПроекта, "");
		ПолноеИмя = ЮТФайлы.ОбъединитьПути(Контекст.РабочийКаталог, ИмяВКаталоге);
		
		ЮТФайлы.СоздатьРодительскийКаталог(ПолноеИмя);
		ПолучитьИзВременногоХранилища(Файл.Хранение).Записать(ПолноеИмя);
		
	КонецЦикла;
	
	Возврат Контекст;
	
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ФайлыПроектаРабочийКаталог()
	
	КлючБазы = ЮТОбщий.ХешMD5(СтрокаСоединенияИнформационнойБазы());
	
	Возврат ЮТФайлы.ОбъединитьПути(КаталогВременныхФайлов(), КлючБазы, "КаталогПроекта");
	
КонецФункции

#КонецОбласти
