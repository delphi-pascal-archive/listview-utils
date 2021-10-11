object Form1: TForm1
  Left = 246
  Top = 133
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'ListView Utils [(C) 2009-2010, Andrew Katrich]'
  ClientHeight = 306
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 120
  TextHeight = 16
  object ListView1: TListView
    Left = 0
    Top = 0
    Width = 524
    Height = 217
    Align = alClient
    Columns = <>
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object Panel1: TPanel
    Left = 0
    Top = 217
    Width = 524
    Height = 89
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 10
      Top = 10
      Width = 119
      Height = 31
      Caption = 'Add Columns'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 138
      Top = 10
      Width = 119
      Height = 31
      Caption = 'Delete Columns'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 266
      Top = 10
      Width = 119
      Height = 31
      Caption = 'Add Item'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 394
      Top = 10
      Width = 119
      Height = 31
      Caption = 'Delete Item'
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 266
      Top = 49
      Width = 119
      Height = 31
      Caption = 'Open'
      TabOrder = 4
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 394
      Top = 49
      Width = 119
      Height = 31
      Caption = 'Save'
      TabOrder = 5
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 10
      Top = 49
      Width = 119
      Height = 31
      Caption = 'Add Sub'
      TabOrder = 6
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 138
      Top = 49
      Width = 119
      Height = 31
      Caption = 'Delete Sub'
      TabOrder = 7
      OnClick = Button8Click
    end
  end
  object XPManifest1: TXPManifest
    Left = 8
    Top = 8
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'List View Items (*.lvi)|*.lvi'
    Filter = 'List View Items (*.lvi)|*.lvi'
    Left = 40
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'List View Items (*.lvi)|*.lvi'
    Filter = 'List View Items (*.lvi)|*.lvi'
    Left = 72
    Top = 8
  end
end
