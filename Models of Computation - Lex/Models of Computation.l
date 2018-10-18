%{
#include<stdio.h>
#include <string.h>
char str[100][25];
int number=0;
%}
%%
[\t]+ {;}
"\/\/"([a-z0-9A-Z]|","|"."|" "|[\t]|"+"|"-"|"_"|[ \{\}\[\]\\\!\@\#\$\%\^\&\*\/\?\>\<\~\`\;\:\"\|])*	{;}

"+" 	{printf("Operator : %s\n",yytext);}

"-"	{printf("Operator : %s\n",yytext);}

"=="	{printf("Operator : %s\n",yytext);}

"!="	{printf("Operator : %s\n",yytext);}

"=<"	{printf("Operator : %s\n",yytext);}

"=>"	{printf("Operator : %s\n",yytext);}

"="	{printf("Operator : %s\n",yytext);}

"<"	{printf("Operator : %s\n",yytext);}
">"	{printf("Operator : %s\n",yytext);}

"/"	{printf("Operator : %s\n",yytext);}

"*"	{printf("Operator : %s\n",yytext);}

"("	{printf("Parenthesis : %s\n",yytext);}

")"	{printf("Parenthesis : %s\n",yytext);}
";"	{printf("Semicolon : %s\n",yytext);}
endif	{printf("Keyword : %s\n",yytext);}
endwhile	{printf("Keyword : %s\n",yytext);}
if	{printf("Keyword : %s\n",yytext);}
else	{printf("Keyword : %s\n",yytext);}
then	{printf("Keyword : %s\n",yytext);}
while	{printf("Keyword : %s\n",yytext);}
do	{printf("Keyword : %s\n",yytext);}
print	{printf("Keyword : %s\n",yytext);}
newline	{printf("Keyword : %s\n",yytext);}
[0-9]+	{
int i,j=0,flag=0;
char c[100];
for(j=0;j<100;j++)
c[j]=0;
j=0;
for(i=0;yytext[i]!='\0';i++){
if(yytext[i]!='0')
flag=1;
if(flag == 1){
c[j]=yytext[i];
j++;
}
}
printf("Integer : %s\n",c);}
[a-zA-Z_]+[a-zA-Z0-9]*  {
int p=0,o=0,flag=0,cot=0;
for(p=0;p<100;p++)
{
cot=0;
for(o=0;o<(strlen(yytext)>strlen(str[p])?strlen(yytext) :strlen(str[p]));o++)
{
if(str[p][o]==yytext[o])
	cot++;
}
if(cot==o)
{
flag=1;
break;
}
}
if(flag==0)
{
	int x;
	for ( x = 0; yytext[x] != '\0';x++)
	    str[number][x] = yytext[x];
	str[number][x] = '\0';
	number++;
	printf("New identifire : %s\n",yytext);
}

if(flag==1)
{
	printf("Identifier \"%s\" already in symbol table\n",yytext);
}

}

"\""([a-z0-9A-Z]|","|"."|" "|[\t])*"\""	{
int i,j=0;
char c[100];
for(j=0;j<100;j++)
c[j]=0;
j=0;
for(i=1;yytext[i]!='\0';i++)
if(yytext[i]!='\"'){
c[j]=yytext[i];
j++;
}
printf("quoted string : %s\n",c);}

([0-9]+[a-zA-Z][a-zA-Z0-9]*|\&.|[a-z0-9A-Z]|","|"."|" "|[\t]|"+"|"-"|"_"|[\{\}\[\]\\\!\@\#\$\%\^\&\*\/\?\>\<\~\`\;\:\"\|\~\`\'\:\;])*	{printf("Wrong Input : %s\n",yytext);}	
%%
main(){
	yylex();
 	yywrap();
}
