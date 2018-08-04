#include "stdafx.h"
#include <string.h>
#include <iostream>
#include <stdio.h>
#include <conio.h>

class ConvertToGermany {
public:	
	bool check = false;
	char* ConvertToGer(long long int x)
{
	{
		char mas[1000];
		char *ger = mas;
		const char *e[] = { "","ein","zwei","drei","vier","fuenf","sechs","sieben","acht","neun","zehn","elf","zwoelf", };
		const char *f[] = { "","erste","zweite","dritte","vierte""funfte","sechste","siebte","achte","neunte","zehnte","elfte","zwolfte", };
		if (x <= 12) {
			if (check == true) {
				ger += sprintf(ger, e[x]);
				return _strdup(mas);
			}
			ger += sprintf(ger, f[x]);
			return _strdup(mas);
		}
		if (x >= 1000000000000) {
			check = true;
			if ((x % 1000000000000) == 0) {
				ger += sprintf(ger, ConvertToGer(x / 1000000000000));
				x %= 1000000000000;
				ger += sprintf(ger, "billionstel");
			}
			else {
				ger += sprintf(ger, ConvertToGer(x / 1000000000000));
				x %= 1000000000000;
				ger += sprintf(ger, "billion");
			}
		}
		if (x >= 1000000000) {
			check = true;
			if ((x % 1000000000) == 0) {
				ger += sprintf(ger, ConvertToGer(x / 1000000000));
				x %= 1000000000;
				ger += sprintf(ger, "milliardstel");
			}
			else {
				ger += sprintf(ger, ConvertToGer(x / 1000000000));
				x %= 1000000000;
				ger += sprintf(ger, "milliarden");
				if (x <= 12) {
					ger += sprintf(ger, e[x]);
					return _strdup(mas);
				}
			}
		}
		if (x >= 1000000) {
			check = true;
			if ((x % 1000000) == 0) {
				ger += sprintf(ger, ConvertToGer(x / 1000000));
				x %= 1000000;
				ger += sprintf(ger, "millionstel");
			}
			else {
				ger += sprintf(ger, ConvertToGer(x / 1000000));
				x %= 1000000;
				ger += sprintf(ger, "million");
				if (x <= 12) {
					ger += sprintf(ger, e[x]);
					return _strdup(mas);
				}
			}
		}
		if (x >= 1000) {
			check = true;
			if ((x % 1000) == 0) {
				ger += sprintf(ger, ConvertToGer(x / 1000));
				x %= 1000;
				ger += sprintf(ger, "tausendstel");
			}
			else {
				ger += sprintf(ger, ConvertToGer(x / 1000));
				x %= 1000;
				ger += sprintf(ger, "tausend");
				if (x <= 12) {
					ger += sprintf(ger, e[x]);
					return _strdup(mas);
				}
			}
		}
		if (x >= 100) {
			if ((x % 100) == 0) {
				ger += sprintf(ger, e[x / 100]);
				x %= 100;
				ger += sprintf(ger, "hunderstel");
			}
			else {
				ger += sprintf(ger, e[x / 100]);
				x %= 100;
				ger += sprintf(ger, "hundert");
				if (x <= 12) {
					ger += sprintf(ger, e[x]);
					return _strdup(mas);
				}
			}
		}
		if (x >= 20) {
			int y = x;
			switch (y %= 10) {
			case 0: break;
			case 1: ger += sprintf(ger, "ein"); break;
			case 5: ger += sprintf(ger, "funf"); break;
			default: ger += sprintf(ger, e[y]); break;
			}
			if (y == 0) {
				x /= 10;
				switch (x) {
				case 2: ger += sprintf(ger, "zwan"); break;
				case 5: ger += sprintf(ger, "funf"); break;
				case 6: ger += sprintf(ger, "sech"); break;
				case 7: ger += sprintf(ger, "sieb"); break;
				default: ger += sprintf(ger, e[x]); break;
				}
				x == 3 ? ger += sprintf(ger, "bigste") : ger += sprintf(ger, "zigste");
			}
			else {
				ger += sprintf(ger, "und");
				x /= 10;
				switch (x) {
				case 2: ger += sprintf(ger, "zwan"); break;
				case 5: ger += sprintf(ger, "funf"); break;
				case 6: ger += sprintf(ger, "sech"); break;
				case 7: ger += sprintf(ger, "sieb"); break;
				default: ger += sprintf(ger, e[x]); break;
				}
				x == 3 ? ger += sprintf(ger, "bigste") : ger += sprintf(ger, "zigste");
			}
		}
		if (x >= 13) {
			x %= 10;
			switch (x) {
			case 5: ger += sprintf(ger, "funf"); break;
			case 6: ger += sprintf(ger, "sech"); break;
			case 7: ger += sprintf(ger, "sieb"); break;
			default: ger += sprintf(ger, e[x]);
			}
			ger += sprintf(ger, "zehnte");
		}
		return _strdup(mas);
	}
}
};