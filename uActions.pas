unit uActions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, StdCtrls, ActnList, XPStyleActnCtrls, ActnMan,
  Grids,
  uOperations, uHi, uSound;

procedure SaveTable(Table : TStringGrid; str : string);
procedure SaveEditDet(Edit : TEdit);
procedure SaveEditSled(Edit : TEdit);
procedure CheckString(var Table : TStringGrid; i , j :integer; var flag : boolean);
procedure CheckEdit(var Edit : TEdit; var flag : boolean);
procedure SetEdit(Edit : TEdit; var size : integer; var sch1 : Byte; var sch2 : Byte);//sch1, sch2 ��� ������������ ����� ����������� ������
procedure SetEditPow(Edit : TEdit;var flag : Boolean; var size : Integer);
procedure Clean(Table : TStringGrid);
procedure Add;
procedure Determinate;
function Det(arr : TMatrix; r : integer; c : TColumn; const n : integer)  : real;
procedure Sub;
procedure MultMatrix;
procedure MultNumb;
procedure Pow;
procedure Transpose;
procedure ObrTranspose;
procedure Music(s : string);
procedure Sled;

implementation

procedure Music(s : string);
begin
  fmOper.MediaPlayer1.FileName := way + s;
  fmOper.MediaPlayer1.Open;
  fmOper.MediaPlayer1.Play;
end;


//��������� ���������� ���������� �� ������� � ����
procedure SaveTable(Table: TStringGrid; str : string);
var
  i, j: integer;
