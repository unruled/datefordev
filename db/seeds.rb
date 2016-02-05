# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#encoding: utf-8

puts 'seed data run'

#lang
en = Language.find_or_create_by(:name => "English", :code => "en")
ru = Language.find_or_create_by(:name => "Russian", :code => "ru")

#skills
s1 = Skill.create_with(:description => "Banks, Insurance companies").find_or_create_by(:name => "C#", :index => 1)
s2 = Skill.create_with(:description => "International corporations").find_or_create_by(:name => "C++", :index => 2)
s3 = Skill.create_with(:description => "Banks, Insurance companies").find_or_create_by(:name => "Java", :index => 3)
s4 = Skill.create_with(:description => "Some unknown companies").find_or_create_by(:name => "Delphi", :index => 4)
s5 = Skill.create_with(:description => "Cool Startups, Funky Design Studios").find_or_create_by(:name => "Objective-C", :index => 5)
s6 = Skill.create_with(:description => "Banks, Insurance companies").find_or_create_by(:name => "Visual Basic", :index => 6)
s7 = Skill.create_with(:description => "Web Hosting companies").find_or_create_by(:name => "Perl", :index => 7)
s8 = Skill.create_with(:description => "Google").find_or_create_by(:name => "Python", :index => 8)
s9 = Skill.create_with(:description => "Cool Startups").find_or_create_by(:name => "JavaScript", :index => 9)
s10 = Skill.create_with(:description => "Cool Startups in USA").find_or_create_by(:name => "Ruby", :index => 10)
s11 = Skill.create_with(:description => "Banks").find_or_create_by(:name => "ASP NET", :index => 11)
s12 = Skill.create_with(:description => "Any web studio").find_or_create_by(:name => "PHP", :index => 12)
s13 = Skill.create_with(:description => "Russian ERP integrators").find_or_create_by(:name => "1C", :index => 13)
s14 = Skill.create_with(:description => "SAP/3 language").find_or_create_by(:name => "ABAP", :index => 14)


#Programmer chanllenges

#english
SkillQuestion.create_with(:question => "What is the operator for 'not equal'?", :answer => "!=").find_or_create_by(:skill_id => s1.id, :language_id => en.id)
SkillQuestion.create_with(:question => "A is equal to 3. What will be value of A after this line: A+=1+7; ?", :answer => "11").find_or_create_by(:skill_id => s1.id, :language_id => en.id)
SkillQuestion.create_with(:question => "What type provides a precise representation of float value?", :answer => "decimal").find_or_create_by(:skill_id => s1.id, :language_id => en.id)

