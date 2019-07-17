unit uHi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons, MPlayer;

type
  TfmHi = class(TForm)
    lbMCalc: TLabel;
    butStart: TButton;
    procedure butStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmHi: TfmHi;
  f : textfile;
  way : string;

implementation

uses uChoise, uSound;

{$R *.dfm}

procedure TfmHi.butStartClick(Sender: TObject);
begin
  if not assigned(form1) then
    form1 := tform1.create(self);
  form1.show;
  fmHi.Enabled := false;
  fmHi.Visible := false;
end;

procedure TfmHi.FormCreate(Sender: TObject);
begin
  assignfile(f, ExtractFilePath(ExpandFileName('Project1.exe')) + '���������� ����������.txt');
  way := ExtractFilePath(ExpandFileName('Project1.exe'));
  rewrite(f);
  closefile(f);
  assignfile(f, way + '��������� � ����.txt');
  rewrite(f);
  closefile(f);
end;

procedure TfmHi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if player = true then
    dispose(tracklist);
end;

end.