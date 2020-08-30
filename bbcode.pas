unit bbcode;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, regexpr;

function bbcodeToHtml(bbcode: String): String;

implementation

function bbcodeToHtml(bbcode: String): String;
begin
  result := bbcode;
  result := ReplaceRegExpr('\[i\](.*?)\[\/i\]', result,'<i>$1</i>', true);
  result := ReplaceRegExpr('\[b\](.*?)\[\/b\]', result,'<strong>$1</strong>', true);
  result := ReplaceRegExpr('\[u\](.*?)\[\/u\]', result,'<u>$1</u>', true);
  result := ReplaceRegExpr('\[s\](.*?)\[\/s\]', result,'<strike>$1</strike>', true);
  result := ReplaceRegExpr('\[code\](.*?)\[\/code\]', result,'<pre>$1</pre>', true);
  result := ReplaceRegExpr('\[img\](.*?)\[\/img\]', result,'<img src="$1" alt="" />', true);
  result := ReplaceRegExpr('\[quote\](.*?)\[\/quote\]', result,'<blockquote><p>"$1"</p></blockquote>', true);
  result := ReplaceRegExpr('\[quote="(.*?)"\](.*?)\[\/quote\]', result,'<blockquote><p>$2<br /> - $1</p></blockquote>', true);
  result := ReplaceRegExpr('\[style size="(.*?)"\](.*?)\[\/style\]', result,'<span style="font-size:$1">$2</span>', true);
  result := ReplaceRegExpr('\[style color="(.*?)"\](.*?)\[\/style\]', result, '<span style="color:$1;">$2</span>', true);
  result := ReplaceRegExpr('\[list\]', result, '<ul><li>', true);
  result := ReplaceRegExpr('\[\*\]', result, '</li> <li>', true);
  result := ReplaceRegExpr('\[\/list\]', result, '</li></ul>', true);
  result := ReplaceRegExpr('\[table\]', result, '<table style="border:1px solid black;">', true);
  result := ReplaceRegExpr('\[\/table\]', result, '</table>', true);
  result := ReplaceRegExpr('\[tr\]', result, '<tr>', true);
  result := ReplaceRegExpr('\[\/tr\]', result, '</tr>', true);
  result := ReplaceRegExpr('\[td\]', result, '<td>', true);
  result := ReplaceRegExpr('\[\/td\]', result, '</td>', true);
  result := ReplaceRegExpr('\[url\](?:http(s)?:\/\/)?(.*?)\[\/url\]', result, '<a href="http$1://$2" target="_blank">http$1://$2</a>', true);
end;

end.

