unit uOperations;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, StdCtrls, ActnList, XPStyleActnCtrls, ActnMan,
  Grids, ExtCtrls, jpeg, MPlayer,
  Buttons;

type
  TMatrix = array of array of real;
  TColumn = set of 1..10;
  TMatr = array [1..10, 1..10] of real;

  TfmOper = class(TForm)
    fmOperMenu: TMainMenu;
    PageControl1: TPageControl;
    tabMain: TTabSheet;
    tabAdd: TTabSheet;
    tabSub: TTabSheet;
    mFile: TMenuItem;
    mNew: TMenuItem;
    mOpen: TMenuItem;
    mSave: TMenuItem;
    N6: TMenuItem;
    mExit: TMenuItem;
    mOperations: TMenuItem;
    mAdd: TMenuItem;
    mSub: TMenuItem;
    N11: TMenuItem;
    mMultNumb: TMenuItem;
    mMultMatr: TMenuItem;
    N14: TMenuItem;
    mDet: TMenuItem;
    mPow: TMenuItem;
    mProgramm: TMenuItem;
    mInst: TMenuItem;
    mAboutProgramm: TMenuItem;
    btAdd: TButton;
    btSub: TButton;
    btDet: TButton;
    btMultNumb: TButton;
    btMultMatr: TButton;
    btPow: TButton;
    tabMultNumb: TTabSheet;
    tabMultMatr: TTabSheet;
    tabPow: TTabSheet;
    tabDet: TTabSheet;
    btBackToMain: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    btAddNumb: TButton;
    btAddMatr: TButton;
    strFirstAdd: TStringGrid;
    strSecondAdd: TStringGrid;
    strResultAdd: TStringGrid;
    lbResultAdd: TLabel;
    lbFirstAdd: TLabel;
    lbSecondAdd: TLabel;
    strFirstSub: TStringGrid;
    lbResultSub: TLabel;
    lbFirstSub: TLabel;
    lbSecondSub: TLabel;
    strSecondSub: TStringGrid;
    strResultSub: TStringGrid;
    btSubMatr: TButton;
    btSubNumb: TButton;
    strMultNumb: TStringGrid;
    lbResultMultNumb: TLabel;
    strResultMultNumb: TStringGrid;
    strFirstMultMatr: TStringGrid;
    lbResultMutMatr: TLabel;
    lbFirstMultMatr: TLabel;
    lbSecondMultMatr: TLabel;
    strSecondMultMatr: TStringGrid;
    strResultMultMatr: TStringGrid;
    strPow: TStringGrid;
    lbResultPow: TLabel;
    strResultPow: TStringGrid;
    strDet: TStringGrid;
    lbResultDet: TLabel;
    lbSizeAdd: TLabel;
    edSize2Add: TEdit;
    Label2: TLabel;
    btOKSizeAdd: TButton;
    edSize1Add: TEdit;
    lbNumbAdd: TLabel;
    edNumbAdd: TEdit;
    lbSizeSub: TLabel;
    Label3: TLabel;
    lbNumbSub: TLabel;
    edSize1Sub: TEdit;
    edSize2Sub: TEdit;
    btOKSizeSub: TButton;
    edNumbSub: TEdit;
    lbNumbMultNumb: TLabel;
    Label4: TLabel;
    lbSizeMultNumb: TLabel;
    edSize1MultNumb: TEdit;
    edSize2MultNumb: TEdit;
    edNumbMultNumb: TEdit;
    btOKSizeMultNumb: TButton;
    Button8: TButton;
    Button9: TButton;
    edSize1MultMatr: TEdit;
    edSize2MultMatr: TEdit;
    edSize3MultMatr: TEdit;
    edSize4MultMatr: TEdit;
    btOKSizeMultMatr: TButton;
    btOKSizePow: TButton;
    edSizePow: TEdit;
    edNumbPow: TEdit;
    edResultDet: TEdit;
    edSizeDet: TEdit;
    btOKSizeDet: TButton;
    GO: TButton;
    GO1: TButton;
    GO2: TButton;
    GO3: TButton;
    GO4: TButton;
    GO5: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    N1: TMenuItem;
    mGO: TMenuItem;
    tabTranspose: TTabSheet;
    strResultTranspose: TStringGrid;
    strTranspose: TStringGrid;
    GO6: TButton;
    edSize1Transpose: TEdit;
    btOKSizeTranspose: TButton;
    Label1: TLabel;
    btTranspose: TButton;
    mTranspose: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    Memo6: TMemo;
    Memo7: TMemo;
    Memo8: TMemo;
    Memo9: TMemo;
    Memo10: TMemo;
    Label5: TLabel;
    Memo11: TMemo;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Memo12: TMemo;
    btShowAlg: TButton;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Memo13: TMemo;
    Button1: TButton;
    Label13: TLabel;
    Label16: TLabel;
    Memo14: TMemo;
    Image2: TImage;
    Button6: TButton;
    Button7: TButton;
    Memo15: TMemo;
    Memo16: TMemo;
    edSize2Transpose: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Image3: TImage;
    Button10: TButton;
    Button11: TButton;
    MediaPlayer1: TMediaPlayer;
    Button12: TButton;
    tabObrTranspose: TTabSheet;
    strObrTranspose: TStringGrid;
    strResultObrTranspose: TStringGrid;
    Label22: TLabel;
    Label23: TLabel;
    btOKSizeObrTranspose: TButton;
    GO7: TButton;
    Button13: TButton;
    Button14: TButton;
    btObrTranspose: TBitBtn;
    Memo17: TMemo;
    Memo18: TMemo;
    Button15: TButton;
    tabSled: TTabSheet;
    strSled: TStringGrid;
    Label24: TLabel;
    edSizeSled: TEdit;
    GO8: TButton;
    Label25: TLabel;
    btOKSizeSled: TButton;
    lbResultSled: TLabel;
    edResultSled: TEdit;
    Memo19: TMemo;
    Label20: TLabel;
    edSizeObrTranspose: TEdit;
    btSled: TButton;
    Button16: TButton;
    Button17: TButton;
    Image1: TImage;
    Label21: TLabel;
    mSled: TMenuItem;
    mObrTranspose: TMenuItem;
    tmrSledShow: TTimer;
    tmrSledSkip: TTimer;
    imgMemo20: TImage;
    Button18: TButton;
    procedure mAboutProgrammClick(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure btSubClick(Sender: TObject);
    procedure btMultNumbClick(Sender: TObject);
    procedure btMultMatrClick(Sender: TObject);
    procedure btPowClick(Sender: TObject);
    procedure btDetClick(Sender: TObject);
    procedure btBackToMainClick(Sender: TObject);
    procedure btAddMatrClick(Sender: TObject);
    procedure btOKSizeAddClick(Sender: TObject);
    procedure btAddNumbClick(Sender: TObject);
    procedure btSubMatrClick(Sender: TObject);
    procedure btSubNumbClick(Sender: TObject);
    procedure btOKSizeSubClick(Sender: TObject);
    procedure btOKSizeMultNumbClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure edSize1AddChange(Sender: TObject);
    procedure edSize1SubChange(Sender: TObject);
    procedure edSize1MultNumbChange(Sender: TObject);
    procedure btOKSizeMultMatrClick(Sender: TObject);
    procedure btOKSizePowClick(Sender: TObject);
    procedure btOKSizeDetClick(Sender: TObject);
    procedure GOClick(Sender: TObject);
    procedure edSize1MultMatrChange(Sender: TObject);
    procedure edSizePowChange(Sender: TObject);
    procedure edSizeDetChange(Sender: TObject);
    procedure btOKSizeTransposeClick(Sender: TObject);
    procedure edSize1TransposeChange(Sender: TObject);
    procedure btTransposeClick(Sender: TObject);
    procedure mInstClick(Sender: TObject);
    procedure mExitClick(Sender: TObject);
    procedure mOpenClick(Sender: TObject);
    procedure mSaveClick(Sender: TObject);
    procedure mNewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btShowAlgClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btOKSizeObrTransposeClick(Sender: TObject);
    procedure edSizeObrTransposeChange(Sender: TObject);
    procedure btObrTransposeClick(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure btOKSizeSledClick(Sender: TObject);
    procedure edSizeSledChange(Sender: TObject);
    procedure btSledClick(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure tmrSledShowTimer(Sender: TObject);
    procedure tmrSledSkipTimer(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure cleanall;

var
  fmOper: TfmOper;
  size1, size2, size1mult, size2mult, sizeresmult1, sizeresmult2, numb1 : integer;
  n : Integer;//����������, ������ �� ��� ���� ��� ������ ����������� ��������
  numb : real;
  sch1, sch2: Byte;
  iden : byte;//iden �������� (� ������ ��� ����. �����.)
  mov : byte;//mov ��������, ���� ���� ����� ����� 2 ���������: (����. ��� �����)
  sign : byte;
  f : textfile;
  i, j : Byte;


implementation

uses
  uAboutProgramm, uOpenUChoise, uInstruction, uChoise, uActions, uHi, uMultMatr, uSound;

{$R *.dfm}


const
  t = 0.000001;

procedure TfmOper.FormCreate(Sender: TObject);
begin
  btObrTranspose.Caption:='���������������� ������������' + #13 + '�������� ���������';
  //���� � ����� ����� ���������
  OpenDialog1.InitialDir := ExtractFilePath(ParamStr(0));//ExtractFilePath ������������� �������� '\'
  SaveDialog1.InitialDir := ExtractFilePath(ParamStr(0));
end;

///////////////////////////////////////////////////////////////////////////
//������ ������ ��������� ���� � ������� �� ������ �� ������� ��������(2)

//��������� �������������� �������� ������� ������� ��� ���������� �����/��������
procedure SetSizeStr(Str:TStringGrid);
begin
  with Str do
    begin
     Width := DefaultColWidth *ColCount + 2*2 + GridLineWidth * (ColCount-1);
     Height :=DefaultRowHeight * RowCount + 2*2 + GridLineWidth * (RowCount-1);
     if (ColCount >= 8) or (RowCount >= 8) then
     begin
       Width := 458;
       Height:= 290;
     end;
    end;
end;

//��������� ���������� ������������� �������� � �����
procedure ColorStr(Table:TStringGrid;ACol,ARow:Integer;Color:TColor);
begin
  if (ACol=1) or (ARow=1) then
begin
  Table.FixedCols:=0;
  Table.FixedRows:=0;
end
else
begin
  Table.FixedCols:=1;
  Table.FixedRows:=1;
  Table.FixedColor := Color;
end;
end;

//��������� ��������� ���������� ������ ���� ����������� ����
procedure MenuFile;
begin
  with fmOper do
    begin
      mNew.Enabled := true;
      mOpen.Enabled := true;
      mSave.Enabled := true;
    end;
end;


//��������� ��������� ������� ����� ����������
procedure Click1(Page : TTabSheet);
begin
  with fmOper do
  begin
    Page.TabVisible := true;
    Page.Show;
    if mov = 1 then
      mOpen.Enabled := false
    else
      Menufile;
    mov := 0;
  end;
end;


//��������� ��������� ������ ����������
procedure Enabling(Ok : TButton);
begin
  with fmOper do
  begin
    Ok.Enabled := false;
    mGo.Enabled := false;
  end;
end;


//��������� ���������� �������
procedure ShowAndExit;
begin
  with fmOper do
  begin
    tabAdd.TabVisible := false;
    tabSub.TabVisible := false;
    tabMultNumb.TabVisible := false;
    tabMultMatr.TabVisible := false;
    tabDet.TabVisible := false;
    tabPow.TabVisible := false;
    tabTranspose.TabVisible := false;
    tabObrTranspose.TabVisible := False;
    tabSled.TabVisible := False;
  end;
end;


//��������� ������ ������� ������� ����� ����������
procedure CleanAll;
begin
  with fmOper do
    begin
      clean(strFirstAdd);
        clean(strSecondAdd);
        clean(strResultAdd);
        edSize1Add.Text := '';
        edSize2Add.Text := '';
        edNumbAdd.Text := '';
      clean(strFirstSub);
        clean(strSecondSub);
        clean(strResultSub);
        edSize1Sub.Text := '';
        edSize2Sub.Text := '';
        edNumbSub.Text := '';
      clean(strMultNumb);
        clean(strResultMultNumb);
        edSize1MultNumb.Text := '';
        edSize2MultNumb.Text := '';
        edNumbMultNumb.Text := '';
      clean(strFirstMultMatr);
        clean(strSecondMultMatr);
        clean(strResultMultMatr);
        edSize1MultMatr.Text := '';
        edSize2MultMatr.Text := '';
        edSize3MultMatr.Text := '';
        edSize4MultMatr.Text := '';
      clean(strPow);
        clean(strResultPow);
        edSizePow.Text := '';
        edNumbPow.Text := '';
      clean(strDet);
        edResultDet.Text := '';
        edSizeDet.Text := '';
      clean(strResultTranspose);
        clean(strTranspose);
        edSize1Transpose.Text := '';
        edSize2Transpose.Text := '';
      Clean(strObrTranspose);
        Clean(strResultObrTranspose);
        edSizeObrTranspose.Text := '';
      Clean(strSled);
        edSizeSled.Text := '';
        edResultSled.Text := '';
    end;
end;

procedure TfmOper.btAddClick(Sender: TObject);
begin
  mov := 1;//��� ������������� ���� �� ������ �������/�����
  Click1(tabAdd);
end;

procedure TfmOper.btSubClick(Sender: TObject);
begin
  mov := 1;
  Click1(tabSub);
end;


procedure TfmOper.btMultNumbClick(Sender: TObject);
begin
  Click1(tabMultNumb);
end;

procedure TfmOper.btMultMatrClick(Sender: TObject);
begin
  Click1(tabMultMatr);
end;

procedure TfmOper.btPowClick(Sender: TObject);
begin
  Click1(tabPow);
end;

procedure TfmOper.btDetClick(Sender: TObject);
begin
  Click1(tabDet);
end;

procedure TfmOper.btTransposeClick(Sender: TObject);
begin
  Click1(tabTranspose);
end;

procedure TfmOper.btObrTransposeClick(Sender: TObject);
begin
  Click1(tabObrTranspose);
end;

procedure TfmOper.btSledClick(Sender: TObject);
begin
  Click1(tabSled);
end;

procedure TfmOper.btBackToMainClick(Sender: TObject);
begin
  fmOper.tabMain.Show;
end;

procedure TfmOper.FormShow(Sender: TObject);
begin
  with fmOper do
    begin
      ShowAndExit;
      tabMain.Show;
      mediaplayer1.Visible := false;
    end;
end;

//����� ������� (2)
////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////
//������ �������� (3)

procedure TfmOper.btAddMatrClick(Sender: TObject); //� ��������
begin
  with fmOper do
  begin
    lbFirstAdd.Visible := true;
    lbSecondAdd.Visible := true;
    strSecondAdd.Visible := true;
    lbSizeAdd.Visible := true;
    Label2.Visible := true;
    edSize2Add.Visible := true;
    edSize1Add.Visible := true;
    btOKSizeAdd.Visible := true;
    edNumbAdd.Visible :=false;
    lbNumbAdd.Visible := false;
    memo7.Visible := false;
    memo6.Visible := true;
  end;
  MenuFile;
  iden := 0;
end;


//������� ������������ ������ � �����(���� �����������)
procedure TfmOper.btOKSizeAddClick(Sender: TObject);
var
  flag : boolean;
begin
  with fmOper do
  begin
    sch1 := 0;
    sch2 := 0;

    flag := true;
    CheckEdit(edSize1Add, flag);
      if flag = false then exit;
    CheckEdit(edSize2Add, flag);
      if flag = false then exit;
    SetEdit(edSize1Add, size1, sch1, sch2);
    SetEdit(edSize2Add, size2, sch1, sch2);

    strFirstAdd.RowCount := Trunc(Strtofloat(edSize1Add.Text)) + 1;
    strFirstAdd.ColCount := Trunc(Strtofloat(edSize2Add.Text)) + 1;

    strSecondAdd.RowCount := Trunc(Strtofloat(edSize1Add.Text)) + 1;
    strSecondAdd.ColCount := Trunc(Strtofloat(edSize2Add.Text)) + 1;

    strResultAdd.RowCount := Trunc(Strtofloat(edSize1Add.Text)) + 1;
    strResultAdd.ColCount := Trunc(Strtofloat(edSize2Add.Text)) + 1;

    SetSizeStr(strFirstAdd);
    SetSizeStr(strSecondAdd);
    SetSizeStr(strResultAdd);

    ColorStr(strFirstAdd,strFirstAdd.ColCount,strFirstAdd.RowCount,clNavy);
    ColorStr(strSecondAdd,strSecondAdd.ColCount,strSecondAdd.RowCount,clGreen);
    ColorStr(strResultAdd,strResultAdd.ColCount,strResultAdd.RowCount,clRed);

    //�������� �������� ������ ��� ������ ����������� �������
    for i:=1 to strFirstAdd.RowCount do
    begin
      strFirstAdd.Cells[0,i]:='������ '+IntToStr(i);
      strSecondAdd.Cells[0,i]:='������ '+IntToStr(i);
      strResultAdd.Cells[0,i]:='������ '+IntToStr(i);
    end;

    for j:=1 to strFirstAdd.ColCount do
    begin
      strFirstAdd.Cells[j,0]:='������� '+IntToStr(j);
      strSecondAdd.Cells[j,0]:='������� '+IntToStr(j);
      strResultAdd.Cells[j,0]:='������� '+IntToStr(j);
    end;

    if iden <> 0 then
      begin
        CheckEdit(edNumbAdd, flag);
          if flag = false then exit;
        if edNumbAdd.Text = '' then
          numb :=0
        else
          numb := strtofloat(edNumbAdd.Text);
          edNumbAdd.Text := floattostr(numb);
      end;
    if (sch1 = 0) and (sch2 = 0) then
    begin
      GO.Enabled := true;
      mGO.Enabled := true;
    end;

  end;
end;

procedure TfmOper.btAddNumbClick(Sender: TObject);  //� ������
begin
  with fmOper do
  begin
    edSize2Add.Visible := true;
    edSize1Add.Visible := true;
    edNumbAdd.Visible := true;
    lbNumbAdd.Visible := true;
    btOKSizeAdd.Visible := true;
    lbFirstAdd.Visible := false;
    lbSecondAdd.Visible := false;
    strSecondAdd.Visible := false;
    memo7.Visible := true;
    label2.Visible := true;
    lbsizeadd.Visible := true;
    memo6.Visible := false;
  end;
  MenuFile;
  iden := 1;
end;

procedure TfmOper.edSize1AddChange(Sender: TObject);
begin
  Enabling(Go);
end;

//����� ������� (3)
//////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////
//����� ��������� (4)

procedure TfmOper.btSubMatrClick(Sender: TObject);
begin
  with fmOper do
  begin
    lbFirstSub.Visible := true;
    lbSecondSub.Visible := true;
    strSecondSub.Visible := true;
    lbSizeSub.Visible := true;
    Label2.Visible := true;
    edSize2Sub.Visible := true;
    edSize1Sub.Visible := true;
    btOKSizeSub.Visible := true;
    edNumbSub.Visible :=false;
    lbNumbSub.Visible := false;
    label3.Visible := true;
    memo8.Visible := true;
    memo9.Visible := false;
    MenuFile;
    iden := 0;
  end;
end;


procedure TfmOper.btSubNumbClick(Sender: TObject);
begin
  with fmOper do
  begin
    edSize2Sub.Visible := true;
    edSize1Sub.Visible := true;
    edNumbSub.Visible := true;
    lbNumbSub.Visible := true;
    btOKSizeSub.Visible := true;
    lbFirstSub.Visible := false;
    lbSecondSub.Visible := false;
    strSecondSub.Visible := false;
    label3.Visible := true;
    lbSizeSub.Visible := true;
    memo8.Visible := false;
    memo9.Visible := true;
    MenuFile;
    iden := 1;
  end;
end;


//������� ������������ ������ � �����(���� �����������)
procedure TfmOper.btOKSizeSubClick(Sender: TObject);
var
  flag : boolean;
begin
  with fmOper do
  begin
    sch1 := 0;
    sch2 := 0;

    flag := true;
    CheckEdit(edSize1Sub, flag);
      if flag = false then exit;
    CheckEdit(edSize2Sub, flag);
      if flag = false then exit;

    SetEdit(edSize1Sub, size1, sch1, sch2);
    SetEdit(edSize2Sub, size2, sch1, sch2);

    strFirstSub.RowCount := Trunc(Strtofloat(edSize1Sub.Text)) + 1;
    strFirstSub.ColCount := Trunc(Strtofloat(edSize2Sub.Text)) + 1;

    strSecondSub.RowCount := Trunc(Strtofloat(edSize1Sub.Text)) + 1;
    strSecondSub.ColCount := Trunc(Strtofloat(edSize2Sub.Text)) + 1;

    strResultSub.RowCount := Trunc(Strtofloat(edSize1Sub.Text)) + 1;
    strResultSub.ColCount := Trunc(Strtofloat(edSize2Sub.Text)) + 1;

    SetSizeStr(strFirstSub);
    SetSizeStr(strSecondSub);
    SetSizeStr(strResultSub);

    ColorStr(strFirstSub,strFirstSub.ColCount,strFirstSub.RowCount,clNavy);
    ColorStr(strSecondSub,strSecondSub.ColCount,strSecondSub.RowCount,clGreen);
    ColorStr(strResultSub,strResultSub.ColCount,strResultSub.RowCount,clRed);

    //��������� �������� ������ ��� ������ ����������� �������
    for i:=1 to strFirstSub.RowCount do
    begin
      strFirstSub.Cells[0,i]:='������ '+IntToStr(i);
      strSecondSub.Cells[0,i]:='������ '+IntToStr(i);
      strResultSub.Cells[0,i]:='������ '+IntToStr(i);
    end;

    for j:=1 to strFirstSub.ColCount do
    begin
      strFirstSub.Cells[j,0]:='������� '+IntToStr(j);
      strSecondSub.Cells[j,0]:='������� '+IntToStr(j);
      strResultSub.Cells[j,0]:='������� '+IntToStr(j);
    end;

    if iden <> 0 then
      begin
        CheckEdit(edNumbSub, flag);
          if flag = false then exit;
        if edNumbSub.Text = '' then
          numb :=0
        else
          numb := strtofloat(edNumbSub.Text);
        edNumbSub.Text := floattostr(numb);
      end;
    if (sch1 = 0) and (sch2 = 0) then
    begin
      Go1.Enabled := true;
      mGO.Enabled := true;
    end;

  end;
end;


//��������� �� ������� ������
procedure TfmOper.Button8Click(Sender: TObject);
begin
  with fmOper do
  begin
    btSubMatr.Enabled := true;
    btSubNumb.Enabled := true;
    RadioButton1.Checked := true;
    RadioButton2.Checked := false;
    sign := 1;
  end;
end;


//��������� �� ������� �������
procedure TfmOper.Button9Click(Sender: TObject);
begin
  with fmOper do
  begin
    btSubMatr.Enabled := true;
    btSubNumb.Enabled := true;
    RadioButton2.Checked := true;
    RadioButton1.Checked := false;
    sign := 0;
  end;
end;

procedure TfmOper.edSize1SubChange(Sender: TObject);
begin
  Enabling(Go1);
end;

//����� ������� (4)
/////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////
//������ ��������� �� ����� (5)


//������� ������������ ������ � �����
procedure TfmOper.btOKSizeMultNumbClick(Sender: TObject);
var
  flag : boolean;
begin
  with fmOper do
  begin
    sch1 := 0;
    sch2 := 0;

    flag := true;
    CheckEdit(edSize1MultNumb, flag);
      if flag = false then exit;
    CheckEdit(edSize2MultNumb, flag);
      if flag = false then exit;
    SetEdit(edSize1MultNumb, size1, sch1, sch2);
    SetEdit(edSize2MultNumb, size2, sch1, sch2);
    CheckEdit(edNumbMultNumb, flag);
      if flag = false then exit;

    strMultNumb.RowCount := Trunc(Strtofloat(edSize1MultNumb.Text)) + 1;
    strMultNumb.ColCount := Trunc(Strtofloat(edSize2MultNumb.Text)) + 1;

    strResultMultNumb.RowCount := Trunc(Strtofloat(edSize1MultNumb.Text)) + 1;
    strResultMultNumb.ColCount := Trunc(Strtofloat(edSize2MultNumb.Text)) + 1;

    SetSizeStr(strMultNumb);
    SetSizeStr(strResultMultNumb);

    ColorStr(strMultNumb,strMultNumb.ColCount,strMultNumb.RowCount,clNavy);
    ColorStr(strResultMultNumb,strResultMultNumb.ColCount,strResultMultNumb.RowCount,clRed);

    for i:=1 to strMultNumb.RowCount do
    begin
      strMultNumb.Cells[0,i]:='������ '+IntToStr(i);
      strResultMultNumb.Cells[0,i]:='������ '+IntToStr(i);
    end;

    for j:=1 to strMultNumb.ColCount do
    begin
      strMultNumb.Cells[j,0]:='������� '+IntToStr(j);
      strResultMultNumb.Cells[j,0]:='������� '+IntToStr(j);
    end;

    if edNumbMultNumb.Text = '' then
      numb :=0
    else numb := strtofloat(edNumbMultNumb.Text);
    edNumbMultNumb.Text := floattostr(numb);

    if (sch1 = 0) and (sch2 = 0) then
    begin
      Go2.Enabled := true;
      mGO.Enabled := true;
    end;

  end;
end;

procedure TfmOper.edSize1MultNumbChange(Sender: TObject);
begin
  Enabling(Go2);
end;

//����� ������� (5)
////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////
//������ ������������ ������ (6)


//������� ������������ ������
procedure TfmOper.btOKSizeMultMatrClick(Sender: TObject);
var
  flag : boolean;
begin
  with fmOper do
  begin
    sch1 := 0;
    sch2 := 0;

    flag := true;
    CheckEdit(edSize1MultMatr, flag);
      if flag = false then exit;
    CheckEdit(edSize3MultMatr, flag);
      if flag = false then exit;
    CheckEdit(edSize2MultMatr, flag);
      if flag = false then exit;
    CheckEdit(edSize4MultMatr, flag);
      if flag = false then exit;

    SetEdit(edSize1MultMatr, size1, sch1, sch2);

    SetEdit(edSize2MultMatr, size2, sch1, sch2);

    SetEdit(edSize3MultMatr, size1mult, sch1, sch2);

    if (edSize3MultMatr.Text <> edSize2MultMatr.Text) then
    begin
      messagebox(fmoper.Handle, pchar('���������� �������� ������ ������� ����������� ������ ���� ����� ���������� ����� ������ �������! ������ ��������� �������������.'), pchar('��������!'), mb_ok+MB_ICONWARNING);
      size1mult := size2;
      edSize3MultMatr.Text := inttostr(size1mult);
    end;

    SetEdit(edSize4MultMatr, size2mult, sch1, sch2);
    sizeresmult1 := size1;//����� ����� �������������� ������� = ����� ����� 1 �������
    sizeresmult2 := size2mult;//����� �������� �������������� ������� = ����� �������� 2 �������

    strFirstMultMatr.RowCount := Trunc(Strtofloat(edSize1MultMatr.Text)) + 1;
    strFirstMultMatr.ColCount := Trunc(Strtofloat(edSize2MultMatr.Text)) + 1;

    strSecondMultMatr.RowCount := Trunc(Strtofloat(edSize2MultMatr.Text)) + 1;
    strSecondMultMatr.ColCount := Trunc(Strtofloat(edSize4MultMatr.Text)) + 1;

    strResultMultMatr.RowCount := Trunc(Strtofloat(edSize1MultMatr.Text)) + 1;
    strResultMultMatr.ColCount := Trunc(Strtofloat(edSize4MultMatr.Text)) + 1;

    SetSizeStr(strFirstMultMatr);
    SetSizeStr(strSecondMultMatr);
    SetSizeStr(strResultMultMatr);

    ColorStr(strFirstMultMatr,strFirstMultMatr.ColCount,strFirstMultMatr.RowCount,clNavy);
    ColorStr(strSecondMultMatr,strSecondMultMatr.ColCount,strSecondMultMatr.RowCount,clGreen);
    ColorStr(strResultMultMatr,strResultMultMatr.ColCount,strResultMultMatr.RowCount,clRed);

    for i:=1 to strFirstMultMatr.RowCount do
    begin
      strFirstMultMatr.Cells[0,i]:='������ '+IntToStr(i);
      strResultMultMatr.Cells[0,i]:='������ '+IntToStr(i);
    end;

    for j:=1 to strFirstMultMatr.ColCount do
    begin
      strFirstMultMatr.Cells[j,0]:='������� '+IntToStr(j);
      strSecondMultMatr.Cells[0,j]:='������ '+IntToStr(j);
    end;

    for j:=1 to strSecondMultMatr.ColCount do
    begin
      strSecondMultMatr.Cells[j,0]:='������� '+IntToStr(j);
      strResultMultMatr.Cells[j,0]:='������� '+IntToStr(j);
    end;

    if (sch1 = 0) and (sch2 = 0) then
    begin
      Go3.Enabled := true;
      mGO.Enabled := true;
    end;

  end;
end;

procedure TfmOper.edSize1MultMatrChange(Sender: TObject);
begin
  Enabling(Go3);
end;

//����� ������� (6)
////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////
//������ ���������� � ������� (7)


//������� ����������� ������� � �����
procedure TfmOper.btOKSizePowClick(Sender: TObject);
var
  flag : boolean;
begin
  with fmOper do
  begin
    sch1 := 0;
    sch2 := 0;

    flag := true;
    CheckEdit(edSizePow, flag);
      if flag = false then exit;
    CheckEdit(edNumbPow, flag);
      if flag = false then exit;
    SetEdit(edSizePow, size1, sch1, sch2);
    SetEditPow(edNumbPow, flag, numb1);

    //������� ������ ���� ���������� ��� ���������� � �������
    strPow.RowCount := Trunc(Strtofloat(edSizePow.Text)) + 1;
    strPow.ColCount := Trunc(Strtofloat(edSizePow.Text)) + 1;

    strResultPow.RowCount := Trunc(Strtofloat(edSizePow.Text)) + 1;
    strResultPow.ColCount := Trunc(Strtofloat(edSizePow.Text)) + 1;

    SetSizeStr(strPow);
    SetSizeStr(strResultPow);

    ColorStr(strPow,strPow.ColCount,strPow.RowCount,clNavy);
    ColorStr(strResultPow,strResultPow.ColCount,strResultPow.RowCount,clRed);

    for i:=1 to strResultPow.RowCount do
    begin
      strPow.Cells[0,i]:='������ '+IntToStr(i);
      strResultPow.Cells[0,i]:='������ '+IntToStr(i);
    end;

    for j:=1 to strResultPow.ColCount do
    begin
      strPow.Cells[j,0]:='������� '+IntToStr(j);
      strResultPow.Cells[j,0]:='������� '+IntToStr(j);
    end;

    if (sch1 = 0) and (sch2 = 0) and (flag) then
    begin
      Go4.Enabled := true;
      mGO.Enabled := true;
    end;

  end;
end;

procedure TfmOper.edSizePowChange(Sender: TObject);
begin
  Enabling(Go4);
end;

//����� ������� (7)
////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////
//������ ������������ (8)


////������� ����������� �������
procedure TfmOper.btOKSizeDetClick(Sender: TObject);
var
  flag : boolean;
begin
  with fmOper do
  begin
    sch1 := 0;
    sch2 := 0;

    flag := true;
    CheckEdit(edSizeDet, flag);
      if flag = false then exit;
    SetEdit(edSizeDet, size1, sch1, sch2);

    //������� ������ ���� ���������� ��� ���������� ������������
    strDet.RowCount := Trunc(Strtofloat(edSizeDet.Text)) + 1;
    strDet.ColCount := Trunc(Strtofloat(edSizeDet.Text)) + 1;

    SetSizeStr(strDet);

    ColorStr(strDet,strDet.ColCount,strDet.RowCount,clNavy);

    for i:=1 to strDet.RowCount do
      strDet.Cells[0,i]:='������ '+IntToStr(i);

    for j:=1 to strDet.ColCount do
      strDet.Cells[j,0]:='������� '+IntToStr(j);

    if (sch1 = 0) and (sch2 = 0) then
    begin
      GO5.Enabled := true;
      mGO.Enabled := true;
    end;

  end;
end;

procedure TfmOper.edSizeDetChange(Sender: TObject);
begin
  Enabling(Go5);
end;

//����� ������� (8)
////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////
//������ ���������������� (9)


////������� ������������ �������
procedure TfmOper.btOKSizeTransposeClick(Sender: TObject);
var
  flag : boolean;
begin
  with fmOper do
  begin
    sch1 := 0;
    sch2 := 0;

    flag := true;
    CheckEdit(edSize1Transpose, flag);
      if flag = false then exit;
    CheckEdit(edSize2Transpose, flag);
      if flag = false then exit;
    SetEdit(edSize1Transpose, size1, sch1, sch2);
    SetEdit(edSize2Transpose, size2, sch1, sch2);

    strTranspose.RowCount := Trunc(Strtofloat(edSize1Transpose.Text)) + 1;
    strTranspose.ColCount := Trunc(Strtofloat(edSize2Transpose.Text)) + 1;

    strResultTranspose.RowCount := Trunc(Strtofloat(edSize2Transpose.Text)) + 1;
    strResultTranspose.ColCount := Trunc(Strtofloat(edSize1Transpose.Text)) + 1;

    SetSizeStr(strTranspose);
    SetSizeStr(strResultTranspose);

    ColorStr(strTranspose,strTranspose.ColCount,strTranspose.RowCount,clNavy);
    ColorStr(strResultTranspose,strResultTranspose.ColCount,strResultTranspose.RowCount,clRed);

    for i:=1 to strTranspose.RowCount do
    begin
      strTranspose.Cells[0,i]:='������ '+IntToStr(i);
      strResultTranspose.Cells[i,0]:='������� '+IntToStr(i);
    end;

  for j:=1 to strTranspose.RowCount do
    begin
      strTranspose.Cells[j,0]:='������� '+IntToStr(j);
      strResultTranspose.Cells[0,j]:='������ '+IntToStr(j);
    end;

    if (sch1 = 0) and (sch2 = 0) then
    begin
      GO6.Enabled := true;
      mGO.Enabled := true;
    end;

  end;
end;

procedure TfmOper.edSize1TransposeChange(Sender: TObject);
begin
  Enabling(Go6);
end;

//����� ������� (9)
////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////
//������ ���������������� ������������ �������� ��������� (10)
////������� ������������ �������
procedure TfmOper.btOKSizeObrTransposeClick(Sender: TObject);
var
  flag : boolean;
begin
  with fmOper do
  begin
    sch1 := 0;
    sch2 := 0;

    flag := true;
    CheckEdit(edSizeObrTranspose, flag);
      if flag = false then exit;
    SetEdit(edSizeObrTranspose, size1, sch1, sch2);

    strObrTranspose.RowCount := Trunc(Strtofloat(edSizeObrTranspose.Text)) + 1;
    strObrTranspose.ColCount := Trunc(Strtofloat(edSizeObrTranspose.Text)) + 1;

    strResultObrTranspose.RowCount := Trunc(Strtofloat(edSizeObrTranspose.Text)) + 1;
    strResultObrTranspose.ColCount := Trunc(Strtofloat(edSizeObrTranspose.Text)) + 1;

    SetSizeStr(strObrTranspose);
    SetSizeStr(strResultObrTranspose);

    ColorStr(strObrTranspose,strObrTranspose.ColCount,strObrTranspose.RowCount,clNavy);
    ColorStr(strResultObrTranspose,strResultObrTranspose.ColCount,strResultObrTranspose.RowCount,clRed);

    for i:=1 to strObrTranspose.RowCount do
    begin
      strObrTranspose.Cells[0,i]:='������ '+IntToStr(i);
      strResultObrTranspose.Cells[i,0]:='������� '+IntToStr(i);
    end;

  for j:=1 to strObrTranspose.RowCount do
    begin
      strObrTranspose.Cells[j,0]:='������� '+IntToStr(j);
      strResultObrTranspose.Cells[0,j]:='������ '+IntToStr(j);
    end;

    if (sch1 = 0) and (sch2 = 0) then
    begin
      GO7.Enabled := true;
      mGO.Enabled := true;
    end;

  end;
end;

procedure TfmOper.edSizeObrTransposeChange(Sender: TObject);
begin
  Enabling(Go7);
end;


//����� ������� (10)
////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////
//������ ���������� ����� ������� (11)


////������� ������������ �������
procedure TfmOper.btOKSizeSledClick(Sender: TObject);
var
  flag : boolean;
begin
  with fmOper do
  begin
    sch1 := 0;
    sch2 := 0;

    flag := true;
    CheckEdit(edSizeSled, flag);
      if flag = false then exit;
    SetEdit(edSizeSled, size1, sch1, sch2);

    strSled.RowCount := Trunc(Strtofloat(edSizeSled.Text)) + 1;
    strSled.ColCount := Trunc(Strtofloat(edSizeSled.Text)) + 1;

    SetSizeStr(strSled);

    ColorStr(strSled,strSled.ColCount,strSled.RowCount,clNavy);

    for i:=1 to strSled.RowCount do
    begin
      strSled.Cells[0,i]:='������ '+IntToStr(i);
    end;

  for j:=1 to strSled.RowCount do
    begin
      strSled.Cells[j,0]:='������� '+IntToStr(j);
    end;
    if (sch1 = 0) and (sch2 = 0) then
    begin
      GO8.Enabled := true;
      mGO.Enabled := true;
    end;

  end;
end;

procedure TfmOper.tmrSledShowTimer(Sender: TObject);
begin
  with fmOper do
  begin
    if tmrSledShow.Enabled = True then
      imgMemo20.Height := imgMemo20.Height + 2;

    if imgMemo20.Height=90 then
    begin
      tmrSledShow.Enabled := False;
      button17.Visible := True;
      button16.Visible := False;
    end;
  end;
end;

procedure TfmOper.tmrSledSkipTimer(Sender: TObject);
begin
  with fmOper do
  begin
    if tmrSledSkip.Enabled = True then
      imgMemo20.Height := imgMemo20.Height - 2;

    if imgMemo20.Height=0 then
    begin
      tmrSledSkip.Enabled := False;
      button17.Visible := False;
      button16.Visible := True;
    end;
  end;
end;

procedure TfmOper.edSizeSledChange(Sender: TObject);
begin
  Enabling(GO8);
end;

//����� ������� (11)
////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////
//������ ������ ���������� ()

procedure TfmOper.GOClick(Sender: TObject);
begin
  with fmOper do
  begin
    if tabAdd.Showing = true then add;
    if tabSub.Showing = true then sub;
    if tabMultNumb.Showing = true then multnumb;
    if tabMultMatr.Showing = true then multmatrix;
    if tabPow.Showing = true then pow;
    if tabDet.Showing = true then determinate;
    if tabTranspose.Showing = true then transpose;
    if tabObrTranspose.Showing = True then ObrTranspose;;
    if tabSled.Showing then Sled;
  end;
end;


//////////////////////////////////////////////////////////////////////////////
//������ ������ ����


//�������� ������ ������� � ������ �������������� ������
procedure ExitOpen;
begin
  messagebox(fmOper.Handle, pchar('������������ ������! ���������� ��� �� �������!'), pchar('������'), mb_ok+mb_iconerror);
  Exit;
end;


//�������� �� �����
procedure TfmOper.mOpenClick(Sender: TObject);
var
  i, j : integer;
  a : real;
begin
    OpenDialog1.InitialDir := ExtractFilePath(ParamStr(0));
    OpenDialog1.DefaultExt := '*.txt';
    OpenDialog1.Filter := '��������� ����|*.txt|��� �����|*.*';

  with fmOper do
  begin
  if tabPow.Showing = true then
    begin
      clean(strPow);
      clean(strResultPow);
      if OpenDialog1.Execute then
      try
        begin
          assignfile(f, OpenDialog1.FileName);
          reset(f);
          read(f, size1);
          read(f, numb1);
          edSizePow.Text := inttostr(size1);
          edNumbPow.text := inttostr(numb1);

          strPow.RowCount := Trunc(Strtofloat(edSizePow.Text)) + 1;
          strPow.ColCount := Trunc(Strtofloat(edSizePow.Text)) + 1;

          strResultPow.RowCount := Trunc(Strtofloat(edSizePow.Text)) + 1;
          strResultPow.ColCount := Trunc(Strtofloat(edSizePow.Text)) + 1;

          SetSizeStr(strPow);
          SetSizeStr(strResultPow);

          for i := 0 to size1-1 do
            for j := 0 to size1-1 do
            begin
              read(f, a);
              strPow.Cells[j+1, i+1] := floattostr(a);
            end;
          closefile(f);
          pow;
        end;
        GO4.Enabled := true;
      except
        ExitOpen;
      end;
    end;
  if tabMultNumb.Showing = true then
    begin
      clean(strMultNumb);
      clean(strResultMultNumb);
      if OpenDialog1.Execute then
      try
        begin
          assignfile(f, OpenDialog1.FileName);
          reset(f);
          read(f, size1);
          read(f, size2);
          read(f, numb);
          edSize1MultNumb.Text := inttostr(size1);
          edSize2MultNumb.Text := inttostr(size2);
          edNumbMultNumb.Text := floattostr(numb);

          strMultNumb.RowCount := Trunc(Strtofloat(edSize1MultNumb.Text)) + 1;
          strMultNumb.ColCount := Trunc(Strtofloat(edSize2MultNumb.Text)) + 1;

          strResultMultNumb.RowCount := Trunc(Strtofloat(edSize1MultNumb.Text)) + 1;
          strResultMultNumb.ColCount := Trunc(Strtofloat(edSize2MultNumb.Text)) + 1;

          SetSizeStr(strMultNumb);
          SetSizeStr(strResultMultNumb);

          for i := 0 to size1-1 do
            for j := 0 to size2-1 do
            begin
              read(f, a);
             strMultNumb.Cells[j+1, i+1] := floattostr(a);
            end;
          closefile(f);
          multnumb;
        end;
        GO2.Enabled := true;
      except
        ExitOpen;
      end;
    end;
  if tabDet.Showing = true then
    begin
      clean(fmoper.strDet);
      if OpenDialog1.Execute then
      try
        begin
          assignfile(f, OpenDialog1.FileName);
          reset(f);
          read(f, size1);
          edSizeDet.Text := inttostr(size1);

          strDet.RowCount := Trunc(Strtofloat(edSizeDet.Text)) + 1;
          strDet.ColCount := Trunc(Strtofloat(edSizeDet.Text)) + 1;

          SetSizeStr(strDet);

          for i := 0 to size1-1 do
            for j := 0 to size1-1 do
            begin
              read(f, a);
              strDet.Cells[j+1, i+1] := floattostr(a);
            end;
          closefile(f);
          determinate;
        end;
       GO5.Enabled := false;
      except
        ExitOpen;
      end;
    end;
  if tabTranspose.Showing = true then
    begin
      clean(fmOper.strTranspose);
      clean(fmOper.strResultTranspose);
      if OpenDialog1.Execute  then
      try
        begin
          assignfile(f, OpenDialog1.FileName);
          reset(f);
          read(f, size1);
          read(f, size2);
          edSize1Transpose.Text := inttostr(size1);
          edSize2Transpose.Text := inttostr(size2);

          strTranspose.RowCount := Trunc(Strtofloat(edSize1Transpose.Text)) + 1;
          strTranspose.ColCount := Trunc(Strtofloat(edSize2Transpose.Text)) + 1;

          strResultTranspose.RowCount := Trunc(Strtofloat(edSize2Transpose.Text)) + 1;
          strResultTranspose.ColCount := Trunc(Strtofloat(edSize1Transpose.Text)) + 1;

          SetSizeStr(strTranspose);
          SetSizeStr(strResultTranspose);

          for i := 0 to size1-1 do
            for j := 0 to size2-1 do
            begin
              read(f, a);
              strTranspose.Cells[j+1, i+1] := floattostr(a);
            end;
          closefile(f);
          transpose;
        end;
        GO6.Enabled := true;
      except
        ExitOpen;
      end;
    end;
  if tabMultMatr.Showing = true then
    begin
      clean(strFirstMultMatr);
      clean(strSecondMultMatr);
      clean(strResultMultMatr);
      if OpenDialog1.Execute  then
      try
        begin
          assignfile(f, OpenDialog1.FileName);
          reset(f);
          read(f, size1);
          read(f, size2);
          for i := 0 to size1-1 do
            for j := 0 to size2-1 do
            begin
              read(f, a);
              strFirstMultMatr.Cells[j+1, i+1] := floattostr(a);
            end;
          read(f, size1mult);
          if size1mult<>size2 then
          begin
            size1mult := size2;
            messagebox(fmoper.Handle, pchar('���������� �������� ������ ������� ����������� ������ ���� ����� ���������� ����� ������ �������! ������ ��������� �������������.'), pchar('��������!'), mb_ok+MB_ICONWARNING);
          end;
          read(f, size2mult);
          sizeresmult1 := size1;
          sizeresmult2 := size2mult;
          for i := 0 to size1mult-1 do
            for j := 0 to size2mult-1 do
            begin
              read(f, a);
              strSecondMultMatr.Cells[j+1, i+1] := floattostr(a);
            end;
          edSize1MultMatr.Text := inttostr(size1);
          edSize2MultMatr.Text := inttostr(size2);
          edSize3MultMatr.Text := inttostr(size1mult);
          edSize4MultMatr.Text := inttostr(size2mult);

          strFirstMultMatr.RowCount := Trunc(Strtofloat(edSize1MultMatr.Text)) + 1;
          strFirstMultMatr.ColCount := Trunc(Strtofloat(edSize2MultMatr.Text)) + 1;

          strSecondMultMatr.RowCount := Trunc(Strtofloat(edSize2MultMatr.Text)) + 1;
          strSecondMultMatr.ColCount := Trunc(Strtofloat(edSize4MultMatr.Text)) + 1;

          strResultMultMatr.RowCount := Trunc(Strtofloat(edSize1MultMatr.Text)) + 1;
          strResultMultMatr.ColCount := Trunc(Strtofloat(edSize4MultMatr.Text)) + 1;

          SetSizeStr(strFirstMultMatr);
          SetSizeStr(strSecondMultMatr);
          SetSizeStr(strResultMultMatr);

          closefile(f);
          multmatrix;
        end;
        GO3.Enabled := true;
      except
        ExitOpen;
      end;
  end;
  if tabAdd.Showing = true then
    begin
      clean(strResultAdd);
      clean(strFirstAdd);
      clean(strSecondAdd);
      edSize2Add.Text := '';
      edSize1Add.Text := '';
      edNumbAdd.Text := '';
      if OpenDialog1.Execute then
      try
        begin
          assignfile(f, OpenDialog1.FileName);
          reset(f);
          read(f, size1);
          read(f, size2);
          if iden = 1 then//� ������
            begin
              read(f, numb);
              edNumbAdd.Text := floattostr(numb);
            end;
          edSize2Add.Text := inttostr(size2);
          edSize1Add.Text := inttostr(size1);

          strFirstAdd.RowCount := Trunc(Strtofloat(edSize1Add.Text)) + 1;
          strFirstAdd.ColCount := Trunc(Strtofloat(edSize2Add.Text)) + 1;

          strSecondAdd.RowCount := Trunc(Strtofloat(edSize1Add.Text)) + 1;
          strSecondAdd.ColCount := Trunc(Strtofloat(edSize2Add.Text)) + 1;

          strResultAdd.RowCount := Trunc(Strtofloat(edSize1Add.Text)) + 1;
          strResultAdd.ColCount := Trunc(Strtofloat(edSize2Add.Text)) + 1;

          SetSizeStr(strFirstAdd);
          SetSizeStr(strSecondAdd);
          SetSizeStr(strResultAdd);

          for i := 0 to size1-1 do
            for j := 0 to size2-1 do
            begin
              read(f, a);
              strFirstAdd.Cells[j+1, i+1] := floattostr(a);
            end;
          if iden = 0 then
            for i := 0 to size1-1 do
              for j := 0 to size2-1 do
              begin
                read(f, a);
                strSecondAdd.Cells[j+1, i+1] := floattostr(a);
              end;
          closefile(f);
          add;
        end;
        GO.Enabled := true;
      except
        ExitOpen;
      end;
    end;
  if tabSub.Showing = true then
    begin
      clean(strResultSub);
      clean(strFirstSub);
      clean(strSecondSub);
      edSize2Sub.Text := '';
      edSize1Sub.Text := '';
      edNumbSub.Text := '';
      if OpenDialog1.Execute then
      try
        begin
          assignfile(f, OpenDialog1.FileName);
          reset(f);
          read(f, size1);
          read(f, size2);
          if iden = 1 then//� ������
            begin
              read(f, numb);
              edNumbSub.Text := floattostr(numb);
            end;
          edSize2Sub.Text := inttostr(size2);
          edSize1Sub.Text := inttostr(size1);

          strFirstSub.RowCount := Trunc(Strtofloat(edSize1Sub.Text)) + 1;
          strFirstSub.ColCount := Trunc(Strtofloat(edSize2Sub.Text)) + 1;

          strSecondSub.RowCount := Trunc(Strtofloat(edSize1Sub.Text)) + 1;
          strSecondSub.ColCount := Trunc(Strtofloat(edSize2Sub.Text)) + 1;

          strResultSub.RowCount := Trunc(Strtofloat(edSize1Sub.Text)) + 1;
          strResultSub.ColCount := Trunc(Strtofloat(edSize2Sub.Text)) + 1;

          SetSizeStr(strFirstSub);
          SetSizeStr(strSecondSub);
          SetSizeStr(strResultSub);
                                      
          for i := 0 to size1-1 do
            for j := 0 to size2-1 do
            begin
              read(f, a);
              strFirstSub.Cells[j+1, i+1] := floattostr(a);
            end;
          if iden = 0 then//� ���������
            for i := 0 to size1-1 do
              for j := 0 to size2-1 do
              begin
                read(f, a);
                strSecondSub.Cells[j+1, i+1] := floattostr(a);
              end;
          closefile(f);
          Sub;
        end;
        GO1.Enabled := true;
      except
        ExitOpen;
      end;
    end;

    if tabSled.Showing = true then
    begin
      clean(fmoper.strSled);
      if OpenDialog1.Execute then
      try
        begin
          assignfile(f, OpenDialog1.FileName);
          reset(f);
          read(f, size1);
          edSizeSled.Text := inttostr(size1);

          strSled.RowCount := Trunc(Strtofloat(edSizeSled.Text)) + 1;
          strSled.ColCount := Trunc(Strtofloat(edSizeSled.Text)) + 1;

          SetSizeStr(strSled);

          for i := 0 to size1-1 do
            for j := 0 to size1-1 do
            begin
              read(f, a);
              strSled.Cells[j+1, i+1] := floattostr(a);
            end;
          closefile(f);
          Sled;
        end;
       GO8.Enabled := false;
      except
        ExitOpen;
      end;
    end;

    if tabObrTranspose.Showing = true then
    begin
      clean(fmoper.strObrTranspose);
      Clean(fmOper.strResultObrTranspose);
      if OpenDialog1.Execute then
      try
        begin
          assignfile(f, OpenDialog1.FileName);
          reset(f);
          read(f, size1);
          edSizeObrTranspose.Text := inttostr(size1);

          strObrTranspose.RowCount := Trunc(Strtofloat(edSizeObrTranspose.Text)) + 1;
          strObrTranspose.ColCount := Trunc(Strtofloat(edSizeObrTranspose.Text)) + 1;

          strResultObrTranspose.RowCount := Trunc(Strtofloat(edSizeObrTranspose.Text)) + 1;
          strResultObrTranspose.ColCount := Trunc(Strtofloat(edSizeObrTranspose.Text)) + 1;

          SetSizeStr(strObrTranspose);
          SetSizeStr(strResultObrTranspose);

          for i := 0 to size1-1 do
            for j := 0 to size1-1 do
            begin
              read(f, a);
              strObrTranspose.Cells[j+1, i+1] := floattostr(a);
            end;
          closefile(f);
          ObrTranspose;
        end;
       GO7.Enabled := false;
      except
        ExitOpen;
      end;
    end;
  end;
end;


//���������� � ����
procedure TfmOper.mSaveClick(Sender: TObject);
begin
  with fmOper do
  begin
    SaveDialog1.InitialDir := ExtractFilePath(ParamStr(0));
    SaveDialog1.DefaultExt := '*.txt';
    SaveDialog1.Filter := '��������� ����|*.txt|��� �����|*.*';

    if SaveDialog1.Execute then
    begin
      try
        n := 1;
        if tabPow.Showing = true then
          SaveTable(strResultPow, '���������� � �������');
        if tabAdd.Showing = true then
          SaveTable(strResultAdd, '��������');
        if tabSub.Showing = true then
          SaveTable(strResultSub, '���������');
        if tabMultNumb.Showing = true then
          SaveTable(strResultMultNumb, '��������� �� �����');
        if tabMultMatr.Showing = true then
          SaveTable(strResultMultMatr, '������������ ������');
        if tabDet.Showing = true then
          SaveEditDet(edResultDet);
        if tabTranspose.Showing = true then
          SaveTable(strResultTranspose, '����������������');
        if tabObrTranspose.Showing = true then
          SaveTable(strResultObrTranspose, '���������������� ������������ �������� ���������');
        if tabSled.Showing = true then
          SaveEditSled(edResultSled);
        n := 0;//�� ����� �������, ��������� �� �������� ('���������� ����������.txt')
      except
      messagebox(fmoper.Handle, pchar('�� �� ������� �������� ��� ����������! �������� ���.'), pchar('��������!'), mb_ok+MB_ICONWARNING);
    end;
    end;
  end;
end;


//�������� ������ �����(������� ����� �������)
procedure TfmOper.mNewClick(Sender: TObject);
begin
  with fmOper do
    if tabAdd.Showing = true then
      begin
        clean(strFirstAdd);
        clean(strSecondAdd);
        clean(strResultAdd);
        edSize1Add.Text := '';
        edSize2Add.Text := '';
        edNumbAdd.Text := '';
      end;
    if tabSub.Showing = true then
      begin
        clean(strFirstSub);
        clean(strSecondSub);
        clean(strResultSub);
        edSize1Sub.Text := '';
        edSize2Sub.Text := '';
        edNumbSub.Text := '';
      end;
    if tabMultNumb.Showing = true then
      begin
        clean(strMultNumb);
        clean(strResultMultNumb);
        edSize1MultNumb.Text := '';
        edSize2MultNumb.Text := '';
        edNumbMultNumb.Text := '';
      end;
    if tabMultMatr.Showing = true then
      begin
        clean(strFirstMultMatr);
        clean(strSecondMultMatr);
        clean(strResultMultMatr);
        edSize1MultMatr.Text := '';
        edSize2MultMatr.Text := '';
        edSize1MultMatr.Text := '';
        edSize2MultMatr.Text := '';
      end;
    if tabPow.Showing = true then
      begin
        clean(strPow);
        clean(strResultPow);
        edSizePow.Text := '';
        edNumbPow.Text := '';
      end;
    if tabDet.Showing = true then
      begin
        clean(strDet);
        edResultDet.Text := '';
        edSizeDet.Text := '';
      end;
    if tabTranspose.Showing = true then
      begin
        clean(strResultTranspose);
        clean(strTranspose);
        edSize1Transpose.Text := '';
      end;
end;

//����� ���������� � ��������
procedure TfmOper.mAboutProgrammClick(Sender: TObject);
begin
  fmAboutProgramm.Show;
end;

//������� � ��������
procedure TfmOper.mInstClick(Sender: TObject);
begin
  if not assigned(fmInstruction) then
    fmInstruction := tfmInstruction.create(self);
  fmInstruction.show;
 //fmInstruction.rchInstruction.Lines.LoadFromFile( way + '���������� ������������.txt');
 fmInstruction.rchInstruction.Lines.LoadFromFile( way + '����.rtf');
end;


//����� �� ���������� (������ �������)
procedure TfmOper.mExitClick(Sender: TObject);
begin
  close;
  cleanall;
  ShowAndExit;
end;


//����� ���������� (��� ����������� ������)
procedure TfmOper.btShowAlgClick(Sender: TObject);
begin
  if not assigned(fmAlgoritm) then
    fmAlgoritm := tfmAlgoritm.create(self);
  fmAlgoritm.show;
end;


////��������� ��� ������/������� ��������� ������������ (����. ������, ���������� � �������)
procedure TfmOper.Button6Click(Sender: TObject);
begin
  with fmOper do
  begin
    image2.Visible := true;
    button7.Visible := true;
    button6.Enabled := false;
  end;
end;

procedure TfmOper.Button7Click(Sender: TObject);
begin
  with fmOper do
  begin
    image2.Visible := false;
    button7.Visible := false;
    button6.Enabled := true;
  end;
end;

procedure TfmOper.Button10Click(Sender: TObject);
begin
  with fmOper do
  begin
    image3.Visible := true;
    button11.Visible := true;
    button10.Visible := false;
  end;
end;

procedure TfmOper.Button11Click(Sender: TObject);
begin
  with fmOper do
  begin
    image3.Visible := false;
    button11.Visible := false;
    button10.Visible := true;
  end;
end;

procedure TfmOper.Button14Click(Sender: TObject);
begin
  with fmOper do
  begin
    Memo18.Visible := true;
    button15.Visible := true;
    button14.Visible := false;
  end;
end;

procedure TfmOper.Button15Click(Sender: TObject);
begin
  with fmOper do
  begin
    Memo18.Visible := False;
    button15.Visible := False;
    button14.Visible := True;
  end;
end;

procedure TfmOper.Button16Click(Sender: TObject);
begin
  tmrSledShow.Enabled := True;
end;

procedure TfmOper.Button17Click(Sender: TObject);
begin
  tmrSledSkip.Enabled := True;
end;


procedure TfmOper.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  form6.Close;
  fmChoise.Enabled := true;
  fmChoise.Visible := true;
end;

procedure TfmOper.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = tabMain then
  begin
    mNew.Enabled := False;
    mOpen.Enabled := False;
    mSave.Enabled := False;
  end;
end;

end.
