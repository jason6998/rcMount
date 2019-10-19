unit uFm_DirTree;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, vte_json,
  fpjson, jsonparser, jsonscanner, process, UTF8Process;

type

  { TFm_DirTree }

  TFm_DirTree = class(TForm)
    Memo1: TMemo;
    VirtualJSONTreeView1: TVirtualJSONTreeView;
  private

  public
    Rclone_Exe :String;
    procedure GetDirTree;
  end;

var
  Fm_DirTree: TFm_DirTree;

implementation

{$R *.frm}

{ TFm_DirTree }

procedure TFm_DirTree.GetDirTree;
var s:String;
  Parser: TJSONParser;
  Stream: TFileStream;
  Data: TJSONData;
begin
  //RunCommand(Rclone_Exe,['lsjson',cb_rcRemote.Text],s,[poWaitOnExit]);
  Memo1.Lines.Add(s);

(*    Stream := nil;
    Parser := nil;
    Data := nil;
    try
      try
        Stream := TFileStream.Create(Value, fmOpenRead);
        Parser := TJSONParser.Create(Stream);
        Data := Parser.Parse;
      finally
        Parser.Free;
        Stream.Free;
      end;
    except
      on E: EFOpenError do
        ShowMessageFmt('Error opening "%s" : %s', [Value, E.Message]);
    {  on E: EJSONScanner do
      begin
        ShowMessageFmt('Error parsing "%s" : %s', [Value, E.Message]);
      end;}
      on E: EScannerError do
      begin
        ShowMessageFmt('Error parsing "%s" : %s', [Value, E.Message]);
      end;
    end;
    if Data <> nil then
    begin
      if Data.JSONType in [{jtObject,} jtArray] then
      begin
        JSONData.Free;
        JSONData := Data;
        JSONTreeView.Data := JSONData;
      end
      else
      begin
        ShowMessageFmt('Expecting a TJSONArray got "%s"', [Data.ClassName]);
        Data.Destroy;
      end;
    end;
*)

end;

end.

