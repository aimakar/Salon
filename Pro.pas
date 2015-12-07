unit Pro;

interface

uses SysUtils, Controls,Dialogs;


procedure CloseData;
procedure IncNom(var S : String; Pod : String);
procedure DelNom(var S : String);
procedure TrimAll (var S : String);
procedure Skidka (var S : String);
function ReplStr (S : String; I : Integer) : String;
function TextSum(S: double): string;
function NasDosT(S : String) : Boolean;
function DecDatePer(D : TDateTime) : String;
function TextSum2(S: double): string;

implementation

uses Data,ProverkaF,Sklad;

function DecDatePer(D : TDateTime) : String;
var Year,Month,Day : Word;
    D1 : TDateTime;
begin
//
DecodeDate(D,Year,Month,Day);
if Month < 12 then
  D1 := EncodeDate(Year,Month+1,1)
else
  D1 := EncodeDate(Year+1,1,1);
if (D1 - D) > 10 then
  Result := DateToStr(D)
else
  Result := DateToStr(D1);
end;

procedure CloseData;
begin
     with DataMain do
          begin
               //GROper.Close;
               //Oper.Close;
               //Who.Close;
               //Why.Close;
               GrTovar.Close;
               Tovar.Close;
               TT.Close;
               Ost.Close;
               Post.Close;
               Predpr.Close;
               Proiz.Close;
               Rekv.Close;
               Config.Close;
               ConfigVit.Close;
               IzlNakl.Close;
               IzlTN.Close;
               BRNakl.Close;
               BRTN.Close;
               CashNakl.Close;
               CashTN.Close;
               NaklPrih.Close;
               TNPrih.Close;
               NaklVozv.Close;
               TnVozv.Close;
               end;
end;


function NasDosT(S : String) : Boolean;
begin
     if S = '1' then NasDost := True else NasDost := False;
end;

function ReplStr (S : String; I : Integer) : String;
var K : Integer;
    S1 : String;
begin
   S1 := S;
   for K := 2 to I do S := S + S1;
   ReplStr := S;
end;

procedure IncNom(var S : String;Pod : String);
var L,P : Integer;
    S1 : String;

begin
     L := Length(S);
     P := Pos(Pod,S);
     S1 := S;
     Delete(S1,P,L);
     S := IntToStr(StrToInt(S1)+1)+Pod;
end;



procedure TrimAll( var S : String);
var S1,S2 : String;
begin
     S1 := S;
     S2 := S;
     S1 := Copy(S1,0,Pos(',',S1)-1);
     S2 := Copy(S2,Pos(',',S2)+1,2);
     S := Trim(S1)+','+Trim(S2);
end;



procedure Skidka (var S : String);
var I : Integer;
begin
     try
     I := StrToInt(trim(S));
     except
     I := 1;
     end;
     if I = 0 then I := 1;
     S := IntToStr(I);
end;

procedure DelNom(var S : String);
begin
     Delete(S,Pos('-',S),length(S));
end;






{------------------------ ������ �������� ---------------------}
function TextSum(S: double): string;

function Conv999(M: longint; fm: integer): string;
const

c1to9m: array [1..9] of string [6] =
('����','���','���','������','����','�����','����','������','������');
c1to9f: array [1..9] of string [6] =
('����','���','���','������','����','�����','����','������','������');
c11to19: array [1..9] of string [12] =
('�����������','����������','����������','������������','����������',
'�����������','����������','������������','������������');
c10to90: array [1..9] of string [11] =
('������','��������','��������','�����','���������','����������',
'���������','�����������','���������');
c100to900: array [1..9] of string [9] =
('���','������','������','���������','�������','��������','�������',
'���������','���������');
var

s: string;
i: longint;
begin

s := '';
i := M div 100;
if i<>0 then s:=c100to900[i]+' ';
M := M mod 100;
i := M div 10;
if (M>10) and (M<20) then s:=s+c11to19[M-10]+' '
else
begin
if i<>0 then s:=s+c10to90[i]+' ';
M := M mod 10;
if M<>0 then
if fm=0 then s:=s+c1to9f[M]+' '
else s:=s+c1to9m[M]+' ';
end;
Conv999 := UpperCase(s);
end;

