document.addEventListener('DOMContentLoaded', () => {
  document.documentElement.style.setProperty('--vh', `${window.innerHeight * 0.01}px`)
})

const form = document.querySelector('.form')
const input = form.querySelector('.form__input')
const lang = form.querySelector('.form__select')
const result = document.querySelector('.result')

const listener = (event) => {
  event.preventDefault()

  GenerateOrdinals(lang.value)

  let words = getWords(input.value)

  // console.log(input.value.split("").pop())

  if (!input.value.trim()) words = ""
  result.textContent = words
}

input.addEventListener("input", listener)
form.addEventListener('submit', listener)

const TEN = 10
const ONE_HUNDRED = 100
const ONE_THOUSAND = 1000
const ONE_MILLION = 1000000
const ONE_BILLION = 1000000000
const ONE_TRILLION = 1000000000000
const ONE_QUADRILLION = 1000000000000000
const MAX_SIZE = 1000000000000000000

let LESS_THAN_TEN = [],
  ELEVEN = [],
  TENTH = [],
  HUNDREDTH = [],
  GENITIVE = [],
  NOMINATIVE = []

function getWords(number, array, through, prevNumber) {
  let words = array ? array : []
  let word

  // Не число
  if (!Number(number) && Number(number) !== 0) {
    words.push(`${number} is a wrong number`)
    return words.join('')
  }

  // Javascript работает с цифрами до 9 квадриллионов,
  // Поэтому работаю со строковым значением, что вмещает >9 квадриллионов

  // Сравниваю последние две цифры изначально входящей строки и строки цикла
  if (number.substr(-2) !== input.value.substr(-2)) {
    number = input.value.substr(-number.length)
  }

  // Реф на следующее число
  let nextNumber = number

  // Done
  if (Number(number) === 0) {
    return words.join('')
  }

  // Through
  if (through) {
    through = false
    return getWords(+nextNumber.slice(1) + "", words, through)
  }

  // 1 - 9
  if (number < TEN) {
    if (lang.value === "DE" && prevNumber > TEN && prevNumber < ONE_HUNDRED) {
      words.push("ste")
    } else {
      words.push(LESS_THAN_TEN[Number(number)])
    }
    return words.join('')
  }

  // 11 - 19
  if (number > 10 && number < 20) {
    words.push(convertEleven(number, null, 2))
    return words.join('')
  }

  switch (true) {
    // 10, 20 - 99
    case number < ONE_HUNDRED:
      word = convertTen(number)
      break
    // 100 - 110, 120 - 199
    case number < ONE_THOUSAND:
      word = convertHundred(number)
      break
    // 1.000
    case number < ONE_MILLION:
      const thousandth = convertMoreThanThousand(number, {
        divisor: ONE_THOUSAND,
        UK: {
          lineend: "тисячний",
          plural: "тисяч",
          nominative: "тисяча",
          genitive: "тисячі"
        },
        EN: {
          nominative: "thousand"
        },
        DE: {
          nominative: "tausend"
        }
      })

      through = thousandth.through
      word = thousandth.word
      break

    // 1.000.000
    case number < ONE_BILLION:
      const million = convertMoreThanThousand(number, {
        divisor: ONE_MILLION,
        UK: {
          lineend: "мільйонний",
          plural: "мільйонів",
          nominative: "мільйон",
          genitive: "мільйони"
        },
        EN: {
          nominative: "million"
        },
        DE: {
          nominative: "million"
        }
      })

      through = million.through
      word = million.word
      break

    // 1.000.000.000
    case number < ONE_TRILLION:
      const billion = convertMoreThanThousand(number, {
        divisor: ONE_BILLION,
        UK: {
          lineend: "мільярдний",
          plural: "мільярдів",
          nominative: "мільярд",
          genitive: "мільярди"
        },
        EN: {
          nominative: "billion"
        },
        DE: {
          nominative: "milliard"
        }
      })

      through = billion.through
      word = billion.word
      break

    case number < ONE_QUADRILLION:
      const trillion = convertMoreThanThousand(number, {
        divisor: ONE_TRILLION,
        UK: {
          lineend: "трильйоний",
          plural: "трильйонів",
          nominative: "трильйон",
          genitive: "трильйони"
        },
        EN: {
          nominative: "trillion"
        },
        DE: {
          nominative: "billion"
        }
      })

      through = trillion.through
      word = trillion.word
      break

    case number < MAX_SIZE:
      const quadrillion = convertMoreThanThousand(number, {
        divisor: ONE_QUADRILLION,
        UK: {
          lineend: "квадрильйоний",
          plural: "квадрильйонів",
          nominative: "квадрильйон",
          genitive: "квадрильйони"
        },
        EN: {
          nominative: "quadrillion"
        },
        DE: {
          nominative: "billiarde"
        }
      })

      through = quadrillion.through
      word = quadrillion.word
      break

    case number >= MAX_SIZE:
      words.push("MAX SIZE")
      return words.join('')
  }

  words.push(word)

  // Обрезаю строку, и все 0000 в начале
  nextNumber = nextNumber.slice(1)
  nextNumber = +nextNumber
  nextNumber = "" + nextNumber

  // Реф на предыдущее число
  prevNumber = number

  return getWords(nextNumber, words, through, prevNumber)
}

