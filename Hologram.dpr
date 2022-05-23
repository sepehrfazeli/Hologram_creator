program Hologram;

uses
  Vcl.Forms,
  dGLSViewer in 'dGLSViewer.pas' {dmGLSViewer: TDataModule},
  fGLForm in 'fGLForm.pas' {GLForm},
  fMain in 'fMain.pas' {MainForm},
  front in 'front.pas' {Form1},
  unit2 in 'unit2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmGLSViewer, dmGLSViewer);
  Application.CreateForm(TGLForm, GLForm);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
