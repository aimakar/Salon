�
 TVOZVNAKL 0�  TPF0	TVozvNaklVozvNaklLeft#Top� BorderIcons BorderStylebsDialogCaption'   Возвратная накладнаяClientHeight�ClientWidthColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
KeyPreview	OldCreateOrder	PositionpoScreenCenter
OnActivateFormActivateOnClose	FormCloseOnDeactivateFormDeactivate	OnKeyDownFormKeyDownPixelsPerInch`
TextHeight TLabelLabel1Left TopWidth� HeightCaptionL   Возвратная накладная №                             от  TLabelLabel2Left� TopWidth0HeightCaptionLabel2Font.CharsetDEFAULT_CHARSET
Font.ColorclPurpleFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabelLabel6Left Top Width?HeightCaption
   @8<5G0=85  TLabelLabel9Left�TopXWidth"HeightCaption   !C<<0  TLabelLabel11Left�TopVWidthHeightCaption0.00Font.CharsetDEFAULT_CHARSET
Font.ColorclRedFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabelLabel12Left�TopWidth<HeightCaption
   >:C?0B5;L  TLabelLabel3Left TopPWidth=HeightCaption'   Основание/
Накладная  TDBMemoDBMemo1LeftHTop Width�Height)	DataFieldPRIM
DataSourceDataMain.NaklPrihDSTabOrder  TDBGridDGLeft ToppWidthHeighti
DataSourceDataMain.TnVozvDSOptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgConfirmDeletedgCancelOnExit ReadOnly	TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style OnEnterDGEnterOnExitDGExit	OnKeyDown	DGKeyDown
OnKeyPress
DGKeyPressColumnsExpanded	FieldNameNaimTitle.Caption   08<5=>20=85Width�Visible	 Expanded	FieldNameV_UPTitle.Caption   В уп.Width-Visible	 Expanded	FieldNameUPTitle.Caption   #?0:>2>:Width=Visible	 Expanded	FieldNameKOLTitle.Caption   Кло-воWidth1Visible	 Expanded	FieldNamePRICETitle.Caption   &5=0Visible	 Expanded	FieldNameSummaTitle.Caption   !C<<0WidthCVisible	    TDBLookupComboBoxPRLLeft�TopWidth!Height	DataFieldCODE_PR
DataSourceDataMain.NaklVozvDSKeyFieldCODE_PR	ListFieldNAIM
ListSourceDataMain.PredprDSTabOrder 
OnDropDownPRLDropDown	OnKeyDown
PRLKeyDown  TDBEditOsnELeftHTopPWidthiHeight	DataFieldOSN
DataSourceDataMain.NaklVozvDSTabOrder  TJvDateEditDELeft� TopWidthoHeightShowNullDateTabOrder  TIBQueryQ1DatabaseDataMain.IBDBTransactionDataMain.IBTSQL.Strings&Select Sum(TP.Kol * TP.Price) As SummaFrom TNVozv TPWhere TP.Nomer = :Nakl Left� Top� 	ParamDataDataType	ftUnknownNameNakl	ParamType	ptUnknown   TFloatFieldQ1SUMMA	FieldNameSUMMAProviderFlags     