unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, TAChartImageList, Forms, Controls, Graphics,
  Dialogs, ComCtrls, StdCtrls, Menus, ExtCtrls;

type

  { TTrain }

  TTrain = class(TForm)
    BuStart: TButton;
    BuAns: TButton;
    BuAns1: TButton;
    BuAns2: TButton;
    BuQuest: TButton;
    BuClose: TButton;
    BuRestart: TButton;
    BuClose1: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    ImGround: TImage;
    ImTrue: TImage;
    ImGround1: TImage;
    ImFalse: TImage;
    ImGround2: TImage;
    LabAns: TLabel;
    Label1: TLabel;
    Label10: TLabel;
    LabAns1: TLabel;
    LabAns2: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LabQuest: TLabel;
    LabResult: TLabel;
    LabQuestions: TLabel;
    LabTrue: TLabel;
    LabFalse: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LabStart: TLabel;
    Lb1: TLabel;
    MainMenu: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    OpenDialog1: TOpenDialog;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Tc1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    ToggleBox1: TToggleBox;
    procedure BuCloseClick(Sender: TObject);
    procedure BuAnsClick(Sender: TObject);
    procedure BuAns1Click(Sender: TObject);
    procedure BuAns2Click(Sender: TObject);
    procedure BuStartClick(Sender: TObject);
    procedure BuQuestClick(Sender: TObject);
    procedure BuRestartClick(Sender: TObject);
    procedure BuClose1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure ToggleBox1Change(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Train: TTrain;
  T:TextFile;//Обьявляем текстовый файл
  S:Integer;//Переменная
  Y:array [1..100] of string;//массив вопросов
  i, j, k1, k2, k3, k, D:Integer;
  anscorrect:integer;//количество правильных ответов
  ansnotcorrect:integer;//количество не правильных ответов
  AnsCor:string;
  TestFilePath : string; //Путь к файлу теста
  CountOfQuest : Integer;
  CurrQuest : Integer;
implementation

{$R *.lfm}

{ TTrain }

procedure TTrain.BuStartClick(Sender: TObject);
VAR Sl : TStringList;
begin
try
   assignfile (T,TestFilePath);//Открываем текстовый файл
   reset (T);//
   sl := TStringList.Create;
   sl.LoadFromFile(TestFilePath);
   CountOfQuest := round(sl.Count/4);
   CurrQuest:= 0;
   sl.free;

   i:=1;
   j:=1;
   D:=0;
   anscorrect:=0;
   S:=0;
   While not eof (T) do
   begin
      readln (T, Y[i]);
      i:=i+1;
      D:=i;// количество вопросов и ответов
   end;
   i:=1;
   Closefile (T);
   randomize;
   Tc1.SelectNextPage(true);
except
  ShowMessage('Файл с именем '+ TestFilePath + ' НЕ найден!' + #13 + 'Выберите другой файл в меню программы!');
end;
end;

procedure TTrain.BuAnsClick(Sender: TObject);
begin
    BuAns1.Enabled:=false;
    BuAns2.Enabled:=false;
    BuAns.Enabled:=false;
 if LabAns.Caption=Anscor then
   begin
        ImTrue.Show;
        anscorrect:=anscorrect+1;


     end
    else
       ImFalse.Show;
       ansnotcorrect:=ansnotcorrect+1;

end;

procedure TTrain.BuCloseClick(Sender: TObject);
begin
  close;
end;

procedure TTrain.BuAns1Click(Sender: TObject);
begin
   BuAns.Enabled:=false;
   BuAns2.Enabled:=false;
   BuAns1.Enabled:=false;
 if LabAns1.Caption=Anscor then
     begin
          ImTrue.Show;
           anscorrect:=anscorrect+1;

     end
     else
       ImFalse.Show;
       ansnotcorrect:=ansnotcorrect+1

end;

procedure TTrain.BuAns2Click(Sender: TObject);
begin
 BuAns1.Enabled:=false;
 BuAns.Enabled:=false;
 BuAns2.Enabled:=false;

 if LabAns2.Caption=Anscor then
  begin
   ImTrue.Show;
   anscorrect:=anscorrect+1;

   end
    else

     ImFalse.Show;
     ansnotcorrect:=ansnotcorrect+1
end;

procedure TTrain.BuQuestClick(Sender: TObject);

begin
 CurrQuest:= CurrQuest + 1;
 label11.Caption := IntToStr(CurrQuest) + ' / ' + IntToStr(CountOfQuest);
 k:=random(5)+1;// выбор группы для перебора ответов
 case k of
      1:begin k1:=1; k2:=2; k3:=3; end;
      2:begin k1:=1; k2:=3; k3:=2; end;
      3:begin k1:=2; k2:=1; k3:=3; end;
      4:begin k1:=2; k2:=3; k3:=1; end;
      5:begin k1:=3; k2:=1; k3:=2; end;
      6:begin k1:=3; k2:=2; k3:=1; end;

 end;
  S:=S+1;
 LabQuest.Caption:=Y[i];// вопрос
 AnsCor:= Y[i+1];//правильный ответ

  BuAns.Show;
  BuAns1.Show;
  BuAns2.Show;
  BuAns.Enabled:=true;
  BuAns1.Enabled:=true;
  BuAns2.Enabled:=true;

  //
  ImTrue.Hide;
  ImFalse.Hide;

 LabAns.Caption:= Y[i+k1];
 LabAns1.Caption:= Y[i+k2];
 LabAns2.Caption:= Y[i+k3];
 i:=i+4;

 //переход на к результатам
 if D<i then  Tc1.SelectNextPage(true);  // Переход к результатам

 //
 Label8.Caption:=IntToStr(S-1);//всего вопросов
 Label9.Caption:=IntToStr(anscorrect);//правильных ответов
 Label10.Caption:=IntToStr(S-1-anscorrect);//кол-во не правильных ответов

end;

procedure TTrain.BuRestartClick(Sender: TObject);
begin
     Label9.Caption:='  ';
     Label10.Caption:='  ';

     Tc1.ActivePageIndex:=0;
     BuAns.Hide;
     BuAns1.Hide;
     BuAns2.Hide;
end;

procedure TTrain.BuClose1Click(Sender: TObject);
begin
  close;
end;

procedure TTrain.Button1Click(Sender: TObject);
var f:textfile;
  s: String;
begin
If (memo1.Text <> '') and (Edit1.Text <> '') and (Edit2.Text <> '') and (Edit3.Text <> '') Then
 Begin
   assignfile(f,label1.Caption);
   if not fileexists(label1.Caption) then  ShowMessage('No File')
   Else
     Begin
       append(f);
       s:=StringReplace(Memo1.Text, #13, '', [rfReplaceAll, rfIgnoreCase]);
       s:=StringReplace(s, #10, ' ', [rfReplaceAll, rfIgnoreCase]);
       writeln(f,s);
       writeln(f,Edit1.Text);
       writeln(f,Edit2.Text);
       writeln(f,Edit3.Text);
       closefile(f);
       Memo1.Clear;
       Edit1.Clear;
       Edit2.Clear;
       Edit3.Clear;
     end;
 end
Else ShowMessage('Не заполнены обязательные поля');

end;

procedure TTrain.Button2Click(Sender: TObject);
begin
  Tc1.ActivePageIndex:=0;
end;

procedure TTrain.Button3Click(Sender: TObject);
begin
  Tc1.ActivePageIndex:=0;
end;

procedure TTrain.Button5Click(Sender: TObject);
begin
end;

procedure TTrain.FormCreate(Sender: TObject);
begin
 BuAns.Hide;
 BuAns1.Hide;
 BuAns2.Hide;     //Скрывает кнопки
ImTrue.Hide;
ImFalse.Hide;

Tc1.ActivePageIndex:=0;//Начало с первой закладки
Tc1.ShowTabs:=false;
 TestFilePath:= '1.txt'; // По умолчанию выбираем тест в папке проекта


end;

procedure TTrain.MenuItem2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
begin
  TestFilePath := OpenDialog1.Filename;
  //ShowMessage(TestFilePath);
end;
end;

procedure TTrain.MenuItem3Click(Sender: TObject);
begin
   Edit5.Clear;
  Tc1.ActivePageIndex:=3;
end;

procedure TTrain.ToggleBox1Change(Sender: TObject);
Var f:textfile;
begin
If Edit5.Text <> '' Then
 Begin
   if Not FileExists(Edit5.Text+'.txt') then
    Begin
      assignfile(f,Edit5.Text+'.txt');
      rewrite(f);//если файл есть, его очистит, если нет, создаст.
      closefile(f);
      Label1.Caption:=Edit5.Text+'.txt';
      Memo1.Clear;
      Edit1.Clear;
      Edit2.Clear;
      Edit3.Clear;
      Tc1.ActivePageIndex:=4;
    end
   Else ShowMessage('Файл с таким именем уже существует!' + #13 + 'Введите другое имя файла.');
 end
Else ShowMessage('Введите имя файла!');

end;

end.



