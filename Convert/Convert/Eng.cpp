#include "stdafx.h"
#include <string.h>
#include <iostream>
#include <stdio.h>
#include <conio.h>

class ConvertToEnglish {
public: 
	bool check = false;
	char* ConvertToEng(long long int x)
{
	char res[1000];
	char *ptr = res;
	const char *a[] = { "","one","two","three","four","five","six","seven","eight","nine","ten","eleven","twelve" };
	const char *b[] = { "","first","second","third","fourth","fifth","sixth","seventh","eighth","ninth","tenth","eleventh","twelfth" };
	if (x <= 12) {
		if (check == true) {
			ptr += sprintf(ptr, "%s ", a[x]);
			return _strdup(res);
		}
		ptr += sprintf(ptr, "%s ", b[x]);
		return _strdup(res);
	}
	if (x >= 1000000000000) {
		check = true;
		if ((x % 1000000000000) == 0) {
			ptr += sprintf(ptr, ConvertToEng(x / 1000000000000));
			x %= 1000000000000;
			ptr += sprintf(ptr, "trillionth ");
		}
		else {
			ptr += sprintf(ptr, ConvertToEng(x / 1000000000000));
			x %= 1000000000000;
			ptr += sprintf(ptr, "trillion ");
		}
	}
	if (x >= 1000000000) {
		check = true;
		if ((x % 1000000000) == 0) {
			ptr += sprintf(ptr, ConvertToEng(x / 1000000000));
			x %= 1000000000;
			ptr += sprintf(ptr, "billionth ");
		}
		else {
			ptr += sprintf(ptr, ConvertToEng(x / 1000000000));
			x %= 1000000000;
			ptr += sprintf(ptr, "billion ");
		}
	}
	if (x >= 1000000) {
		check = true;
		if ((x % 1000000) == 0) {
			ptr += sprintf(ptr, ConvertToEng(x / 1000000));
			x %= 1000000;
			ptr += sprintf(ptr, "millionth ");
		}
		else {
			ptr += sprintf(ptr, ConvertToEng(x / 1000000));
			x %= 1000000;
			ptr += sprintf(ptr, "million ");
		}
	}
	if (x >= 1000) {
		check = true;
		if ((x % 1000) == 0) {
			ptr += sprintf(ptr, ConvertToEng(x / 1000));
			x %= 1000;
			ptr += sprintf(ptr, "thousandth ");
		}
		else {
			ptr += sprintf(ptr, ConvertToEng(x / 1000));
			x %= 1000;
			ptr += sprintf(ptr, "thousand ");
		}
	}
	if (x >= 100) {
		if ((x % 100) == 0) {
			ptr += sprintf(ptr, "%s ", a[x / 100]);
			x %= 100;
			ptr += sprintf(ptr, "hundredth ");
		}
		else {
			ptr += sprintf(ptr, "%s ", a[x / 100]);
			x %= 100;
			ptr += sprintf(ptr, "hundred ");
		}
	}
	if (x >= 20) {
		switch (x / 10) {
		case 2: ptr += sprintf(ptr, "twen"); break;
		case 3: ptr += sprintf(ptr, "thir"); break;
		case 4: ptr += sprintf(ptr, "for"); break;
		case 5: ptr += sprintf(ptr, "fif"); break;
		case 8: ptr += sprintf(ptr, "eigh"); break;
		default: ptr += sprintf(ptr, a[x / 10]); break;
		}
		(x %= 10) == 0 ? ptr += sprintf(ptr, "tieth ") : ptr += sprintf(ptr, "ty ");
	}
	if (x >= 13) {
		x %= 10;
		switch (x) {
		case 2: ptr += sprintf(ptr, "twen"); break;
		case 3: ptr += sprintf(ptr, "thir"); break;
		case 5: ptr += sprintf(ptr, "fif"); break;
		case 8: ptr += sprintf(ptr, "eigh"); break;
		default: ptr += sprintf(ptr, a[x]);
		}
		ptr += sprintf(ptr, "teenth");
	}
	else if (x > 0)
		if (check == true)
		{
			ptr += sprintf(ptr, "%s ", a[x]);
			return _strdup(res);
		}
	ptr += sprintf(ptr, "%s ", b[x]);
	return _strdup(res);
}
};