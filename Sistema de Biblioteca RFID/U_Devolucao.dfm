object F_Devolucao: TF_Devolucao
  Left = 302
  Top = 252
  Width = 482
  Height = 422
  Caption = 'Devolu'#231#227'o'
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
    object Btn_FinalizaDevolucao: TBitBtn
      Left = 26
      Top = 281
      Width = 145
      Height = 37
      Caption = 'Finaliza Devolu'#231#227'o'
      Default = True
      TabOrder = 0
      Visible = False
      OnClick = Btn_FinalizaDevolucaoClick
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
        FEFBFBFBF7F7F7F4F4F4F4F4F4F7F7F7FBFBFBFEFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF6F6F6DDDEDEB4BF
        B993B1A17FAD9577AA8F78AA8F83AB959BB1A5C1C5C3E3E3E3F8F8F8FEFEFEFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5C6CCC982B2995ABD8A51C0
        874FBF854DBE834BBD8149BC7F46BB7D44BA7B44B97A5CAB8094AC9ED5D5D5F8
        F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDDEDFDF88B69F5CC49059C48E57C38C55C2
        8A52C18850C0864EBF844CBE824ABD8048BC7E46BB7C44BA7A42B97954AD7CA2
        B0A8E9E9E9FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFCFCFCC8CFCC6FC09960C8955EC7935CC6915AC58F58C4
        8D56C38B54C28952C18850C0864EBF844CBE824ABD8047BC7E45BB7C43BA7A43
        B8787FA590DDDDDDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDFDFDC5CDC96EC89C66CB9A64CA9862C99760C8955EC7935CC6
        915AC58F5FC591A2D4BA7CCBA251C1874FC0854DBF834BBE8149BD7F47BC7D45
        BB7B44BA7A73A58ADDDDDDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD5D9D774C9A26CCDA06ACC9E68CB9C66CA9A63C99861C8965FC7
        945DC69268C898E7E6E5A3D5BB55C28A53C18851C0874FBF854DBE834BBD8148
        BC7F46BB7D45BA7C7FA691E9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF1F1F184C5A772D0A56FCFA36DCEA16BCD9F69CC9D67CB9B65CA9963C9
        977BCFA5A5D8BEE8E8E7C2DECF7ECDA559C48D54C28A52C18850C0864EBF844C
        BE824ABD8048BC7E47BA7DA2B0A9F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFEFEAFC4BB77D3AA75D2A873D1A671D0A46FCFA36DCEA16BCD9F6ECDA0C0E1
        D1ECEBEBEBEAEAEAE9E9E9E8E8E8E7E6D2E1D877CBA056C38B54C28952C18750
        C0854EBF834BBE8249BD805AB082D6D6D6FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
        EFEFEF82CFAD7AD4AD79D3AC77D3AA75D2A873D1A670D0A46ECFA2C5E4D5EFEE
        EEEEEDECEDECEBECEBEAEAEAE9EAE9E8E9E8E7E1E5E270CA9C57C38D55C28B53
        C28951C1874FC0854DBF834BBD8195ACA0F8F8F8FFFFFFFFFFFFFFFFFFFFFFFF
        BDCCC67FD6B17DD5AF7BD5AE7AD4AD78D3AB76D2A974D1A78FD8B7F1F1F0F0F0
        EFEEEFEEADDDC6EEEDECB1DDC7A1D8BDEAEAE9EAE9E8BCDDCC5BC59059C48E57
        C38C55C28A53C18851C0864FBF8464AE88E3E3E3FFFFFFFFFFFFFFFFFFFDFDFD
        9AC5B381D7B380D6B27ED6B07DD5AF7BD4AE79D4AC78D3ABBBE4D1F3F2F2F2F1
        F1BBE3D079D1A8EFEFEEB0DEC867CB9BCCE3D7EBEBEAE5E8E661C8955DC6915A
        C59058C48E56C38C54C28A52C18851C086C2C5C3FEFEFEFFFFFFFFFFFFF7F7F7
        8AD3B584D8B582D7B481D7B37FD6B17ED5B07CD5AF7BD4AD92DABBA8E0C7B4E2
        CD86D6B17DD3ABF1F0F0B3E0CA6BCD9FC4E3D4EDECECECEBEB6CCB9C60C8955E
        C7935CC6915AC58F58C48D56C38B54C2899EB2A7FBFBFBFFFFFFFFFFFFE7E9E8
        88D9B987D9B885D8B684D8B582D7B480D6B27FD6B17DD5B07CD5AE7AD4AD79D3
        AB77D3AA80D5AFF2F2F1B5E1CD8DD7B4EBEEECEFEEEDEAECEA69CB9C64C99862
        C89660C7945DC6925BC59059C48F57C38D8AAE9BF7F7F7FFFFFFFFFFFFDBE0DE
        8BDABB8ADABA88D9B886D9B785D8B683D7B582D7B380D6B27FD6B07DD5AF7BD4
        AE7AD4AD94DBBBF4F3F3EAF0EDF1F1F1F1F1F0F0F0EFC9E5D769CC9D67CB9C65
        CA9A63C99861C8965FC7945DC6925BC59080AE97F4F4F4FFFFFFFFFFFFD8DEDC
        8EDBBD8CDBBC8BDABB89DAB988D9B886D8B784D8B683D7B481D7B380D6B294DC
        BDD8EEE4F6F5F5F5F5F4F4F4F4F3F3F3F3F2F2E8EFEB83D4AF6DCEA16BCD9F69
        CC9D67CB9B65CA9963C99761C8955EC79380AF98F4F4F4FFFFFFFFFFFFE0E4E3
        91DCC08FDCBE8DDBBD8CDBBC8ADABA89D9B987D9B886D8B684D8B59CDEC3F3F7
        F5F8F8F7F7F7F7F6F6F6F6F5F5F1F3F2C6E8D884D6B173D1A671D0A46FCFA26D
        CEA06ACD9E68CC9C66CB9A64CA9962C99789B19EF7F7F7FFFFFFFFFFFFF1F2F2
        94DDC392DDC190DCBF8FDBBE8DDBBD8BDABB8ADABA88D9B987D9B8E4F4EDFAFA
        F9F9F9F9F6F8F7F8F7F7CEEBDE84D7B37AD4AD78D3AB76D2AA74D1A872D0A670
        CFA46ECEA26CCDA06ACC9E68CB9C66CA9A99B4A7FBFBFBFFFFFFFFFFFFFCFDFD
        9DD3BF94DEC393DDC291DCC090DCBF8EDBBE8DDBBC8BDABB9ADEC3FBFBFBFBFB
        FBF0F7F4A0DFC5F9F9F8C0E8D77ED6B07DD5AF7BD4AE7AD4AC78D3AB76D2A974
        D1A772D0A570CFA36DCEA16BCD9F69CC9DB6C1BCFEFEFEFFFFFFFFFFFFFFFFFF
        B2CDC397DFC596DEC494DDC392DDC191DCC08FDCBF8EDBBDA9E3CCFCFCFCFCFC
        FCC8ECDD91DBBDFAFAFAC2E9D984D7B587D8B67ED5B07CD5AF7BD4AD79D4AC77
        D3AA75D2A873D1A771D0A56FCFA371C8A0DDDEDEFFFFFFFFFFFFFFFFFFFFFFFF
        DBE2DF9AE0C898DFC697DEC595DEC494DDC292DDC190DCC0A3E2CAFDFDFDFDFD
        FCD9F2E893DCBFFBFBFBC4EADBB3E5D0F8F9F8F0F6F3B6E5D17ED5B07CD5AE7A
        D4AD79D3AC77D3AA75D2A873D1A68DB7A4F6F6F6FFFFFFFFFFFFFFFFFFFFFFFF
        FDFDFDA6D0C29BE0C99ADFC798DFC696DEC595DEC393DDC293DDC1EFF9F5FDFD
        FDFDFDFDD4F0E5FCFCFCE2F4ECF4F9F7FAFAFAFAF9F99FDFC580D6B27FD6B17D
        D5AF7BD5AE7AD4AD78D3AB77D1AAC8CDCBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFDBE2E09FE1CB9CE0CA9BE0C899DFC798DFC696DEC494DEC3AFE6D2FBFD
        FCFEFEFEFDFDFDFDFDFDFCFCFCFCFCFCFBFBFBD0EEE285D8B683D7B481D7B380
        D6B27ED6B07DD5AF7BD4AE94BCAAF5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEFEFEB8D0C89FE1CC9DE1CB9CE0C99AE0C899DFC797DFC596DEC4ABE5
        D0E2F6EFFCFDFCFEFEFDFDFDFDEEF8F4BEE9D88ADABA87D9B886D8B784D8B583
        D7B481D7B37FD6B185CAACDFE0DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFAFAFAADD2C6A0E2CD9FE1CC9DE1CA9BE0C99AE0C798DFC697DE
        C595DEC4A0E1C9FEFEFECDEFE28FDCBE8DDBBD8CDABC8ADABA88D9B987D9B885
        D8B684D8B585D2B1CAD0CDFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF6F7F7ADD2C7A1E2CEA0E2CD9EE1CB9DE1CA9BE0C899DF
        C798DFC698DFC5A6E3CD9CE0C792DDC190DCBF8EDBBE8DDBBD8BDABB8ADABA88
        D9B98AD3B5C7CECBFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFAFAFABAD1CAA3E2CEA1E2CE9FE2CC9EE1CB9CE0
        C99BE0C899DFC797DFC596DEC494DEC393DDC291DCC090DCBF8EDBBD8CDBBC93
        CAB4D6DAD8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEDCE3E1ABD2C6A2E3CEA0E2CD9FE1
        CC9DE1CA9CE0C99AE0C899DFC697DFC595DEC494DDC392DDC194D5BCB4C6BFF1
        F2F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDDCE3E1B6CEC7A5D6
        C7A1E1CD9EE1CB9DE1CA9BE0C99AE0C79BD9C3A3C9BCC1CEC9EFF0EFFEFEFEFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
        FDF2F3F2E1E6E4DAE0DEDCE1DFE8EAE9F7F8F7FDFDFDFFFFFFFFFFFFFFFFFFFF
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