unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  CalcOp=(Null,Plus,Minus,Mult,Delim);
  TFMainForm = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button15: TButton;
    Button16: TButton;
    Button14: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    procedure Button13Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    operation:CalcOp;
    firstArg:string;
    procedure setOp(op:CalcOp);
    function getFloat(text:string):real;
  end;

var
  FMainForm: TFMainForm;

implementation

{$R *.dfm}

procedure TFMainForm.Button12Click(Sender: TObject);
begin
  setOp(Mult);
end;

procedure TFMainForm.Button13Click(Sender: TObject);
var text:string;
begin
  Text:=Edit1.Text;
  Text:=Text+TButton(Sender).Caption;
  while (text[1]='0') and (text[2]<>',') and (length(text)>1) do
    delete(text,1,1);
  Edit1.Text:=Text;
end;

procedure TFMainForm.Button14Click(Sender: TObject);
begin
  Edit1.Text:='0';
end;

procedure TFMainForm.Button15Click(Sender: TObject);
var arg1,arg2:real;
begin
  arg1:=getFloat(firstArg);
  arg2:=getFloat(Edit1.Text);
  case operation of
    Plus:begin
      Edit1.Text:=floattostr(arg1+arg2);
      operation:=Null;
    end;
    Minus:begin
      Edit1.Text:=floattostr(arg1-arg2);
      operation:=Null;
    end;
    Mult:begin
      Edit1.Text:=floattostr(arg1*arg2);
      operation:=Null;
    end;
    Delim:if (arg2<>0) then begin
      Edit1.Text:=floattostr(arg1/arg2);
      operation:=Null;
    end;
  end;
end;

procedure TFMainForm.Button16Click(Sender: TObject);
begin
  setOp(Delim);
end;

procedure TFMainForm.Button18Click(Sender: TObject);
var l:integer; text:string;
begin
  text:=Edit1.Text;
  l:=length(text);
  if (l=1) or ((l=2) and (text[1]=',')) then
    text:='0'
  else
    delete(text,l,1);
  Edit1.Text:=text;
end;

procedure TFMainForm.Button4Click(Sender: TObject);
begin
  setOp(Plus);
end;

procedure TFMainForm.Button8Click(Sender: TObject);
begin
  setOp(Minus);
end;

procedure TFMainForm.FormCreate(Sender: TObject);
begin
  operation:=Null;
  firstArg:='';
  edit1.Text:='0';
end;

procedure TFMainForm.setOp(op: CalcOp);
begin
  operation:=op;
  firstArg:=Edit1.Text;
  Edit1.Text:='0';
end;

function TFMainForm.getFloat(text: string):real;
begin
  try
    result:=strtofloat(text);
  except
    result:=0;
  end;
end;

end.
