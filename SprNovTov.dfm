�
 TNEWTOV 0�  TPF0TNewTovNewTovLeftTop� Caption.   Добавление нового товараClientHeight� ClientWidth�Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	PositionpoScreenCenter
OnActivateFormActivate	OnKeyDownFormKeyDownPixelsPerInch`
TextHeight TPanelPanel1Left Top� Width�Height&AlignalBottomTabOrder TButtonButton1Left� TopWidthKHeightCaption	   !>E@0=8BLTabOrder OnClickButton1Click  TButtonButton2LeftpTopWidthKHeightCancel	Caption   B<5=0TabOrderOnClickButton2Click   TDBRadioGroupDBRadioGroup1Left Top� Width�Height.AlignalBottomCaption   Вид номенклатурыColumns	DataFieldVID
DataSourceDataMain.TovarDSItems.Strings   ">20@   #A;C30 ParentBackground	TabOrderValues.Strings01   TPanelPanel2Left Top Width�Height� AlignalClientTabOrder  TLabelLabel1LeftTopWidthrHeightCaption%   Наименование товара  TLabelLabel5LeftTop0WidthRHeightCaption   Приходная цена  TLabelLabel9LeftTop0Width,HeightCaption   0F5=:0  TLabelLabel7Left�Top0WidthFHeightCaption   Базовая цена  TLabelLabel10LeftTopPWidthvHeightCaption(   Количество в упаковке  TLabelLabel20LeftTopkWidth)HeightCaption   @B8:C;  TLabelLabel14LeftTopfWidthOHeightCaption   @>872>48B5;L  TLabelLabel2Left�TopPWidthNHeightCaption   Цена в бонусах  TDBLookupComboBoxDBLookupComboBox2Left�TopcWidthHeight	DataFieldCODE_PR
DataSourceDataMain.TovarDSKeyField
CODE_PROIZ	ListFieldNAIM
ListSourceDataMain.PriozDSTabOrder 
OnDropDownDBLookupComboBox2DropDown	OnKeyDownDBLookupComboBox2KeyDown  TDBEditDBEdit1Left� TopWidthHeight	DataFieldNAIM
DataSourceDataMain.TovarDSTabOrder  TDBEdit	PrihPriceLeft� Top-WidthaHeight	DataFieldPRIHOD
DataSourceDataMain.TovarDSTabOrder  TDBEditNacBLeftpTop-WidthKHeight	DataFieldNACEN
DataSourceDataMain.TovarDSTabOrder  TDBEditPriceBLeftdTop-WidthUHeight	DataFieldPRICE_B
DataSourceDataMain.TovarDSTabOrder  TDBEditDBEdit10Left� TopcWidth_Height	DataFieldARTIKUL
DataSourceDataMain.TovarDSTabOrder  TDBEditDBEdit7Left� TopHWidth9Height	DataFieldUP
DataSourceDataMain.TovarDSTabOrder  TJvDBCalcEditBonusEDLeftpTopHWidthIHeightDecimalPlaces DisplayFormat,0TabOrderDecimalPlacesAlwaysShown	DataFieldBONUS
DataSourceDataMain.TovarDS   TIBQueryIBQuery1DatabaseDataMain.IBDBTransactionDataMain.IBTSQL.Stringsselect CODE from TOVARwhere code= :code Left`Top� 	ParamDataDataType	ftUnknownNamecode	ParamType	ptUnknown     