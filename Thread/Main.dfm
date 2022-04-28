object fMain: TfMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Main'
  ClientHeight = 289
  ClientWidth = 496
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lbInformeDataProcesso1: TLabel
    Left = 56
    Top = 48
    Width = 162
    Height = 13
    Caption = 'Informe o intervalo do processo 1'
  end
  object lbInformeDataProcesso2: TLabel
    Left = 267
    Top = 48
    Width = 162
    Height = 13
    Caption = 'Informe o intervalo do processo 2'
  end
  object pbIntervalo1: TProgressBar
    Left = 56
    Top = 91
    Width = 162
    Height = 17
    TabOrder = 0
  end
  object pbIntervalo2: TProgressBar
    Left = 267
    Top = 91
    Width = 163
    Height = 17
    TabOrder = 1
  end
  object btProcessarAnonimo: TButton
    Left = 56
    Top = 168
    Width = 162
    Height = 41
    Caption = 'Processar Thread An'#244'nima'
    TabOrder = 2
    OnClick = btProcessarAnonimoClick
  end
  object eIntervalo1: TSpinEdit
    Left = 56
    Top = 64
    Width = 162
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 3
    Value = 0
  end
  object eIntervalo2: TSpinEdit
    Left = 267
    Top = 64
    Width = 163
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 4
    Value = 0
  end
  object gbThreadComClasse: TGroupBox
    Left = 259
    Top = 128
    Width = 182
    Height = 137
    Caption = 'Thread utilizando classe'
    TabOrder = 5
    object btProcessar: TButton
      Left = 11
      Top = 16
      Width = 162
      Height = 41
      Caption = 'Processar Thread'
      TabOrder = 0
      OnClick = btProcessarClick
    end
    object btParar: TButton
      Left = 11
      Top = 80
      Width = 162
      Height = 41
      Caption = 'Parar Thread'
      Enabled = False
      TabOrder = 1
      OnClick = btPararClick
    end
  end
end
