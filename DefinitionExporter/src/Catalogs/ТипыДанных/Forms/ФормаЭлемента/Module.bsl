

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)

	НастроитьФормуПодТипы();
	
КонецПроцедуры


&НаСервере
Процедура НастроитьФормуПодТипы()
	
	Если Объект.Предопределенный Тогда
		Элементы.Реквизиты.Видимость = Ложь;
	КонецЕсли;
		
КонецПроцедуры

