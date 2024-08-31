# Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`namespace `[`DotParse`](#namespaceDotParse) | 
`namespace `[`DotParse::Test`](#namespaceDotParse_1_1Test) | 
`class `[`DotParse::Test::Basic::BasicParser`](#classDotParse_1_1Test_1_1Basic_1_1BasicParser) | 
`class `[`DotParse::Context::ExpressionNode`](#classDotParse_1_1Context_1_1ExpressionNode) | Expression representation to parse infix expressions.
`class `[`DotParse::Context::FloatingPoint`](#classDotParse_1_1Context_1_1FloatingPoint) | 
`class `[`DotParse::Context::FuncParser`](#classDotParse_1_1Context_1_1FuncParser) | 
`class `[`DotParse::Test::Basic::Number`](#classDotParse_1_1Test_1_1Basic_1_1Number) | 
`class `[`DotParse::BinaryOperation::OpVal`](#classDotParse_1_1BinaryOperation_1_1OpVal) | 

# namespace `DotParse` 

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`class `[`DotParse::BinaryOperation`](#classDotParse_1_1BinaryOperation) | BinaryOperation represents expression in the form: Expr ::= Value \| Expr Operation Value This form can not be parsed correctly using simple PEG grammar but this form is very useful for arithmetic expressions parsing, so I decided to include this wrapper here.
`class `[`DotParse::Context`](#classDotParse_1_1Context) | Parse context used to parse data.
`class `[`DotParse::ParseException`](#classDotParse_1_1ParseException) | 
`class `[`DotParse::SourceLocation`](#classDotParse_1_1SourceLocation) | 
`class `[`DotParse::Whitespace`](#classDotParse_1_1Whitespace) | Parser for whitespace characters and comments. It is possible to add your own comment functions to skip different kind of not-standard comments.
`class `[`DotParse::Word`](#classDotParse_1_1Word) | Fast word parsing for PEG.

# class `DotParse::BinaryOperation` 

```
class DotParse::BinaryOperation
  : public DotParse.IPegParsable
```  

BinaryOperation represents expression in the form: Expr ::= Value | Expr Operation Value This form can not be parsed correctly using simple PEG grammar but this form is very useful for arithmetic expressions parsing, so I decided to include this wrapper here.

Actually this class works simple. It parses grammar in form: Expr ::= Value | Value Operation Expr and then reverts the order of operations.

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public `[`BinaryOperation`](#classDotParse_1_1BinaryOperation)`< Val, Op >? `[`Expression`](#classDotParse_1_1BinaryOperation_1a3885593a1d75025465162d4e92352bb3) | 
`public Op `[`Operation`](#classDotParse_1_1BinaryOperation_1a2eb90b090a65ee091f23fb1ecd75a059) | 
`public Val `[`Value`](#classDotParse_1_1BinaryOperation_1ae240bb18c2a6532ee7df1d5cc5d0a6bc) | 
`public inline void `[`PegParse`](#classDotParse_1_1BinaryOperation_1abafeef2559126844153d2330e6a82bdb)`(`[`Context`](#classDotParse_1_1Context)` ctx)` | 

## Members

#### `public `[`BinaryOperation`](#classDotParse_1_1BinaryOperation)`< Val, Op >? `[`Expression`](#classDotParse_1_1BinaryOperation_1a3885593a1d75025465162d4e92352bb3) 

#### `public Op `[`Operation`](#classDotParse_1_1BinaryOperation_1a2eb90b090a65ee091f23fb1ecd75a059) 

#### `public Val `[`Value`](#classDotParse_1_1BinaryOperation_1ae240bb18c2a6532ee7df1d5cc5d0a6bc) 

#### `public inline void `[`PegParse`](#classDotParse_1_1BinaryOperation_1abafeef2559126844153d2330e6a82bdb)`(`[`Context`](#classDotParse_1_1Context)` ctx)` 

# class `DotParse::Context` 

Parse context used to parse data.

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`{property} string? `[`Filename`](#classDotParse_1_1Context_1a9fc6aac1cd856a5256d711b68ac133a2) | Name of the current file.
`public string `[`Source`](#classDotParse_1_1Context_1af9a6a844549a822e98e8fc15dbe388f8) | Source string that is parsed now.
`public int `[`Position`](#classDotParse_1_1Context_1ab3fc79d47662ed56d06594622147ab90) | Position in the source string.
`public `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)`? `[`WS`](#classDotParse_1_1Context_1a5cddf6aac3a2768562d049115a97044c) | Whitespace parser. It can be set in constructor or you can use any IPegParsable to parse it.
`public inline  `[`Context`](#classDotParse_1_1Context_1a896088785940446d6b69061c3dc629e0)`(string source)` | Create context to parse source string.
`public inline  `[`Context`](#classDotParse_1_1Context_1acb147c9d6985e206e96c7cd9c112f5ee)`(string source,string filename)` | Create context to parse source string.
`public inline  `[`Context`](#classDotParse_1_1Context_1a81a3b7475a5af770f76c4867b94a2046)`(string source,`[`Whitespace.Skip`](#classDotParse_1_1Whitespace_1ab64a4f672956e9dec2b29b4dfc4c523b)` skip)` | Create context to parse source string with whitespace specification.
`public inline  `[`Context`](#classDotParse_1_1Context_1a5eaa919debc323b525f98d365c82701b)`(string source,string filename,`[`Whitespace.Skip`](#classDotParse_1_1Whitespace_1ab64a4f672956e9dec2b29b4dfc4c523b)` skip)` | Create context to parse source string with whitespace specification.
`public inline bool `[`Parse`](#classDotParse_1_1Context_1a2e46ee576035a9c8c35493d9e11c5856)`(`[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` parser)` | Parse source string using parser. This method can be used in grammar to apply subparsers.
`public inline void `[`SkipWS`](#classDotParse_1_1Context_1af934acfcac509920b888ff4de7521ce9)`()` | Skip whitespace characters in source string.
`public inline string `[`Combine`](#classDotParse_1_1Context_1a24787c93a67a5ae0b8dde8b340cac63e)`(`[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` parser,`[`Whitespace.Skip`](#classDotParse_1_1Whitespace_1ab64a4f672956e9dec2b29b4dfc4c523b)`? overrideSkip)` | Function parses content using parser, but returns string from beginning position to end position. This function is a faster alternative for Regex.
`public inline string `[`Combine< T >`](#classDotParse_1_1Context_1a3b813526eaae205ec971cedef423219f)`(`[`Whitespace.Skip`](#classDotParse_1_1Whitespace_1ab64a4f672956e9dec2b29b4dfc4c523b)`? overrideSkip)` | Function parses content using parser, but returns string from beginning position to end position. This function is a faster alternative for Regex.
`public inline void `[`Error`](#classDotParse_1_1Context_1a047d55452620c646601beeed89576999)`(string msg)` | Throw exception at current position.
`public inline void `[`NotEOF`](#classDotParse_1_1Context_1ae7e3a2cba7d0c1a3493e54f04e7a81f9)`()` | Check that it is not end of the string.
`public inline void `[`EOF`](#classDotParse_1_1Context_1a271f553702a5cb28342608390d113a90)`()` | Check that it is the end of the string.
`public inline void `[`Literal`](#classDotParse_1_1Context_1ac74d16ae2dc05849061c76409e9f46cd)`(string literal)` | Parse literal. That means parser sees this literal at current position and eats it.
`public inline void `[`Literals`](#classDotParse_1_1Context_1a5955ccc6bb003ebc65572e959f3b1818)`(out string val,params string[] literals)` | Parse some of literals. This is the same as writing FirstOf with list of literals, but shorter.
`public inline void `[`Keyword`](#classDotParse_1_1Context_1ab73abc7a3c675889a6fb46bf3fcaddd8)`(string keyword)` | Parse keyword. Keyword is like literal but after the word we should see non-character symbol.
`public inline void `[`Word`](#classDotParse_1_1Context_1a864e7e69b016e00d2b68312989527dcb)`(`[`Word`](#classDotParse_1_1Word)` word,out string dst)` | Parse word defined by word object.
`public inline void `[`Regex`](#classDotParse_1_1Context_1af493a5a218c380b7d0ac9f7a090f70a9)`(System.Text.RegularExpressions.Regex regex,out string dst)` | Parse string based on regular expression.
`public inline void `[`Regex`](#classDotParse_1_1Context_1a4c5eab885ac50bfffa8a2b737ac15fba)`(System.Text.RegularExpressions.Regex regex)` | Parse string based on regular expression.
`public inline void `[`Regex`](#classDotParse_1_1Context_1ab891c786eaa49f7a35c0934af3e8a62e)`(string regex,out string dst)` | Parse string based on regular expression. It is not recomended to use this function, it is better to compile regular expression before usage.
`public inline void `[`Regex`](#classDotParse_1_1Context_1ab56421e60513abfa34ff2b596652911e)`(string regex)` | Parse string based on regular expression. It is not recomended to use this function, it is better to compile regular expression before usage.
`public inline void `[`Double`](#classDotParse_1_1Context_1a065d5264bf811bbff430eb6b6bdb3006)`(out double dst)` | Parse floating point number and return double precision value.
`public inline double `[`Double`](#classDotParse_1_1Context_1a66b3b335781dc0fa7d6046c10ed842a3)`()` | Parse floating point number and return double precision value.
`public inline void `[`FirstOf`](#classDotParse_1_1Context_1a6a69d47b4da73b88bdd0f60dd8ea424a)`(out int index,params `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` parsables)` | Try all parsers and return the first successful result.
`public inline `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` `[`FirstOf`](#classDotParse_1_1Context_1a51509d18b6e2bf4fe6fa543c99fb077f)`(out int index,params `[`Func](#classDotParse_1_1Context_1a4d73271dc85c1fd977eb309841e09920)< [IPegParsable`](#interfaceDotParse_1_1IPegParsable)` >[] parsables)` | Try all parsers and return the first successful result.
`public inline `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` `[`Union< T1, T2 >`](#classDotParse_1_1Context_1a300050d256f415ff00c097c22884aa14)`(out int index)` | Try all parsers and return the first successful result. This function allows to not create all the possible options to parse them.
`public inline `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` `[`Union< T1, T2, T3 >`](#classDotParse_1_1Context_1afce3b1b90ebeb9b8ebecdd9d401eb73c)`(out int index)` | Try all parsers and return the first successful result. This function allows to not create all the possible options to parse them.
`public inline `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` `[`Union< T1, T2, T3, T4 >`](#classDotParse_1_1Context_1a5f38482058e7a8e60820463bcd43648e)`(out int index)` | Try all parsers and return the first successful result. This function allows to not create all the possible options to parse them.
`public inline `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` `[`Union< T1, T2, T3, T4, T5 >`](#classDotParse_1_1Context_1abe9eb7b94c15f2b211d8e933e34cabc4)`(out int index)` | Try all parsers and return the first successful result. This function allows to not create all the possible options to parse them.
`public inline `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` `[`Union< T1, T2, T3, T4, T5, T6 >`](#classDotParse_1_1Context_1aa358371796c151cf84a6b127dbbb5844)`(out int index)` | Try all parsers and return the first successful result. This function allows to not create all the possible options to parse them.
`public inline `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` `[`Union< T1, T2, T3, T4, T5, T6, T7 >`](#classDotParse_1_1Context_1a112c59689c14df6585b71fd00ff0fcf0)`(out int index)` | Try all parsers and return the first successful result. This function allows to not create all the possible options to parse them.
`public inline `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` `[`Union< T1, T2, T3, T4, T5, T6, T7, T8 >`](#classDotParse_1_1Context_1a5edc17e68d45a96390140a1c6c5c7dd5)`(out int index)` | Try all parsers and return the first successful result. This function allows to not create all the possible options to parse them.
`public inline `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` `[`Union< T1, T2, T3, T4, T5, T6, T7, T8, T9 >`](#classDotParse_1_1Context_1a7098a764bbea49130c40cbe27cc45b4e)`(out int index)` | Try all parsers and return the first successful result. This function allows to not create all the possible options to parse them.
`public inline `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` `[`Union< T1, T2, T3, T4, T5, T6, T7, T8, T9, T10 >`](#classDotParse_1_1Context_1a65b73000ab1612b2e3892b0311d5103b)`(out int index)` | Try all parsers and return the first successful result. This function allows to not create all the possible options to parse them.
`public inline void `[`Optional`](#classDotParse_1_1Context_1a638c7d76ef0722ecc0e06b696bbbf5eb)`(`[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` parser)` | Parse optional value.
`public inline T? `[`Optional< T >`](#classDotParse_1_1Context_1afd17c7f61190cd6f7024b34ea3ba52d6)`()` | Parse optional value. If parser fails returns null.
`public inline bool `[`OptionalLiteral`](#classDotParse_1_1Context_1a93ffd3088261baa9fe9791adc6eb21ae)`(string literal)` | Parse optional literal at position.
`public inline bool `[`OptionalFunc`](#classDotParse_1_1Context_1a828fac1fac8f7c09676e30c9d10b1047)`(Action< `[`Context`](#classDotParse_1_1Context)` > func)` | Parse optional using function at position. This is a shortcut of using context.Optional(context.Func(func)), but faster.
`public inline void `[`One`](#classDotParse_1_1Context_1afcd6cae3f6f348aaba840429cf05c8f4)`(`[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` parser)` | Parse value defined by parser. This function is a recomended way to parse something inside parsers.
`public inline T `[`One< T >`](#classDotParse_1_1Context_1a2de6c178298064ad9ed3d33b653fd059)`()` | Parse value defined by parser. This function is a recomended way to parse something inside parsers.
`public inline void `[`FollowedBy`](#classDotParse_1_1Context_1abf28ab00f6fa12b37bd262e9f219098b)`(`[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` parser)` | Check that type T is parsable on the position.
`public inline void `[`FollowedBy< T >`](#classDotParse_1_1Context_1a7c169a60654727f8d9c789d5b6741800)`()` | Check that type T is parsable on the position.
`public inline void `[`NotAny`](#classDotParse_1_1Context_1ae827cef5467236d8e8d4724b779c6959)`(`[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` parser)` | Check that type T is not parsable on the position.
`public inline void `[`NotAny< T >`](#classDotParse_1_1Context_1aebdf6a452e1bda34c9dd61702b52863a)`()` | Check that type T is not parsable on the position.
`public inline void `[`Repeated< T >`](#classDotParse_1_1Context_1a3c83b74b0940d6b46dea3545b48a0e62)`(List< T > dst,int minCount,int maxCount)` | Apply parser several times.
`public inline void `[`ZeroOrMore< T >`](#classDotParse_1_1Context_1a5965b8150799530ad560094d237829e9)`(List< T > dst)` | Apply parser zero or more times.
`public inline void `[`OneOrMore< T >`](#classDotParse_1_1Context_1a30923ea5186842e0d9c1a28a4ebfa303)`(List< T > dst)` | Apply parser one or more times.
`public inline void `[`DelimitedList< T >`](#classDotParse_1_1Context_1a9fcf7293b7fd209621344045818876ba)`(List< T > dst,`[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` separator)` | Parse list of elements divided by separator.
`public inline void `[`DelimitedList< T >`](#classDotParse_1_1Context_1a732d8666e3476d33b1af39bdb18c5a11)`(List< T > dst,string separator)` | Parse list of elements divided by separator.
`public inline `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` `[`Func`](#classDotParse_1_1Context_1a4d73271dc85c1fd977eb309841e09920)`(Action< `[`Context`](#classDotParse_1_1Context)` > action)` | Simple way to create new parser based on lambda function.
`public inline `[`ExpressionNode`](#classDotParse_1_1Context_1_1ExpressionNode)`< T > `[`Infix< T >`](#classDotParse_1_1Context_1aea5367adff155e4aaf3711fb66f0a204)`(params string[] operations)` | 

## Members

#### `{property} string? `[`Filename`](#classDotParse_1_1Context_1a9fc6aac1cd856a5256d711b68ac133a2) 

Name of the current file.

#### `public string `[`Source`](#classDotParse_1_1Context_1af9a6a844549a822e98e8fc15dbe388f8) 

Source string that is parsed now.

#### `public int `[`Position`](#classDotParse_1_1Context_1ab3fc79d47662ed56d06594622147ab90) 

Position in the source string.

#### `public `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)`? `[`WS`](#classDotParse_1_1Context_1a5cddf6aac3a2768562d049115a97044c) 

Whitespace parser. It can be set in constructor or you can use any IPegParsable to parse it.

#### `public inline  `[`Context`](#classDotParse_1_1Context_1a896088785940446d6b69061c3dc629e0)`(string source)` 

Create context to parse source string.

#### Parameters
* `source` Source string to parse

#### `public inline  `[`Context`](#classDotParse_1_1Context_1acb147c9d6985e206e96c7cd9c112f5ee)`(string source,string filename)` 

Create context to parse source string.

#### Parameters
* `source` Source string to parse

* `filename` Name of the source file

#### `public inline  `[`Context`](#classDotParse_1_1Context_1a81a3b7475a5af770f76c4867b94a2046)`(string source,`[`Whitespace.Skip`](#classDotParse_1_1Whitespace_1ab64a4f672956e9dec2b29b4dfc4c523b)` skip)` 

Create context to parse source string with whitespace specification.

#### Parameters
* `source` Source string to parse

* `skip` Whitespace classes

#### `public inline  `[`Context`](#classDotParse_1_1Context_1a5eaa919debc323b525f98d365c82701b)`(string source,string filename,`[`Whitespace.Skip`](#classDotParse_1_1Whitespace_1ab64a4f672956e9dec2b29b4dfc4c523b)` skip)` 

Create context to parse source string with whitespace specification.

#### Parameters
* `source` Source string to parse

* `filename` Name of the source file

* `skip` Whitespace classes

#### `public inline bool `[`Parse`](#classDotParse_1_1Context_1a2e46ee576035a9c8c35493d9e11c5856)`(`[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` parser)` 

Parse source string using parser. This method can be used in grammar to apply subparsers.

#### Parameters
* `parser` Parser that should be applied

#### Returns
boolean value indicating that full source string was parsed

#### `public inline void `[`SkipWS`](#classDotParse_1_1Context_1af934acfcac509920b888ff4de7521ce9)`()` 

Skip whitespace characters in source string.

#### `public inline string `[`Combine`](#classDotParse_1_1Context_1a24787c93a67a5ae0b8dde8b340cac63e)`(`[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` parser,`[`Whitespace.Skip`](#classDotParse_1_1Whitespace_1ab64a4f672956e9dec2b29b4dfc4c523b)`? overrideSkip)` 

Function parses content using parser, but returns string from beginning position to end position. This function is a faster alternative for Regex.

#### Parameters
* `parser` Parser to apply

* `overrideSkip` Override skip whitespace. It is typical to use Skip.None here

#### Returns
String representing all the parsed input

#### `public inline string `[`Combine< T >`](#classDotParse_1_1Context_1a3b813526eaae205ec971cedef423219f)`(`[`Whitespace.Skip`](#classDotParse_1_1Whitespace_1ab64a4f672956e9dec2b29b4dfc4c523b)`? overrideSkip)` 

Function parses content using parser, but returns string from beginning position to end position. This function is a faster alternative for Regex.

#### Parameters
* `overrideSkip` Override skip whitespace. It is typical to use Skip.None here

#### Returns
String representing all the parsed input

#### `public inline void `[`Error`](#classDotParse_1_1Context_1a047d55452620c646601beeed89576999)`(string msg)` 

Throw exception at current position.

#### Parameters
* `msg` Error message to include into error. Typical message is "Expected something"

#### `public inline void `[`NotEOF`](#classDotParse_1_1Context_1ae7e3a2cba7d0c1a3493e54f04e7a81f9)`()` 

Check that it is not end of the string.

#### `public inline void `[`EOF`](#classDotParse_1_1Context_1a271f553702a5cb28342608390d113a90)`()` 

Check that it is the end of the string.

#### `public inline void `[`Literal`](#classDotParse_1_1Context_1ac74d16ae2dc05849061c76409e9f46cd)`(string literal)` 

Parse literal. That means parser sees this literal at current position and eats it.

#### Parameters
* `literal` Literal to parse

#### `public inline void `[`Literals`](#classDotParse_1_1Context_1a5955ccc6bb003ebc65572e959f3b1818)`(out string val,params string[] literals)` 

Parse some of literals. This is the same as writing FirstOf with list of literals, but shorter.

#### Parameters
* `val` Variable to save the parsed literal

* `literals` List of literals to be parsed

#### `public inline void `[`Keyword`](#classDotParse_1_1Context_1ab73abc7a3c675889a6fb46bf3fcaddd8)`(string keyword)` 

Parse keyword. Keyword is like literal but after the word we should see non-character symbol.

#### Parameters
* `keyword` Keyword to parse

#### `public inline void `[`Word`](#classDotParse_1_1Context_1a864e7e69b016e00d2b68312989527dcb)`(`[`Word`](#classDotParse_1_1Word)` word,out string dst)` 

Parse word defined by word object.

#### Parameters
* `word` Word to be parsed

* `dst` Output string to put parsed substring into

#### `public inline void `[`Regex`](#classDotParse_1_1Context_1af493a5a218c380b7d0ac9f7a090f70a9)`(System.Text.RegularExpressions.Regex regex,out string dst)` 

Parse string based on regular expression.

#### Parameters
* `regex` Regular expression to be parsed

* `dst` Output string to put parsed substring into

#### `public inline void `[`Regex`](#classDotParse_1_1Context_1a4c5eab885ac50bfffa8a2b737ac15fba)`(System.Text.RegularExpressions.Regex regex)` 

Parse string based on regular expression.

#### Parameters
* `regex` Regular expression to be parsed

#### `public inline void `[`Regex`](#classDotParse_1_1Context_1ab891c786eaa49f7a35c0934af3e8a62e)`(string regex,out string dst)` 

Parse string based on regular expression. It is not recomended to use this function, it is better to compile regular expression before usage.

#### Parameters
* `regex` Regular expression to be parsed

* `dst` Output string to put parsed substring into

#### `public inline void `[`Regex`](#classDotParse_1_1Context_1ab56421e60513abfa34ff2b596652911e)`(string regex)` 

Parse string based on regular expression. It is not recomended to use this function, it is better to compile regular expression before usage.

#### Parameters
* `regex` Regular expression to be parsed

#### `public inline void `[`Double`](#classDotParse_1_1Context_1a065d5264bf811bbff430eb6b6bdb3006)`(out double dst)` 

Parse floating point number and return double precision value.

#### Parameters
* `dst` Variable to write value into

#### `public inline double `[`Double`](#classDotParse_1_1Context_1a66b3b335781dc0fa7d6046c10ed842a3)`()` 

Parse floating point number and return double precision value.

#### Returns
Parsed value

#### `public inline void `[`FirstOf`](#classDotParse_1_1Context_1a6a69d47b4da73b88bdd0f60dd8ea424a)`(out int index,params `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` parsables)` 

Try all parsers and return the first successful result.

#### Parameters
* `index` index of parsed element

#### `public inline `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` `[`FirstOf`](#classDotParse_1_1Context_1a51509d18b6e2bf4fe6fa543c99fb077f)`(out int index,params `[`Func](#classDotParse_1_1Context_1a4d73271dc85c1fd977eb309841e09920)< [IPegParsable`](#interfaceDotParse_1_1IPegParsable)` >[] parsables)` 

Try all parsers and return the first successful result.

#### Parameters
* `index` index of parsed element

* `parsables` list of functions returning each of possible options

#### `public inline `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` `[`Union< T1, T2 >`](#classDotParse_1_1Context_1a300050d256f415ff00c097c22884aa14)`(out int index)` 

Try all parsers and return the first successful result. This function allows to not create all the possible options to parse them.

#### Parameters
* `index` index of parsed element

#### `public inline `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` `[`Union< T1, T2, T3 >`](#classDotParse_1_1Context_1afce3b1b90ebeb9b8ebecdd9d401eb73c)`(out int index)` 

Try all parsers and return the first successful result. This function allows to not create all the possible options to parse them.

#### Parameters
* `index` index of parsed element

#### `public inline `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` `[`Union< T1, T2, T3, T4 >`](#classDotParse_1_1Context_1a5f38482058e7a8e60820463bcd43648e)`(out int index)` 

Try all parsers and return the first successful result. This function allows to not create all the possible options to parse them.

#### Parameters
* `index` index of parsed element

#### `public inline `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` `[`Union< T1, T2, T3, T4, T5 >`](#classDotParse_1_1Context_1abe9eb7b94c15f2b211d8e933e34cabc4)`(out int index)` 

Try all parsers and return the first successful result. This function allows to not create all the possible options to parse them.

#### Parameters
* `index` index of parsed element

#### `public inline `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` `[`Union< T1, T2, T3, T4, T5, T6 >`](#classDotParse_1_1Context_1aa358371796c151cf84a6b127dbbb5844)`(out int index)` 

Try all parsers and return the first successful result. This function allows to not create all the possible options to parse them.

#### Parameters
* `index` index of parsed element

#### `public inline `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` `[`Union< T1, T2, T3, T4, T5, T6, T7 >`](#classDotParse_1_1Context_1a112c59689c14df6585b71fd00ff0fcf0)`(out int index)` 

Try all parsers and return the first successful result. This function allows to not create all the possible options to parse them.

#### Parameters
* `index` index of parsed element

#### `public inline `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` `[`Union< T1, T2, T3, T4, T5, T6, T7, T8 >`](#classDotParse_1_1Context_1a5edc17e68d45a96390140a1c6c5c7dd5)`(out int index)` 

Try all parsers and return the first successful result. This function allows to not create all the possible options to parse them.

#### Parameters
* `index` index of parsed element

#### `public inline `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` `[`Union< T1, T2, T3, T4, T5, T6, T7, T8, T9 >`](#classDotParse_1_1Context_1a7098a764bbea49130c40cbe27cc45b4e)`(out int index)` 

Try all parsers and return the first successful result. This function allows to not create all the possible options to parse them.

#### Parameters
* `index` index of parsed element

#### `public inline `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` `[`Union< T1, T2, T3, T4, T5, T6, T7, T8, T9, T10 >`](#classDotParse_1_1Context_1a65b73000ab1612b2e3892b0311d5103b)`(out int index)` 

Try all parsers and return the first successful result. This function allows to not create all the possible options to parse them.

#### Parameters
* `index` index of parsed element

#### `public inline void `[`Optional`](#classDotParse_1_1Context_1a638c7d76ef0722ecc0e06b696bbbf5eb)`(`[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` parser)` 

Parse optional value.

#### Parameters
* `parser` Parser that should be applied

#### `public inline T? `[`Optional< T >`](#classDotParse_1_1Context_1afd17c7f61190cd6f7024b34ea3ba52d6)`()` 

Parse optional value. If parser fails returns null.

#### Returns
Parsed value if successful and null if failed

#### `public inline bool `[`OptionalLiteral`](#classDotParse_1_1Context_1a93ffd3088261baa9fe9791adc6eb21ae)`(string literal)` 

Parse optional literal at position.

#### Parameters
* `literal` Expected input at position

#### Returns
boolean indicating that literal was found at position

#### `public inline bool `[`OptionalFunc`](#classDotParse_1_1Context_1a828fac1fac8f7c09676e30c9d10b1047)`(Action< `[`Context`](#classDotParse_1_1Context)` > func)` 

Parse optional using function at position. This is a shortcut of using context.Optional(context.Func(func)), but faster.

#### Parameters
* `func` Function to use

#### Returns
boolean indicating that parse succeed

#### `public inline void `[`One`](#classDotParse_1_1Context_1afcd6cae3f6f348aaba840429cf05c8f4)`(`[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` parser)` 

Parse value defined by parser. This function is a recomended way to parse something inside parsers.

#### Parameters
* `parser` Parser that should be applied

#### `public inline T `[`One< T >`](#classDotParse_1_1Context_1a2de6c178298064ad9ed3d33b653fd059)`()` 

Parse value defined by parser. This function is a recomended way to parse something inside parsers.

#### Returns
Parsed value

#### `public inline void `[`FollowedBy`](#classDotParse_1_1Context_1abf28ab00f6fa12b37bd262e9f219098b)`(`[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` parser)` 

Check that type T is parsable on the position.

#### Parameters
* `parser` Parser that should be applied

#### `public inline void `[`FollowedBy< T >`](#classDotParse_1_1Context_1a7c169a60654727f8d9c789d5b6741800)`()` 

Check that type T is parsable on the position.

#### `public inline void `[`NotAny`](#classDotParse_1_1Context_1ae827cef5467236d8e8d4724b779c6959)`(`[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` parser)` 

Check that type T is not parsable on the position.

#### Parameters
* `parser` Parser that should be applied

#### `public inline void `[`NotAny< T >`](#classDotParse_1_1Context_1aebdf6a452e1bda34c9dd61702b52863a)`()` 

Check that type T is not parsable on the position.

#### `public inline void `[`Repeated< T >`](#classDotParse_1_1Context_1a3c83b74b0940d6b46dea3545b48a0e62)`(List< T > dst,int minCount,int maxCount)` 

Apply parser several times.

#### Parameters
* `dst` Destination to write values into

* `minCount` Minimal number of appears

* `maxCount` Maximum number of appears

#### `public inline void `[`ZeroOrMore< T >`](#classDotParse_1_1Context_1a5965b8150799530ad560094d237829e9)`(List< T > dst)` 

Apply parser zero or more times.

#### Parameters
* `dst` Destination to write values into

#### `public inline void `[`OneOrMore< T >`](#classDotParse_1_1Context_1a30923ea5186842e0d9c1a28a4ebfa303)`(List< T > dst)` 

Apply parser one or more times.

#### Parameters
* `dst` Destination to write values into

#### `public inline void `[`DelimitedList< T >`](#classDotParse_1_1Context_1a9fcf7293b7fd209621344045818876ba)`(List< T > dst,`[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` separator)` 

Parse list of elements divided by separator.

#### Parameters
* `dst` Destination to write values into

* `separator` Value separator

#### `public inline void `[`DelimitedList< T >`](#classDotParse_1_1Context_1a732d8666e3476d33b1af39bdb18c5a11)`(List< T > dst,string separator)` 

Parse list of elements divided by separator.

#### Parameters
* `dst` Destination to write values into

* `separator` Value separator. This separator will be used as Literal.

#### `public inline `[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)` `[`Func`](#classDotParse_1_1Context_1a4d73271dc85c1fd977eb309841e09920)`(Action< `[`Context`](#classDotParse_1_1Context)` > action)` 

Simple way to create new parser based on lambda function.

#### Parameters
* `action` Actions to be done to parse the value

#### Returns
Parser that parses something using the action

#### `public inline `[`ExpressionNode`](#classDotParse_1_1Context_1_1ExpressionNode)`< T > `[`Infix< T >`](#classDotParse_1_1Context_1aea5367adff155e4aaf3711fb66f0a204)`(params string[] operations)` 

# class `DotParse::ParseException` 

```
class DotParse::ParseException
  : public Exception
```  

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public string `[`SourceString`](#classDotParse_1_1ParseException_1a929e2e0e79b9e5c448a2383020145db4) | 
`public int `[`Position`](#classDotParse_1_1ParseException_1a83232a6f1e522bbbd8ec40516c201b48) | 
`public string `[`ErrorMessage`](#classDotParse_1_1ParseException_1a43bca5eb7b24f3e7a1a690c83224461d) | 
`public List< `[`ParseException`](#classDotParse_1_1ParseException)` >? `[`Children`](#classDotParse_1_1ParseException_1ad8b18fdf228caecf87aa677acb43f433) | 
`public inline  `[`ParseException`](#classDotParse_1_1ParseException_1a48666728b2048a932ddb3764d6198f15)`(string source,int position,string message)` | 
`public inline int `[`LineNo`](#classDotParse_1_1ParseException_1afa5187dabc459c533450bf3718855bf6)`()` | 
`public inline string `[`ParseError`](#classDotParse_1_1ParseException_1aa28d422135e43d5a34720fa98d8f7f14)`(int offset)` | 
`public inline void `[`AddChild`](#classDotParse_1_1ParseException_1a567469cd83f81bb22a6524912e739803)`(`[`ParseException`](#classDotParse_1_1ParseException)` exc,bool forceAdd)` | 

## Members

#### `public string `[`SourceString`](#classDotParse_1_1ParseException_1a929e2e0e79b9e5c448a2383020145db4) 

#### `public int `[`Position`](#classDotParse_1_1ParseException_1a83232a6f1e522bbbd8ec40516c201b48) 

#### `public string `[`ErrorMessage`](#classDotParse_1_1ParseException_1a43bca5eb7b24f3e7a1a690c83224461d) 

#### `public List< `[`ParseException`](#classDotParse_1_1ParseException)` >? `[`Children`](#classDotParse_1_1ParseException_1ad8b18fdf228caecf87aa677acb43f433) 

#### `public inline  `[`ParseException`](#classDotParse_1_1ParseException_1a48666728b2048a932ddb3764d6198f15)`(string source,int position,string message)` 

#### `public inline int `[`LineNo`](#classDotParse_1_1ParseException_1afa5187dabc459c533450bf3718855bf6)`()` 

#### `public inline string `[`ParseError`](#classDotParse_1_1ParseException_1aa28d422135e43d5a34720fa98d8f7f14)`(int offset)` 

#### `public inline void `[`AddChild`](#classDotParse_1_1ParseException_1a567469cd83f81bb22a6524912e739803)`(`[`ParseException`](#classDotParse_1_1ParseException)` exc,bool forceAdd)` 

# class `DotParse::SourceLocation` 

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------

## Members

# class `DotParse::Whitespace` 

```
class DotParse::Whitespace
  : public DotParse.IPegParsable
```  

Parser for whitespace characters and comments. It is possible to add your own comment functions to skip different kind of not-standard comments.

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public `[`Skip`](#classDotParse_1_1Whitespace_1ab64a4f672956e9dec2b29b4dfc4c523b)` `[`SkipClasses`](#classDotParse_1_1Whitespace_1abd05a10c5a2a31e86fb1696b0d00d3c7) | 
`public Action< `[`Context`](#classDotParse_1_1Context)` >? `[`SkipFunc`](#classDotParse_1_1Whitespace_1aef51408fb343860077c6c9c7303b122c) | 
`public inline  `[`Whitespace`](#classDotParse_1_1Whitespace_1a9850cf4401aa3c298ff481153a56c9bd)`()` | 
`public inline  `[`Whitespace`](#classDotParse_1_1Whitespace_1acfbfffd3a9f084b18c535197c041e3ec)`(`[`Skip`](#classDotParse_1_1Whitespace_1ab64a4f672956e9dec2b29b4dfc4c523b)` skip)` | 
`public inline  `[`Whitespace`](#classDotParse_1_1Whitespace_1ae93ef54bf51475e0e53c2feabae761b9)`(`[`Skip`](#classDotParse_1_1Whitespace_1ab64a4f672956e9dec2b29b4dfc4c523b)` skip,Action< `[`Context`](#classDotParse_1_1Context)` > skipFunc)` | 
`public inline  `[`Whitespace`](#classDotParse_1_1Whitespace_1a9711a2891beafaa940daffac305239c3)`(Action< `[`Context`](#classDotParse_1_1Context)` > skipFunc)` | 
`public inline void `[`PegParse`](#classDotParse_1_1Whitespace_1a5f1f1aa53171d4d64d6f008ab9adadfb)`(`[`Context`](#classDotParse_1_1Context)` ctx)` | 
`public inline void `[`SkipCStyleComment`](#classDotParse_1_1Whitespace_1a2b2fbe3d9bde05eccaedb585036b65b0)`(`[`Context`](#classDotParse_1_1Context)` ctx)` | 
`public inline void `[`SkipCppStyleComment`](#classDotParse_1_1Whitespace_1a8562cb88aaaab5ca1593b1b0f98ea9c9)`(`[`Context`](#classDotParse_1_1Context)` ctx)` | 
`public inline void `[`SkipShellComment`](#classDotParse_1_1Whitespace_1affa499bb7eb33305fc76109cdfbc4ebe)`(`[`Context`](#classDotParse_1_1Context)` ctx)` | 
`public inline override string `[`ToString`](#classDotParse_1_1Whitespace_1ac9aeb52411e7c115c39f12a2922eb791)`()` | 
`enum `[`Skip`](#classDotParse_1_1Whitespace_1ab64a4f672956e9dec2b29b4dfc4c523b) | Skip different kinds of data.

## Members

#### `public `[`Skip`](#classDotParse_1_1Whitespace_1ab64a4f672956e9dec2b29b4dfc4c523b)` `[`SkipClasses`](#classDotParse_1_1Whitespace_1abd05a10c5a2a31e86fb1696b0d00d3c7) 

#### `public Action< `[`Context`](#classDotParse_1_1Context)` >? `[`SkipFunc`](#classDotParse_1_1Whitespace_1aef51408fb343860077c6c9c7303b122c) 

#### `public inline  `[`Whitespace`](#classDotParse_1_1Whitespace_1a9850cf4401aa3c298ff481153a56c9bd)`()` 

#### `public inline  `[`Whitespace`](#classDotParse_1_1Whitespace_1acfbfffd3a9f084b18c535197c041e3ec)`(`[`Skip`](#classDotParse_1_1Whitespace_1ab64a4f672956e9dec2b29b4dfc4c523b)` skip)` 

#### `public inline  `[`Whitespace`](#classDotParse_1_1Whitespace_1ae93ef54bf51475e0e53c2feabae761b9)`(`[`Skip`](#classDotParse_1_1Whitespace_1ab64a4f672956e9dec2b29b4dfc4c523b)` skip,Action< `[`Context`](#classDotParse_1_1Context)` > skipFunc)` 

#### `public inline  `[`Whitespace`](#classDotParse_1_1Whitespace_1a9711a2891beafaa940daffac305239c3)`(Action< `[`Context`](#classDotParse_1_1Context)` > skipFunc)` 

#### `public inline void `[`PegParse`](#classDotParse_1_1Whitespace_1a5f1f1aa53171d4d64d6f008ab9adadfb)`(`[`Context`](#classDotParse_1_1Context)` ctx)` 

#### `public inline void `[`SkipCStyleComment`](#classDotParse_1_1Whitespace_1a2b2fbe3d9bde05eccaedb585036b65b0)`(`[`Context`](#classDotParse_1_1Context)` ctx)` 

#### `public inline void `[`SkipCppStyleComment`](#classDotParse_1_1Whitespace_1a8562cb88aaaab5ca1593b1b0f98ea9c9)`(`[`Context`](#classDotParse_1_1Context)` ctx)` 

#### `public inline void `[`SkipShellComment`](#classDotParse_1_1Whitespace_1affa499bb7eb33305fc76109cdfbc4ebe)`(`[`Context`](#classDotParse_1_1Context)` ctx)` 

#### `public inline override string `[`ToString`](#classDotParse_1_1Whitespace_1ac9aeb52411e7c115c39f12a2922eb791)`()` 

#### `enum `[`Skip`](#classDotParse_1_1Whitespace_1ab64a4f672956e9dec2b29b4dfc4c523b) 

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
None            | 
WhiteChars            | 
CStyleComment            | 
CppStyleComment            | 
ShellComment            | 

Skip different kinds of data.

# class `DotParse::Word` 

Fast word parsing for PEG.

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public inline  `[`Word`](#classDotParse_1_1Word_1af4c8c837383ee7cf6979e01b0b579042)`(string first,string rest,int maxCount)` | Create word parser with first character from first and other characters from rest.
`public inline  `[`Word`](#classDotParse_1_1Word_1a808a8a1c4b8c6995c4b1adee3f10c01d)`(string chars,int maxCount)` | Create word parser with first character from first and other characters from rest.
`public inline int `[`ParseAt`](#classDotParse_1_1Word_1a2ee27e0922aef92820e76256a7b5a951)`(string source,int pos)` | Try to parse Word at position pos.
`public inline override string `[`ToString`](#classDotParse_1_1Word_1ae5e1444158980d3c182e39f28fe6c0ec)`()` | 

## Members

#### `public inline  `[`Word`](#classDotParse_1_1Word_1af4c8c837383ee7cf6979e01b0b579042)`(string first,string rest,int maxCount)` 

Create word parser with first character from first and other characters from rest.

#### Parameters
* `first` Set of characters for the first char

* `rest` Set of characters for rest chars

* `maxCount` Maximum number of characters in the word. If negative unlimited.

#### `public inline  `[`Word`](#classDotParse_1_1Word_1a808a8a1c4b8c6995c4b1adee3f10c01d)`(string chars,int maxCount)` 

Create word parser with first character from first and other characters from rest.

#### Parameters
* `chars` Set of characters for all chars

* `maxCount` Maximum number of characters in the word. If negative unlimited.

#### `public inline int `[`ParseAt`](#classDotParse_1_1Word_1a2ee27e0922aef92820e76256a7b5a951)`(string source,int pos)` 

Try to parse Word at position pos.

#### Returns
Length of parsed string or -1 if failed.

#### `public inline override string `[`ToString`](#classDotParse_1_1Word_1ae5e1444158980d3c182e39f28fe6c0ec)`()` 

# namespace `DotParse::Test` 

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`class `[`DotParse::Test::Basic`](#classDotParse_1_1Test_1_1Basic) | 
`class `[`DotParse::Test::BinaryExprTest`](#classDotParse_1_1Test_1_1BinaryExprTest) | 
`class `[`DotParse::Test::FirstOfParser`](#classDotParse_1_1Test_1_1FirstOfParser) | 
`class `[`DotParse::Test::FirstOfTest`](#classDotParse_1_1Test_1_1FirstOfTest) | 
`class `[`DotParse::Test::OperationParser`](#classDotParse_1_1Test_1_1OperationParser) | 
`class `[`DotParse::Test::Tests`](#classDotParse_1_1Test_1_1Tests) | 
`class `[`DotParse::Test::ValueParser`](#classDotParse_1_1Test_1_1ValueParser) | 

# class `DotParse::Test::Basic` 

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public inline void `[`Setup`](#classDotParse_1_1Test_1_1Basic_1ad9568f266cc1515dc73cfea5b2ca7c10)`()` | 
`public inline void `[`TryParse`](#classDotParse_1_1Test_1_1Basic_1afc7b64326441a126969e7587e0fa5d32)`(string src,string name,`[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)`? ws)` | 
`public inline void `[`Test1`](#classDotParse_1_1Test_1_1Basic_1a7b83a9be5c1f84a9dd7d92c8ea617298)`()` | 
`public inline void `[`Test2`](#classDotParse_1_1Test_1_1Basic_1aed24bb760b40f570e6a1bf36b22a5990)`()` | 
`public inline void `[`Test3`](#classDotParse_1_1Test_1_1Basic_1afd2d31863fb13886ffbcb6fddc42414c)`()` | 
`public inline void `[`TestDelimitedList`](#classDotParse_1_1Test_1_1Basic_1a63d4a04a331fe9c65756e628369b51e2)`(string v,string t)` | 
`public inline void `[`Test4`](#classDotParse_1_1Test_1_1Basic_1a8d3fa4a88b05f9b235e446d7d537b9e6)`()` | 

## Members

#### `public inline void `[`Setup`](#classDotParse_1_1Test_1_1Basic_1ad9568f266cc1515dc73cfea5b2ca7c10)`()` 

#### `public inline void `[`TryParse`](#classDotParse_1_1Test_1_1Basic_1afc7b64326441a126969e7587e0fa5d32)`(string src,string name,`[`IPegParsable`](#interfaceDotParse_1_1IPegParsable)`? ws)` 

#### `public inline void `[`Test1`](#classDotParse_1_1Test_1_1Basic_1a7b83a9be5c1f84a9dd7d92c8ea617298)`()` 

#### `public inline void `[`Test2`](#classDotParse_1_1Test_1_1Basic_1aed24bb760b40f570e6a1bf36b22a5990)`()` 

#### `public inline void `[`Test3`](#classDotParse_1_1Test_1_1Basic_1afd2d31863fb13886ffbcb6fddc42414c)`()` 

#### `public inline void `[`TestDelimitedList`](#classDotParse_1_1Test_1_1Basic_1a63d4a04a331fe9c65756e628369b51e2)`(string v,string t)` 

#### `public inline void `[`Test4`](#classDotParse_1_1Test_1_1Basic_1a8d3fa4a88b05f9b235e446d7d537b9e6)`()` 

# class `DotParse::Test::BinaryExprTest` 

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public inline void `[`Setup`](#classDotParse_1_1Test_1_1BinaryExprTest_1a6bc307eca4e7101f0a9da54c4a094963)`()` | 
`public inline void `[`TryParse`](#classDotParse_1_1Test_1_1BinaryExprTest_1ada6f5f03ab00e7819fda4c35b4954e55)`(string src,string res)` | 
`public inline void `[`TryParse2`](#classDotParse_1_1Test_1_1BinaryExprTest_1ac5f1e2a22d710d63a496bfcdbfc0796e)`(string src,string res)` | 
`public inline void `[`Test`](#classDotParse_1_1Test_1_1BinaryExprTest_1abf76267ad63b504bd148f97ded2a1425)`()` | 
`public inline void `[`TestSimple`](#classDotParse_1_1Test_1_1BinaryExprTest_1a285db1605c5b3e408207546ec373d65e)`()` | 

## Members

#### `public inline void `[`Setup`](#classDotParse_1_1Test_1_1BinaryExprTest_1a6bc307eca4e7101f0a9da54c4a094963)`()` 

#### `public inline void `[`TryParse`](#classDotParse_1_1Test_1_1BinaryExprTest_1ada6f5f03ab00e7819fda4c35b4954e55)`(string src,string res)` 

#### `public inline void `[`TryParse2`](#classDotParse_1_1Test_1_1BinaryExprTest_1ac5f1e2a22d710d63a496bfcdbfc0796e)`(string src,string res)` 

#### `public inline void `[`Test`](#classDotParse_1_1Test_1_1BinaryExprTest_1abf76267ad63b504bd148f97ded2a1425)`()` 

#### `public inline void `[`TestSimple`](#classDotParse_1_1Test_1_1BinaryExprTest_1a285db1605c5b3e408207546ec373d65e)`()` 

# class `DotParse::Test::FirstOfParser` 

```
class DotParse::Test::FirstOfParser
  : public DotParse.IPegParsable
```  

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public string `[`Val`](#classDotParse_1_1Test_1_1FirstOfParser_1a17cdcb5c11dc0a1614276b6df7e45ca4) | 
`public int `[`Choice`](#classDotParse_1_1Test_1_1FirstOfParser_1a0262a050fe271351cd5148c10c0c2350) | 
`public inline void `[`PegParse`](#classDotParse_1_1Test_1_1FirstOfParser_1a9739d7d78ef40649abf54582933c9c08)`(`[`Context`](#classDotParse_1_1Context)` ctx)` | 

## Members

#### `public string `[`Val`](#classDotParse_1_1Test_1_1FirstOfParser_1a17cdcb5c11dc0a1614276b6df7e45ca4) 

#### `public int `[`Choice`](#classDotParse_1_1Test_1_1FirstOfParser_1a0262a050fe271351cd5148c10c0c2350) 

#### `public inline void `[`PegParse`](#classDotParse_1_1Test_1_1FirstOfParser_1a9739d7d78ef40649abf54582933c9c08)`(`[`Context`](#classDotParse_1_1Context)` ctx)` 

# class `DotParse::Test::FirstOfTest` 

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public inline void `[`Setup`](#classDotParse_1_1Test_1_1FirstOfTest_1addc1265f20cc2401c5ae92ac34f123e9)`()` | 
`public inline void `[`TryParse`](#classDotParse_1_1Test_1_1FirstOfTest_1ab1135e8909c832fa08fa415c3861b188)`(string src,int choice)` | 
`public inline void `[`Test`](#classDotParse_1_1Test_1_1FirstOfTest_1aca04715ed71447e3a3c6bf7336ce5d9f)`()` | 

## Members

#### `public inline void `[`Setup`](#classDotParse_1_1Test_1_1FirstOfTest_1addc1265f20cc2401c5ae92ac34f123e9)`()` 

#### `public inline void `[`TryParse`](#classDotParse_1_1Test_1_1FirstOfTest_1ab1135e8909c832fa08fa415c3861b188)`(string src,int choice)` 

#### `public inline void `[`Test`](#classDotParse_1_1Test_1_1FirstOfTest_1aca04715ed71447e3a3c6bf7336ce5d9f)`()` 

# class `DotParse::Test::OperationParser` 

```
class DotParse::Test::OperationParser
  : public DotParse.IPegParsable
```  

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public string `[`Op`](#classDotParse_1_1Test_1_1OperationParser_1a41fa3de6d63709e916f97dac153ef8d7) | 
`public inline void `[`PegParse`](#classDotParse_1_1Test_1_1OperationParser_1ae82824fe02decf6292b4350df211bf43)`(`[`Context`](#classDotParse_1_1Context)` ctx)` | 

## Members

#### `public string `[`Op`](#classDotParse_1_1Test_1_1OperationParser_1a41fa3de6d63709e916f97dac153ef8d7) 

#### `public inline void `[`PegParse`](#classDotParse_1_1Test_1_1OperationParser_1ae82824fe02decf6292b4350df211bf43)`(`[`Context`](#classDotParse_1_1Context)` ctx)` 

# class `DotParse::Test::Tests` 

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public inline void `[`Setup`](#classDotParse_1_1Test_1_1Tests_1a37476ec354e93980bcd8d180419db175)`()` | 
`public inline void `[`Test1`](#classDotParse_1_1Test_1_1Tests_1a09237e2bfed168dd1a2d558c7046f995)`()` | 

## Members

#### `public inline void `[`Setup`](#classDotParse_1_1Test_1_1Tests_1a37476ec354e93980bcd8d180419db175)`()` 

#### `public inline void `[`Test1`](#classDotParse_1_1Test_1_1Tests_1a09237e2bfed168dd1a2d558c7046f995)`()` 

# class `DotParse::Test::ValueParser` 

```
class DotParse::Test::ValueParser
  : public DotParse.IPegParsable
```  

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public string `[`Val`](#classDotParse_1_1Test_1_1ValueParser_1abc92d57d03247e1eee7a033f33f4cbcb) | 
`public inline void `[`PegParse`](#classDotParse_1_1Test_1_1ValueParser_1af3ede77ee9f05aa452358fa87c4139da)`(`[`Context`](#classDotParse_1_1Context)` ctx)` | 

## Members

#### `public string `[`Val`](#classDotParse_1_1Test_1_1ValueParser_1abc92d57d03247e1eee7a033f33f4cbcb) 

#### `public inline void `[`PegParse`](#classDotParse_1_1Test_1_1ValueParser_1af3ede77ee9f05aa452358fa87c4139da)`(`[`Context`](#classDotParse_1_1Context)` ctx)` 

# class `DotParse::Test::Basic::BasicParser` 

```
class DotParse::Test::Basic::BasicParser
  : public DotParse.IPegParsable
```  

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public string `[`Name`](#classDotParse_1_1Test_1_1Basic_1_1BasicParser_1a7f1c3e70d750bd8fafade39e8d3dd369) | 
`public inline void `[`PegParse`](#classDotParse_1_1Test_1_1Basic_1_1BasicParser_1a9a3c18b4ee6a6ba6340cb76af5cc9487)`(`[`Context`](#classDotParse_1_1Context)` ctx)` | 

## Members

#### `public string `[`Name`](#classDotParse_1_1Test_1_1Basic_1_1BasicParser_1a7f1c3e70d750bd8fafade39e8d3dd369) 

#### `public inline void `[`PegParse`](#classDotParse_1_1Test_1_1Basic_1_1BasicParser_1a9a3c18b4ee6a6ba6340cb76af5cc9487)`(`[`Context`](#classDotParse_1_1Context)` ctx)` 

# class `DotParse::Context::ExpressionNode` 

Expression representation to parse infix expressions.

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`{property} T `[`Value`](#classDotParse_1_1Context_1_1ExpressionNode_1acb10e732a69f4f340d33baa9fb3c2612) | 
`public string `[`Operation`](#classDotParse_1_1Context_1_1ExpressionNode_1afa24a55319a4503b7ce38b0e61a963e2) | 
`public `[`ExpressionNode`](#classDotParse_1_1Context_1_1ExpressionNode)`< T >? `[`Left`](#classDotParse_1_1Context_1_1ExpressionNode_1ad456814318daf155651a24e6cf8ee7f9) | 
`public T? `[`Right`](#classDotParse_1_1Context_1_1ExpressionNode_1ad3bf179d46e9c97a62662f2087f89b81) | 
`public inline bool `[`IsValue`](#classDotParse_1_1Context_1_1ExpressionNode_1aeeeb21212f2b814774492cfbcc35c9d8)`()` | 

## Members

#### `{property} T `[`Value`](#classDotParse_1_1Context_1_1ExpressionNode_1acb10e732a69f4f340d33baa9fb3c2612) 

#### `public string `[`Operation`](#classDotParse_1_1Context_1_1ExpressionNode_1afa24a55319a4503b7ce38b0e61a963e2) 

#### `public `[`ExpressionNode`](#classDotParse_1_1Context_1_1ExpressionNode)`< T >? `[`Left`](#classDotParse_1_1Context_1_1ExpressionNode_1ad456814318daf155651a24e6cf8ee7f9) 

#### `public T? `[`Right`](#classDotParse_1_1Context_1_1ExpressionNode_1ad3bf179d46e9c97a62662f2087f89b81) 

#### `public inline bool `[`IsValue`](#classDotParse_1_1Context_1_1ExpressionNode_1aeeeb21212f2b814774492cfbcc35c9d8)`()` 

# class `DotParse::Context::FloatingPoint` 

```
class DotParse::Context::FloatingPoint
  : public DotParse.IPegParsable
```  

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public inline void `[`PegParse`](#classDotParse_1_1Context_1_1FloatingPoint_1a9aa232a984431fe8a413cab37dce139f)`(`[`Context`](#classDotParse_1_1Context)` context)` | 

## Members

#### `public inline void `[`PegParse`](#classDotParse_1_1Context_1_1FloatingPoint_1a9aa232a984431fe8a413cab37dce139f)`(`[`Context`](#classDotParse_1_1Context)` context)` 

# class `DotParse::Context::FuncParser` 

```
class DotParse::Context::FuncParser
  : public DotParse.IPegParsable
```  

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public inline  `[`FuncParser`](#classDotParse_1_1Context_1_1FuncParser_1a55eb4b8a283ba59e6e04806511d56724)`(Action< `[`Context`](#classDotParse_1_1Context)` > action)` | 
`public inline void `[`PegParse`](#classDotParse_1_1Context_1_1FuncParser_1a27c7ba048a011fc5bc11be44174a0557)`(`[`Context`](#classDotParse_1_1Context)` ctx)` | 

## Members

#### `public inline  `[`FuncParser`](#classDotParse_1_1Context_1_1FuncParser_1a55eb4b8a283ba59e6e04806511d56724)`(Action< `[`Context`](#classDotParse_1_1Context)` > action)` 

#### `public inline void `[`PegParse`](#classDotParse_1_1Context_1_1FuncParser_1a27c7ba048a011fc5bc11be44174a0557)`(`[`Context`](#classDotParse_1_1Context)` ctx)` 

# class `DotParse::Test::Basic::Number` 

```
class DotParse::Test::Basic::Number
  : public DotParse.IPegParsable
```  

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public string `[`Val`](#classDotParse_1_1Test_1_1Basic_1_1Number_1a017a8fe62f59e8c5c36ca2629bf89bb6) | 
`public inline void `[`PegParse`](#classDotParse_1_1Test_1_1Basic_1_1Number_1a587b19f02f8b539f4411096e6d261bbe)`(`[`Context`](#classDotParse_1_1Context)` ctx)` | 

## Members

#### `public string `[`Val`](#classDotParse_1_1Test_1_1Basic_1_1Number_1a017a8fe62f59e8c5c36ca2629bf89bb6) 

#### `public inline void `[`PegParse`](#classDotParse_1_1Test_1_1Basic_1_1Number_1a587b19f02f8b539f4411096e6d261bbe)`(`[`Context`](#classDotParse_1_1Context)` ctx)` 

# class `DotParse::BinaryOperation::OpVal` 

```
class DotParse::BinaryOperation::OpVal
  : public DotParse.IPegParsable
```  

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public Op `[`Operation`](#classDotParse_1_1BinaryOperation_1_1OpVal_1a313074f74203d5ecb16548f3a17033e6) | 
`public Val `[`Value`](#classDotParse_1_1BinaryOperation_1_1OpVal_1acc88395d9f19effe4b2afa92f8439744) | 
`public inline void `[`PegParse`](#classDotParse_1_1BinaryOperation_1_1OpVal_1a376e10dae1695d0b217776776f7c1d40)`(`[`Context`](#classDotParse_1_1Context)` ctx)` | 

## Members

#### `public Op `[`Operation`](#classDotParse_1_1BinaryOperation_1_1OpVal_1a313074f74203d5ecb16548f3a17033e6) 

#### `public Val `[`Value`](#classDotParse_1_1BinaryOperation_1_1OpVal_1acc88395d9f19effe4b2afa92f8439744) 

#### `public inline void `[`PegParse`](#classDotParse_1_1BinaryOperation_1_1OpVal_1a376e10dae1695d0b217776776f7c1d40)`(`[`Context`](#classDotParse_1_1Context)` ctx)` 

Generated by [Moxygen](https://sourcey.com/moxygen)