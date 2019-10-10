function replaceText(element, text)
{
	if (element != null)
	{
		clearText(element);
		var newNode = document.createTextNode(text);
		element.appendChild(newNode);
	}
}

function clearText(element)
{
	if (element != null)
	{
		if (element.childNodes)
		{
			for (var i = 0; i < element.childNodes.length; i++)
			{
				var subNode = element.childNodes[i];
				element.removeChild(subNode);
			}
		}
	}
}

function getText(element)
{
	var text = "";
	if (element != null)
	{
		if (element.childNodes)
		{
			for (var i = 0; i < element.childNodes.length; i++)
			{
				var childNode = element.childNodes[i];
				if (childNode.nodeValue != null)
				{
					text = text + childNode.nodeValue;
				}
			}
		}
	}
	return text;
}

function insertComma(text)
{
	text = ""+text;
	var nowLocation = text.length;
	while((nowLocation -3)>0)
	{
		nowLocation = nowLocation -3;
		var aStr = text.substring(0, nowLocation);
		var bStr = text.substring(nowLocation);
		text = aStr + "," + bStr;
	}

	return text;
}

function deleteComma(text)
{
	var newText = text.replace(',', '');
	return newText;
}