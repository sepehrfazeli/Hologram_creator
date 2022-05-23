unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.MaterialSources;

type
  TForm1 = class(TForm)
    Pie1: TPie;
    Pie2: TPie;
    Pie3: TPie;
    Pie4: TPie;
    Circle1: TCircle;
    Rectangle1: TRectangle;
    TextureMaterialSource1: TTextureMaterialSource;
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
Pie1.Fill.Bitmap.Bitmap.LoadFromFile('C:\My_Delphi\pix\index1.jpg');
Pie2.Fill.Bitmap.Bitmap.LoadFromFile('C:\My_Delphi\pix\index2.jpg');
Pie3.Fill.Bitmap.Bitmap.LoadFromFile('C:\My_Delphi\pix\index3.jpg');
Pie4.Fill.Bitmap.Bitmap.LoadFromFile('C:\My_Delphi\pix\index4.jpg');
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
if keychar=Space then
begin
  close;
end;
end;

end.
