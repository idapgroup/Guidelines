# Converter
---
### public properties
* **localeID** -- строка идентефикатор локали. Динамическое проперти, представляет соответствующее проперти Matcher. Геттер передает информацию от Матчер о текущей установленной локали. Сеттер переключает Matcher на определенный словарь (если есть). Может быть nil (после удаления последнего словаря).
* **ordinal** -- переключатель режима порядковые/количественные (ordinal/cardinal). Порядковые получаются из количественных, решил оставить возможность выводить чисто количественные. Проперти просто подключает/отключает одно из правил Форматтер.
* **shortScale** -- переключатель режима короткая/длинная шкала (short/long scale). Динамическое проперти, представляет соответствующее проперти Matcher. Короткая шкала: миллион, биллион, триллион, квадриллион. Длинная шкала: миллион, миллиард, биллион, биллиард. 
* **availableLocaleID** -- возвращает массив доступных локалей. Динамическое проперти.

### private properties
* **matcher**

### methods
* **- init** -- возвращает Конвертер с тремя преудустановленными форматерами.
* **- initWithFormatter:** -- возвращает Конвертер с форматером, переданным как параметр.
* **- addFormatter:** -- добавляет форматтер. Если это единственный форматтер, то переключает localeID и shortScale на свои.
* **- removeFormatterWithLocale:** -- удаляет форматтер, если он есть. Если это единственный форматтер, то localeID устанавливается в nil.
* **- stringFromNumber:** -- конвертирует число в строку учитывая текущие настройки.
* **- stringFromNumber:withLocale:** -- convenient метод для использования с `[NSLocale currentLocale]`. Если переданной локали нет у Матчер, вернется nil

### private methods
* **- convertNumber:**
* **- threeDigitParser:**
---
# Matcher
---
### properties
* **localeID** -- см. localeID в классе Converter.
* **shortScale** -- см. shortScale в классе Converter.

### private properties
* **matchers** -- словарь хранящий доступные форматтеры. Ключ словаря, это имя локали, оно соответствует проперти localeID форматтера, они синхронизируются при установке очередного словаря.

### methods
* **+ defaultMatcher** -- матчер с тремя предустановленными форматтерами.
* **- addFormatter:**
* **- removeFormatterWithLocale:**
* **- availableLocaleID**
* **- unitsIn: multiplier:**
* **- tensAndTeensIn: multiplier:**
* **- hundredsIn: multiplier:**
* **- largeNumbersForMultiplier: quantity:**
* **- ordinalFormatter: withString:**
* **- starterFormatter:**
* **- finishingFormatter:**

### private methods
* **- isCorrectLocaleID:** -- проверяет, при попытке переключения локали или удаления словаря по локали, доступна ли такая локаль вообще.
---
# Formatter
---
### properties
* **localeID**
* **numerals**

### methods
* **+ formatter**
* **- initWithNumerals:**
* **- initWithFile:**
* **- unitsFormatter: multiplier:**
* **- teensFormatter: multiplier:**
* **- roundTensFormatter: multiplier:**
* **- tensFormatter: multiplier:**
* **- hundredsFormatter: multiplier:**
* **- largeNumbersFormatter: quantity:**
* **- ordinalFormatter: withString:**
* **- starterFormatter:**
* **- finishingFormatter: withString:**

* **- protect** -- защита от использования базового класса.
---
# Numerals
---
### properties
* **localeID**  -- имя текущего словаря.
* **shortScale** -- см. shortScale у Converter. В зависимости от состояния, методы `ordinalLarge` и `cardinalLarge` будут автоматически возвращать данные в нужном виде.
* **cardinal**
* **ordinal**
* **exceptions**
* **ordinalLarge** -- Динамическое проперти. Возвращает либо ordinalLargeShort, либо ordinalLargeLong, в зависимости от флага shortScale.
* **cardinalLarge** -- Динамическое проперти. Возвращает либо cardinalLargeShort, либо cardinalLargeLong, в зависимости от флага shortScale.

### private properties
* **ordinalLargeShort**
* **ordinalLargeLong**
* **cardinalLargeShort**
* **cardinalLargeLong**

### methods
* **- initWithFile:**
* **- setOrdinalLargeShort** -- этот и следующие три метода нужны для установки Large словарей, т.к. соответствующие публичныие проперти @dynamic, и не имеют иваров.
* **- setOrdinalLargeLong** -- см. выше.
* **- setCardinalLargeShort** -- см. выше.
* **- setOrdinalLargeLong** -- см. выше.
* **+ english** --  этот и следующие три метода, являются удобными методами для генеращии английского, немецкого и украинского словарей.
* **+ deutsch**
* **+ ukrainian**

