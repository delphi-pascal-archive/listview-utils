unit uMainDemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, XPMan, StdCtrls;

type
  TForm1 = class(TForm)
    XPManifest1: TXPManifest;
    ListView1: TListView;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses LVUtils;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  LVUtils.CulumnAdd('Test Column',100,ListView1);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  LVUtils.ColumnDelete(ListView1.Columns.Count-1,ListView1);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  LVUtils.ItemAdd('Test item',0,-1,ListView1);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  LVUtils.SubItemAdd(ListView1.SelCount-1,'Test sub',ListView1);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  LVUtils.SubItemDelete(ListView1.SelCount-1,ListView1.Selected.SubItems.Count-1,ListView1);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    begin
      LVUtils.LoadItems(OpenDialog1.FileName,ListView1);
    end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    begin
      LVUtils.SaveItems(SaveDialog1.FileName,ListView1);
    end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  LVUtils.ItemDelete(ListView1.SelCount-1,ListView1);
end;

end.
