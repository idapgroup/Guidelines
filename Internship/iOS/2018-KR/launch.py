from __future__ import unicode_literals

import english
# import deutsch
# import ukrainian

CONVERTER_LANG = {
    'en': english.ConvertToEng(),
    # 'de': deutsch.ConvertToDe(),
    # 'ukr': ukrainian.ConvertToUkr()
}

def conv2ord(number, lang):
    converter = CONVERTER_LANG[lang]
    print(converter.to_ordinal(number))


number = int(input("Input a number: "))
print("Enter your language")
print("(en=english, de=deutsch, ukr=ukrainian)")
lang = input()

conv2ord(number, lang)

