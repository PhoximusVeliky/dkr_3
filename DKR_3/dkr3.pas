program z1; ///f=x*x*x+2*x*x-2*x+8
uses crt;
var
    a,b,S : Real;
      h,x : real;
        i : integer;
    flag2 : boolean;
 
function Y (x:real) :real;
begin
  y:=x*x*x+2*x*x-2*x+8;
end;
 
function Y_sht (x:real) :real;
begin
  y_sht:=((x*x*x*x)/4)+((2*x*x*x)/3)-((2*x*x)/2)+(8*x);
end;
    
function av:real;
var flag:boolean;
       x:real;
begin
  x:=0;        
  repeat
  flag:=true;
  if 0<=x*x*x+2*x*x-2*x+8 then begin
                               flag:=false;
                               x-=0.0001;
                               X:=(Round(X*10000))/10000;
                               end;                             
  until flag=true;
  av:=x;//-3.3251
end;

{procedure pregel(var a,b :real);
var flag:boolean;
begin
  repeat
  flag:=true;
  writeln('Введите пределы интегрирования ф-ии [-3.3251;0]');
  read(a,b);
  if (av<a) and (a>0) then begin
                           flag:=false;
                           writeln('предел а недопустим');
                           end;
  if (av<b) and (b>0) then begin
                           flag:=false;
                           writeln('предел b недопустим');
                           end;
  if a>b then begin
              flag:=false;
              writeln('предел a и b недопустим');
              end;
  until flag=true;
end;}

procedure v_lob;
begin
  //в лоб
  writeln('Вы выбрали бызовый метод');
  S:=Y_sht(b)-Y_sht(a);
  writeln('Интеграл = ',s);
  
end;

procedure v_simsona;
var n : integer;
begin
  //в симсонa
  writeln('Вы выбрали метод Симпсона');
  writeln('На сколько частей делим промежуток?');
  Readln(n);
  h:=(b-a)/n;// мб спросить на сколько частей?(1000=n)
  s:=0;
  x:=a+h;
  while x<b do begin
               s:=s+4*Y(x);
               x:=x+h;
               s:=s+2*Y(x);
               x:=x+h;
               end;
  S:=h/3*(s+Y(a)-Y(b));
  writeln('Интеграл = ',s);
  writeln('Погрешность = ', (Y_sht(b)-Y_sht(a)) - s);
end;

begin
repeat
flag2:=true;
writeln('Нахождение интеграла  y=x^(3)+2x^(2)-2*x+8');
{pregel(a,b);}
writeln('Введите пределы интегрирования ф-ии [-3.3251;∞]');
read(a,b);
writeln('Выберите метод интегрирования');

writeln('1:базовый метод интегрирования');
writeln('2:метод Симпсона');
readln(i);
case i of
  0:flag2:=false;
  1:v_lob;
  2:v_simsona;
 end;
writeln('Хотите повторить ввод?');
writeln('1:Да');
writeln('2:Нет');
readln(i);
case i of 
  1:flag2:=false;
  2:flag2:=true;
 end;
until flag2=true ;
end.
