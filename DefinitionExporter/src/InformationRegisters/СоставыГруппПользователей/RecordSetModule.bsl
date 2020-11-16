///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2020, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ОбработчикиСобытий

Процедура ПриЗаписи(Отказ, Замещение)
	
	// В режиме ОбменДанными.Загрузка необходимо обновлять УИД в константе ВерсияДатЗапретаИзменения,
	// который позволять сеансам определить, что нужно обновить кэш дат запрета изменения в памяти.
	Если ОбменДанными.Загрузка Тогда
		Если Не ДополнительныеСвойства.Свойство("ПропуститьОбновлениеВерсииДатЗапретаИзменения") Тогда
			ОбновитьВерсиюДатЗапретаИзмененияПриЗагрузкеДанных();
		КонецЕсли;
		Возврат;
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ОбновитьВерсиюДатЗапретаИзмененияПриЗагрузкеДанных()
	
	// Изменения в обычном режиме записи регистрируются в общем модуле ПользователиСлужебный
	// в процедуре ПослеОбновленияСоставовГруппПользователейПереопределяемый.
	
	Если ОбщегоНазначения.ПодсистемаСуществует("СтандартныеПодсистемы.ДатыЗапретаИзменения") Тогда
		МодульДатыЗапретаИзмененияСлужебный = ОбщегоНазначения.ОбщийМодуль("ДатыЗапретаИзмененияСлужебный");
		МодульДатыЗапретаИзмененияСлужебный.ОбновитьВерсиюДатЗапретаИзмененияПриЗагрузкеДанных(ЭтотОбъект);
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Иначе
ВызватьИсключение НСтр("ru = 'Недопустимый вызов объекта на клиенте.'");
#КонецЕсли