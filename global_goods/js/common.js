// 문자열 앞뒤 공백제거
function trim(str)
{
	var count = str.length;
	var len = count;
	var st = 0;

	while ((st < len) && (str.charAt(st) <= ' '))
	{
		st++;
	}
	while ((st < len) && (str.charAt(len - 1) <= ' '))
	{
		len--;
	}
	return ((st > 0) || (len < count)) ? str.substring(st, len) : str ;   
}

// 영문 또는 숫자 체크
function isEngNum(orgNum)
{
	var oxEngNum = false;
	for(x=0; x<orgNum.length; x++)
	{
		n = orgNum.substring(x, x+1);
		if(n!="0" && n!="1" && n!="2" && n!="3" && n!="4" && n!="5" && n!="6" && n!="7" && n!="8" && n!="9"
			&& n!="a" && n!="b" && n!="c" && n!="d" && n!="e" && n!="f" && n!="g" && n!="h" && n!="i" && n!="j"
			&& n!="k" && n!="l" && n!="m" && n!="n" && n!="o" && n!="p" && n!="q" && n!="r" && n!="s" && n!="t"
			&& n!="u" && n!="v" && n!="w" && n!="x" && n!="y" && n!="z")
		{
			oxEngNum = true;
			break;
		}
	}
	return oxEngNum;
}

// 이메일 포함 문자 체크
function isEmailChar(orgChar)
{
	var oxEmailChar = false;
	for(x=0; x<orgChar.length; x++)
	{
		n = orgChar.substring(x, x+1);
		if(n!="0" && n!="1" && n!="2" && n!="3" && n!="4" && n!="5" && n!="6" && n!="7" && n!="8" && n!="9"
			&& n!="a" && n!="b" && n!="c" && n!="d" && n!="e" && n!="f" && n!="g" && n!="h" && n!="i" && n!="j"
			&& n!="k" && n!="l" && n!="m" && n!="n" && n!="o" && n!="p" && n!="q" && n!="r" && n!="s" && n!="t"
			&& n!="u" && n!="v" && n!="w" && n!="x" && n!="y" && n!="z" && n!="@" && n!=".")
		{
			oxEmailChar = true;
			break;
		}
	}
	return oxEmailChar;
}

// 숫자 체크
function isNum(orgNum)
{
	var oxNum = true;
	for(x=0; x<orgNum.length; x++)
	{
		n = orgNum.substring(x, x+1);
		if(n!="0" && n!="1" && n!="2" && n!="3" && n!="4" && n!="5" && n!="6" && n!="7" && n!="8" && n!="9")
		{
			oxNum = false;
			break;
		}
	}
	return oxNum;
}

//이미지조절
$(document).ready(function(){
	
	

});