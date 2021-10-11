{ *********************************************************************** }
{                                                                         }
{ Name: ListView Utils                                                    }
{ Version: 1.0                                                            }
{ Author: Andrew Katrich                                                  }
{ ICQ: 441047552                                                          }
{ Email: ZoTack@Live.ru                                                   }
{ Copyright: (C) 2009-2010, Andrew Katrich. All Rights Reserved.          }
{ Licensing: GPL 2.0 / File gpl.txt                                       }
{                                                                         }
{ *********************************************************************** }

unit LVUtils;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Forms, ComCtrls,
  INIFiles;

  //function Command: string;
  //function EFileName(const FileName: string): string;
  procedure SaveItems(FileName: String; ListView: TListView);
  procedure LoadItems(FileName: String; ListView: TListView);
  procedure CulumnAdd(CName: String; CSize: Integer; ListView: TListView);
  procedure ColumnDelete(Index: integer; ListView: TListView);
  procedure ColumnRepaint(CName: String; CSize: integer; Index: integer;
            ListView: TListView);
  procedure ItemAdd(CName: String; ImageIndex,StateIndex: integer;
            ListView: TListView);
  procedure ItemDelete(Index: integer; ListView: TListView);
  procedure ItemRepaint(Index: integer; CName: String; ImageIndex,
            StateIndex: integer; ListView: TListView);
  procedure SubItemAdd(index: integer; CName: String; ListView: TListView);
  procedure SubItemDelete(ItemIndex,SubItem: integer; ListView: TListView);
  procedure SubItemRepaint(ItemIndex,SubItem: integer; CName: String;
            ListView: TListView);

var
  IFile: TINIFile;

const
  Delim  = {$IFDEF MSWINDOWS} ''; {$ELSE} ''; {$ENDIF}

implementation
{*
function Command: string;
var
  lgnht,i: integer;
  cmd: string;
begin
  lgnht := Length(Application.ExeName);
  i := LastDelimiter(PathDelim+PathDelim,cmdline);

  cmd := Copy(cmdline, lgnht+5, MaxInt);
  i := LastDelimiter(Delim+Delim,cmd);
  lgnht := Length(cmd);
  lgnht := lgnht - 2;
  Command := Copy(cmd, i+2, lgnht);
end;

function EFileName(const FileName: string): string;
var
  I,S: Integer;
  nam: string;
begin
  I := LastDelimiter(PathDelim + DriveDelim, FileName);
  S :=Length(FileName);
  nam := Copy(FileName, I+1, S);
  i := LastDelimiter(PathDelim + DriveDelim,nam);
  s := Length(nam);
  s := s - 4;
  Result := Copy(nam, i, s);
end;
*}

procedure SaveItems(FileName: String; ListView: TListView);
var
  CCount: Integer;
  CStr: Integer;
  CName: String;
  CSize: Integer;

  ICount: Integer;
  IStr: Integer;
  IName: String;
  ISubName: String;
  OStr: Integer;
  IIndex,SIndex: Integer;
begin
{ Save Columns }
  IFile := TINIFile.Create(FileName);
  CCount := ListView.Columns.Count;
  IFile.WriteInteger('Columns','Count',CCount);
  for CStr := 0 to CCount - 1 do
    begin
      CName := ListView.Columns.Items[CStr].Caption;
      CSize := ListView.Columns.Items[CStr].Width;
      IFile.WriteString('ColumnsItem'+IntToStr(CStr),'Text',CName);
      IFile.WriteInteger('ColumnsItem'+IntToStr(CStr),'Size',CSize);
    end;
{ Save Items }
  ICount := ListView.Items.Count;
  IFile.WriteInteger('Items','Count',ICount);
  for IStr := 0 to ICount - 1 do
    begin
      IName := ListView.Items.Item[IStr].Caption;
      IFile.WriteString('Items'+IntToStr(IStr),'Text',IName);
      IIndex := ListView.Items.Item[IStr].ImageIndex;
      IFile.WriteInteger('Items'+IntToStr(IStr),'ImageIndex',IIndex);
      SIndex := ListView.Items.Item[IStr].StateIndex;
      IFile.WriteInteger('Items'+IntToStr(IStr),'StateIndex',SIndex);
      for OStr := 0 to CCount -2 do
        begin
          ISubName := ListView.Items.Item[IStr].SubItems.Strings[OStr];
          IFile.WriteString('Items'+IntToStr(IStr),'Sub'+IntToStr(OStr),ISubName);
        end;
    end;