function convertTen(number, divisor, slice) {
  let word

  let num = divisor
    ? Math.floor(number / TEN / divisor)
    : Math.floor(number / TEN)

  switch (lang.value) {
    case "UA":

      if (isLastNumber(number, slice)) {
        // ь - ий
        if (num >= 1 && num <= 3) word = TENTH[num].replace("ь", "ий")
        else if (num === 4) word = TENTH[num] + "овий"
        else if (num >= 5 && num <= 8 && num !== 7) word = GENITIVE[num] + "десятий"
        else if (num === 7) word = TENTH[num] + "ий"
        else if (num === 9) word = TENTH[num].replace("то", "тий")

        // ти - двадцяти п'яти тисячний
        if (number > divisor && divisor) {

          word = TENTH[num]
          if (num >= 1 && num <= 3) word = TENTH[num].replace("ь", "и")
          else if (num === 4) word = TENTH[num] + "а"
          else if (num >= 5 && num <= 8 && num !== 7) word = GENITIVE[num] + "десяти"
          else if (num === 7) word = TENTH[num] + "и"
        }
      } else {

        // ть - двадцять п'ять тисяч перший
        word = TENTH[num] + " "
      }

      break
    case "EN":
      if (isLastNumber(number, slice)) {
        // ten + th
        if (num === 1) word = TENTH[num] + "th"
        else word = TENTH[num].replace("y", "ieth")

      } else {
        // twenty
        word = TENTH[num] + "-"
      }
      break
    case "DE":
        if (isLastNumber(number, slice)) {
          // zehn + te, zwanzig + ste
          if (num === 1) word = TENTH[num] + "te"
          else word = TENTH[num] + "ste"

        } else {
          // 21 - ein + und + zwanzig
          word = NOMINATIVE[number % 10] + "und" + TENTH[Math.floor(number % 100 / 10)]
        }
      break
  }

  return word
}

function convertEleven(number, divisor, slice) {
  let word

  let num = divisor
    ? Math.floor((number / divisor) % TEN)
    : Math.floor(number % TEN)

  switch (lang.value) {
    case "UA":
      if (isLastNumber(number, slice)) {
        // ь - ий
        word = ELEVEN[num].replace("ь", "ий")

        // одинадцятитисячний
        if (number > divisor && divisor) {
          word = ELEVEN[num].replace("ь", "и")
        }
      } else {
        // ь
        word = ELEVEN[num]
      }
      break
    case "EN":
      if (isLastNumber(number, slice)) {
        // eleven + th
        if (num === 2) word = ELEVEN[num].replace("ve", "fth")
        else word = ELEVEN[num] + "th"

      } else {
        // eleven
        word = ELEVEN[num]
      }
      break
    case "DE":
      if (isLastNumber(number, slice)) {
        // elf + te
        word = ELEVEN[num] + "te"
      } else {
        word = ELEVEN[num]
      }
      break
  }

  return word
}

function convertHundred(number, divisor, slice) {
  let word

  let num = divisor
    ? Math.floor(number / ONE_HUNDRED / divisor)
    : Math.floor(number / ONE_HUNDRED)

  switch (lang.value) {
    case "UA":

      if (isLastNumber(number, slice)) {
        // сотий двохсотий
        if (num === 1) word = "сотий"
        else if (num >= 2 && num <= 9) word = GENITIVE[num] + "сотий"

        // двохсоттисячний
        if (number > divisor && divisor) {
          if (num === 1) word = "сто"
          else if (num >= 2 && num <= 9) word = GENITIVE[num] + "сот"
        }
      } else {

        // дев'ятсот перший
        word = HUNDREDTH[num] + " "
      }

      break
    case "EN":
      if (isLastNumber(number, slice)) {
        // hundred + th
        if (num === 1) word = "hundred" + "th"
        else word = NOMINATIVE[num] + " " + "hundred" + "th"

      } else {
        // one hundred
        word = NOMINATIVE[num] + " " + "hundred" + " "
      }
      break
    case "DE":
      if (isLastNumber(number, slice)) {
        // ein + hundert + ste
        word = NOMINATIVE[num] + "hundert" + "ste"
      } else {
        // ein + hundert
        word = NOMINATIVE[num] + "hundert"
      }
      break
  }

  return word
}

