�
 TSPRTOV 0�  TPF0TSprTovSprTovLeft� Top� HelpContextBorderIconsbiSystemMenu
biMinimize
biMaximizebiHelp BorderStylebsDialogCaption#   Справочник товаровClientHeight�ClientWidth�Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 	FormStyle
fsMDIChildOldCreateOrder	PositionpoScreenCenterVisible	
OnActivateA_WinCrExecuteOnClick	FormClickOnClose	FormClosePixelsPerInch`
TextHeight 	TSplitter	Splitter1Left� TopHeight�ExplicitLeft� ExplicitTopxExplicitHeightd  TActionToolBarActionToolBar1Left Top Width�HeightActionManagerActionManager1CaptionActionToolBar1ColorMap.HighlightColorclWhiteColorMap.BtnSelectedColor	clBtnFaceColorMap.UnusedColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style 
ParentFontSpacing   	TJvDBGrid	JvDBGrid1Left TopWidth� Height�AlignalLeft
DataSourceDataMain.GrTovarDSOptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgConfirmDeletedgCancelOnExitdgTitleClickdgTitleHotTrack ReadOnly	TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style AutoSizeColumns	"SelectColumnsDialogStrings.CaptionSelect columnsSelectColumnsDialogStrings.OK&OK-SelectColumnsDialogStrings.NoSelectionWarning$At least one column must be visible!EditControls 
RowsHeightTitleRowHeightColumnsExpanded	FieldNameNAIMTitle.Caption   08<5=>20=85Width� Visible	    	TJvDBGrid	JvDBGrid2Left� TopWidth7Height�AlignalClient
DataSourceDataMain.TovarDSOptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgConfirmDeletedgCancelOnExitdgTitleClickdgTitleHotTrack ReadOnly	TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style OnCellClickJvDBGrid2CellClickAutoSizeColumns	"SelectColumnsDialogStrings.CaptionSelect columnsSelectColumnsDialogStrings.OK&OK-SelectColumnsDialogStrings.NoSelectionWarning$At least one column must be visible!EditControls 
RowsHeightTitleRowHeightColumnsExpanded	FieldNameNAIMTitle.Caption%   Наименование товараWidthOVisible	 Expanded	FieldNamePRIHODTitle.Caption   Цена приходаWidth3Visible	 Expanded	FieldNamePRICE_BTitle.Caption   &5=0Width,Visible	 Expanded	FieldNameOst1Title.Caption   Опер. остWidth,Visible	 Expanded	FieldNameOst2Title.Caption   Факт.ост.WidthHVisible	    TButtonButton1Left�Top WidthKHeightCaption   1=>28BLTabOrderOnClickButton1Click  TActionManagerActionManager1
ActionBarsItemsActionA_Ins
ImageIndex ShortCut- ActionA_Edit
ImageIndexShortCuts ActionA_Del
ImageIndexShortCut. Caption- ActionA_Per
ImageIndex ActionA_Copy
ImageIndex Caption- ActionA_Find
ImageIndexShortCutu Caption- ActionDvigTov
ImageIndex  	ActionBarActionToolBar1  ImagesDataMain.ImageList2Left8Top(	StyleNameXP Style TActionA_WinCrCategory	   !;C651=K5Caption   Создание окна	OnExecuteA_WinCrExecute  TActionA_InsCategory    540:B8@>20=85Caption   >1028BL
ImageIndex ShortCut-	OnExecuteA_InsExecute  TActionA_EditCategory    540:B8@>20=85Caption    540:B8@>20BL
ImageIndexShortCuts	OnExecuteA_EditExecute  TActionA_DelCategory    540:B8@>20=85Caption   #40;8BL
ImageIndexShortCut.	OnExecuteA_DelExecute  TActionA_FindCategory   >8A:Caption   >8A:
ImageIndexShortCutu	OnExecuteA_FindExecute  TActionA_ExitCategory	   !;C651=K5Caption   Закрытие окнаSecondaryShortCuts.StringsESCESCAPE 	OnExecuteA_ExitExecute  TActionA_PerCategory    540:B8@>20=85Caption   5@5=>A
ImageIndex	OnExecuteA_PerExecute  TActionA_CopyCategory    540:B8@>20=85Caption   >?8@>20=85
ImageIndex	OnExecuteA_CopyExecute  TActionDvigTovCategory	   !;C651=K5Caption   Движение товара
ImageIndex	OnExecuteDvigTovExecute   TIBQueryIBQuery1DatabaseDataMain.IBDBTransactionDataMain.IBTSQL.Stringsselect CODEGR  from TOVARwhere CODEGR= :CODEGR Left� Top(	ParamDataDataType	ftUnknownNameCODEGR	ParamType	ptUnknown    TIBQueryIBQuery2DatabaseDataMain.IBDBTransactionDataMain.IBTSQL.Strings     LeftTop(  TIBQueryQ_IzlDatabaseDataMain.IBDBTransactionDataMain.IBTSQL.Stringsselect kol, ot from izltn  tp -left join izlnakl np  on tp.nomer = np.nomer where tp.code = :code LeftpTop(	ParamDataDataType	ftUnknownNamecode	ParamType	ptUnknown    TIBQueryQ_VozvDatabaseDataMain.IBDBTransactionDataMain.IBTSQL.Stringsselect kol, ot from tnvozv  tp /left join naklvozv  np  on tp.nomer = np.nomer where tp.code = :code Left�Top(	ParamDataDataType	ftUnknownNamecode	ParamType	ptUnknown    TIBQueryQ_CashDatabaseDataMain.IBDBTransactionDataMain.IBTSQL.Stringsselect kol, ot from cashtn tp .left join cashnakl np  on tp.nomer = np.nomer where tp.code = :code Left�Top(	ParamDataDataType	ftUnknownNamecode	ParamType	ptUnknown    TIBQueryQ_BrDatabaseDataMain.IBDBTransactionDataMain.IBTSQL.Stringsselect kol, ot from brtn tp ,left join brnakl np  on tp.nomer = np.nomer where tp.code = :code Left Top(	ParamDataDataType	ftUnknownNamecode	ParamType	ptUnknown    TIBQueryQ_PrihDatabaseDataMain.IBDBTransactionDataMain.IBTSQL.Stringsselect kol, ot from tnprih tp .left join naklprih np  on tp.nomer = np.nomer where tp.code = :code Left@Top(	ParamDataDataType	ftUnknownNamecode	ParamType	ptUnknown     