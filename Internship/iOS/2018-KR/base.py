from __future__ import unicode_literals

from collections import OrderedDict


class Convert_base(object):

    def __init__(self):
        self.cards = OrderedDict()
        self.is_title = False
        self.exclude_title = []

        self.setup()
        self.set_numwords()

        self.MAXVAL = 1000 * list(self.cards.keys())[0]

    def set_numwords(self):
        self.set_high_numwords(self.high_numwords)
        self.set_mid_numwords(self.mid_numwords)
        self.set_low_numwords(self.low_numwords)

    def set_mid_numwords(self, mid):
        for key, val in mid:
            self.cards[key] = val

    def set_low_numwords(self, numwords):
        for word, n in zip(numwords, range(len(numwords) - 1, -1, -1)):
            self.cards[n] = word

    def splitnum(self, value):
        for elem in self.cards:
            if elem > value:
                continue

            out = []
            if value == 0:
                div, mod = 1, 0
            else:
                div, mod = divmod(value, elem)

            if div == 1:
                out.append((self.cards[1], 1))
            else:
                if div == value:
                    return [(div * self.cards[elem], div*elem)]
                out.append(self.splitnum(div))

            out.append((self.cards[elem], elem))

            if mod:
                out.append(self.splitnum(mod))

            return out

    def to_cardinal(self, value):

        out = ""
        val = self.splitnum(value)
        words, num = self.clean(val)
        return self.title(out + words)

    def clean(self, val):
        out = val
        while len(val) != 1:
            out = []
            left, right = val[:2]
            if isinstance(left, tuple) and isinstance(right, tuple):
                out.append(self.merge(left, right))
                if val[2:]:
                    out.append(val[2:])
            else:
                for elem in val:
                    if isinstance(elem, list):
                        if len(elem) == 1:
                            out.append(elem[0])
                        else:
                            out.append(self.clean(elem))
                    else:
                        out.append(elem)
            val = out
        return out[0]

    def title(self, value):
        if self.is_title:
            out = []
            value = value.split()
            for word in value:
                if word in self.exclude_title:
                    out.append(word)
                else:
                    out.append(word[0].upper() + word[1:])
            value = " ".join(out)
        return value