function convertMoreThanThousand(number, {divisor, UK, EN, DE}) {
  let word, through

  // Забираю первые три цифры
  const first = Math.floor(number / (divisor * ONE_HUNDRED)),
    second = Math.floor(number / (divisor * TEN)),
    third = Math.floor(number / (divisor))

  switch (lang.value) {
    case "UA":

      if (isLastNumber(number)) {
        // стотисячний
        if (first && first < 10) {
          word = convertHundred(number + "", divisor)

          // десятитисячний
        } else if (second && second < 10) {
          word = convertTen(number + "", divisor)

          // тисячний
        } else if (third && third < 10) {
          word = GENITIVE[third]
        }
        word += UK.lineend
      } else {
        // сто тисяч
        if (first && first < 10) {
          word = convertHundred(number + "", divisor, 3)

          // одинадцятитисячний && одинадцять тисяч
        } else if (third && third > 10 && third < 20) {
          word = convertEleven(number + "", divisor, 2)
          through = true

          // десять тисяч
        } else if (second && second < 10) {
          word = convertTen(number + "", divisor, 2)

          // одна тисяча
        } else if (third && third < 10) {
          word = NOMINATIVE[third]

          if (divisor >= ONE_MILLION && third === 1) word = "один"
        }

        // определение последнего числа
        // 1 + тисяча, мільйон, мільярд
        if (first && !(second % 10) && !(third % 100)) {
          word += " " + UK.plural + " "
        }
        // 11, 12, 13 + трильйоний, мільйонний, мільярдний
        else if (third && third > 10 && third < 20) {
          if (isLastNumber(number, 2)) word += " " + UK.lineend + " "
          else word += " " + UK.plural + " "

        } else if (!first && second && !(third % 10)) {
          word += " " + UK.plural + " "

        } else if (!first && !second && third) {
          if (third === 1) word += " " + UK.nominative + " "
          // 2, 3, 4 + тисячі, мільйони, мільярди
          else if (third > 1 && third < 5) word += " " + UK.genitive + " "
          // 5, 7, 8, 9 + тисяч, мільйонів, мільярдів
          else if (third > 4) word += " " + UK.plural + " "
        }
      }

      break
    case "EN":

      if (isLastNumber(number)) {
        if (first && first < 10) {
          // hundred thousandth
          if (first === 1) word = "hundred" + " " + EN.nominative + "th"
          else word = NOMINATIVE[first] + " " + "hundred" + " " + EN.nominative + "th"

        } else if (second && second < 10) {
          // ten thousandth
          if (second === 1) word = "ten" + " " + EN.nominative + "th"
          else word = NOMINATIVE[second] + " " + "ten" + " " + EN.nominative + "th"

        } else if (third && third < 10) {
          // thousandth
          if (third === 1) word = EN.nominative + "th"
          else word = NOMINATIVE[third] + " " + EN.nominative + "th"
        }
      } else {
        // five hundred twenty-three thousand one hundredth
        // one hundred thousand
        if (first && first < 10) {
          word = NOMINATIVE[first] + " " + "hundred" + " "

          // eleven thousandth && eleven thousand first
        } else if (third && third > 10 && third < 20) {
          word = ELEVEN[third % TEN]
          through = true

          // ten thousand
        } else if (second && second < 10) {
          if (third % TEN === 0) word = TENTH[second] + " "
          else word = TENTH[second] + "-"

          // one thousand
        } else if (third && third < 10) {
          word = NOMINATIVE[third] + " "
        }

        //
        if (first && !(second % 10) && !(third % 100)) word += EN.nominative + " "
        //
        else if (third && third > 10 && third < 20) {
          if (isLastNumber(number, 2)) word += " " + EN.nominative + "th"
          else word += " " + EN.nominative + " "
        }
        //
        else if (!first && second && !(third % 10)) word += EN.nominative + " "
        //
        else if (!first && !second && third) word += EN.nominative + " "
      }
      break
    case "DE":
      if (isLastNumber(number)) {
        if (first && first < 10) {
          word = NOMINATIVE[first] + "hundert"

        } else if (second && second < 10) {
          word = TENTH[second]

        } else if (third && third < 10) {
          word = NOMINATIVE[third]

        }
        word += DE.nominative + "ste"
      } else {

        if (first && first < 10) {
          word = NOMINATIVE[first] + "hundert"

        } else if (third && third > 10 && third < 20) {
          word = ELEVEN[third % TEN] + DE.nominative
          if (isLastNumber(number, 2)) word += "ste"
          through = true

        } else if (second && second < 10) {
          // 21 - ein + und + zwanzig
          if (Math.floor(third % 10)) {
            word = NOMINATIVE[third % 10] + "und" + TENTH[second] + DE.nominative
            through = true
          } else {
            word = TENTH[second]
          }

        } else if (third && third < 10) {
          word = NOMINATIVE[third]
        }

        //
        if (first && !(second % 10) && !(third % 100)) {
          word += DE.nominative
        }
        //
        else if (!first && second && !(third % 10)) {
          word += DE.nominative
        }
        //
        else if (!first && !second && third) {
          word += DE.nominative
        }
      }
      break
  }

  return {word, through}
}

