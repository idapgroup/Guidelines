# Converter
---
### properties
* **localeID** -- строка идентефикатор локали. Динамическое проперти. Геттер передает информацию от Матчер о текущей установленной локали. Сеттер переключает Matcher на определенный словарь (если есть). Может быть nil (после удаления последнего словаря).
* **ordinal** -- переключатель режима порядковые/количественные (ordinal/cardinal). Порядковые получаются из количественных, решил оставить возможность выводить чисто количественные. Проперти просто подключает/отключает одно из правил Форматтер.
* **shortScale** -- переключатель режима короткая/длинная шкала (short/long scale). Динамическое проперти. Короткая шкала: миллион, биллион, триллион, квадриллион. Длинная шкала: миллион, миллиард, биллион, биллиард. 
* **availableLocaleID** -- возвращает массив доступных локалей. Динамическое проперти.

### methods
* **- init** -- возвращает Конвертер с тремя преудустановленными форматерами.
* **- initWithFormatter:** -- возвращает Конвертер с форматером, переданным как параметр.
* **- addFormatter:** -- добавляет форматтер. Если это единственный форматтер, то переключает localeID и shortScale на свои.
* **- removeFormatterWithLocale:** -- удаляет форматтер, если он есть. Если это единственный форматтер, то localeID устанавливается в nil.
* **- stringFromNumber:** -- конвертирует число в строку учитывая текущие настройки.
* **- stringFromNumber:withLocale:** -- convenient метод для использования с `[NSLocale currentLocale]`. Если переданной локали нет у Матчер, вернется nil

---
# Matcher
---
### properties
* **localeID**
* **shortScale**

### methods
* **+ defaultMatcher**
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

---
# Numerals
---
### properties
* **localeID**
* **shortScale**
* **cardinal**
* **ordinal**
* **exceptions**

### methods

