#include-once
#include <Debug.au3>

Func my_Debug($sText, $iLevel=0)
	#cs my_Debug
		Отображает отладочную информацию
		$sText - текст отладочной информации
		$iLevel - уровень отладочной информации и по совместительству уровень отступа информации от левого края
			 1 - значит текущее сообщение нужно отобразить на один уровень правее последнего сообщения
			 0 - значит текущее сообщение нужно отобразить на уровне последнего сообщения
			-1 - значит текущее сообщение нужно отобразить на уровень левее последнего сообщения
		Если не заданы глобальные переменные $iDebugLevel и $iDebugShow, функция задаст их самостоятельно.
	#ce
;~ 	_DebugSetup("Имя главного скрипта", True,2) ;_DebugSetup должно быть настроено в главном скрипте
	
	If Not IsDeclared("iDebugLevel") Then Global $iDebugLevel = 0 ;Если такой переменной еще нету, то создать
	If Not IsDeclared("iDebugShow") Then Global $iDebugShow = 10 ;Если такой переменной еще нету то создать
	
	If $iLevel > 0 Then $iDebugLevel += $iLevel ;Если iLevel > 0 то сдвинуть ГЛОБАЛЬНЫЙ отступ вправо на указанный iLevel
	Local $iCurDebugLevel = $iDebugLevel ;Приравнять локальный отступ - глобальному
	If $iLevel = 0 Then $iCurDebugLevel = $iDebugLevel + 1 ;если iLevel = 0 то приравнять локальный отступ = Глобальному + 1

	Local $sMessage = ""
	;Набираем табуляций в соответствии с $iCurDebugLevel
	For $i = 1 To Int($iCurDebugLevel) Step 1
		$sMessage &= @TAB
	Next

	If $iDebugLevel < $iDebugShow Then _DebugOut($sMessage & $sText) ;если текущий уровень лока меньше максимального уровня отображения - отображаем лог
	If $iLevel < 0 Then $iDebugLevel += $iLevel ;если iLevel < 0 - сдвигаем отступ влево на число указанное в iLevel
EndFunc
