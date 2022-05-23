unit unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  front, TypecastU, ImFilterU, ImagePrU, Vcl.Imaging.pngimage, Vcl.StdCtrls,
  Vcl.Menus;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    ImagePr1: TImagePr;
    imageFilter1: TimageFilter;
    TypeCast1: TTypeCast;
    PopupMenu1: TPopupMenu;
    zoomin1: TMenuItem;
    zoomout1: TMenuItem;
    exit1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure zoomin1Click(Sender: TObject);
    procedure zoomout1Click(Sender: TObject);
    procedure exit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    md: Boolean;
    mx, my: Integer;
    procedure moving(shiftx: Integer; shifty: Integer);
    { Public declarations }

  end;

var
  Form2: TForm2;
  mat, mat1, mat2, mat3, mat4: TBitMat;
  b, bit, bitt: tBITMAP;

implementation

{$R *.dfm}

uses fMain;

procedure TForm2.FormShow(Sender: TObject);

var
  i, j: Integer;
begin
  b := tBITMAP.Create;
  bit := tBITMAP.Create;
  bit.Assign(Image1.Picture.Graphic);

  mat.Pixels := 1280;
  mat.Lines := 800;
  mat.Colr := true;
  ImagePr1.DllSetmat(mat);
  ImagePr1.ResizeX(mat, 1280, 800);

  // b.LoadFromFile(pathstr+'index0.bmp');
  ImagePr1.Image2Mat(Form1.form1im[0], mat1);
  ImagePr1.ResizeX(mat1, 300, 300);

  // b.LoadFromFile(pathstr+'index1.bmp');
  ImagePr1.Image2Mat(Form1.form1im[1], mat2);
  ImagePr1.ResizeX(mat2, 300, 300);

  // b.LoadFromFile(pathstr+'index2.bmp');
  ImagePr1.Image2Mat(Form1.form1im[2], mat3);
  ImagePr1.ResizeX(mat3, 300, 300);

  // b.LoadFromFile(pathstr+'index3.bmp');
  ImagePr1.Image2Mat(Form1.form1im[3], mat4);
  ImagePr1.ResizeX(mat4, 300, 300);

  for i := 0 to 299 do
    for j := 0 to 299 do
    begin
      mat.Red[i, 490 + j] := mat1.Red[i, j];
      mat.Green[i, 490 + j] := mat1.Green[i, j];
      mat.Blue[i, 490 + j] := mat1.Blue[i, j];
      // ======================================
      mat.Red[i + 500, 490 + j] := mat2.Red[i, j];
      mat.Green[i + 500, 490 + j] := mat2.Green[i, j];
      mat.Blue[i + 500, 490 + j] := mat2.Blue[i, j];
      // ======================================
      mat.Red[i + 250, 240 + j] := mat3.Red[j, i];
      mat.Green[i + 250, 240 + j] := mat3.Green[j, i];
      mat.Blue[i + 250, 240 + j] := mat3.Blue[j, i];
      // ======================================
      mat.Red[i + 250, 740 + j] := mat4.Red[j, i];
      mat.Green[i + 250, 740 + j] := mat4.Green[j, i];
      mat.Blue[i + 250, 740 + j] := mat4.Blue[j, i];

    end;
  ImagePr1.Mat2Image(mat, bit);
  Image1.Picture.Assign(bit);
  Image1.Stretch := true;
  bit.Free;
  b.Free;
  MainForm.Visible := false;

end;

procedure TForm2.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    md := true;
    mx := X;
    my := Y;
  end;
end;

procedure TForm2.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if md = true then
  begin
    md := false;
    moving((X - mx), (Y - my));
    MainForm.screening;
    Application.ProcessMessages;
    Form2.FormShow(nil);
  end;

end;

procedure TForm2.exit1Click(Sender: TObject);
begin
  close;
end;

procedure TForm2.moving(shiftx: Integer; shifty: Integer);
begin
  MainForm.ffObject.Direction.X := MainForm.ffObject.Direction.X + shiftx / 300;
  MainForm.ffObject.Direction.Y := MainForm.ffObject.Direction.Y + shifty / 300;
  MainForm.ffObject.Direction.Z := MainForm.ffObject.Direction.Z + shifty / 300;
end;

procedure TForm2.zoomin1Click(Sender: TObject);
begin
  MainForm.Camera1.Position.X := MainForm.Camera1.Position.X - 30; // 50
  MainForm.Camera2.Position.X := MainForm.Camera2.Position.X + 30; // -50
  MainForm.Camera3.Position.Y := MainForm.Camera3.Position.Y - 30; // 50
  MainForm.Camera4.Position.Y := MainForm.Camera4.Position.Y + 30; // -50
  Application.ProcessMessages;
  MainForm.screening;
  Form2.FormShow(nil);
end;

procedure TForm2.zoomout1Click(Sender: TObject);
begin
  MainForm.Camera1.Position.X := MainForm.Camera1.Position.X + 30; // 50
  MainForm.Camera2.Position.X := MainForm.Camera2.Position.X - 30; // -50
  MainForm.Camera3.Position.Y := MainForm.Camera3.Position.Y + 30; // 50
  MainForm.Camera4.Position.Y := MainForm.Camera4.Position.Y - 30; // -50
  Application.ProcessMessages;
  MainForm.screening;
  Form2.FormShow(nil);
  MainForm.Visible := false;

end;

end.
