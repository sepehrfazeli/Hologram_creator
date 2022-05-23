unit front;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, TypecastU, Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    Image1: TImage;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    camchange: TBitBtn;
    Label1: TLabel;
    Panel1: TPanel;
    BitBtn6: TBitBtn;
    Button1: TButton;
    Image2: TImage;
    Image3: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure camchangeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    form1im: Array [0 .. 3] of TBitmap;

  end;

var
  Form1: TForm1;
  x, y: integer;

implementation

{$R *.dfm}

uses fMain, Unit2;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin

  // Application.ProcessMessages;
  // MainForm.Visible:= false;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  // MainForm .Visible:=false;
  case x of
    0:
      begin
        MainForm.Visible := false;
        x := x + 1;
      end;
    1:
      begin
        MainForm.Visible := true;
        x := 0;
      end;

  end;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin

  // MainForm.Visible:=true;

end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  MainForm.acFilePickExecute(nil);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  // form3.visible:=true;
end;

procedure TForm1.camchangeClick(Sender: TObject);
begin
  case y of
    0:
      begin
        MainForm.snViewer.Camera := MainForm.Camera1;
        // Form4.GLSceneViewer1.Camera:= MainForm.Camera1 ;
        y := y + 1;
        Label1.Caption := 'camera1';
//        Form1.Caption := '0';
      end;
    1:
      begin
        MainForm.snViewer.Camera := MainForm.Camera2;
        // Form4.GLSceneViewer1.Camera:= MainForm.Camera2 ;
        y := y + 1;
        Label1.Caption := 'camera2';
//        Form1.Caption := '1';
      end;
    2:
      begin
        MainForm.snViewer.Camera := MainForm.Camera3;
        // Form4.GLSceneViewer1.Camera:= MainForm.Camera3 ;
        y := y + 1;
        Label1.Caption := 'camera3';
//        Form1.Caption := '2';
      end;
    3:
      begin
        MainForm.snViewer.Camera := MainForm.Camera4;
        // Form4.GLSceneViewer1.Camera:= MainForm.Camera4 ;
        y := 0;
        Label1.Caption := 'camera4';
//        Form1.Caption := '3';
      end;

  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to 3 do
    form1im[i] := TBitmap.create;

end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  MainForm := TMainForm.create(Application);
  MainForm.Visible := true;
  MainForm.Width := 300;
  MainForm.Height := 300;

  MainForm.acFileOpenExecute(nil);
  MainForm.screening;
  Form2 := TForm2.create(Application);
  Form2.Visible := true;
end;

procedure reseting;
begin
  y := 0;
end;

end.