end;

procedure LoadItems(FileName: String; ListView: TListView);
var
  CCount: Integer;
  CStr: Integer;
  CName: String;
  CSize: Integer;

  ICount: Integer;
  IStr: Integer;
  IName: String;
  ISubName: String;
  OStr: Integer;
  IIndex,SIndex: Integer;
begin
{ Load Columns }
  IFile := TINIFile.Create(FileName);
  ListView.Columns.Clear;
  CCount := IFile.ReadInteger('Columns','Count',0);
  for CStr := 0 to CCount - 1 do
    begin
      CName := IFile.ReadString('ColumnsItem'+IntToStr(CStr),'Text','');
      CSize := IFile.ReadInteger('ColumnsItem'+IntToStr(CStr),'Size',0);
      with ListView.Columns do
        begin
          Add.Caption := CName;
          Items[CStr].Width := CSize;
        end;
    end;
{ Load Items }
  ListView.Items.Clear;
  ICount := IFile.ReadInteger('Items','Count',0);
  for IStr := 0 to ICount - 1 do
    begin
      IName := IFile.ReadString('Items'+IntToStr(IStr),'Text','');
      IIndex :=  IFile.ReadInteger('Items'+IntToStr(IStr),'ImageIndex',0);
      SIndex :=  IFile.ReadInteger('Items'+IntToStr(IStr),'StateIndex',0);
      with ListView.Items do
        begin
          Add.Caption := IName;
          Item[IStr].ImageIndex := IIndex;
          Item[IStr].StateIndex := SIndex;
          for OStr := 0 to CCount -2 do
            begin
              ISubName := IFile.ReadString('Items'+IntToStr(IStr),'Sub'+IntToStr(OStr),'');
              Item[IStr].SubItems.Add(ISubName);
            end;
        end;
    end;
end;

procedure CulumnAdd(CName: String; CSize: Integer; ListView: TListView);
begin
  with ListView.Columns do
    begin
      Add.Caption := CName;
      Items[ListView.Columns.Count-1].Width := CSize;
    end;
end;

procedure ColumnDelete(Index: integer; ListView: TListView);
begin
  if ListView.Columns.Count <> 0 then
    begin
    with ListView.Columns do
      begin
        Delete(Index);
      end;
    end;
end;

procedure ColumnRepaint(CName: string; CSize: integer; Index: integer;
          ListView: TListView);
begin
  if ListView.Columns.Count <> 0 then
    begin
    with ListView.Columns do
      begin
        Items[Index].Caption := CName;
        Items[Index].Width := CSize;
      end;
    end;
end;

procedure ItemAdd(CName: String; ImageIndex,StateIndex: integer;
          ListView: TListView);
begin
  with ListView.Items do
    begin
      Add.Caption := CName;
      Item[ListView.Items.Count-1].ImageIndex := ImageIndex;
      Item[ListView.Items.Count-1].StateIndex := StateIndex;
    end;
end;

procedure ItemDelete(Index: integer; ListView: TListView);
begin
  with ListView.Items do
    begin
      Item[index].Delete;
    end;
end;

procedure ItemRepaint(Index: integer; CName: String; ImageIndex,
          StateIndex: integer; ListView: TListView);
begin
  with ListView.Items do
    begin
      Item[index].Caption := CName;
      Item[index].ImageIndex := ImageIndex;
      Item[index].StateIndex := StateIndex;
    end;
end;

procedure SubItemAdd(index: integer; CName: String; ListView: TListView);
begin
  with ListView.Items do
    begin
      Item[index].SubItems.Add(CName);
    end;
end;

procedure SubItemDelete(ItemIndex,SubItem: integer; ListView: TListView);
begin
  with ListView.Items do
    begin
      Item[ItemIndex].SubItems.Delete(SubItem);
    end;
end;

procedure SubItemRepaint(ItemIndex,SubItem: integer; CName: String;
          ListView: TListView);
begin
  with ListView.Items do
    begin
      Item[ItemIndex].SubItems.Strings[SubItem] := CName;
    end;
end;

end.