{--------------------------------------------------------------}
var

i: longint;
j: longint;
r: real;
t: string;

begin

t := '';


j := Trunc(S/1000000000.0);
r := j;
r := S - r*1000000000.0;
i := Trunc(r);
if j<>0 then
begin
t:=t+Conv999(j,1)+'��������';
j := j mod 100;
if (j>10) and (j<20) then t:=t+'�� '
else
case j mod 10 of
0: t:=t+'�� ';
1: t:=t+' ';
2..4: t:=t+'� ';
5..9: t:=t+'�� ';
end;
end;


j := i div 1000000;
if j<>0 then
begin
t:=t+Conv999(j,1)+'�������';
j := j mod 100;
if (j>10) and (j<20) then t:=t+'�� '
else
case j mod 10 of
0: t:=t+'�� ';
1: t:=t+' ';
2..4: t:=t+'� ';
5..9: t:=t+'�� ';
end;
end;


i := i mod 1000000;
j := i div 1000;
if j<>0 then
begin
t:=t+Conv999(j,0)+'�����';
j := j mod 100;
if (j>10) and (j<20) then t:=t+' '
else
case j mod 10 of
0: t:=t+' ';
1: t:=t+'� ';
2..4: t:=t+'� ';
5..9: t:=t+' ';
end;
end;


i := i mod 1000;
j := i;
if j<>0 then t:=t+Conv999(j,1);
t := t+'���. ';


i := Round(Frac(S)*100.0);
t := t+IntToStr(i)+' ���.';
TextSum := t;
end;



{------------------------ ������ �������� ---------------------}
function TextSum2(S: double): string;

function Conv999(M: longint; fm: integer): string;
const

c1to9m: array [1..9] of string [6] =
('����','���','���','������','����','�����','����','������','������');
c1to9f: array [1..9] of string [6] =
('����','���','���','������','����','�����','����','������','������');
c11to19: array [1..9] of string [12] =
('�����������','����������','����������','������������','����������',
'�����������','����������','������������','������������');
c10to90: array [1..9] of string [11] =
('������','��������','��������','�����','���������','����������',
'���������','�����������','���������');
c100to900: array [1..9] of string [9] =
('���','������','������','���������','�������','��������','�������',
'���������','���������');
var

s: string;
i: longint;
begin

s := '';
i := M div 100;
if i<>0 then s:=c100to900[i]+' ';
M := M mod 100;
i := M div 10;
if (M>10) and (M<20) then s:=s+c11to19[M-10]+' '
else
begin
if i<>0 then s:=s+c10to90[i]+' ';
M := M mod 10;
if M<>0 then
if fm=0 then s:=s+c1to9f[M]+' '
else s:=s+c1to9m[M]+' ';
end;
Conv999 := UpperCase(s);
end;

{--------------------------------------------------------------}
var

i: longint;
j: longint;
r: real;
t: string;

begin

t := '';


j := Trunc(S/1000000000.0);
r := j;
r := S - r*1000000000.0;
i := Trunc(r);
if j<>0 then
begin
t:=t+Conv999(j,1)+'��������';
j := j mod 100;
if (j>10) and (j<20) then t:=t+'�� '
else
case j mod 10 of
0: t:=t+'�� ';
1: t:=t+' ';
2..4: t:=t+'� ';
5..9: t:=t+'�� ';
end;
end;


j := i div 1000000;
if j<>0 then
begin
t:=t+Conv999(j,1)+'�������';
j := j mod 100;
if (j>10) and (j<20) then t:=t+'�� '
else
case j mod 10 of
0: t:=t+'�� ';
1: t:=t+' ';
2..4: t:=t+'� ';
5..9: t:=t+'�� ';
end;
end;


i := i mod 1000000;
j := i div 1000;
if j<>0 then
begin
t:=t+Conv999(j,0)+'�����';
j := j mod 100;
if (j>10) and (j<20) then t:=t+' '
else
case j mod 10 of
0: t:=t+' ';
1: t:=t+'� ';
2..4: t:=t+'� ';
5..9: t:=t+' ';
end;
end;


i := i mod 1000;
j := i;
if j<>0 then t:=t+Conv999(j,1);

TextSum2 := t;
end;




end.
