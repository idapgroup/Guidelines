#include "stdafx.h"
#include <string.h>
#include <iostream>
#include <stdio.h>
#include <conio.h>

class ConvertToUkrainian {
public: 
	bool check = false;
	char* ConvertToUa(long long int x) 
{
	char arr[1000];
	char *ukr = arr;
	const char *c[] = { "","один","два","три","чотири","п'€ть","ш≥сть","с≥м","в≥с≥м","дев'€ть","дес€ть", "одинадц€ть", "дванадц€ть","тринадц€ть","чотирнадц€ть","п'€тнадц€ть","ш≥стнадц€ть","с≥мнадц€ть","в≥с≥мнадц€ть", "дев'€тнадц€ть" };
	const char *d[] = { "нульовий","перший","другий","трет≥й","четвертий","п'€тий","шостий","сьомий","восьмий","дев'€тий","дес€тий", };
	const char *des[] = { " "," ","двадц€тий","тридц€тий","сороковий","п'€тидес€тий","шестидес€тий","семидес€тий","восьмидес€тий","дев'€ностий", "" };
	const char *dec[] = { " "," ","двадц€ть","тридц€ть","сорок","п'€тдес€т","ш≥стдес€т","с≥мдес€т","в≥с≥мдес€т","дев'€носто", "" };
	const char *sot[] = { " ","сотий","двухсотий","трьохсотий","чотирьохсотий","п'€тисотий","ш≥стсотий","семисотий","восьмисотий","дев'€тисотий", "" };
	const char *sog[] = { " ","сто","дв≥ст≥","триста","чотириста","п'€тьсот","ш≥стсот","с≥мсот","в≥с≥мсот","дев'€тсот", "" };
	const char *thou[] = { "","одно","двох","трьох","чотирьох","п'€ти","шести","семи","восьми","дев'€ти","дес€ти", "одинадц€ти", "дванадц€ти","тринадц€ти","чотирнадц€ти","п'€тнадц€ти","ш≥стнадц€ти","с≥мнадц€ти","в≥с≥мнадц€ти", "дев'€тнадц€ти" };
	const char *thous[] = { " ","дес€ти","двадц€ти","тридц€ти","сорока","п'€тдес€ти","ш≥стдес€ти","с≥мдес€ти","восьмидес€ти","дев'€носто" };
	if (x <= 10) {
		ukr += sprintf(ukr, "%s ", d[x]);
		return _strdup(arr);
	}
	if (x >= 1000000000000) {
		long long int h = x;
		check = true;
		if ((h % 1000000000000) == 0) {
			x /= 1000000000000;
			if (x >= 100 && x <= 999) {
				int j = x;
				x /= 100;
				ukr += sprintf(ukr, "%s ", sog[x]);
				if ((j %= 100) == 0) {
					ukr += sprintf(ukr, "трильйонний");
					j = 0;
					x = 0;
				}
				if (j >= 20 && j <= 99) {
					int Full = j / 10;
					int Ost = j % 10;
					ukr += sprintf(ukr, "%s ", thous[Full]);
					ukr += sprintf(ukr, "%s ", thou[Ost]);
					ukr += sprintf(ukr, "трильйонний");
					j = 0;
					x = 0;
				}
				if (j >= 1 && j <= 19) {
					if (j == 1) {
						ukr += sprintf(ukr, "%s ", thou[j]);
						ukr += sprintf(ukr, "трильйонний");
						return _strdup(arr);
					}
					else {
						ukr += sprintf(ukr, "%s ", thou[j]);
						ukr += sprintf(ukr, "трильйонний");
					}
					j = 0;
					x = 0;
				}
			}
			if (x >= 20 && x <= 99) {
				int Full = x / 10;
				int Ost = x % 10;
				ukr += sprintf(ukr, "%s ", thous[Full]);
				ukr += sprintf(ukr, "%s ", thou[Ost]);
				ukr += sprintf(ukr, "трильйонний");
				x = 0;
			}
			if (x >= 1 && x <= 19) {
				if (x == 1) {
					ukr += sprintf(ukr, "%s ", thou[x - 1]);
					ukr += sprintf(ukr, "трильйонний");
					return _strdup(arr);
				}
				else {
					ukr += sprintf(ukr, "%s ", thou[x]);
					ukr += sprintf(ukr, "трильйонний");
				}
				x = 0;
			}
		}
		else {
			h /= 1000000000000;
			long long int q = h;
			if (q >= 100 && q <= 999) {
				q /= 100;
				ukr += sprintf(ukr, "%s ", sog[q]);
				h %= 100;
			}
			if (h >= 20 && h <= 99) {
				int Full = h / 10;
				int Ost = h % 10;
				if (Ost == 1) {
					ukr += sprintf(ukr, "%s ", dec[Full]);
					ukr += sprintf(ukr, "один ");
					ukr += sprintf(ukr, "трильйон ");
				}
				if (Ost >= 2 && Ost <= 4) {
					ukr += sprintf(ukr, "%s ", dec[Full]);
					ukr += sprintf(ukr, "%s ", c[Ost]);
					ukr += sprintf(ukr, "трильйони ");
				}
				if (Ost >= 5 && Ost <= 99) {
					ukr += sprintf(ukr, "%s ", dec[Full]);
					ukr += sprintf(ukr, "%s ", c[Ost]);
					ukr += sprintf(ukr, "трильйонiв ");
				}
				if (Ost == 0) {
					ukr += sprintf(ukr, "%s ", dec[Full]);
					ukr += sprintf(ukr, "трильйонiв ");
				}
				x %= 1000000000000;
			}
			if (h >= 1 && h <= 19) {
				if (h == 1) {
					ukr += sprintf(ukr, "один ");
					ukr += sprintf(ukr, "трильйон ");
					x %= 1000000000000;
				}
				if (h >= 2 && h <= 4) {
					ukr += sprintf(ukr, "%s ", dec[h]);
					ukr += sprintf(ukr, "%s ", c[h]);
					ukr += sprintf(ukr, "трильйони ");
					x %= 1000000000000;
				}
				if (h >= 5 && h <= 19) {
					ukr += sprintf(ukr, "%s ", c[h]);
					ukr += sprintf(ukr, "трильйонiв ");
					x %= 1000000000000;
				}
			}
		}
	}
	if (x >= 1000000000) {
		long long int h = x;
		check = true;
		if ((h % 1000000000) == 0) {
			x /= 1000000000;
			if (x >= 100 && x <= 999) {
				int j = x;
				x /= 100;
				ukr += sprintf(ukr, "%s ", sog[x]);
				if ((j %= 100) == 0) {
					ukr += sprintf(ukr, "мiль€рдний");
					j = 0;
					x = 0;
				}
				if (j >= 20 && j <= 99) {
					int Full = j / 10;
					int Ost = j % 10;
					ukr += sprintf(ukr, "%s ", thous[Full]);
					ukr += sprintf(ukr, "%s ", thou[Ost]);
					ukr += sprintf(ukr, "мiль€рдний");
					j = 0;
					x = 0;
				}
				if (j >= 1 && j <= 19) {
					if (j == 1) {
						ukr += sprintf(ukr, "%s ", thou[j]);
						ukr += sprintf(ukr, "мiль€рдний");
						return _strdup(arr);
					}
					else {
						ukr += sprintf(ukr, "%s ", thou[j]);
						ukr += sprintf(ukr, "мiль€рдний");
					}
					j = 0;
					x = 0;
				}
			}
			if (x >= 20 && x <= 99) {
				int Full = x / 10;
				int Ost = x % 10;
				ukr += sprintf(ukr, "%s ", thous[Full]);
				ukr += sprintf(ukr, "%s ", thou[Ost]);
				ukr += sprintf(ukr, "мiль€рдний");
				x = 0;
			}
			if (x >= 1 && x <= 19) {
				if (x == 1) {
					ukr += sprintf(ukr, "%s ", thou[x - 1]);
					ukr += sprintf(ukr, "мiль€рдний");
					return _strdup(arr);
				}
				else {
					ukr += sprintf(ukr, "%s ", thou[x]);
					ukr += sprintf(ukr, "мiль€рдний");
				}
				x = 0;
			}
		}
		else {
			h /= 1000000000;
			long long int q = h;
			if (q >= 100 && q <= 999) {
				q /= 100;
				ukr += sprintf(ukr, "%s ", sog[q]);
				h %= 100;
			}
			if (h >= 20 && h <= 99) {
				int Full = h / 10;
				int Ost = h % 10;
				if (Ost == 1) {
					ukr += sprintf(ukr, "%s ", dec[Full]);
					ukr += sprintf(ukr, "один ");
					ukr += sprintf(ukr, "мiль€рд ");
				}
				if (Ost >= 2 && Ost <= 4) {
					ukr += sprintf(ukr, "%s ", dec[Full]);
					ukr += sprintf(ukr, "%s ", c[Ost]);
					ukr += sprintf(ukr, "мiль€рди ");
				}
				if (Ost >= 5 && Ost <= 99) {
					ukr += sprintf(ukr, "%s ", dec[Full]);
					ukr += sprintf(ukr, "%s ", c[Ost]);
					ukr += sprintf(ukr, "мiль€рдiв ");
				}
				if (Ost == 0) {
					ukr += sprintf(ukr, "%s ", dec[Full]);
					ukr += sprintf(ukr, "мiль€рдiв ");
				}
				x %= 1000000000;
			}
			if (h >= 1 && h <= 19) {
				if (h == 1) {
					ukr += sprintf(ukr, "один ");
					ukr += sprintf(ukr, "мiль€рд ");
					x %= 1000000000;
				}
				if (h >= 2 && h <= 4) {
					ukr += sprintf(ukr, "%s ", dec[h]);
					ukr += sprintf(ukr, "%s ", c[h]);
					ukr += sprintf(ukr, "мiль€рди ");
					x %= 1000000000;
				}
				if (h >= 5 && h <= 19) {
					ukr += sprintf(ukr, "%s ", c[h]);
					ukr += sprintf(ukr, "мiль€рдiв ");
					x %= 1000000000;
				}
			}
		}
	}
	if (x >= 1000000) {
		int h = x;
		check = true;
		if ((h % 1000000) == 0) {
			x /= 1000000;
			if (x >= 100 && x <= 999) {
				int j = x;
				x /= 100;
				ukr += sprintf(ukr, "%s ", sog[x]);
				if ((j %= 100) == 0) {
					ukr += sprintf(ukr, "мiльйонний");
					j = 0;
					x = 0;
				}
				if (j >= 20 && j <= 99) {
					int Full = j / 10;
					int Ost = j % 10;
					ukr += sprintf(ukr, "%s ", thous[Full]);
					ukr += sprintf(ukr, "%s ", thou[Ost]);
					ukr += sprintf(ukr, "мiльйонний");
					j = 0;
					x = 0;
				}
				if (j >= 1 && j <= 19) {
					if (j == 1) {
						ukr += sprintf(ukr, "%s ", thou[j]);
						ukr += sprintf(ukr, "мiльйонний");
						return _strdup(arr);
					}
					else {
						ukr += sprintf(ukr, "%s ", thou[j]);
						ukr += sprintf(ukr, "мiльйонний");
					}
					j = 0;
					x = 0;
				}
			}
			if (x >= 20 && x <= 99) {
				int Full = x / 10;
				int Ost = x % 10;
				ukr += sprintf(ukr, "%s ", thous[Full]);
				ukr += sprintf(ukr, "%s ", thou[Ost]);
				ukr += sprintf(ukr, "мiльйонний");
				x = 0;
			}
			if (x >= 1 && x <= 19) {
				if (x == 1) {
					ukr += sprintf(ukr, "%s ", thou[x - 1]);
					ukr += sprintf(ukr, "мiльйонний");
					return _strdup(arr);
				}
				else {
					ukr += sprintf(ukr, "%s ", thou[x]);
					ukr += sprintf(ukr, "мiльйонний");
				}
				x = 0;
			}
		}
		else {
			h /= 1000000;
			int q = h;
			if (q >= 100 && q <= 999) {
				q /= 100;
				ukr += sprintf(ukr, "%s ", sog[q]);
				h %= 100;
			}
			if (h >= 20 && h <= 99) {
				int Full = h / 10;
				int Ost = h % 10;
				if (Ost == 1) {
					ukr += sprintf(ukr, "%s ", dec[Full]);
					ukr += sprintf(ukr, "один ");
					ukr += sprintf(ukr, "мiльйон ");
				}
				if (Ost >= 2 && Ost <= 4) {
					ukr += sprintf(ukr, "%s ", dec[Full]);
					ukr += sprintf(ukr, "%s ", c[Ost]);
					ukr += sprintf(ukr, "мiльйони ");
				}
				if (Ost >= 5 && Ost <= 99) {
					ukr += sprintf(ukr, "%s ", dec[Full]);
					ukr += sprintf(ukr, "%s ", c[Ost]);
					ukr += sprintf(ukr, "мiльйонiв ");
				}
				if (Ost == 0) {
					ukr += sprintf(ukr, "%s ", dec[Full]);
					ukr += sprintf(ukr, "мiльйонiв ");
				}
				x %= 1000000; // ok
			}
			if (h >= 1 && h <= 19) {
				if (h == 1) {
					ukr += sprintf(ukr, "один ");
					ukr += sprintf(ukr, "мiльйон ");
					x %= 1000000;
				}
				if (h >= 2 && h <= 4) {
					ukr += sprintf(ukr, "%s ", dec[h]);
					ukr += sprintf(ukr, "%s ", c[h]);
					ukr += sprintf(ukr, "мiльйони ");
					x %= 1000000;
				}
				if (h >= 5 && h <= 19) {
					ukr += sprintf(ukr, "%s ", c[h]);
					ukr += sprintf(ukr, "мiльйонiв ");
					x %= 1000000;
				}
			}
		}
	}
	if (x >= 1000) {
		int h = x;
		check = true;
		if ((h % 1000) == 0) {
			x /= 1000;
			if (x >= 100 && x <= 999) {
				int j = x;
				x /= 100;
				ukr += sprintf(ukr, "%s ", sog[x]);
				if ((j %= 100) == 0) {
					ukr += sprintf(ukr, "тис€чний");
					j = 0;
					x = 0;
				}
				if (j >= 20 && j <= 99) {
					int Full = j / 10;
					int Ost = j % 10;
					ukr += sprintf(ukr, "%s ", thous[Full]);
					ukr += sprintf(ukr, "%s ", thou[Ost]);
					ukr += sprintf(ukr, "тис€чний");
					j = 0;
					x = 0;
				}
				if (j >= 1 && j <= 19) {
					if (j == 1) {
						ukr += sprintf(ukr, "%s ", thou[j]);
						ukr += sprintf(ukr, "тис€чний");
						return _strdup(arr);
					}
					else {
						ukr += sprintf(ukr, "%s ", thou[j]);
						ukr += sprintf(ukr, "тис€чний");
					}
					j = 0;
					x = 0;
				}
			}
			if (x >= 20 && x <= 99) {
				int Full = x / 10;
				int Ost = x % 10;
				ukr += sprintf(ukr, "%s ", thous[Full]);
				ukr += sprintf(ukr, "%s ", thou[Ost]);
				ukr += sprintf(ukr, "тис€чний");
				x = 0;
			}
			if (x >= 1 && x <= 19) {
				if (x == 1) {
					ukr += sprintf(ukr, "%s ", thou[x - 1]);
					ukr += sprintf(ukr, "тис€чний");
					return _strdup(arr);
				}
				else {
					ukr += sprintf(ukr, "%s ", thou[x]);
					ukr += sprintf(ukr, "тис€чний");
				}
				x = 0;
			}
		}
		else {
			h /= 1000;
			int q = h;
			if (q >= 100 && q <= 999) {
				q /= 100;
				ukr += sprintf(ukr, "%s ", sog[q]);
				h %= 100;
			}
			if (h >= 20 && h <= 99) {
				int Full = h / 10;
				int Ost = h % 10;
				if (Ost == 1) {
					ukr += sprintf(ukr, "%s ", dec[Full]);
					ukr += sprintf(ukr, "одна ");
					ukr += sprintf(ukr, "тис€ча ");
				}
				if (Ost >= 2 && Ost <= 4) {
					ukr += sprintf(ukr, "%s ", dec[Full]);
					Ost == 2 ? ukr += sprintf(ukr, "двi ") : ukr += sprintf(ukr, "%s ", c[Ost]);
					ukr += sprintf(ukr, "тис€чi ");
				}
				if (Ost >= 5 && Ost <= 99) {
					ukr += sprintf(ukr, "%s ", dec[Full]);
					ukr += sprintf(ukr, "%s ", c[Ost]);
					ukr += sprintf(ukr, "тис€ч ");
				}
				if (Ost == 0) {
					ukr += sprintf(ukr, "%s ", dec[Full]);
					ukr += sprintf(ukr, "тис€ч ");
				}
				x %= 1000;
			}
			if (h >= 1 && h <= 19) {
				if (h == 1) {
					ukr += sprintf(ukr, "одна ");
					ukr += sprintf(ukr, "тис€ча ");
					x %= 1000;
				}
				if (h >= 2 && h <= 4) {
					h == 2 ? ukr += sprintf(ukr, "двi ") : ukr += sprintf(ukr, "%s ", c[h]);
					ukr += sprintf(ukr, "тис€чi ");
					x %= 1000;
				}
				if (h >= 5 && h <= 19) {
					ukr += sprintf(ukr, "%s ", c[h]);
					ukr += sprintf(ukr, "тис€ч ");
					x %= 1000;
				}
			}
		}
	}
	if (x >= 100) {
		int n = x;
		if ((n % 100) == 0) {
			x /= 100;
			ukr += sprintf(ukr, "%s ", sot[x]);
		}
		else {
			ukr += sprintf(ukr, "%s ", sog[x / 100]);
			x %= 100;
			if (x <= 10) {
				ukr += sprintf(ukr, d[x]);
				return _strdup(arr);
			}
		}
		check = false;
	}
	if (x >= 20) {
		int z = x;
		if ((z %= 10) == 0) {
			x /= 10;
			ukr += sprintf(ukr, "%s ", des[x]);
		}
		else {
			x /= 10;
			ukr += sprintf(ukr, "%s ", dec[x]);
			z %= 10;
			ukr += sprintf(ukr, "%s ", d[z]);
		}
	}
	if (x >= 11) {
		x %= 10;
		switch (x) {
		case 1: ukr += sprintf(ukr, "оди"); break;
		case 4: ukr += sprintf(ukr, "чотир"); break;
		case 5: ukr += sprintf(ukr, "п'€т"); break;
		case 6: ukr += sprintf(ukr, "шiст"); break;
		case 9: ukr += sprintf(ukr, "дев'€т"); break;
		default: ukr += sprintf(ukr, c[x]);
		}
		ukr += sprintf(ukr, "надц€тий");
	}
	else if (x > 0)
		if (check == true)
		{
			ukr += sprintf(ukr, "%s ", d[x]);
			return _strdup(arr);
		}
	return _strdup(arr);
}
};
