�
 TSPRPV 0  TPF0TSprPVSprPVLeft� Top{BorderIconsbiSystemMenu
biMinimize BorderStylebsDialogCaption%   Справочник клиентовClientHeightClientWidthColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
KeyPreview	OldCreateOrder	PositionpoScreenCenterOnCreate
FormCreate	OnDestroyFormDestroy	OnKeyDownFormKeyDownPixelsPerInch`
TextHeight TDBGridDBGrid1Left Top WidthHeightAlignalClient
DataSourceDataSource1OptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgConfirmDeletedgCancelOnExit ReadOnly	TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 	OnKeyDownDBGrid1KeyDownColumnsExpanded	FieldNamenaimVisible	    TQueryQuery1DatabaseNameSkladSessionName
Session1_2SQL.Strings!select code_pr, naim from predpr Dwhere (code_pr in (select code_pr from roznnakl where (otp = true)))order by naim LeftHToph TFloatFieldQuery1code_pr	FieldNamecode_prVisible  TStringField
Query1naimDisplayLabel   08<5=>20=85	FieldNamenaimSizeP   TDataSourceDataSource1DataSetQuery1Left� Toph   