object F_Renovacao: TF_Renovacao
  Left = 302
  Top = 252
  Width = 482
  Height = 422
  Caption = 'Renova'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object P_Topo: TPanel
    Left = 0
    Top = 0
    Width = 466
    Height = 46
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label3: TLabel
      Left = 10
      Top = 15
      Width = 130
      Height = 20
      Caption = 'C'#243'digo do Livro:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object E_CodLivro: TEdit
      Left = 145
      Top = 10
      Width = 226
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = E_CodLivroExit
      OnKeyPress = SomenteNumeros
    end
    object Btn_Pesquisar: TBitBtn
      Left = 376
      Top = 10
      Width = 28
      Height = 28
      Default = True
      TabOrder = 1
      OnClick = Btn_PesquisarClick
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFD8D8D8969696B5B5B5FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFBCBCBC3E3E3E040404121212B2B2B2FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFEFEA8A8A83030300000001616164949498C8C8CFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB9090902525250000002626266F6F
        6F434343D1D1D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F37B7B7B1A1A1A000000
        3636366F6F6F464646CDCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFEFEFEDFDFDFC3C3C3BDBDBDBBBBBBBDBDBDC8C8C8F2F2F2EDEDED6B6B6B12
        12120000002525256F6F6F555555DDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE9E9E9B7B7B7D2D2D2ECECECEDEDEDEDEDEDEDEDEDE2E2E2B2B2
        B28787871414140101012F2F2F6F6F6F676767ECECECFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE0E0E0BEBEBEEEEEEEDACEC4C1A085C29D7DC39C7C
        C09D7FCBB6A4ECEAE9CFCFCF0D0D0D3232324040407C7C7CF6F6F6FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFBDBDBDEDECEBC2A289CCA584E6
        CEB9EBD7C4ECD9C8EBD8C6DCBEA5BF9674DFD6D0BABABA505050A0A0A0FBFBFB
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDBDBDEDEDEDC1A0
        85D8B79AE8D0BAEBD7C4EEDDCDF0E1D3EFE0D1EDDAC9E7D1BCBF9472E3DDD9BF
        BFBFDEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2
        C6C6C6D6C9BFCBA17DE5CAB2E8D2BDECDAC8F0E1D3F3E8DDF2E5D8EEDDCEEAD6
        C2E2C7AEC19E83E6E6E6B4B4B4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFD3D3D3DDDDDDC09D82E0C2A5EBD7C5EFE0D2F2E5D9F3E8DDF3E7DD
        F1E3D6EEDDCDEAD5C2E6CEB7C39772E0DEDCB6B6B6FAFAFAFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFC9C9C9E0E0E0BF9674E6CCB5F0E0D2F2E5D9F4
        E9DFF6EBE3F5ECE4F2E5D9EBD8C6E9D2BDE5CBB3CDA582D3C7BEC1C1C1EEEEEE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C9C9DEDEDEC09572E8D2
        BCF1E3D6F3E7DDF5EBE1F5ECE3F5EBE3F4EAE0EDDCCCE6CDB6E3C7ADCFA785D2
        C3B8C4C4C4EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1D1D1
        DCDCDCBF9878E8D1BBF2E5D9F4EADFF5ECE3F6EDE5F5ECE2F3E8DEF1E4D7E5CA
        B2E1C2A6C69972DDD6D1BDBDBDF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFEFEFEFCCCCCCC7AF9BD8B699F4E8DDF5ECE3F7EFE8F6EEE6F5EBE3
        F3E8DDF1E3D6E6CEB7DEBEA0BE9471EAEAEABCBCBCFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1C1C1E6E4E3BC906BEAD6C3F7EEE7F8
        F2EBF7EFE8F4EAE1F2E7DAF0E1D4E7CFB8C99E7AD0BFB1DCDCDCD6D6D6FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEACECECED8CD
        C5BE916BE7D1BDF5ECE4F6EDE6F4EAE0F1E3D7E8D1BDCBA17CC5A994ECECECB9
        B9B9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFDBDBDBD4D4D4DED8D3BF9A7DC39770D2AD8DD4B192C89D78BD936FCEBD
        AFEBEBEBB9B9B9F4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E2E2C7C7C7E4E4E4E4E1DED4C7BCD1C1B5
        DDD5CFEAEAEAD5D5D5BEBEBEF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBD6D6D6C8
        C8C8CACACACACACAC6C6C6C6C6C6E3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
  end
  object P_Edicao: TPanel
    Left = 0
    Top = 46
    Width = 466
    Height = 338
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object L_Matricula: TLabel
      Left = 350
      Top = 68
      Width = 95
      Height = 24
      Caption = 'L_Matricula'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object L_Matricula_: TLabel
      Left = 350
      Top = 45
      Width = 75
      Height = 24
      Caption = 'Matricula'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object L_Livro: TLabel
      Left = 30
      Top = 128
      Width = 60
      Height = 24
      Caption = 'L_Livro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object L_Livro_: TLabel
      Left = 30
      Top = 105
      Width = 40
      Height = 24
      Caption = 'Livro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object L_DataEmprestimo_: TLabel
      Left = 30
      Top = 160
      Width = 170
      Height = 24
      Caption = 'Data de Empr'#233'stimo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object L_DataEmprestimo: TLabel
      Left = 30
      Top = 183
      Width = 158
      Height = 24
      Caption = 'L_DataEmprestimo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object L_DataDevolucao_: TLabel
      Left = 235
      Top = 160
      Width = 159
      Height = 24
      Caption = 'Data de Devolu'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object L_DataDevolucao: TLabel
      Left = 235
      Top = 183
      Width = 147
      Height = 24
      Caption = 'L_DataDevolucao'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object L_Aluno_: TLabel
      Left = 30
      Top = 45
      Width = 50
      Height = 24
      Caption = 'Aluno'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object L_Aluno: TLabel
      Left = 30
      Top = 68
      Width = 70
      Height = 24
      Caption = 'L_Aluno'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object L_Encontrado: TLabel
      Left = 64
      Top = 89
      Width = 331
      Height = 24
      Alignment = taCenter
      Caption = 'Livro 000, n'#227'o se encontra emprestado.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object L_Multa_: TLabel
      Left = 235
      Top = 220
      Width = 50
      Height = 24
      Caption = 'Multa '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object L_DiasAtraso_: TLabel
      Left = 30
      Top = 220
      Width = 126
      Height = 24
      Caption = 'Dias em Atraso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object L_DiasAtraso: TLabel
      Left = 30
      Top = 243
      Width = 109
      Height = 24
      Alignment = taCenter
      Caption = 'L_DiasAtraso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object L_Multa: TLabel
      Left = 235
      Top = 243
      Width = 65
      Height = 24
      Caption = 'L_Multa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object L_Codigo: TLabel
      Left = 30
      Top = 20
      Width = 81
      Height = 24
      Caption = 'L_Codigo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Btn_RenovarEmprestimo: TBitBtn
      Left = 26
      Top = 281
      Width = 145
      Height = 37
      Caption = 'Renovar Emprestimo'
      Default = True
      TabOrder = 0
      Visible = False
      OnClick = Btn_RenovarEmprestimoClick
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2DBD6C6C9C8F7F7F7FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6CCC151B07DB0B8B3F3F3F3FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFD
        FDFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCB6CBC049BC7F4DB47DA2B0A9EFEFEFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF0F0F0D6D7D6B8C1BDA9B9
        B1A6B6AEA5B5ADA5B5ADA4B5ACA4B5AC82B0984EBE834ABD804BB87E95AA9FE9
        E9E9FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0B4C1BB84BCA270CDA16CCD9F68CC
        9C65CA9962C99660C7935CC69159C48E55C38B53C1884FC0854CBE824ABC7F89
        A797E3E3E3FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFEFEDFE0E08EC0AB7AD4AC78D3AA75D1A772D0A46ECE
        A16BCD9E68CB9B65CA9862C8965FC7935CC59059C48D56C28A52C1874FBF844C
        BD817CA690DBDBDBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFDEE0DF8BCBB080D6B27ED5B07BD4AE79D4AC77D2A973D1
        A670CFA36DCEA06ACC9D66CB9B63C99860C8955EC6925AC58F57C38C54C28952
        C0864EBF8372A98BDEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF1F1F194C8B486D9B784D8B582D7B37FD6B17DD5AF7CD4AD78D3
        AB75D2A872D0A570CFA36CCDA069CC9D66CA9A63C9975FC7945CC69159C48E57
        C38B53C1896BB790E3E4E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEFEFEB3C6BF8DDBBD8ADABB88D9B986D8B783D7B581D7B380D6B17CD5
        AF7AD4AD77D3AA75D1A871D0A56ECEA26BCD9F69CB9C65CA9962C8965EC7935C
        C5907DB89AE7E9E8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF3F3F397D6BE91DCC08FDBBE8CDBBC8ADABA87D9B885D8B683D7B480D6
        B27FD5B07DD5AE7AD4AC78D2AA74D1A771D0A46ECEA16BCD9E68CB9B65C9988D
        BAA4EFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCED5D397DFC595DEC393DDC290DCC08EDBBD8CDABB89DABA8FCBB3A8C6
        BAADC8BCABC8BCABC8BBAAC7BBA9C7BA92C4AD74D1A66FCFA36DCDA09DBCAEF4
        F5F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFB7CBC49BE0C999DFC797DEC594DEC392DDC190DCBF94C4B1E9EAE9FEFE
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0D1CA79D3AB76D1A8ADC1B8F8F8F8FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFB1CCC49FE2CC9DE1CA9BE0C898DFC696DEC494DDC2BBC5C1FEFEFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1D2CA7ED1AEBBC8C2FAFAFAFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF6F7F6EDEFEEEDEFEEEDEFEEEDEFEEEDEEEEEDEEEEF9F9F9FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2DFDACED4D1FCFCFCFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAD7DA
        D8F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF6F6F6F6
        F6F6F6F6F6F6F6F6F6F6F6F7F7F7FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B0C1B983B7
        9EEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB98B8A882AD9781
        AD9680AC957FAC937DAB9381AC95E5E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4A5BEB378D2AA82B8
        9FEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFED8DCDA5AC48E55C28A53
        C1874FBF854CBE8248BC7F51B47FE2E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF9DBEB07FD5B07CD5AE81B8
        9FC7C7C7D2D3D2D2D3D2D2D3D2D2D3D2D1D2D2BCC4C075BC995EC6925BC58F58
        C38C55C28A52C0874FBF8469B08BEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE8E9E997C2B184D8B582D7B380D6B17ED4
        AF7CD2AC7AD1AA77D0A874CFA571CDA26ECC9F6ACC9D66CA9A63C99760C8945E
        C69159C48F56C38C53C28994B3A3FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFEFEE0E1E096C8B58BDABB88D9B986D8B784D8B581D7
        B37FD6B17DD5AF7BD4AD78D3AB75D2A871D0A56FCFA26BCD9F68CC9C65CA9963
        C9965FC7945CC6915DC28ED3D6D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFED8DBDA97CEBA91DCC08FDCBE8CDBBC8ADABA88D9B885D8
        B683D7B481D6B27FD6B07CD5AE7AD4AC77D3AA75D1A771D0A46ECEA16ACD9E68
        CB9B64CA9961C89697B7A7F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFEA9CEC198DFC695DEC493DDC291DCC08EDBBE8CDABC89DA
        BA87D9B885D8B682D7B480D6B27FD5B07CD4AE7AD3AC77D2A974D1A671CFA36E
        CEA06BCC9E80BC9FECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF5F6F6AAD0C299DFC797DFC595DEC392DDC190DCBF8EDB
        BD8BDABB89D9B986D9B784D8B582D7B37FD6B17ED5AF7BD4AD78D3AB75D2A873
        D0A588BFA6E7E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFAFBFBB1CEC59BE0C999DFC796DEC594DDC392DD
        C18FDCBF8DDBBD8BDABB88D9B986D8B783D7B581D7B37FD6B17CD5AF7FCFACAE
        C4BAF4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDBBD0C99DE0CA9AE0C898DFC695D8
        C099D0BC9AD0BC99D0BA97D0BA95CFB893CEB695CAB4A0C5B6BECDC7EDEEEDFE
        FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC6D4D0A0E0CB9CE0C998C0
        B2EBEBEBFCFDFDFCFDFDFCFDFDFCFDFCFCFDFCFCFCFCFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFED1DBD8A2DECB9BC1
        B5EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCE3E1A8C4
        BCF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8
        F8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
  end
  object ADOQ_Emprestimo: TADOQuery
    Connection = F_Principal.ADOC_Conexao
    Parameters = <>
    Left = 391
    Top = 51
  end
  object ADOQ_Aux: TADOQuery
    Connection = F_Principal.ADOC_Conexao
    Parameters = <>
    Left = 421
    Top = 51
  end
end