function GenerateOrdinals(lang) {
  switch (lang) {
    case "UA":
      LESS_THAN_TEN = [
        "", "перший", "другий",
        "третій", "четвертий", "п'ятий",
        "шостий", "сьомий", "восьмий",
        "дев'ятий",
      ]
      TENTH = [
        "", "десять", "двадцять", "тридцять",
        "сорок", "п'ятдесят", "шістдесят",
        "сімдесят", "вісімдесят", "дев'яносто"
      ]
      ELEVEN = [
        "", "одинадцять", "дванадцять",
        "тринадцять", "чотирнадцять", "п'ятнадцять",
        "шістнадцять", "сімнадцять", "вісімнадцять",
        "дев'ятнадцять"
      ]
      HUNDREDTH = [
        "", "сто", "двісті", "триста",
        "чотириста", "п'ятсот", "шістсот",
        "сімсот", "вісімсот", "дев'ятсот",
      ]
      GENITIVE = [
        "", "", "двох", "трьох", "чотирьох",
        "п'яти", "шести", "семи", "восьми", "дев'яти"
      ]
      NOMINATIVE = [
        "", "одна", "дві", "три", "чотири", "п'ять",
        "шість", "сім", "вісім", "дев'ять",
      ]
      break
    case "EN":
      LESS_THAN_TEN = [
        "",
        "first", "second", "third",
        "fourth", "fifth", "sixth",
        "seventh", "eighth", "ninth",
        "tenth"
      ]
      TENTH = [
        "", "ten", "twenty", "thirty",
        "forty", "fifty", "sixty",
        "seventy", "eighty", "ninety"
      ]
      ELEVEN = [
        "", "eleven", "twelve",
        "thirteen", "fourteen", "fifteen",
        "sixteen", "seventeen", "eighteen",
        "nineteen"
      ]
      NOMINATIVE = [
        "", "one", "two", "three",
        "four", "five", "six", "seven",
        "eight", "nine"
      ]
      break
    case "DE":
      LESS_THAN_TEN = [
        "", "erste", "zweite", "dritte",
        "vierte", "fünfte", "sechste",
        "siebte", "achte", "neunte"
      ]

      TENTH = [
        "", "zehn", "zwanzig", "dreißig",
        "vierzig", "fünfzig", "sechzig",
        "siebzig", "achtzig", "neunzig"
      ]
      ELEVEN = [
        "", "elf", "zwölf", "dreizehn",
        "vierzehn", "fünfzehn", "sechzehn",
        "siebzehn", "achtzehn", "neunzehn"
      ]
      NOMINATIVE = [
        "", "ein", "zwei", "drei",
        "vier", "fünf", "sechs",
        "sieben", "acht", "neun"
      ]
      break
  }
}

function isLastNumber(number, slice = 1) {
  number = String(number).slice(slice)
  let isLast = true

  for (let i = 0; i < number.length; i++) {
    let isZero = false

    if (number[i] === "0") isZero = true

    isLast = isLast && isZero
  }

  return isLast
}