SkillQuestion.create_with(:question => "What is the operator for 'not equal'?", :answer => "!=").find_or_create_by(:skill_id => s2.id, :language_id => en.id)
SkillQuestion.create_with(:question => "A is equal to 3. What will be value of A after this line: A+=1+7; ?", :answer => "11").find_or_create_by(:skill_id => s2.id, :language_id => en.id)
SkillQuestion.create_with(:question => "
#include <iostream>
#include <stdint.h>

int main(int a, char** b)
{
   uint32_t A[10];
   size_t B = sizeof(A);
   std::cout&lt;&lt;B;
}", :answer => "40").find_or_create_by(:skill_id => s2.id, :language_id => en.id)

SkillQuestion.create_with(:question => "What is the name of the name space that includes input and output operations related classes?", :answer => "java.io").find_or_create_by(:skill_id => s3.id, :language_id => en.id)
SkillQuestion.create_with(:question => "A is equal to 7. What will be value of A after this line: A+=8-10; ?", :answer => "5").find_or_create_by(:skill_id => s3.id, :language_id => en.id)
SkillQuestion.create_with(:question => "What is the name of data type which is a 16-bit signed two's complement integer?", :answer => "short").find_or_create_by(:skill_id => s3.id, :language_id => en.id)

SkillQuestion.create_with(:question => "What is the operator to assign value to variable?", :answer => ":=").find_or_create_by(:skill_id => s4.id, :language_id => en.id)
SkillQuestion.create_with(:question => "What is the operator used for not equal (like != in other languages?)", :answer => "<>").find_or_create_by(:skill_id => s4.id, :language_id => en.id)
SkillQuestion.create_with(:question => "A is equal to 4. What will be value of A after this line: Dec(A, 4);?", :answer => "0").find_or_create_by(:skill_id => s4.id, :language_id => en.id)

SkillQuestion.create_with(:question => "What system keyword is used to define a structure?", :answer => "struct").find_or_create_by(:skill_id => s5.id, :language_id => en.id)
SkillQuestion.create_with(:question => "What is the name of the class to store a string?", :answer => "NSString").find_or_create_by(:skill_id => s5.id, :language_id => en.id)
SkillQuestion.create_with(:question => "What is the command to exit a function and return a value?", :answer => "return").find_or_create_by(:skill_id => s5.id, :language_id => en.id)

SkillQuestion.create_with(:question => "How to define the integer variable named 'counter'?", :answer => "Dim counter as Integer").find_or_create_by(:skill_id => s6.id, :language_id => en.id)
SkillQuestion.create_with(:question => "What is the constant to add line carriage and line feed into string?", :answer => "vbCRLF").find_or_create_by(:skill_id => s6.id, :language_id => en.id)
SkillQuestion.create_with(:question => "What is the name of the namespace to work with bitmaps and drawings in .net?", :answer => "System.Drawing").find_or_create_by(:skill_id => s6.id, :language_id => en.id)

SkillQuestion.create_with(:question => "What is the operator to match end of the string?", :answer => "$").find_or_create_by(:skill_id => s7.id, :language_id => en.id)
SkillQuestion.create_with(:question => "What is the shortest symbol to match anything?", :answer => ".").find_or_create_by(:skill_id => s7.id, :language_id => en.id)
SkillQuestion.create_with(:question => "What is the operator telling to match zero or more characters?", :answer => "*").find_or_create_by(:skill_id => s7.id, :language_id => en.id)

SkillQuestion.create_with(:question => "What is the operator to start defining a function?", :answer => "def").find_or_create_by(:skill_id => s8.id, :language_id => en.id)
SkillQuestion.create_with(:question => "What is the name of the function to concatenate an array of strings into one single string?", :answer => "join").find_or_create_by(:skill_id => s8.id, :language_id => en.id)
SkillQuestion.create_with(:question => "What is the name of the function to get length of a string?", :answer => "len").find_or_create_by(:skill_id => s8.id, :language_id => en.id)

SkillQuestion.create_with(:question => "What is the operator for 'not equal'?", :answer => "!=").find_or_create_by(:skill_id => s9.id, :language_id => en.id)
SkillQuestion.create_with(:question => "A is equal to 3. What will be value of A after this line: A+=12+1; ?", :answer => "16").find_or_create_by(:skill_id => s9.id, :language_id => en.id)
SkillQuestion.create_with(:question => "What is the name of the keyword is used to pause and resume a generator function?", :answer => "yeild").find_or_create_by(:skill_id => s9.id, :language_id => en.id)

SkillQuestion.create_with(:question => "What is the shortest keyword to define a function?", :answer => "def").find_or_create_by(:skill_id => s10.id, :language_id => en.id)
SkillQuestion.create_with(:question => "If 'email' variable contains 'John Doe &lt;john@example.com&gt;' then what text will return this call: email.match(/<(.*?)>/)[1]", :answer => "john@example.com").find_or_create_by(:skill_id => s10.id, :language_id => en.id)
SkillQuestion.create_with(:question => "What is the nickname of Ruby creator?", :answer => "Matz").find_or_create_by(:skill_id => s10.id, :language_id => en.id)

SkillQuestion.create_with(:question => "What is the name of the web-server for use with ASP.NET?", :answer => "IIS").find_or_create_by(:skill_id => s11.id, :language_id => en.id)
SkillQuestion.create_with(:question => "What is the name of the .NET version that runs on Linux?", :answer => "mono").find_or_create_by(:skill_id => s11.id, :language_id => en.id)
SkillQuestion.create_with(:question => "What is the name of the javascript superset Microsoft invented?", :answer => "Typescript").find_or_create_by(:skill_id => s11.id, :language_id => en.id)

SkillQuestion.create_with(:question => "What is the symbol required as a prefix for variables?", :answer => "$").find_or_create_by(:skill_id => s12.id, :language_id => en.id)
SkillQuestion.create_with(:question => "What is the variation of 'else' operator that also checks a condition?", :answer => "elseif").find_or_create_by(:skill_id => s12.id, :language_id => en.id)
SkillQuestion.create_with(:question => "What is the name of predefined array that contains POST variables?", :answer => "$_POST").find_or_create_by(:skill_id => s12.id, :language_id => en.id)

SkillQuestion.create_with(:question => "What is the keyword to close a procedure?", :answer => "КонецПроцедуры").find_or_create_by(:skill_id => s13.id, :language_id => en.id)
SkillQuestion.create_with(:question => "What is the keyword to define 'else' operator that also checks a condition?", :answer => "ИначеЕсли").find_or_create_by(:skill_id => s13.id, :language_id => en.id)
SkillQuestion.create_with(:question => "What is the keyword to start a block which is executed on exception?", :answer => "Исключение").find_or_create_by(:skill_id => s13.id, :language_id => en.id)

SkillQuestion.create_with(:question => "What is transaction for object navigator?", :answer => "SE80").find_or_create_by(:skill_id => s14.id, :language_id => en.id)
SkillQuestion.create_with(:question => "Which operator is used to copy data from one structure to another by the single components?", :answer => "MOVE-CORRESPONDING").find_or_create_by(:skill_id => s14.id, :language_id => en.id)
SkillQuestion.create_with(:question => "
Please type the output from the following code:
DATA: BEGIN OF rate,
 usa TYPE f VALUE '0.5',
 frg TYPE f VALUE '1.0',
 aut TYPE f VALUE '6.3',
END OF rate.
DATA: BEGIN OF money,
  usa TYPE i VALUE 100,
  frg TYPE i VALUE 200,
  aut TYPE i VALUE 300,
 END OF money.
MULTIPLY-CORRESPONDING money BY rate.
WRITE / money-usa.
WRITE / money-frg.
WRITE / money-aut.
", :answer => "50 200 1890").find_or_create_by(:skill_id => s14.id, :language_id => en.id)


#russian

SkillQuestion.create_with(:question => "What is the operator for 'not equal'?", :answer => "!=").find_or_create_by(:skill_id => s1.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "A is equal to 3. What will be value of A after this line: A+=1+7; ?", :answer => "11").find_or_create_by(:skill_id => s1.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "What type provides a precise representation of float value?", :answer => "decimal").find_or_create_by(:skill_id => s1.id, :language_id => ru.id)

SkillQuestion.create_with(:question => "What is the operator for 'not equal'?", :answer => "!=").find_or_create_by(:skill_id => s2.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "A is equal to 3. What will be value of A after this line: A+=1+7; ?", :answer => "11").find_or_create_by(:skill_id => s2.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "
#include <iostream>
#include <stdint.h>

int main(int a, char** b)
{
   uint32_t A[10];
   size_t B = sizeof(A);
   std::cout&lt;&lt;B;
}", :answer => "40").find_or_create_by(:skill_id => s2.id, :language_id => ru.id)

SkillQuestion.create_with(:question => "What is the name of the name space that includes input and output operations related classes?", :answer => "java.io").find_or_create_by(:skill_id => s3.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "A is equal to 7. What will be value of A after this line: A+=8-10; ?", :answer => "5").find_or_create_by(:skill_id => s3.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "What is the name of data type which is a 16-bit signed two's complement integer?", :answer => "short").find_or_create_by(:skill_id => s3.id, :language_id => ru.id)

SkillQuestion.create_with(:question => "What is the operator to assign value to variable?", :answer => ":=").find_or_create_by(:skill_id => s4.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "What is the operator used for not equal (like != in other languages?)", :answer => "<>").find_or_create_by(:skill_id => s4.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "A is equal to 4. What will be value of A after this line: Dec(A, 4);?", :answer => "0").find_or_create_by(:skill_id => s4.id, :language_id => ru.id)

SkillQuestion.create_with(:question => "What system keyword is used to define a structure?", :answer => "struct").find_or_create_by(:skill_id => s5.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "What is the name of the class to store a string?", :answer => "NSString").find_or_create_by(:skill_id => s5.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "What is the command to exit a function and return a value?", :answer => "return").find_or_create_by(:skill_id => s5.id, :language_id => ru.id)

SkillQuestion.create_with(:question => "How to define the integer variable named 'counter'?", :answer => "Dim counter as Integer").find_or_create_by(:skill_id => s6.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "What is the constant to add line carriage and line feed into string?", :answer => "vbCRLF").find_or_create_by(:skill_id => s6.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "What is the name of the namespace to work with bitmaps and drawings in .net?", :answer => "System.Drawing").find_or_create_by(:skill_id => s6.id, :language_id => ru.id)

SkillQuestion.create_with(:question => "What is the operator to match end of the string?", :answer => "$").find_or_create_by(:skill_id => s7.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "What is the shortest symbol to match anything?", :answer => ".").find_or_create_by(:skill_id => s7.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "What is the operator telling to match zero or more characters?", :answer => "*").find_or_create_by(:skill_id => s7.id, :language_id => ru.id)

SkillQuestion.create_with(:question => "What is the operator to start defining a function?", :answer => "def").find_or_create_by(:skill_id => s8.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "What is the name of the function to concatenate an array of strings into one single string?", :answer => "join").find_or_create_by(:skill_id => s8.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "What is the name of the function to get length of a string?", :answer => "len").find_or_create_by(:skill_id => s8.id, :language_id => ru.id)

SkillQuestion.create_with(:question => "What is the operator for 'not equal'?", :answer => "!=").find_or_create_by(:skill_id => s9.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "A is equal to 3. What will be value of A after this line: A+=12+1; ?", :answer => "16").find_or_create_by(:skill_id => s9.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "What is the name of the keyword is used to pause and resume a generator function?", :answer => "yeild").find_or_create_by(:skill_id => s9.id, :language_id => ru.id)

SkillQuestion.create_with(:question => "What is the shortest keyword to define a function?", :answer => "def").find_or_create_by(:skill_id => s10.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "If 'email' variable contains 'John Doe &lt;john@example.com&gt;' then what text will return this call: email.match(/<(.*?)>/)[1]", :answer => "john@example.com").find_or_create_by(:skill_id => s10.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "What is the nickname of Ruby creator?", :answer => "Matz").find_or_create_by(:skill_id => s10.id, :language_id => ru.id)

SkillQuestion.create_with(:question => "What is the name of the web-server for use with ASP.NET?", :answer => "IIS").find_or_create_by(:skill_id => s11.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "What is the name of the .NET version that runs on Linux?", :answer => "mono").find_or_create_by(:skill_id => s11.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "What is the name of the javascript superset Microsoft invented?", :answer => "Typescript").find_or_create_by(:skill_id => s11.id, :language_id => ru.id)

SkillQuestion.create_with(:question => "What is the symbol required as a prefix for variables?", :answer => "$").find_or_create_by(:skill_id => s12.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "What is the variation of 'else' operator that also checks a condition?", :answer => "elseif").find_or_create_by(:skill_id => s12.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "What is the name of predefined array that contains POST variables?", :answer => "$_POST").find_or_create_by(:skill_id => s12.id, :language_id => ru.id)

SkillQuestion.create_with(:question => "What is the keyword to close a procedure?", :answer => "КонецПроцедуры").find_or_create_by(:skill_id => s13.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "What is the keyword to define 'else' operator that also checks a condition?", :answer => "ИначеЕсли").find_or_create_by(:skill_id => s13.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "What is the keyword to start a block which is executed on exception?", :answer => "Исключение").find_or_create_by(:skill_id => s13.id, :language_id => ru.id)

SkillQuestion.create_with(:question => "Назовите транзакцию навигатора по объектам", :answer => "SE80").find_or_create_by(:skill_id => s14.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "Какой оператор используется для копирования содержимого исходной структуры в целевую по отдельным компонентам?", :answer => "MOVE-CORRESPONDING").find_or_create_by(:skill_id => s14.id, :language_id => ru.id)
SkillQuestion.create_with(:question => "
Пожалуйста напечатайте какой будет вывод в результате выполнения данного кода:

DATA: BEGIN OF rate,
 usa TYPE f VALUE '0.5',
 frg TYPE f VALUE '1.0',
 aut TYPE f VALUE '6.3',
END OF rate.
DATA: BEGIN OF money,
  usa TYPE i VALUE 100,
  frg TYPE i VALUE 200,
  aut TYPE i VALUE 300,
 END OF money.
MULTIPLY-CORRESPONDING money BY rate.
WRITE / money-usa.
WRITE / money-frg.
WRITE / money-aut.", :answer => "50 200 1890").find_or_create_by(:skill_id => s14.id, :language_id => ru.id)

#traits
t1 = Trait.find_or_create_by(:name => "Young", :index => 1)
t2 = Trait.find_or_create_by(:name => "Middle aged", :index => 1)
t3 = Trait.find_or_create_by(:name => "Generious", :index => 2)
t4 = Trait.find_or_create_by(:name => "Frugal", :index => 2)
t5 = Trait.find_or_create_by(:name => "Attentive", :index => 3)
t6 = Trait.find_or_create_by(:name => "Self-centered", :index => 3)
t7 = Trait.find_or_create_by(:name => "Kind", :index => 4)
t8 = Trait.find_or_create_by(:name => "Strict", :index => 4)
t9 = Trait.find_or_create_by(:name => "Responsible", :index => 5)
t10 = Trait.find_or_create_by(:name => "Careless", :index => 5)
t11 = Trait.find_or_create_by(:name => "Gifted", :index => 6)
t12 = Trait.find_or_create_by(:name => "Persistent", :index => 6)
t13 = Trait.find_or_create_by(:name => "Funny", :index => 7)
t14 = Trait.find_or_create_by(:name => "Accurate", :index => 7)
t15 = Trait.find_or_create_by(:name => "Romantic", :index => 8)
t16 = Trait.find_or_create_by(:name => "Pragmatic", :index => 8)
t17 = Trait.find_or_create_by(:name => "Resourceful", :index => 9)
t18 = Trait.find_or_create_by(:name => "Conservative", :index => 9)
t19 = Trait.find_or_create_by(:name => "Practical", :index => 10)
t20 = Trait.find_or_create_by(:name => "Crazy", :index => 10)
t21 = Trait.find_or_create_by(:name => "Love kids", :index => 11)
t22 = Trait.find_or_create_by(:name => "Do not love kids", :index => 11)
t23 = Trait.find_or_create_by(:name => "Wealthy", :index => 12)
t24 = Trait.find_or_create_by(:name => "Frugal", :index => 12)
t25 = Trait.find_or_create_by(:name => "Canny", :index => 13)
t26 = Trait.find_or_create_by(:name => "Sociable", :index => 13)
t27 = Trait.find_or_create_by(:name => "Family-man", :index => 14)
t28 = Trait.find_or_create_by(:name => "Party-goer", :index => 14)
t29 = Trait.find_or_create_by(:name => "With bad habits", :index => 15)
t30 = Trait.find_or_create_by(:name => "Without bad habits", :index => 15)
t31 = Trait.find_or_create_by(:name => "Modest", :index => 16)
t32 = Trait.find_or_create_by(:name => "Comfort loving", :index => 16)
t33 = Trait.find_or_create_by(:name => "Conservative about sex", :index => 17)
t34 = Trait.find_or_create_by(:name => "Wild Thing", :index => 17)

skills = [s1, s2, s3, s4, s5, s6, s7, s8, s9, s10,s11, s12, s13, s14]

skills.each_with_index do |skill, i|
  case i
  when 0
    traits = [t1, t2, t4, t5, t6, t7, t8, t10, t11, t13, t14, t15, t18, t19, t20, t22, t23, t26, t28, t29, t31, t32, t33] 
  when 1
    traits = [t2, t3, t4, t5, t6, t9, t10, t11, t12, t14, t16, t18, t19, t21, t22, t23, t24, t26, t28, t29, t31, t32, t34]
  when 2 
    traits = [t2, t3, t5, t6,  t8, t9, t11, t12, t13, t15, t16, t18, t19, t20, t21, t22, t23, t26, t28, t29, t30, t32, t33]
  when 3 
    traits = [t1, t2, t4, t5, t6, t7, t9, t10, t11, t13, t14, t15, t17, t19, t20, t22, t24, t26, t28, t28, t31, t32, t34]
  when 4 
    traits = [t1, t2, t3, t5, t6, t7, t8, t9, t11, t13, t14, t15, t16, t19, t20, t22, t24, t26, t28, t29, t30, t32, t33]
  when 5 
    traits = [t1, t3, t4, t5, t6, t8, t9, t10, t12, t13, t14, t17, t18, t19, t20, t21, t23, t26, t28, t30, t31, t32, t33]
  when 6 
    traits = [t1, t2, t4, t5, t6, t7, t8, t10, t11, t13, t14, t15, t18, t19, t20, t22, t23, t26, t28, t29, t31, t32, t33]
  when 7 
    traits = [t1, t3, t5, t7, t9, t11, t13, t15, t17, t19, t21, t23, t25, t27, t29, t30, t31, t32, t33, t34, t2, t8, t16]
  when 8 
    traits = [t1, t3, t4, t5, t6, t7, t8, t10, t11, t13, t14, t15, t18, t19, t20, t22, t23, t26, t28, t29, t31, t32, t33]
  when 9 
    traits = [t2, t3, t4, t5, t6, t9, t10, t11, t12, t14, t16, t18, t19, t21, t22, t23, t24, t26, t28, t29, t31, t32, t34]
  when 10 
    traits = [t1, t3, t4, t5, t6, t7, t8, t10, t11, t13, t14, t15, t18, t19, t20, t22, t23, t26, t28, t29, t31, t32, t33]
  when 11
    traits = [t1, t3, t4, t7, t9, t11, t12, t15, t17, t19, t21, t23, t26, t27, t29, t30, t31, t32, t18, t34, t2, t8, t18]
  when 12
    traits = [t2, t3, t4, t5, t6, t7, t9, t10, t11, t13, t14, t15, t17, t19, t20, t22, t24, t26, t28, t28, t31, t32, t34]
  when 13
    traits = [t2, t3, t4, t5, t6, t9, t10, t11, t12, t14, t16, t18, t19, t21, t22, t23, t24, t26, t28, t29, t31, t32, t34]    
  end
  
  traits.each do |trait|
    SkillTrait.find_or_create_by(:skill_id => skill.id, :trait_id => trait.id)
  end    
end

puts 'adding users'


if Rails.env.development?
  
  # create admin user
  user = AdminUser.find_by_email("admin@example.com")
  unless user
    user = AdminUser.new(email: "admin@example.com", password: "dateprog", password_confirmation: "dateprog")
      user.save!
  end
  
  user = User.find_by_email("test@example.com")
  unless user
    user = User.new(username: "Test", email: "test@example.com", password: "123456", password_confirmation: "123456", is_girl: false, about_me: "I am a programmer", 
      country: "IN", city: "ahmedabad", age: 29, gender: 1, looking_for: 2, 
      skill: Skill.first , girl_match_skill_id: Skill.first.id)
      # user.skip_confirmation!
      user.save!
  end

  # more fake programmer and non programmer accounts
  user = User.find_by_email("test1@example.com")
  unless user
    user = User.new(username: "Test1", email: "test1@example.com", password: "123456", password_confirmation: "123456", gender: 1, is_girl: false, about_me: "I am a programmer", 
      country: "US", city: "New York", age: 25, battery_size: 1000, points: 1000, gender: 1, 
      looking_for: 2,
      is_instructor: true,
      skill: Skill.first, girl_match_skill_id: Skill.first.id)
      # user.skip_confirmation!
      user.save!
  end

  # girls

  user = User.find_by_email("test2@example.com")
  unless user
    user = User.new(username: "Testing Girl 1", email: "test2@example.com", password: "123456", password_confirmation: "123456", is_girl: true, gender: 2, about_me: "testing girl number 1", 
      country: "RU", city: "Moscow", age: 19, battery_size: 1000, points: 1000, gender: 2, 
      looking_for: 1, 
      is_instructor: true,
      skill: Skill.first, girl_match_skill_id: Skill.first.id)
      # user.skip_confirmation!
      user.save!
  end

  puts 'adding users - done'

  puts 'mass fake users '
  100.times { Fabricate(:user) }
  puts 'mass users run - end'
  
  puts 'profile views'
  
  ProfileView.create!([
    {from: 3, to: 3, last_view: "2015-06-16 07:03:22", view_count: 3, is_read: false},
    {from: 3, to: 57, last_view: "2015-05-28 08:37:47", view_count: 1, is_read: false},
    {from: 3, to: 24, last_view: "2015-05-31 15:11:58", view_count: 5, is_read: false},
    {from: 3, to: 36, last_view: "2015-05-28 08:40:14", view_count: 4, is_read: false},
    {from: 3, to: 39, last_view: "2015-05-28 08:38:12", view_count: 2, is_read: false},
    {from: 3, to: 87, last_view: "2015-05-28 08:40:17", view_count: 2, is_read: false},
    {from: 3, to: 94, last_view: "2015-05-28 08:40:18", view_count: 1, is_read: false},
    {from: 3, to: 17, last_view: "2015-05-31 15:11:38", view_count: 1, is_read: false}
  ])

  puts 'courses'
  user = User.find_by_email("test1@example.com")
  Course.create!([
    {instructor_id: user.id, language_id: 0, title: "HTML for beginners", description: "<p>description of the course</p>\r\n", avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, is_published: true, is_approved: false, congratulations: ""}
  ])

  puts 'user course'  
  UserCourse.create!([
    {user_id: 3, course_id: 1, passed_levels: 1, is_completed: true}
  ])
  
  puts 'course levels'
  CourseLevel.create!([
  {course_id: 1, title: "LEVEL 1 - intro", description: "<div style=\"color: rgb(0, 0, 0); font-family: Helvetica; line-height: normal;\">HTML is the hypertext markup language and it uses special commands to change formatting, set links, set position and the behavior of the text.&nbsp;</div>\r\n\r\n<div style=\"color: rgb(0, 0, 0); font-family: Helvetica; line-height: normal;\">&nbsp;</div>\r\n\r\n<div style=\"color: rgb(0, 0, 0); font-family: Helvetica; line-height: normal;\">Commands are surrounded with &lt; and &gt; symbols. There are opening commands like &lt;command&gt; and the closing command like &lt;/command&gt;.</div>\r\n\r\n<div style=\"color: rgb(0, 0, 0); font-family: Helvetica; line-height: normal;\">The only difference is the / symbol.</div>\r\n\r\n<div style=\"color: rgb(0, 0, 0); font-family: Helvetica; line-height: normal;\">&nbsp;</div>\r\n\r\n<div style=\"color: rgb(0, 0, 0); font-family: Helvetica; line-height: normal;\">There some simple HTML commands:</div>\r\n\r\n<div style=\"color: rgb(0, 0, 0); font-family: Helvetica; line-height: normal;\">&lt;strong&gt; and &lt;/strong&gt; to mark the text inside these commands with the strong (bold) style</div>\r\n\r\n<div style=\"color: rgb(0, 0, 0); font-family: Helvetica; line-height: normal;\">&lt;i&gt; and &lt;/i&gt; to create an italic text style&nbsp;</div>\r\n\r\n<div style=\"color: rgb(0, 0, 0); font-family: Helvetica; line-height: normal;\">&lt;s&gt; and &lt;/s&gt; to create a stroked style</div>\r\n\r\n<div style=\"color: rgb(0, 0, 0); font-family: Helvetica; line-height: normal;\">&nbsp;</div>\r\n\r\n<div style=\"color: rgb(0, 0, 0); font-family: Helvetica; line-height: normal;\">All these commands can be combined.&nbsp;</div>\r\n\r\n<div style=\"color: rgb(0, 0, 0); font-family: Helvetica; line-height: normal;\">&nbsp;</div>\r\n\r\n<div style=\"color: rgb(0, 0, 0); font-family: Helvetica; line-height: normal;\">&nbsp;</div>\r\n", question: "<p>set the bold style for the first word and italic for the last&nbsp;</p>\r\n", answer: "\\s*\\<strong\\>\\s*We\\s*\\<\\/strong>\\s*know\\s*<i>\\s*HTML\\s*<\\/i>", predefined_answer: "one we know HTML", case_sensitive: false, regular_expression: false, error_message: "<p>werwerwer</p>\r\n", congratulations: "<p>perfect</p>\r\n"}
  ])
  
  puts 'tag'  
  Tag.find_or_create_by(:name => "c#", :taggings_count => 2)    
  
end


