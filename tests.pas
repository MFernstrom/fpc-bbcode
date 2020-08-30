unit tests;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testregistry, bbcode;

type

  BBCodeTestCases = class(TTestCase)
  published
    procedure Tests;
  end;

implementation

procedure BBCodeTestCases.Tests;
begin
  AssertEquals('Failed Italic test', '<i>italic</i>', bbcodeToHtml('[i]italic[/i]'));
  AssertEquals('Failed Bold test', '<strong>bold</strong>', bbcodeToHtml('[b]bold[/b]'));
  AssertEquals('Failed Italic test', '<u>italic</u>', bbcodeToHtml('[u]italic[/u]'));
  AssertEquals('Failed Strikethrough test', '<strike>strike</strike>', bbcodeToHtml('[s]strike[/s]'));
  AssertEquals('Failed Code test', '<pre>code</pre>', bbcodeToHtml('[code]code[/code]'));
  AssertEquals('Failed Image test', '<img src="url" alt="" />', bbcodeToHtml('[img]url[/img]'));
  AssertEquals('Failed Quote test', '<blockquote><p>"A Quote"</p></blockquote>', bbcodeToHtml('[quote]A Quote[/quote]'));
  AssertEquals('Failed Quote 2 test', '<blockquote><p>A Quote<br /> - Someone Famous</p></blockquote>', bbcodeToHtml('[quote="Someone Famous"]A Quote[/quote]'));
  AssertEquals('Failed Style size test', '<span style="font-size:20">Big text</span>', bbcodeToHtml('[style size="20"]Big text[/style]'));
  AssertEquals('Failed Style color test', '<span style="color:green;">Green text</span>', bbcodeToHtml('[style color="green"]Green text[/style]'));
  AssertEquals('Failed List test', '<ul><li>', bbcodeToHtml('[list]'));
  AssertEquals('Failed List element test', '</li> <li>', bbcodeToHtml('[*]'));
  AssertEquals('Failed List end test', '</li></ul>', bbcodeToHtml('[/list]'));
  AssertEquals('Failed Table test', '<table style="border:1px solid black;">', bbcodeToHtml('[table]'));
  AssertEquals('Failed Table end test', '</table>', bbcodeToHtml('[/table]'));
  AssertEquals('Failed Table row test', '<tr>', bbcodeToHtml('[tr]'));
  AssertEquals('Failed Table end row test', '</tr>', bbcodeToHtml('[/tr]'));
  AssertEquals('Failed Table data test', '<td>', bbcodeToHtml('[td]'));
  AssertEquals('Failed Table data end test', '</td>', bbcodeToHtml('[/td]'));
  AssertEquals('Failed url test', '<a href="http://google.com" target="_blank">http://google.com</a>', bbcodeToHtml('[url]http://google.com[/url]'));
end;



initialization

  RegisterTest(BBCodeTestCases);
end.

