�
 TIZLT 0�	  TPF0TIzlTIzlTLeft� TopZBorderIcons BorderStylebsDialogCaptionK   Накладная на излишки продукции на складеClientHeight�ClientWidth�Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
KeyPreview	OldCreateOrder	PositionpoScreenCenter
OnActivateFormActivateOnDeactivateFormDeactivate	OnKeyDownFormKeyDownPixelsPerInch`
TextHeight TLabelLabel1Left TopWidth� HeightCaptionK   Накладная на излишки №                             от  TLabelLabel2Left� TopWidth0HeightCaptionLabel2Font.CharsetDEFAULT_CHARSET
Font.ColorclPurpleFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabelLabel6LeftTopWidth?HeightCaption
   @8<5G0=85  TLabelLabel9Left�TopWidth[HeightCaption   Сумма накладной  TLabelLabel11LeftHTopWidthHeightCaption0.00Font.CharsetDEFAULT_CHARSET
Font.ColorclRedFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TDBMemoDBMemo1LeftSTopWidth�Height)	DataFieldPRIM
DataSourceDataMain.IzlNaklDSTabOrder   TDBGridDGLeft�TopZWidth�Height�
DataSourceDataMain.IzlTNDSOptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgConfirmDeletedgCancelOnExit TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style OnEnterDGEnterOnExitDGExit	OnKeyDown	DGKeyDown
OnKeyPress
DGKeyPressColumnsExpanded	FieldNameNaimTitle.Caption   08<5=>20=85Width� Visible	 Expanded	FieldNameV_UPTitle.Caption   В уп.Width#Visible	 Expanded	FieldNameUPTitle.Caption   #?0:>2>:Width8Visible	 Expanded	FieldNameKOLTitle.Caption   Кол-воWidth0Visible	 Expanded	FieldNamePRICETitle.Caption   &5=0Visible	 Expanded	FieldNameSummaTitle.Caption   !C<<0Visible	 Expanded	FieldNamePRIMTitle.Caption
   @8<5G0=85Width� Visible	    TJvDateEditDELeft TopWidthyHeightShowNullDateTabOrder  TIBQueryQ1DatabaseDataMain.IBDBTransactionDataMain.IBTSQL.Strings&Select Sum(TP.Kol * TP.Price) As SummaFrom IzlTN TPWhere TP.Nomer = :Nakl     Left� Top� 	ParamDataDataType	ftUnknownNameNakl	ParamType	ptUnknown   TFloatFieldQ1SUMMA	FieldNameSUMMAProviderFlags     