begin
  if n = 0 then
    assignfile(f, way + '���������� ����������.txt') //���� ��� ������ �������� ('���������� ����������.txt')
  else assignfile(f, fmOper.SaveDialog1.FileName);
  append(f);
  write(f, '��������� ' + str + ':');

  with Table do
    for i:=0 to RowCount-1 do
    begin
      for j:=0 to  ColCount-1 do
        write(f, Table.cells[j, i] + ' ');
        writeln(f, #13 + #13);
    end;
    closefile(f);
end;


//��������� ���������� ������ �� ���� � ����
procedure SaveEditDet(Edit : TEdit);
begin
  if n = 0 then
    assignfile(f, way + '���������� ����������.txt')
  else assignfile(f, fmOper.SaveDialog1.FileName);
  append(f);
  writeln(f, '��������� ���������� ������������:');
  writeln(f, Edit.Text);
  writeln(f, #13 + #13);
  closefile(f);
end;


//��������� ���������� ������ �� ���� � ����
procedure SaveEditSled(Edit : TEdit);
begin
  if n = 0 then
    assignfile(f, way + '���������� ����������.txt')
  else assignfile(f, fmOper.SaveDialog1.FileName);
  append(f);
  writeln(f, '��������� ���������� ����� �������:');
  writeln(f, Edit.Text);
  writeln(f, #13 + #13);
  closefile(f);
end;

//��������� �������� ����� ������� �� ������������
procedure CheckString(var Table : TStringGrid; i, j: integer; var flag : boolean);
var
  k, x : integer;
  curr : string;
begin
  flag := true;
  x := 0;
  curr := Table.Cells[j+1, i+1];
  for k := 1 to length(curr) do
  begin
    if curr[k] = ',' then inc(x);
    if curr[k] = '.' then curr[k] := ',';
    if not(curr[k] in ['0','1','2','3','4','5','6','7','8','9', ',','-']) or
      (length(curr) = 1) and (curr[1] = '-') or
        (length(curr) > 1) and (k >= 2) and (curr[k] = '-') or
          (curr[1] = ',') or (x > 1)  then
        begin
          messagebox(fmoper.Handle, pchar('������������ ������! ���������� ����� �������!'), pchar('������'), mb_ok+mb_iconerror);
          flag := false;
          break;
        end;
  end;
  Table.Cells[j+1, i+1] := curr;
end;


//��������� �������� ���� �� ������������
procedure CheckEdit(var Edit : TEdit;  var flag : boolean);
var
  k, x : integer;
  curr : string;
begin
  flag := true;
  x := 0;
  curr := Edit.Text;
  for k := 1 to length(curr) do
  begin
    if curr[k] = ',' then inc(x);
    if curr[k] = '.' then curr[k] := ',';
    if not(curr[k] in ['0','1','2','3','4','5','6','7','8','9', ',','-']) or
      (length(curr) = 1) and (curr[1] = '-') or
        (length(curr) > 1) and (k >= 2) and (curr[k] = '-') or
          (curr[1] = ',') or (x > 1)  then
        begin
          messagebox(fmoper.Handle, pchar('������������ ������! ���������� ����� �������!'), pchar('������!'), mb_ok+mb_iconerror);
          flag := false;
          break;
        end;
  end;
  Edit.Text := curr;
end;


//��������� ������� ���� ����� �������
procedure Clean(Table : TStringGrid);
var
  i :integer;
begin
  with Table do
    for i := 0 to ColCount-1 do
      Cols[i].Clear;
end;


//��������� �������������� ���������� �� ���� � ������ ���
procedure SetEdit(Edit : TEdit; var size : Integer; var sch1 : Byte; var sch2 : Byte); //sch1, sch2 ��� ������������ ����� ����������� ������
begin
  try
  if (strtofloat(Edit.Text) <= 0) then
  begin
    size := 1;
    if sch1=0 then
      messagebox(fmoper.Handle, pchar('������������ ������! ����������� ������� ������ ���� ����� ������������� ������. ����������� �������������� ������ �� 1. ��� ������������� ������� OK.'), pchar('������!'), mb_ok+mb_iconerror);
    inc(sch1);
    size := 1;
    Edit.Text := '1';
    Exit;
  end
  else size := trunc(strtofloat(Edit.Text));
  except
    if sch2=0 then
      messagebox(fmoper.Handle, pchar('������������ ������! �� �� ����� ��������(-�) ����������� �������. ����������� �������������� ������ �� 1. ��� ������������� ������� OK.'), pchar('������!'), mb_ok+mb_iconerror);
    inc(sch2);
    size := 1;
    Edit.Text := '1';
  end;

  if size > 10 then size := 10;

  Edit.Text := inttostr(size);
end;

//��������� �������������� ���������� �� edNumbPow � ������ ���
procedure SetEditPow(Edit : TEdit; var flag : Boolean; var size : Integer); //numb ��� ������������ ����� ����������� ������
begin
  flag := True;
  try
  if (strtofloat(Edit.Text) <= 0) then
  begin
    size := 1;
    messagebox(fmoper.Handle, pchar('������������ ������! � �������� ������� ������� ����� ������� ���� ����� ������������� �����! ����������� �������������� ������ ������� �� 1. ��� ������������� ������� OK.'), pchar('������!'), mb_ok+mb_iconerror);
    Edit.Text := '1';
    flag := False;
    Exit;
  end
  else size := trunc(strtofloat(Edit.Text));
  if size > 10 then size := 10;
  Edit.Text := inttostr(size);
  except
    messagebox(fmoper.Handle, pchar('������������ ������! �� �� ����� �������! ����������� �������������� ������ ������� �� 1. ��� ������������� ������� OK.'), pchar('������!'), mb_ok+mb_iconerror);
    Edit.Text := '1';
    size :=1 ;
    flag := False;
    Exit;
  end;
end;

///////////////////////////////////////////////////////////////////////////////
// ������ �������� �������� � ������� ��� ���������(1)

//��������� ��������
procedure Add;
var
  i, j, k:integer;
  arr1, arr2, arr3: TMatrix;
  flag : boolean;
begin
  flag := true;
  setlength(arr1, size1, size2);
  setlength(arr2, size1, size2);
  setlength(arr3, size1, size2);
  for i := 0  to size1-1 do
    for j := 0 to size2-1 do
    begin
      CheckString(fmOper.strFirstAdd, i, j, flag);
        if flag = false then exit;
      if fmOper.strFirstAdd.Cells[j+1, i+1] = '' then
        begin
          arr1[i, j] := 0;
          fmOper.strFirstAdd.Cells[j+1, i+1] := '0';
        end
      else
        arr1[i, j] := strtofloat(fmOper.strFirstAdd.Cells[j+1, i+1]);

      if iden = 0 then //�������
      begin
        CheckString(fmOper.strSecondAdd, i, j, flag);
          if flag = false then exit;
        if fmOper.strSecondAdd.Cells[j+1, i+1] = '' then
          begin
            arr2[i, j] := 0;
            fmOper.strSecondAdd.Cells[j+1, i+1] := '0';
          end
        else
          arr2[i, j] := strtofloat(fmOper.strSecondAdd.Cells[j+1, i+1]);
      end
      else arr2[i, j] := numb;
      arr3[i, j] := arr1[i, j] + arr2[i, j];
      fmOper.strResultAdd.Cells[j+1, i+1] := floattostr(arr3[i, j]);
    end;
  SaveTable(fmOper.strResultAdd, '��������');
end;


//��������� ���������
procedure Sub;
var
  i, j:integer;
  arr1, arr2, arr3: TMatrix;
  flag : boolean;
begin
  flag := true;
  setlength(arr1, size1, size2);
  setlength(arr2, size1, size2);
  setlength(arr3, size1, size2);

  for i := 0  to size1-1 do
    for j := 0 to size2-1 do
    begin
      CheckString(fmOper.strFirstSub, i, j, flag);
        if flag = false then exit;
      if fmOper.strFirstSub.Cells[j+1, i+1] = '' then
        begin
          arr1[i, j] := 0;
          fmOper.strFirstSub.Cells[j+1, i+1] := '0';
        end
      else
        arr1[i, j] := strtofloat(fmOper.strFirstSub.Cells[j+1, i+1]);

      if iden = 0 then
      begin
        CheckString(fmOper.strSecondSub, i, j, flag);
          if flag = false then exit;
        if fmOper.strSecondSub.Cells[j+1, i+1] = '' then
          begin
            arr2[i, j] := 0;
            fmOper.strSecondSub.Cells[j+1, i+1] := '0';
          end
        else
          arr2[i, j] := strtofloat(fmOper.strSecondSub.Cells[j+1, i+1])
      end
      else arr2[i, j] := numb ;
      if sign = 1 then
        arr3[i, j] := arr1[i, j] - arr2[i, j]
      else  arr3[i, j] := -arr1[i, j] + arr2[i, j];
      fmOper.strResultSub.Cells[j+1, i+1] := floattostr(arr3[i, j]);
    end;
  SaveTable(fmOper.strResultSub, '���������');
end;


//��������� ��������� ������� �� �����
procedure MultNumb;
var
  i, j: integer;
  arr1, arr2: TMatrix;
  flag : boolean;
begin
  flag := true;
  setlength(arr1, size1, size2);
  setlength(arr2, size1, size2);
  for i := 0 to size1-1 do
    for j := 0 to size2-1 do
    begin
      CheckString(fmOper.strMultNumb, i, j, flag);
        if flag = false then exit;
      if fmOper.strMultNumb.Cells[j+1, i+1] = '' then
        begin
          arr1[i, j] := 0;
          fmOper.strMultNumb.Cells[j+1, i+1] := '0';
        end
      else
        arr1[i, j] := strtofloat(fmOper.strMultNumb.Cells[j+1, i+1]);
      arr2[i, j] := arr1[i, j] * numb ;
      fmOper.strResultMultNumb.Cells[j+1, i+1] := floattostrf(arr2[i, j], ffGeneral, 8, 4);
    end;
  SaveTable(fmOper.strResultMultNumb, '��������� �� �����');
end;


//��������� ���������� ������� � �������
procedure Pow;
var
  ia, ib, ja, jb, k, i, j: integer;
  s : real;
  arr1, arr2, arr3: TMatrix;
  flag : boolean;
begin
  flag := true;
  setlength(arr1, size1 ,size1);
  setlength(arr2, size1 ,size1);
  setlength(arr3, size1 ,size1);
  for i:=0 to size1-1 do
    for j:=0 to size1-1 do
    begin
      CheckString(fmOper.strPow, i, j, flag);
        if flag = false then exit;
      if fmOper.strPow.Cells[j+1, i+1] = '' then
        begin
          arr1[i, j] := 0;
          fmOper.strPow.Cells[j+1, i+1] := '0';
        end
      else arr1[i, j] := strtofloat(fmOper.strPow.cells[j+1, i+1]);
      arr2[i, j] := arr1[i, j];
    end;

  if numb1 = 1 then
    for i := 1 to size1 do
      for j := 1 to size1 do
        fmOper.strResultPow.Cells[j, i] := fmOper.strPow.Cells[j, i]
  else
  begin
    k:=1;
    while k <= numb1-1 do
    begin
      for ia:=0 to size1-1 do
        for jb:=0 to size1-1 do
        begin
          s := 0;
          ja := 0;
          ib := 0;
          while (ja <= size1-1) do
          begin
            s := s + arr1[iA, jA] * arr2[iB,jB];
            inc(ja);
            inc(ib);
          end;
          arr3[ia,jb] := s;
        end;
        inc(k);
        for i:=0 to size1-1 do
          for j:=0 to size1-1 do
            arr2[i, j] := arr3[i, j];
      end;
    for i := 0 to size1-1 do
      for j := 0 to size1-1 do
        fmOper.strResultPow.cells[j+1, i+1] := floattostrf(arr3[i, j], ffGeneral, 8, 4);
  end;
  SaveTable(fmOper.strResultPow, '���������� � �������');
end;


//������� ���������� ������������
function Det(arr : TMatrix; r : integer; c: TColumn; const n : integer) : real;
var
  i : integer;
  sum : real;
  minusflag : boolean;
begin
  sum := 0;
  minusflag := false;
  if r = n then
    begin
      for i := 0 to n-1 do
        if not(i in c) then
          sum := arr [i, r-1];
    end
  else for i := 0 to n-1 do
    if not(i in c) then
      begin
        include(c, i);
        if not minusflag then
          sum := sum + arr[i, r-1] * Det(arr, r+1, c, n)
        else sum := sum - arr[i, r-1] * Det(arr, r+1, c, n);
        exclude(c, i);
        minusflag := not minusflag;
      end;
  result := sum;
end;


//��������� ���������� ������������
procedure Determinate;
var
  arr : TMatrix;
  i, j : integer;
  flag : boolean;
begin
  flag := true;
  setlength(arr, size1, size1);
  for i := 0 to size1-1 do
    for j := 0 to size1-1 do
    begin
      CheckString(fmOper.strDet, i, j, flag);
        if flag = false then exit;
      if fmOper.strDet.Cells[j+1, i+1] = '' then
        begin
          arr[i, j] := 0;
          fmOper.strDet.Cells[j+1, i+1] := '0';
        end
      else
        arr[i, j] := strtofloat(fmOper.strDet.Cells[j+1, i+1]);
    end;
  fmOper.edResultDet.Text := floattostr(det(arr, 1, [], size1));
  SaveEditDet(fmOper.edResultDet);
end;


//��������� ������������ ������
procedure MultMatrix;
var
  arr1, arr2, arr3 : TMatrix;
  iA, jA, iB, jB, i, j : integer;
  sum : real;
  flag : boolean;
begin
  flag := true;
  setlength(arr1, size1, size2);
  setlength(arr2, size1mult, size2mult);
  setlength(arr3, sizeresmult1, sizeresmult2);
  for i := 0 to size1-1 do
    for j := 0 to size2-1 do
    begin
      CheckString(fmOper.strFirstMultMatr, i, j, flag);
        if flag = false then exit;
      if fmOper.strFirstMultMatr.cells[j+1, i+1] = '' then
        begin
          arr1[i, j] := 0;
          fmOper.strFirstMultMatr.cells[j+1, i+1] := '0';
        end
      else arr1[i, j] := strtofloat(fmOper.strFirstMultMatr.Cells[j+1, i+1]);
    end;
   for i := 0 to size1mult-1 do
    for j := 0 to size2mult-1 do
    begin
      CheckString(fmOper.strSecondMultMatr, i, j, flag);
        if flag = false then exit;
      if fmOper.strSecondMultMatr.cells[j+1, i+1] = '' then
        begin
          arr2[i, j] := 0;
          fmOper.strSecondMultMatr.cells[j+1, i+1] := '0';
        end
      else arr2[i, j] := strtofloat(fmOper.strSecondMultMatr.Cells[j+1, i+1]);
    end;
  for iA := 0 to size1-1 do
    for jB := 0 to size2mult-1 do
    begin
      sum := 0;
      jA := 0;
      iB := 0;
      while (jA <= size2-1) and (iB <= size1mult-1) do
      begin
        sum := sum + arr1[iA, jA] * arr2[iB, jB];
        inc(jA);
        inc(iB);
      end;
      arr3[iA, jB] := sum;
    end;
  for i := 0 to sizeresmult1-1 do
    for j := 0 to sizeresmult2-1 do
      fmOper.strResultMultMatr.Cells[j+1, i+1] := floattostrf(arr3[i, j], ffGeneral, 8, 4);
  SaveTable(fmOper.strResultMultMatr, '������������ ������');
end;


//��������� ���������������� �������
procedure Transpose;
var
  i, j : integer;
  k : real;
  arr1, arr2 : TMatrix;
  flag : boolean;
begin
  flag := true;
  setlength(arr1, size1, size2);
  setlength(arr2, size2, size1);
  for i := 0 to size1-1 do
    for j := 0 to size2-1 do
    begin
      CheckString(fmOper.strTranspose, i, j, flag);
        if flag = false then exit;
      if fmOper.strTranspose.Cells[j+1, i+1] = '' then
        begin
          arr1[i, j] := 0;
          fmOper.strTranspose.Cells[j+1, i+1] := '0';
        end
      else
        arr1[i, j] := strtofloat(fmOper.strTranspose.Cells[j+1, i+1]);
    end;
  for i := 0 to size2-1 do
    for j := 0 to size1-1 do
      arr2[i, j] := arr1[j, i];
  for i := 0 to size2-1 do
    for j := 0 to size1-1 do
      fmOper.strResultTranspose.Cells[j+1, i+1] := floattostr(arr2[i, j]);
  SaveTable(fmOper.strResultTranspose, '����������������');
end;

 //��������� ���������������� ������� ������������ �������� ���������
procedure ObrTranspose;
var
  i, j : integer;
  tmp, k : real;
  arr1, arr2 : TMatrix;
  flag : boolean;
begin
  flag := true;
  setlength(arr1, size1, size1);
  setlength(arr2, size1+1, size1+1);
  for i := 0 to size1-1 do
    for j := 0 to size1-1 do
    begin
      CheckString(fmOper.strObrTranspose, i, j, flag);
        if flag = false then exit;
      if fmOper.strObrTranspose.Cells[j+1, i+1] = '' then
        begin
          arr1[i, j] := 0;
          fmOper.strObrTranspose.Cells[j+1, i+1] := '0';
        end
      else
        arr1[i, j] := strtofloat(fmOper.strObrTranspose.Cells[j+1, i+1]);
    end;

  for i := 1 to (size1) do
    for j := 1 to (size1) do
      arr2[i, j] := arr1[i-1, j-1];

  for i:=1 to size1-1 do
    for j:=1 to size1-i do
    begin
      tmp:=arr2[i,j];
      arr2[i,j]:=arr2[size1-j+1,size1-i+1];
      arr2[size1-j+1,size1-i+1]:=tmp;
    end;

  for i := 1 to size1 do
    for j := 1 to size1 do
      fmOper.strResultObrTranspose.Cells[j, i] := floattostr(arr2[i, j]);

  SaveTable(fmOper.strResultTranspose, '���������������� ������������ �������� ���������');
end;

//��������� ���������� ����� �������
procedure Sled;
var
  arr : TMatrix;
  i, j : integer;
  sum : Real;
  flag : boolean;
begin
  flag := true;
  setlength(arr, size1, size1);
  for i := 0 to size1-1 do
    for j := 0 to size1-1 do
    begin
      CheckString(fmOper.strSled, i, j, flag);
        if flag = false then exit;
      if fmOper.strSled.Cells[j+1, i+1] = '' then
        begin
          arr[i, j] := 0;
          fmOper.strSled.Cells[j+1, i+1] := '0';
        end
      else
        arr[i, j] := strtofloat(fmOper.strSled.Cells[j+1, i+1]);
    end;

  sum:=0;
  for i:=0 to (size1-1) do
    for j:=0 to (size1-1) do
      if i=j then
        sum := sum + arr[i,j];

  fmOper.edResultSled.Text := floattostr(sum);
  
  SaveEditSled(fmOper.edResultSled);
end;

end.
