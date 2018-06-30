/*
 * Copyright 2015-2018 Marcel Piestansky
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */
package feathers.themes {

    import feathers.controls.Alert;
    import feathers.controls.AutoComplete;
    import feathers.controls.Button;
    import feathers.controls.ButtonGroup;
    import feathers.controls.ButtonState;
    import feathers.controls.Callout;
    import feathers.controls.Check;
    import feathers.controls.DataGrid;
    import feathers.controls.DateTimeSpinner;
    import feathers.controls.Drawers;
    import feathers.controls.GroupedList;
    import feathers.controls.Header;
    import feathers.controls.ImageLoader;
    import feathers.controls.Label;
    import feathers.controls.LayoutGroup;
    import feathers.controls.List;
    import feathers.controls.NumericStepper;
    import feathers.controls.PageIndicator;
    import feathers.controls.Panel;
    import feathers.controls.PanelScreen;
    import feathers.controls.PickerList;
    import feathers.controls.ProgressBar;
    import feathers.controls.Radio;
    import feathers.controls.ScrollContainer;
    import feathers.controls.ScrollPolicy;
    import feathers.controls.ScrollText;
    import feathers.controls.Scroller;
    import feathers.controls.SimpleScrollBar;
    import feathers.controls.Slider;
    import feathers.controls.SpinnerList;
    import feathers.controls.StepperButtonLayoutMode;
    import feathers.controls.TabBar;
    import feathers.controls.TabNavigator;
    import feathers.controls.TextArea;
    import feathers.controls.TextCallout;
    import feathers.controls.TextInput;
    import feathers.controls.TextInputState;
    import feathers.controls.ToggleButton;
    import feathers.controls.ToggleSwitch;
    import feathers.controls.TrackLayoutMode;
	import feathers.controls.Tree;
	import feathers.controls.popups.DropDownPopUpContentManager;
    import feathers.controls.popups.VerticalCenteredPopUpContentManager;
    import feathers.controls.renderers.BaseDefaultItemRenderer;
    import feathers.controls.renderers.DefaultDataGridCellRenderer;
    import feathers.controls.renderers.DefaultDataGridHeaderRenderer;
    import feathers.controls.renderers.DefaultGroupedListHeaderOrFooterRenderer;
    import feathers.controls.renderers.DefaultGroupedListItemRenderer;
    import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.DefaultTreeItemRenderer;
	import feathers.controls.text.ITextEditorViewPort;
    import feathers.controls.text.StageTextTextEditor;
    import feathers.controls.text.TextBlockTextEditor;
    import feathers.controls.text.TextBlockTextRenderer;
    import feathers.controls.text.TextFieldTextEditorViewPort;
    import feathers.core.FeathersControl;
    import feathers.core.ITextEditor;
    import feathers.core.PopUpManager;
    import feathers.layout.Direction;
    import feathers.layout.HorizontalAlign;
    import feathers.layout.RelativePosition;
    import feathers.layout.VerticalAlign;
    import feathers.media.FullScreenToggleButton;
    import feathers.media.MuteToggleButton;
    import feathers.media.PlayPauseToggleButton;
    import feathers.media.SeekSlider;
    import feathers.media.TimeLabel;
    import feathers.media.VolumeSlider;
    import feathers.skins.ImageSkin;
    import feathers.system.DeviceCapabilities;
    import feathers.text.FontStylesSet;

    import flash.geom.Rectangle;

    import starling.animation.Transitions;
    import starling.core.Starling;
    import starling.display.DisplayObject;
    import starling.display.Image;
    import starling.display.Quad;
    import starling.text.TextFormat;
    import starling.textures.Texture;
    import starling.textures.TextureAtlas;
    import starling.utils.Align;

    public class BaseUniflatMobileTheme extends StyleNameFunctionTheme {

        [Embed(source="/../assets/fonts/RobotoCondensed-Regular.ttf", fontFamily="RobotoCNSD", fontWeight="normal", mimeType="application/x-font", embedAsCFF="true")]
        private static const ROBOTO_REGULAR:Class;
        [Embed(source="/../assets/fonts/RobotoCondensed-Bold.ttf", fontFamily="RobotoCNSD", fontWeight="bold", mimeType="application/x-font", embedAsCFF="true")]
        private static const ROBOTO_BOLD:Class;

        public static const FONT_NAME:String = "RobotoCNSD";

        /**
         * Default colors
         * Either edit these values directly below or provide
         * UniflatMobileThemeColors object when initializing the theme.
         **/
        private static var COLOR_STAGE:int = 0xEEF2F6;
        private static var COLOR_BACKGROUND:int = 0xFFFFFF;
        private static var COLOR_PRIMARY:int = 0x07C1BB;
        private static var COLOR_PRIMARY_DISABLED:int = 0xB4ECEA;
        private static var COLOR_PRIMARY_CONTRAST:int = 0xFFFFFF;
        private static var COLOR_PRIMARY_CONTRAST_DISABLED:int = 0xFFFFFF;
        private static var COLOR_ALTERNATIVE:int = 0xFF2D55;
        private static var COLOR_ALTERNATIVE_DISABLED:int = 0xFFC0CC;
        private static var COLOR_ALTERNATIVE_CONTRAST:int = 0xFFFFFF;
        private static var COLOR_ALTERNATIVE_CONTRAST_DISABLED:int = 0xFFFFFF;
        private static var COLOR_CONTRAST:int = 0x2B333A;
        private static var COLOR_CONTRAST_DISABLED:int = 0xB1B4B7;

        /* Scale 9 Grids */
        protected static const BACKGROUND_SCALE9_GRID:Rectangle = new Rectangle( 1, 1, 1, 1 );
        protected static const BACKGROUND_TOOLBAR_SCALE9_GRID:Rectangle = new Rectangle( 25, 24, 1, 1 );
        protected static const BUTTON_SCALE9_GRID:Rectangle = new Rectangle( 20, 20, 2, 2 );
        protected static const BUTTON_SMALL_SCALE9_GRID:Rectangle = new Rectangle( 13, 13, 1, 1 );
        protected static const BUTTON_BACK_SCALE9_GRID:Rectangle = new Rectangle( 40, 20, 1, 2 );
        protected static const BUTTON_FORWARD_SCALE9_GRID:Rectangle = new Rectangle( 21, 20, 1, 2 );
        protected static const BUTTON_PICKER_LIST_SMALL_SCALE9_GRID:Rectangle = new Rectangle( 13, 13, 1, 1 );
        protected static const NUMERIC_BUTTON_DEC_SCALE_9_GRID:Rectangle = new Rectangle( 22, 5, 1, 1 );
        protected static const NUMERIC_BUTTON_INC_SCALE_9_GRID:Rectangle = new Rectangle( 3, 5, 1, 1 );
        protected static const TAB_SCALE9_GRID:Rectangle = new Rectangle( 13, 13, 1, 1 );
        protected static const ALERT_BUTTON_SCALE9_GRID:Rectangle = new Rectangle( 13, 13, 1, 1 );
        protected static const ALERT_BACKGROUND_SCALE9_GRID:Rectangle = new Rectangle( 8, 8, 0.5, 0.5 );
        protected static const TAB_WITH_ICON_SCALE9_GRID:Rectangle = new Rectangle( 13, 49, 1, 1 );
        protected static const TAB_BAR_BACKGROUND_SCALE9_GRID:Rectangle = new Rectangle( 1, 4, 1, 1 );
        protected static const ITEM_RENDERER_SCALE9_GRID:Rectangle = new Rectangle( 22, 22, 1, 1 );
        protected static const GROUPED_LIST_ITEM_SCALE9_GRID:Rectangle = new Rectangle( 21, 8, 2, 2 );
        protected static const DATA_GRID_CELL_SCALE9_GRID:Rectangle = new Rectangle( 8, 8, 2, 2 );
        protected static const DATA_GRID_DIVIDER_SCALE9_GRID:Rectangle = new Rectangle( 0, 8, 0.5, 2 );
        protected static const CALLOUT_BACKGROUND_POPUP_SCALE9_GRID:Rectangle = new Rectangle( 8, 8, 0.5, 0.5 );
        protected static const DROP_DOWN_LIST_BACKGROUND_SCALE9_GRID:Rectangle = new Rectangle( 8, 8, 0.5, 0.5 );
        protected static const SPINNER_LIST_BACKGROUND_SCALE9_GRID:Rectangle = new Rectangle( 8, 8, 0.5, 0.5 );
        protected static const SPINNER_LIST_OVERLAY_SCALE9_GRID:Rectangle = new Rectangle( 22, 22, 1, 1 );
        protected static const DATE_TIME_SPINNER_OVERLAY_SCALE9_GRID:Rectangle = new Rectangle( 2, 3, 1, 1 );
        protected static const DATE_TIME_SPINNER_BACKGROUND_SCALE9_GRID:Rectangle = new Rectangle( 6, 7, 1, 1 );
        protected static const SCROLL_BAR_VERTICAL_SCALE9_GRID:Rectangle = new Rectangle( 0, 4, 1, 4 );
        protected static const SCROLL_BAR_HORIZONTAL_SCALE9_GRID:Rectangle = new Rectangle( 4, 0, 4, 1 );
        protected static const HEADER_BACKGROUND_SCALE9_GRID:Rectangle = new Rectangle( 1, 1, 1, 1 );
        protected static const TEXT_INPUT_SCALE9_GRID:Rectangle = new Rectangle( 1, 1, 1, 1 );
        protected static const SEARCH_INPUT_SCALE9_GRID:Rectangle = new Rectangle( 20, 20, 2, 2 );
        protected static const PROGRESS_BAR_SCALE9_GRID:Rectangle = new Rectangle( 2, 2, 1, 1 );
        protected static const SLIDER_VERTICAL_SCALE9_GRID:Rectangle = new Rectangle( 1, 1.5, 1, 1 );
        protected static const SLIDER_HORIZONTAL_SCALE9_GRID:Rectangle = new Rectangle( 1.5, 1, 1, 1 );
        protected static const NUMERIC_STEPPER_INPUT_BACKGROUND_SCALE9_GRID:Rectangle = new Rectangle( 1, 1, 1, 1 );

        /* Dimensions */
        protected static var mSmallPaddingSize:int;
        protected static var mRegularPaddingSize:int;
        protected static var mTrackSize:int;
        protected static var mControlSize:int;
        protected static var mSmallControlSize:int;
        protected static var mLargeControlSize:int;
        protected static var mTabSize:int;
        protected static var mHeaderSize:int;

        /* Fonts */
        protected static var mSmallFontSize:int;
        protected static var mRegularFontSize:int;
        protected static var mLargeFontSize:int;
        protected static var mExtraLargeFontSize:int;

        /**
         * Text formats
         */
        protected static var mPrimaryBoldTF:TextFormat;
        protected static var mPrimaryBoldDisabledTF:TextFormat;
        protected static var mPrimaryBoldExtraLargeTF:TextFormat;
        protected static var mPrimaryBoldExtraLargeDisabledTF:TextFormat;
        protected static var mPrimaryContrastBoldTF:TextFormat;
        protected static var mPrimaryContrastBoldDisabledTF:TextFormat;
        protected static var mPrimaryContrastBoldLargeTF:TextFormat;
        protected static var mPrimaryContrastBoldExtraLargeTF:TextFormat;
        protected static var mPrimaryContrastBoldSmallTF:TextFormat;
        protected static var mPrimaryContrastBoldDisabledSmallTF:TextFormat;
        protected static var mAlternativeBoldTF:TextFormat;
        protected static var mAlternativeBoldDisabledTF:TextFormat;
        protected static var mAlternativeContrastBoldTF:TextFormat;
        protected static var mAlternativeContrastBoldDisabledTF:TextFormat;
        protected static var mContrastRegularTF:TextFormat;
        protected static var mContrastRegularDisabledTF:TextFormat;
        protected static var mContrastRegularSmallTF:TextFormat;
        protected static var mContrastRegularDisabledSmallTF:TextFormat;
        protected static var mContrastBoldLargeTF:TextFormat;
        protected static var mContrastBoldDisabledLargeTF:TextFormat;
        protected static var mContrastBoldSmallTF:TextFormat;
        protected static var mContrastBoldDisabledSmallTF:TextFormat;

        /**
         * Theme assets, initialized by subclasses
         **/
        protected static var mAtlas:TextureAtlas;

        /* Textures */
        protected static var mAlertButtonDownTexture:Texture;
        protected static var mAlertBackgroundTexture:Texture;
        protected static var mBackgroundListTexture:Texture;
        protected static var mBackgroundHeaderTexture:Texture;
        protected static var mBackgroundToolbarTexture:Texture;
        protected static var mBackgroundPlainTexture:Texture;
        protected static var mBackgroundPlainOverlayTexture:Texture;
        protected static var mBackgroundDropDownListTexture:Texture;
        protected static var mButtonUpTexture:Texture;
        protected static var mButtonDownTexture:Texture;
        protected static var mButtonSmallUpTexture:Texture;
        protected static var mButtonSmallDownTexture:Texture;
        protected static var mButtonOutlineUpTexture:Texture;
        protected static var mButtonOutlineAlternativeUpTexture:Texture;
        protected static var mButtonOutlineAlternativeDownTexture:Texture;
        protected static var mButtonOutlineAlternativeDisabledTexture:Texture;
        protected static var mButtonSelectedUpTexture:Texture;
        protected static var mButtonSelectedDownTexture:Texture;
        protected static var mButtonSelectedDisabledTexture:Texture;
        protected static var mButtonBackIconTexture:Texture;
        protected static var mButtonBackUpTexture:Texture;
        protected static var mButtonBackDownTexture:Texture;
        protected static var mButtonBackDisabledTexture:Texture;
        protected static var mButtonForwardIconTexture:Texture;
        protected static var mButtonForwardUpTexture:Texture;
        protected static var mButtonForwardDownTexture:Texture;
        protected static var mButtonForwardDisabledTexture:Texture;
        protected static var mButtonPickerListUpTexture:Texture;
        protected static var mButtonPickerListDownTexture:Texture;
        protected static var mButtonPickerListSmallUpTexture:Texture;
        protected static var mButtonPickerListSmallDownTexture:Texture;
        protected static var mButtonPickerListSmallDisabledTexture:Texture;
        protected static var mNumericStepperIncButtonUpTexture:Texture;
        protected static var mNumericStepperIncButtonDownTexture:Texture;
        protected static var mNumericStepperDecButtonUpTexture:Texture;
        protected static var mNumericStepperDecButtonDownTexture:Texture;
        protected static var mNumericStepperInputBackgroundTexture:Texture;
        protected static var mCalloutBackgroundTexture:Texture;
        protected static var mCalloutUpArrowTexture:Texture;
        protected static var mCalloutRightArrowTexture:Texture;
        protected static var mCalloutDownArrowTexture:Texture;
        protected static var mCalloutLeftArrowTexture:Texture;
        protected static var mCheckUpIconTexture:Texture;
        protected static var mCheckDownIconTexture:Texture;
        protected static var mCheckSelectedUpIconTexture:Texture;
        protected static var mCheckSelectedDownIconTexture:Texture;
        protected static var mRadioUpIconTexture:Texture;
        protected static var mRadioDownIconTexture:Texture;
        protected static var mRadioSelectedUpIconTexture:Texture;
        protected static var mRadioSelectedDownIconTexture:Texture;
        protected static var mListItemRendererUpTexture:Texture;
        protected static var mListItemRendererDownTexture:Texture;
        protected static var mListItemRendererSelectedTexture:Texture;
        protected static var mGroupedListItemRendererUpTexture:Texture;
        protected static var mGroupedListItemRendererDownTexture:Texture;
        protected static var mGroupedListItemRendererSelectedTexture:Texture;
        protected static var mGroupedListFirstItemRendererUpTexture:Texture;
        protected static var mGroupedListFirstItemRendererDownTexture:Texture;
        protected static var mGroupedListFirstItemRendererSelectedTexture:Texture;
        protected static var mGroupedListLastItemRendererUpTexture:Texture;
        protected static var mGroupedListLastItemRendererDownTexture:Texture;
        protected static var mGroupedListLastItemRendererSelectedTexture:Texture;
        protected static var mGroupedListSingleItemRendererUpTexture:Texture;
        protected static var mGroupedListSingleItemRendererDownTexture:Texture;
        protected static var mGroupedListSingleItemRendererSelectedTexture:Texture;
        protected static var mProgressBarVerticalTexture:Texture;
        protected static var mProgressBarHorizontalTexture:Texture;
        protected static var mSliderThumbTexture:Texture;
        protected static var mSliderVerticalTrackTexture:Texture;
        protected static var mSliderHorizontalTrackTexture:Texture;
        protected static var mSpinnerListBackgroundTexture:Texture;
        protected static var mSpinnerListSelectionOverlayTexture:Texture;
        protected static var mDateTimeSpinnerSelectionOverlayTexture:Texture;
        protected static var mDateTimeSpinnerBackgroundTexture:Texture;
        protected static var mPickerListButtonIcon:Texture;
        protected static var mScrollBarVerticalTexture:Texture;
        protected static var mScrollBarHorizontalTexture:Texture;
        protected static var mSearchInputUpTexture:Texture;
        protected static var mSearchInputFocusedTexture:Texture;
        protected static var mSearchIconTexture:Texture;
        protected static var mTabTexture:Texture;
        protected static var mTabWithIconTexture:Texture;
        protected static var mTabBarBackgroundTexture:Texture;
        protected static var mTabBarInvertedBackgroundTexture:Texture;
        protected static var mTextInputUpTexture:Texture;
        protected static var mTextInputFocusedTexture:Texture;
        protected static var mToggleSwitchThumbTexture:Texture;
        protected static var mToggleSwitchTrackTexture:Texture;
        protected static var mPageIndicatorTexture:Texture;
	    protected static var mTreeDisclosureOpenIconTexture:Texture;
	    protected static var mTreeDisclosureClosedIconTexture:Texture;
        protected static var mDataGridHeaderSortAscendingIconTexture:Texture;
        protected static var mDataGridHeaderSortDescendingIconTexture:Texture;
        protected static var mDataGridHeaderUpTexture:Texture;
        protected static var mDataGridCellUpTexture:Texture;
        protected static var mDataGridCellDownTexture:Texture;
        protected static var mDataGridCellSelectedTexture:Texture;
        protected static var mDataGridHeaderDividerTexture:Texture;
        protected static var mDataGridCellDividerTexture:Texture;

        /* Media controls */
        protected static var mPlayIconTexture:Texture;
        protected static var mPauseIconTexture:Texture;
        protected static var mVolumeUpIconTexture:Texture;
        protected static var mVolumeDownIconTexture:Texture;
        protected static var mVolumeSliderTrackTexture:Texture;
        protected static var mVolumeSliderThumbTexture:Texture;
        protected static var mFullScreenEnterIconTexture:Texture;
        protected static var mFullScreenExitIconTexture:Texture;
        protected static var mSeekSliderThumbTexture:Texture;
        protected static var mSeekSliderTrackTexture:Texture;

        /* Public name list */
        public static const THEME_STYLE_NAME_BUTTON_SMALL:String = "uniflat-mobile-button-small";
        public static const THEME_STYLE_NAME_BUTTON_OUTLINE:String = "uniflat-mobile-button-outline";
        public static const THEME_STYLE_NAME_BUTTON_OUTLINE_ALTERNATIVE:String = "uniflat-mobile-button-outline-alternative";
        public static const THEME_STYLE_NAME_BUTTON_QUIET_ALTERNATIVE:String = "uniflat-mobile-button-quiet-alternative";
        public static const THEME_STYLE_NAME_BUTTON_HEADER_QUIET:String = "uniflat-mobile-button-header-quiet";
        public static const THEME_STYLE_NAME_BUTTON_HEADER_QUIET_ICON_ONLY:String = "uniflat-mobile-button-header-quiet-icon-only";
        public static const THEME_STYLE_NAME_TAB_BAR:String = "uniflat-mobile-tab-bar";
        public static const THEME_STYLE_NAME_TAB_BAR_INVERTED:String = "uniflat-mobile-tab-bar-inverted";
        public static const THEME_STYLE_NAME_TAB_BAR_WITH_ICONS:String = "uniflat-mobile-tab-bar-with-icons";
        public static const THEME_STYLE_NAME_TAB_NAVIGATOR_WITH_ICONS:String = "uniflat-mobile-tab-navigator-with-icons";
        public static const THEME_STYLE_NAME_PANEL_WITHOUT_PADDING:String = "uniflat-mobile-panel-without-padding";
        public static const THEME_STYLE_NAME_TRANSPARENT_HEADER:String = "uniflat-mobile-transparent-header";
        public static const THEME_STYLE_NAME_PICKER_LIST_SMALL:String = "uniflat-mobile-picker-list-small";
        /* Protected name list */
        protected static const THEME_STYLE_NAME_ALERT_BUTTON_GROUP_BUTTON:String = "uniflat-mobile-alert-button-group-button";
        protected static const THEME_STYLE_NAME_DROP_DOWN_LIST_ITEM_RENDERER:String = "uniflat-mobile-picker-list-item-renderer";
        protected static const THEME_STYLE_NAME_TAB_WITH_ICON:String = "uniflat-mobile-tab-with-icon";
        protected static const THEME_STYLE_NAME_GROUPED_LIST_ITEM_RENDERER:String = "uniflat-mobile-grouped-list-item-renderer";
        protected static const THEME_STYLE_NAME_GROUPED_LIST_LAST_ITEM_RENDERER:String = "uniflat-mobile-grouped-list-last-item-renderer";
        protected static const THEME_STYLE_NAME_GROUPED_LIST_FIRST_ITEM_RENDERER:String = "uniflat-mobile-grouped-list-first-item-renderer";
        protected static const THEME_STYLE_NAME_GROUPED_LIST_SINGLE_ITEM_RENDERER:String = "uniflat-mobile-grouped-list-single-item-renderer";
        protected static const THEME_STYLE_NAME_SPINNER_LIST_ITEM_RENDERER:String = "uniflat-mobile-spinner-list-item-renderer";
        protected static const THEME_STYLE_NAME_DATE_TIME_SPINNER_LIST_ITEM_RENDERER:String = "uniflat-mobile-date-time-spinner-list-item-renderer";
        protected static const THEME_STYLE_NAME_VERTICAL_SIMPLE_SCROLL_BAR_THUMB:String = "uniflat-mobile-vertical-simple-scroll-bar-thumb";
        protected static const THEME_STYLE_NAME_HORIZONTAL_SIMPLE_SCROLL_BAR_THUMB:String = "uniflat-mobile-horizontal-simple-scroll-bar-thumb";
        protected static const THEME_STYLE_NAME_VERTICAL_SLIDER_MINIMUM_TRACK:String = "uniflat-mobile-vertical-slider-minimum-track";
        protected static const THEME_STYLE_NAME_VERTICAL_SLIDER_MAXIMUM_TRACK:String = "uniflat-mobile-vertical-slider-maximum-track";
        protected static const THEME_STYLE_NAME_HORIZONTAL_SLIDER_MINIMUM_TRACK:String = "uniflat-mobile-horizontal-slider-minimum-track";
        protected static const THEME_STYLE_NAME_HORIZONTAL_SLIDER_MAXIMUM_TRACK:String = "uniflat-mobile-horizontal-slider-maximum-track";
        protected static const THEME_STYLE_NAME_PICKER_LIST_BUTTON_SMALL:String = "uniflat-mobile-picker-list-button-small";
        protected static const THEME_STYLE_NAME_TAB_NAVIGATOR_TAB_BAR_WITH_ICONS:String = "uniflat-mobile-tab-navigator-tab-bar-with-icons";

        public function BaseUniflatMobileTheme( colors:UniflatMobileThemeColors = null ) {
            super();

            if( colors !== null ) {
                initializeColors( colors );
            }
        }

        /**
         *
         *
         * Initializers
         *
         *
         */

        protected function initialize():void {
            initializeDimensions();
            initializeFonts();
            initializeTextures();
            initializeGlobals();
            initializeStage();
            initializeStyleProviders();
        }

        protected function initializeStage():void {
            Starling.current.stage.color = COLOR_STAGE;
            Starling.current.nativeStage.color = COLOR_STAGE;
        }

        protected function initializeDimensions():void {
            mSmallPaddingSize = 10;
            mRegularPaddingSize = 20;
            mTrackSize = 2;
            mSmallControlSize = 28;
            mControlSize = 44;
            mLargeControlSize = 46;
            mTabSize = 60;
            mHeaderSize = 68;
        }

        protected function initializeTextures():void {
            /* Alert */
            mAlertButtonDownTexture = mAtlas.getTexture( "alert-button-down" );
            mAlertBackgroundTexture = mAtlas.getTexture( "alert-background" );

            /* Background */
            mBackgroundPlainTexture = mAtlas.getTexture( "background-plain" );
            mBackgroundPlainOverlayTexture = mAtlas.getTexture( "background-plain-overlay" );
            mBackgroundToolbarTexture = mAtlas.getTexture( "background-toolbar-translucent" );
            mBackgroundListTexture = mAtlas.getTexture( "background-list" );
            mBackgroundDropDownListTexture = mAtlas.getTexture( "drop-down-list-background" );

            /* Button */
            mButtonUpTexture = mAtlas.getTexture( "button-up" );
            mButtonDownTexture = mAtlas.getTexture( "button-down" );
            mButtonSmallUpTexture = mAtlas.getTexture( "button-small-up" );
            mButtonSmallDownTexture = mAtlas.getTexture( "button-small-down" );
            mButtonOutlineUpTexture = mAtlas.getTexture( "button-outline-up" );
            mButtonOutlineAlternativeUpTexture = mAtlas.getTexture( "button-outline-alt-up" );
            mButtonOutlineAlternativeDownTexture = mAtlas.getTexture( "button-outline-alt-down" );
            mButtonOutlineAlternativeDisabledTexture = mAtlas.getTexture( "button-outline-alt-disabled" );
            mButtonSelectedUpTexture = mAtlas.getTexture( "button-selected-up" );
            mButtonSelectedDownTexture = mAtlas.getTexture( "button-selected-down" );
            mButtonSelectedDisabledTexture = mAtlas.getTexture( "button-selected-disabled" );
            mButtonBackIconTexture = mAtlas.getTexture( "button-back-icon" );
            mButtonBackUpTexture = mAtlas.getTexture( "button-back-up" );
            mButtonBackDownTexture = mAtlas.getTexture( "button-back-down" );
            mButtonBackDisabledTexture = mAtlas.getTexture( "button-back-disabled" );
            mButtonForwardIconTexture = mAtlas.getTexture( "button-forward-icon" );
            mButtonForwardUpTexture = mAtlas.getTexture( "button-forward-up" );
            mButtonForwardDownTexture = mAtlas.getTexture( "button-forward-down" );
            mButtonForwardDisabledTexture = mAtlas.getTexture( "button-forward-disabled" );

            /* Callout */
            mCalloutBackgroundTexture = mAtlas.getTexture( "callout-background" );
            mCalloutUpArrowTexture = mAtlas.getTexture( "callout-arrow-up" );
            mCalloutRightArrowTexture = mAtlas.getTexture( "callout-arrow-right" );
            mCalloutDownArrowTexture = mAtlas.getTexture( "callout-arrow-down" );
            mCalloutLeftArrowTexture = mAtlas.getTexture( "callout-arrow-left" );

            /* Check */
            mCheckUpIconTexture = mAtlas.getTexture( "check-up-icon" );
            mCheckDownIconTexture = mAtlas.getTexture( "check-down-icon" );
            mCheckSelectedUpIconTexture = mAtlas.getTexture( "check-selected-up-icon" );
            mCheckSelectedDownIconTexture = mAtlas.getTexture( "check-selected-down-icon" );

            /* Data grid */
            mDataGridHeaderSortAscendingIconTexture = mAtlas.getTexture( "data-grid-header-sort-ascending" );
            mDataGridHeaderSortDescendingIconTexture = mAtlas.getTexture( "data-grid-header-sort-descending" );
            mDataGridHeaderUpTexture = mAtlas.getTexture( "data-grid-header-up" );
            mDataGridCellUpTexture = mAtlas.getTexture( "data-grid-list-item-up" );
            mDataGridCellDownTexture = mAtlas.getTexture( "data-grid-list-item-down" );
            mDataGridCellSelectedTexture = mAtlas.getTexture( "data-grid-list-item-selected" );
            mDataGridHeaderDividerTexture = mAtlas.getTexture( "data-grid-cell-divider" );
            mDataGridCellDividerTexture = mAtlas.getTexture( "data-grid-cell-divider" );

            /* Date time spinner */
            mDateTimeSpinnerBackgroundTexture = mAtlas.getTexture( "date-time-spinner-background" );
            mDateTimeSpinnerSelectionOverlayTexture = mAtlas.getTexture( "date-time-spinner-selection-overlay" );

            /* Header */
            mBackgroundHeaderTexture = mAtlas.getTexture( "background-header" );

            /* List / GroupedList / Item renderers */
            mListItemRendererUpTexture = mAtlas.getTexture( "list-item-up" );
            mListItemRendererDownTexture = mAtlas.getTexture( "list-item-down" );
            mListItemRendererSelectedTexture = mAtlas.getTexture( "list-item-selected" );
            mGroupedListItemRendererUpTexture = mAtlas.getTexture( "grouped-list-item-middle-up" );
            mGroupedListItemRendererDownTexture = mAtlas.getTexture( "grouped-list-item-middle-down" );
            mGroupedListItemRendererSelectedTexture = mAtlas.getTexture( "grouped-list-item-middle-selected" );
            mGroupedListFirstItemRendererUpTexture = mAtlas.getTexture( "grouped-list-item-first-up" );
            mGroupedListFirstItemRendererDownTexture = mAtlas.getTexture( "grouped-list-item-first-down" );
            mGroupedListFirstItemRendererSelectedTexture = mAtlas.getTexture( "grouped-list-item-first-selected" );
            mGroupedListLastItemRendererUpTexture = mAtlas.getTexture( "grouped-list-item-last-up" );
            mGroupedListLastItemRendererDownTexture = mAtlas.getTexture( "grouped-list-item-last-down" );
            mGroupedListLastItemRendererSelectedTexture = mAtlas.getTexture( "grouped-list-item-last-selected" );
            mGroupedListSingleItemRendererUpTexture = mAtlas.getTexture( "grouped-list-item-single-up" );
            mGroupedListSingleItemRendererDownTexture = mAtlas.getTexture( "grouped-list-item-single-down" );
            mGroupedListSingleItemRendererSelectedTexture = mAtlas.getTexture( "grouped-list-item-single-selected" );

            /* Numeric stepper */
            mNumericStepperIncButtonUpTexture = mAtlas.getTexture( "numeric-stepper-inc-button-up" );
            mNumericStepperIncButtonDownTexture = mAtlas.getTexture( "numeric-stepper-inc-button-down" );
            mNumericStepperDecButtonUpTexture = mAtlas.getTexture( "numeric-stepper-dec-button-up" );
            mNumericStepperDecButtonDownTexture = mAtlas.getTexture( "numeric-stepper-dec-button-down" );
            mNumericStepperInputBackgroundTexture = mAtlas.getTexture( "numeric-stepper-input-background" );

            /* Page indicator */
            mPageIndicatorTexture = mAtlas.getTexture( "page-indicator" );

            /* Picker list */
            mPickerListButtonIcon = mAtlas.getTexture( "picker-list-button-icon" );
            mButtonPickerListUpTexture = mAtlas.getTexture( "button-forward-up" );
            mButtonPickerListDownTexture = mAtlas.getTexture( "button-forward-down" );
            mButtonPickerListSmallUpTexture = mAtlas.getTexture( "picker-list-button-small-up" );
            mButtonPickerListSmallDownTexture = mAtlas.getTexture( "picker-list-button-small-down" );
            mButtonPickerListSmallDisabledTexture = mAtlas.getTexture( "picker-list-button-small-disabled" );

            /* ProgressBar */
            mProgressBarVerticalTexture = mAtlas.getTexture( "progress-bar-vertical" );
            mProgressBarHorizontalTexture = mAtlas.getTexture( "progress-bar-horizontal" );

            /* Radio */
            mRadioUpIconTexture = mAtlas.getTexture( "radio-up-icon" );
            mRadioDownIconTexture = mAtlas.getTexture( "radio-down-icon" );
            mRadioSelectedUpIconTexture = mAtlas.getTexture( "radio-selected-up-icon" );
            mRadioSelectedDownIconTexture = mAtlas.getTexture( "radio-selected-down-icon" );

            /* Slider */
            mSliderThumbTexture = mAtlas.getTexture( "slider-thumb" );
            mSliderHorizontalTrackTexture = mAtlas.getTexture( "slider-horizontal" );
            mSliderVerticalTrackTexture = mAtlas.getTexture( "slider-vertical" );

            /* Scroll bar */
            mScrollBarVerticalTexture = mAtlas.getTexture( "scroll-bar-vertical" );
            mScrollBarHorizontalTexture = mAtlas.getTexture( "scroll-bar-horizontal" );

            /* Spinner list */
            mSpinnerListBackgroundTexture = mAtlas.getTexture( "spinner-list-background" );
            mSpinnerListSelectionOverlayTexture = mAtlas.getTexture( "spinner-list-selection-overlay" );

            /* TabBar */
            mTabTexture = mAtlas.getTexture( "tab" );
            mTabWithIconTexture = mAtlas.getTexture( "tab-with-icon" );
            mTabBarBackgroundTexture = mAtlas.getTexture( "tab-bar-background" );
            mTabBarInvertedBackgroundTexture = mAtlas.getTexture( "tab-bar-inverted-background" );

            /* Text & search inputs */
            mTextInputUpTexture = mAtlas.getTexture( "text-input-up" );
            mTextInputFocusedTexture = mAtlas.getTexture( "text-input-focused" );
            mSearchInputUpTexture = mAtlas.getTexture( "search-input-up" );
            mSearchInputFocusedTexture = mAtlas.getTexture( "search-input-focused" );
            mSearchIconTexture = mAtlas.getTexture( "search-input-icon" );

            /* ToggleSwitch */
            mToggleSwitchTrackTexture = mAtlas.getTexture( "toggle-switch-track" );
            mToggleSwitchThumbTexture = mAtlas.getTexture( "toggle-switch-thumb" );

	        /* Tree */
	        mTreeDisclosureOpenIconTexture = mAtlas.getTexture( "tree-disclosure-open-icon" );
	        mTreeDisclosureClosedIconTexture = mAtlas.getTexture( "tree-disclosure-closed-icon" );

            /* Media controls */
            mPlayIconTexture = mAtlas.getTexture( "play-button-icon" );
            mPauseIconTexture = mAtlas.getTexture( "pause-button-icon" );
            mFullScreenEnterIconTexture = mAtlas.getTexture( "full-screen-enter-icon" );
            mFullScreenExitIconTexture = mAtlas.getTexture( "full-screen-exit-icon" );
            mVolumeUpIconTexture = mAtlas.getTexture( "volume-up-icon" );
            mVolumeDownIconTexture = mAtlas.getTexture( "volume-down-icon" );
            mVolumeSliderThumbTexture = mAtlas.getTexture( "volume-slider-thumb" );
            mVolumeSliderTrackTexture = mAtlas.getTexture( "volume-slider" );
            mSeekSliderThumbTexture = mAtlas.getTexture( "seek-slider-thumb" );
            mSeekSliderTrackTexture = mAtlas.getTexture( "seek-slider" );
        }

        protected function initializeFonts():void {
            mSmallFontSize = 13;
            mRegularFontSize = 16;
            mLargeFontSize = 22;
            mExtraLargeFontSize = 25;

            /* UI */
            mPrimaryBoldTF = getTextFormat( mRegularFontSize, COLOR_PRIMARY, true );
            mPrimaryBoldDisabledTF = getTextFormat( mRegularFontSize, COLOR_PRIMARY_DISABLED, true );
            mPrimaryBoldExtraLargeTF = getTextFormat( mExtraLargeFontSize, COLOR_PRIMARY, true );
            mPrimaryBoldExtraLargeDisabledTF = getTextFormat( mExtraLargeFontSize, COLOR_PRIMARY_DISABLED, true );
            mPrimaryContrastBoldTF = getTextFormat( mRegularFontSize, COLOR_PRIMARY_CONTRAST, true );
            mPrimaryContrastBoldDisabledTF = getTextFormat( mRegularFontSize, COLOR_PRIMARY_CONTRAST_DISABLED, true );
            mPrimaryContrastBoldLargeTF = getTextFormat( mLargeFontSize, COLOR_PRIMARY_CONTRAST, true );
            mPrimaryContrastBoldExtraLargeTF = getTextFormat( mExtraLargeFontSize, COLOR_PRIMARY_CONTRAST, true );
            mPrimaryContrastBoldSmallTF = getTextFormat( mSmallFontSize, COLOR_PRIMARY_CONTRAST, true );
            mPrimaryContrastBoldDisabledSmallTF = getTextFormat( mSmallFontSize, COLOR_PRIMARY_CONTRAST_DISABLED, true );
            mAlternativeBoldTF = getTextFormat( mRegularFontSize, COLOR_ALTERNATIVE, true );
            mAlternativeBoldDisabledTF = getTextFormat( mRegularFontSize, COLOR_ALTERNATIVE_DISABLED, true );
            mAlternativeContrastBoldTF = getTextFormat( mRegularFontSize, COLOR_ALTERNATIVE_CONTRAST, true );
            mAlternativeContrastBoldDisabledTF = getTextFormat( mRegularFontSize, COLOR_ALTERNATIVE_CONTRAST_DISABLED, true );
            mContrastRegularTF = getTextFormat( mRegularFontSize, COLOR_CONTRAST );
            mContrastRegularDisabledTF = getTextFormat( mRegularFontSize, COLOR_CONTRAST_DISABLED );
            mContrastRegularSmallTF = getTextFormat( mSmallFontSize, COLOR_CONTRAST );
            mContrastRegularDisabledSmallTF = getTextFormat( mSmallFontSize, COLOR_CONTRAST_DISABLED );
            mContrastBoldLargeTF = getTextFormat( mLargeFontSize, COLOR_CONTRAST, true );
            mContrastBoldDisabledLargeTF = getTextFormat( mLargeFontSize, COLOR_CONTRAST_DISABLED, true );
            mContrastBoldSmallTF = getTextFormat( mSmallFontSize, COLOR_CONTRAST, true );
            mContrastBoldDisabledSmallTF = getTextFormat( mSmallFontSize, COLOR_CONTRAST_DISABLED, true );
        }

        protected function initializeGlobals():void {
            FeathersControl.defaultTextEditorFactory = textEditorFactory;
            FeathersControl.defaultTextRendererFactory = textRendererFactory;

            PopUpManager.overlayFactory = popUpOverlayFactory;
        }

        protected function initializeStyleProviders():void {
            /* Alert */
            getStyleProviderForClass( Alert ).defaultStyleFunction = setAlertStyles;
            getStyleProviderForClass( ButtonGroup ).setFunctionForStyleName( Alert.DEFAULT_CHILD_STYLE_NAME_BUTTON_GROUP, setAlertButtonGroupStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( THEME_STYLE_NAME_ALERT_BUTTON_GROUP_BUTTON, setAlertButtonGroupButtonStyles );
            getStyleProviderForClass( Header ).setFunctionForStyleName( Alert.DEFAULT_CHILD_STYLE_NAME_HEADER, setAlertHeaderStyles );

            /* AutoComplete */
            getStyleProviderForClass( AutoComplete ).defaultStyleFunction = setTextInputStyles;
            getStyleProviderForClass( AutoComplete ).setFunctionForStyleName( TextInput.ALTERNATE_STYLE_NAME_SEARCH_TEXT_INPUT, setSearchTextInputStyles );
            getStyleProviderForClass( List ).setFunctionForStyleName( AutoComplete.DEFAULT_CHILD_STYLE_NAME_LIST, setAutoCompleteListStyles );

            /* Buttons */
            getStyleProviderForClass( Button ).defaultStyleFunction = setButtonStyles;
            getStyleProviderForClass( Button ).setFunctionForStyleName( THEME_STYLE_NAME_BUTTON_SMALL, setSmallButtonStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( Button.ALTERNATE_STYLE_NAME_QUIET_BUTTON, setQuietButtonStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( THEME_STYLE_NAME_BUTTON_QUIET_ALTERNATIVE, setAlternativeQuietButtonStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( THEME_STYLE_NAME_BUTTON_HEADER_QUIET, setHeaderQuietButtonStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( THEME_STYLE_NAME_BUTTON_HEADER_QUIET_ICON_ONLY, setHeaderQuietButtonIconOnlyStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( Button.ALTERNATE_STYLE_NAME_CALL_TO_ACTION_BUTTON, setCallToActionButtonStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( THEME_STYLE_NAME_BUTTON_OUTLINE, setOutlineButtonStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( THEME_STYLE_NAME_BUTTON_OUTLINE_ALTERNATIVE, setOutlineAlternativeButtonStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( Button.ALTERNATE_STYLE_NAME_BACK_BUTTON, setBackButtonStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( Button.ALTERNATE_STYLE_NAME_FORWARD_BUTTON, setForwardButtonStyles );
            getStyleProviderForClass( ToggleButton ).defaultStyleFunction = setButtonStyles;

            /* ButtonGroup */
            getStyleProviderForClass( ButtonGroup ).defaultStyleFunction = setButtonGroupStyles;
            getStyleProviderForClass( Button ).setFunctionForStyleName( ButtonGroup.DEFAULT_CHILD_STYLE_NAME_BUTTON, setButtonStyles );
            getStyleProviderForClass( ToggleButton ).setFunctionForStyleName( ButtonGroup.DEFAULT_CHILD_STYLE_NAME_BUTTON, setButtonStyles );

            /* Callout */
            getStyleProviderForClass( Callout ).defaultStyleFunction = setCalloutStyles;

            /* Check */
            getStyleProviderForClass( Check ).defaultStyleFunction = setCheckStyles;

            /* DataGrid */
            getStyleProviderForClass( DataGrid ).defaultStyleFunction = setDataGridStyles;
            getStyleProviderForClass( DefaultDataGridCellRenderer ).defaultStyleFunction = setDataGridCellRendererStyles;
            getStyleProviderForClass( DefaultDataGridHeaderRenderer ).defaultStyleFunction = setDataGridHeaderStyles;

            /* DateTimeSpinner */
            getStyleProviderForClass( SpinnerList ).setFunctionForStyleName( DateTimeSpinner.DEFAULT_CHILD_STYLE_NAME_LIST, setDateTimeSpinnerListStyles );
            getStyleProviderForClass( DefaultListItemRenderer ).setFunctionForStyleName( THEME_STYLE_NAME_DATE_TIME_SPINNER_LIST_ITEM_RENDERER, setDateTimeSpinnerListItemRendererStyles );

            /* Drawers */
            getStyleProviderForClass( Drawers ).defaultStyleFunction = setDrawersStyles;

            /* GroupedList*/
            getStyleProviderForClass( GroupedList ).defaultStyleFunction = setGroupedListStyles;

            /* Header */
            getStyleProviderForClass( Header ).defaultStyleFunction = setHeaderStyles;

            /* Label */
            getStyleProviderForClass( Label ).defaultStyleFunction = setLabelStyles;
            getStyleProviderForClass( Label ).setFunctionForStyleName( Label.ALTERNATE_STYLE_NAME_HEADING, setHeadingLabelStyles );
            getStyleProviderForClass( Label ).setFunctionForStyleName( Label.ALTERNATE_STYLE_NAME_DETAIL, setDetailLabelStyles );

            /* LayoutGroup */
            getStyleProviderForClass( LayoutGroup ).setFunctionForStyleName( LayoutGroup.ALTERNATE_STYLE_NAME_TOOLBAR, setLayoutGroupToolbarStyles );
            getStyleProviderForClass( LayoutGroup ).setFunctionForStyleName( THEME_STYLE_NAME_TAB_BAR, setLayoutGroupTabBarStyles );
            getStyleProviderForClass( LayoutGroup ).setFunctionForStyleName( THEME_STYLE_NAME_TAB_BAR_INVERTED, setLayoutGroupTabBarInvertedStyles );
            getStyleProviderForClass( LayoutGroup ).setFunctionForStyleName( THEME_STYLE_NAME_TAB_BAR_WITH_ICONS, setLayoutGroupTabBarWithIconsStyles );

            /* List / Item renderers */
            getStyleProviderForClass( List ).defaultStyleFunction = setListStyles;
            getStyleProviderForClass( DefaultListItemRenderer ).defaultStyleFunction = setItemRendererStyles;
            getStyleProviderForClass( DefaultListItemRenderer ).setFunctionForStyleName( THEME_STYLE_NAME_DROP_DOWN_LIST_ITEM_RENDERER, setPickerListItemRendererStyles );
            /* GroupedList header / footer */
            getStyleProviderForClass( DefaultGroupedListHeaderOrFooterRenderer ).defaultStyleFunction = setGroupedListHeaderRendererStyles;
            getStyleProviderForClass( DefaultGroupedListHeaderOrFooterRenderer ).setFunctionForStyleName( GroupedList.DEFAULT_CHILD_STYLE_NAME_FOOTER_RENDERER, setGroupedListFooterRendererStyles );
            getStyleProviderForClass( DefaultGroupedListItemRenderer ).setFunctionForStyleName( THEME_STYLE_NAME_GROUPED_LIST_ITEM_RENDERER, setGroupedListItemRendererStyles );
            getStyleProviderForClass( DefaultGroupedListItemRenderer ).setFunctionForStyleName( THEME_STYLE_NAME_GROUPED_LIST_LAST_ITEM_RENDERER, setGroupedListLastItemRendererStyles );
            getStyleProviderForClass( DefaultGroupedListItemRenderer ).setFunctionForStyleName( THEME_STYLE_NAME_GROUPED_LIST_FIRST_ITEM_RENDERER, setGroupedListFirstItemRendererStyles );
            getStyleProviderForClass( DefaultGroupedListItemRenderer ).setFunctionForStyleName( THEME_STYLE_NAME_GROUPED_LIST_SINGLE_ITEM_RENDERER, setGroupedListSingleItemRendererStyles );

            /* Numeric stepper */
            getStyleProviderForClass( NumericStepper ).defaultStyleFunction = setNumericStepperStyles;
            getStyleProviderForClass( TextInput ).setFunctionForStyleName( NumericStepper.DEFAULT_CHILD_STYLE_NAME_TEXT_INPUT, setNumericStepperTextInputStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( NumericStepper.DEFAULT_CHILD_STYLE_NAME_DECREMENT_BUTTON, setNumericStepperDecButtonStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( NumericStepper.DEFAULT_CHILD_STYLE_NAME_INCREMENT_BUTTON, setNumericStepperIncButtonStyles );

            /* Page indicator */
            getStyleProviderForClass( PageIndicator ).defaultStyleFunction = setPageIndicatorStyles;

            /* Panel */
            getStyleProviderForClass( Panel ).defaultStyleFunction = setPanelWithPaddingStyles;
            getStyleProviderForClass( Panel ).setFunctionForStyleName( THEME_STYLE_NAME_PANEL_WITHOUT_PADDING, setBasePanelStyles );
            getStyleProviderForClass( Header ).setFunctionForStyleName( Panel.DEFAULT_CHILD_STYLE_NAME_HEADER, setHeaderWithoutBackgroundStyles );

            /* Panel screen */
            getStyleProviderForClass( PanelScreen ).defaultStyleFunction = setPanelWithPaddingStyles;
            getStyleProviderForClass( PanelScreen ).setFunctionForStyleName( THEME_STYLE_NAME_PANEL_WITHOUT_PADDING, setBasePanelStyles );
            getStyleProviderForClass( PanelScreen ).setFunctionForStyleName( THEME_STYLE_NAME_TRANSPARENT_HEADER, setPanelTransparentHeaderStyles );
            getStyleProviderForClass( Header ).setFunctionForStyleName( PanelScreen.DEFAULT_CHILD_STYLE_NAME_HEADER, setPanelScreenHeaderStyles );
            getStyleProviderForClass( Header ).setFunctionForStyleName( THEME_STYLE_NAME_TRANSPARENT_HEADER, setPanelScreenTransparentHeaderStyles );

            /* Picker list */
            getStyleProviderForClass( List ).setFunctionForStyleName( PickerList.DEFAULT_CHILD_STYLE_NAME_LIST, setPickerListListStyles );
            getStyleProviderForClass( PickerList ).defaultStyleFunction = setPickerListStyles;
            getStyleProviderForClass( PickerList ).setFunctionForStyleName( THEME_STYLE_NAME_PICKER_LIST_SMALL, setPickerListSmallStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( PickerList.DEFAULT_CHILD_STYLE_NAME_BUTTON, setPickerListButtonStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( THEME_STYLE_NAME_PICKER_LIST_BUTTON_SMALL, setPickerListButtonSmallStyles );

            /* Progress bar */
            getStyleProviderForClass( ProgressBar ).defaultStyleFunction = setProgressBarStyles;

            /* Radio */
            getStyleProviderForClass( Radio ).defaultStyleFunction = setRadioStyles;

            /* Scroll container */
            getStyleProviderForClass( ScrollContainer ).defaultStyleFunction = setScrollContainerStyles;

            /* Scroll text */
            getStyleProviderForClass( ScrollText ).defaultStyleFunction = setScrollTextStyles;

            /* Simple scroll bar */
            getStyleProviderForClass( SimpleScrollBar ).defaultStyleFunction = setSimpleScrollBarStyles;
            getStyleProviderForClass( Button ).setFunctionForStyleName( THEME_STYLE_NAME_VERTICAL_SIMPLE_SCROLL_BAR_THUMB, setVerticalSimpleScrollBarThumbStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( THEME_STYLE_NAME_HORIZONTAL_SIMPLE_SCROLL_BAR_THUMB, setHorizontalSimpleScrollBarThumbStyles );

            /* Slider */
            getStyleProviderForClass( Slider ).defaultStyleFunction = setSliderStyles;
            getStyleProviderForClass( Button ).setFunctionForStyleName( Slider.DEFAULT_CHILD_STYLE_NAME_THUMB, setSliderThumbStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( THEME_STYLE_NAME_HORIZONTAL_SLIDER_MINIMUM_TRACK, setHorizontalSliderMinimumTrackStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( THEME_STYLE_NAME_HORIZONTAL_SLIDER_MAXIMUM_TRACK, setHorizontalSliderMaximumTrackStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( THEME_STYLE_NAME_VERTICAL_SLIDER_MINIMUM_TRACK, setVerticalSliderMinimumTrackStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( THEME_STYLE_NAME_VERTICAL_SLIDER_MAXIMUM_TRACK, setVerticalSliderMaximumTrackStyles );

            /* Spinner list */
            getStyleProviderForClass( SpinnerList ).defaultStyleFunction = setSpinnerListStyles;
            getStyleProviderForClass( DefaultListItemRenderer ).setFunctionForStyleName( THEME_STYLE_NAME_SPINNER_LIST_ITEM_RENDERER, setSpinnerListItemRendererStyles );

            /* Tab bar */
            getStyleProviderForClass( TabBar ).defaultStyleFunction = setTabBarStyles;
            getStyleProviderForClass( TabBar ).setFunctionForStyleName( THEME_STYLE_NAME_TAB_BAR_WITH_ICONS, setTabBarWithIconsStyles );
            getStyleProviderForClass( ToggleButton ).setFunctionForStyleName( TabBar.DEFAULT_CHILD_STYLE_NAME_TAB, setTabStyles );
            getStyleProviderForClass( ToggleButton ).setFunctionForStyleName( THEME_STYLE_NAME_TAB_WITH_ICON, setTabWithIconStyles );

            /* Tab navigator */
            getStyleProviderForClass( TabNavigator ).setFunctionForStyleName( THEME_STYLE_NAME_TAB_NAVIGATOR_WITH_ICONS, setTabNavigatorWithIconsStyles );
            getStyleProviderForClass( TabBar ).setFunctionForStyleName( TabNavigator.DEFAULT_CHILD_STYLE_NAME_TAB_BAR, setTabNavigatorTabBarStyles );
            getStyleProviderForClass( TabBar ).setFunctionForStyleName( THEME_STYLE_NAME_TAB_NAVIGATOR_TAB_BAR_WITH_ICONS, setTabNavigatorTabBarWithIconsStyles );

            /* Text input */
            getStyleProviderForClass( TextInput ).defaultStyleFunction = setTextInputStyles;
            getStyleProviderForClass( TextInput ).setFunctionForStyleName( TextInput.ALTERNATE_STYLE_NAME_SEARCH_TEXT_INPUT, setSearchTextInputStyles );
            getStyleProviderForClass( StageTextTextEditor ).setFunctionForStyleName( TextInput.DEFAULT_CHILD_STYLE_NAME_TEXT_EDITOR, setTextInputTextEditorStyles );

            /* Text area */
            getStyleProviderForClass( TextArea ).defaultStyleFunction = setTextAreaStyles;
            getStyleProviderForClass( TextFieldTextEditorViewPort ).setFunctionForStyleName( TextArea.DEFAULT_CHILD_STYLE_NAME_TEXT_EDITOR, setTextAreaTextEditorStyles );

            /* Text callout */
            getStyleProviderForClass( TextCallout ).defaultStyleFunction = setTextCalloutStyles;

            /* Toggle switch */
            getStyleProviderForClass( Button ).setFunctionForStyleName( ToggleSwitch.DEFAULT_CHILD_STYLE_NAME_ON_TRACK, setToggleSwitchTrackStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( ToggleSwitch.DEFAULT_CHILD_STYLE_NAME_OFF_TRACK, setToggleSwitchTrackStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( ToggleSwitch.DEFAULT_CHILD_STYLE_NAME_THUMB, setToggleSwitchThumbStyles );
            getStyleProviderForClass( ToggleButton ).setFunctionForStyleName( ToggleSwitch.DEFAULT_CHILD_STYLE_NAME_THUMB, setToggleSwitchThumbStyles );
            getStyleProviderForClass( ToggleSwitch ).defaultStyleFunction = setToggleSwitchStyles;

	        /* Tree */
	        getStyleProviderForClass( Tree ).defaultStyleFunction = setTreeStyles;
	        getStyleProviderForClass( DefaultTreeItemRenderer ).defaultStyleFunction = setTreeItemRendererStyles;

            /**
             * Media controls
             */

            /* Seek slider */
            getStyleProviderForClass( SeekSlider ).defaultStyleFunction = setSeekSliderStyles;
            getStyleProviderForClass( Button ).setFunctionForStyleName( SeekSlider.DEFAULT_CHILD_STYLE_NAME_THUMB, setSeekSliderThumbStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( SeekSlider.DEFAULT_CHILD_STYLE_NAME_MINIMUM_TRACK, setSeekSliderMinimumTrackStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( SeekSlider.DEFAULT_CHILD_STYLE_NAME_MAXIMUM_TRACK, setSeekSliderMaximumTrackStyles );

            /* Play pause button */
            getStyleProviderForClass( PlayPauseToggleButton ).defaultStyleFunction = setPlayPauseToggleButtonStyles;

            /* Mute button */
            getStyleProviderForClass( MuteToggleButton ).defaultStyleFunction = setMuteToggleButtonStyles;

            /* Volume slider */
            getStyleProviderForClass( VolumeSlider ).defaultStyleFunction = setVolumeSliderStyles;
            getStyleProviderForClass( Button ).setFunctionForStyleName( VolumeSlider.DEFAULT_CHILD_STYLE_NAME_THUMB, setVolumeSliderThumbStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( VolumeSlider.DEFAULT_CHILD_STYLE_NAME_MINIMUM_TRACK, setVolumeSliderMinimumTrackStyles );
            getStyleProviderForClass( Button ).setFunctionForStyleName( VolumeSlider.DEFAULT_CHILD_STYLE_NAME_MAXIMUM_TRACK, setVolumeSliderMaximumTrackStyles );

            /* Full screen button */
            getStyleProviderForClass( FullScreenToggleButton ).defaultStyleFunction = setFullScreenToggleButtonStyles;

            /* Time label */
            getStyleProviderForClass( TimeLabel ).defaultStyleFunction = setTimeLabelStyles;
        }

        protected function initializeColors( colors:UniflatMobileThemeColors ):void {
            COLOR_STAGE = colors.colorStage;
            COLOR_BACKGROUND = colors.colorBackground;
            COLOR_PRIMARY = colors.colorPrimary;
            COLOR_PRIMARY_DISABLED = colors.colorPrimaryDisabled;
            COLOR_PRIMARY_CONTRAST = colors.colorPrimaryContrast;
            COLOR_PRIMARY_CONTRAST_DISABLED = colors.colorPrimaryContrastDisabled;
            COLOR_ALTERNATIVE = colors.colorAlt;
            COLOR_ALTERNATIVE_DISABLED = colors.colorAltDisabled;
            COLOR_ALTERNATIVE_CONTRAST = colors.colorAltContrast;
            COLOR_ALTERNATIVE_CONTRAST_DISABLED = colors.colorAltContrastDisabled;
            COLOR_CONTRAST = colors.colorContrast;
            COLOR_CONTRAST_DISABLED = colors.colorContrastDisabled;
        }

        protected function getTextFormat( size:int, color:uint, isBold:Boolean = false, horizontalAlign:String = Align.LEFT, verticalAlign:String = Align.TOP ):TextFormat {
            var format:TextFormat = new TextFormat( FONT_NAME, size, color, horizontalAlign, verticalAlign );
            format.bold = isBold;
            return format;
        }

        /**
         *
         *
         * Styles
         *
         *
         */

        /**
         * Alert
         */

        protected function setAlertStyles( alert:Alert ):void {
            setScrollerStyles( alert );

            const skin:Image = new Image( mAlertBackgroundTexture );
            skin.color = COLOR_BACKGROUND;
            skin.scale9Grid = ALERT_BACKGROUND_SCALE9_GRID;
            alert.backgroundSkin = skin;
            alert.padding = alert.gap = mRegularPaddingSize;
            alert.maxWidth = 300;
            alert.maxHeight = 300;

            var format:TextFormat = mContrastRegularTF.clone();
            format.leading = mRegularFontSize * 0.5;
            alert.fontStyles = format;
        }

        protected function setAlertButtonGroupStyles( group:ButtonGroup ):void {
            group.direction = Direction.HORIZONTAL;
            group.horizontalAlign = HorizontalAlign.RIGHT;
            group.verticalAlign = VerticalAlign.JUSTIFY;
            group.distributeButtonSizes = false;
            group.gap = 0;
            group.padding = mRegularPaddingSize;
            group.paddingTop = 0;
            group.customButtonStyleName = THEME_STYLE_NAME_ALERT_BUTTON_GROUP_BUTTON;
        }

        protected function setAlertButtonGroupButtonStyles( button:Button ):void {
            var skin:FadeImageSkin = setBaseButtonStyles( button, null, mAlertButtonDownTexture, COLOR_PRIMARY );
            skin.scale9Grid = ALERT_BUTTON_SCALE9_GRID;
            skin.minHeight = mSmallControlSize;
            skin.height = mSmallControlSize;
            skin.fadeOutTransition = Transitions.EASE_OUT;

            button.defaultSkin = skin;
            button.paddingLeft = button.paddingRight = mSmallPaddingSize;
            button.minTouchHeight = mControlSize;

            button.fontStyles = mContrastBoldSmallTF.clone();
            button.disabledFontStyles = mContrastBoldDisabledSmallTF.clone();
            button.setFontStylesForState( ButtonState.DOWN, mPrimaryContrastBoldSmallTF.clone() );
        }

        protected function setAlertHeaderStyles( header:Header ):void {
            setHeaderWithoutBackgroundStyles( header, false );

            header.paddingTop = mRegularPaddingSize;
            header.fontStyles = mContrastBoldLargeTF.clone();
        }

        /**
         * Auto complete
         */

        protected function setAutoCompleteStyles( input:AutoComplete ):void {
            var dropDownManager:DropDownPopUpContentManager = new DropDownPopUpContentManager();
            dropDownManager.gap = mSmallPaddingSize >> 1;
            input.popUpContentManager = dropDownManager;
        }

        protected function setAutoCompleteListStyles( list:List ):void {
            setScrollerStyles( list );

            var skin:Image = new Image( mBackgroundDropDownListTexture );
            skin.color = COLOR_BACKGROUND;
            skin.scale9Grid = DROP_DOWN_LIST_BACKGROUND_SCALE9_GRID;
            list.backgroundSkin = skin;
            list.maxHeight = 250;
            list.paddingLeft = 1.5;
            list.paddingTop = 6;
            list.paddingRight = 1.5;
            list.paddingBottom = 8;
            list.verticalScrollPolicy = ScrollPolicy.ON;
            list.customItemRendererStyleName = THEME_STYLE_NAME_DROP_DOWN_LIST_ITEM_RENDERER;
        }

        /**
         * Buttons
         */

        protected function setBaseButtonStyles( button:Button, upTexture:Texture, downTexture:Texture, defaultColor:int = -1, disabledColor:int = -1, iconScale:Number = 0.75 ):FadeImageSkin {
            var skin:FadeImageSkin = new FadeImageSkin( upTexture );
            if( downTexture !== null ) {
                skin.setTextureForState( ButtonState.DOWN, downTexture );
            }
            if( upTexture !== null ) {
                skin.setTextureForState( ButtonState.DISABLED, upTexture );
                if( disabledColor >= 0 ) {
                    skin.setColorForState( ButtonState.DISABLED, disabledColor );
                    skin.setColorForState( ButtonState.DISABLED_AND_SELECTED, disabledColor );
                }
            }
            if( defaultColor >= 0 ) {
                skin.defaultColor = defaultColor;
            }
            skin.minWidth = skin.minHeight = mControlSize;
            skin.width = skin.height = mControlSize;
            skin.scale9Grid = BUTTON_SCALE9_GRID;

            button.defaultSkin = skin;
            button.gap = Number.POSITIVE_INFINITY;
            button.minGap = mSmallPaddingSize;
            button.paddingLeft = button.paddingRight = mRegularPaddingSize << 1;
            /* Adjust the padding if an icon is used */
            if( button.defaultIcon ) {
                if( button.iconPosition == RelativePosition.LEFT ) {
                    button.paddingLeft = mRegularPaddingSize;
                } else if( button.iconPosition == RelativePosition.RIGHT ) {
                    button.paddingRight = mRegularPaddingSize;
                }
            }

            scaleButtonIcon( button, iconScale );
            return skin;
        }

        protected function setButtonStyles( button:Button ):void {
            var skin:FadeImageSkin = setBaseButtonStyles( button, mButtonUpTexture, mButtonDownTexture, COLOR_PRIMARY, COLOR_PRIMARY_DISABLED );
            /* Set ToggleButton styles as well */
            if( button is ToggleButton ) {
                skin.selectedTexture = mButtonSelectedUpTexture;
                skin.setTextureForState( ButtonState.DOWN_AND_SELECTED, mButtonSelectedDownTexture );
                skin.setTextureForState( ButtonState.DISABLED_AND_SELECTED, mButtonSelectedDisabledTexture );
            }

            tintButtonIcon( button, COLOR_PRIMARY_CONTRAST, -1, COLOR_PRIMARY_CONTRAST_DISABLED );

            button.fontStyles = mPrimaryContrastBoldTF.clone();
            button.disabledFontStyles = mPrimaryContrastBoldDisabledTF.clone();
        }

        protected function setSmallButtonStyles( button:Button ):void {
            var skin:FadeImageSkin = setBaseButtonStyles( button, mButtonSmallUpTexture, mButtonSmallDownTexture, COLOR_PRIMARY, COLOR_PRIMARY_DISABLED );
            skin.minHeight = mSmallControlSize;
            skin.width = skin.height = mSmallControlSize;
            skin.scale9Grid = BUTTON_SMALL_SCALE9_GRID;
            button.gap = Number.POSITIVE_INFINITY;
            button.minGap = mSmallPaddingSize >> 1;
            button.paddingLeft = button.paddingRight = mSmallPaddingSize + (mSmallPaddingSize >> 1);

            tintButtonIcon( button, COLOR_PRIMARY_CONTRAST, -1, COLOR_PRIMARY_CONTRAST_DISABLED );
            scaleButtonIcon( button, 0.6 );

            button.fontStyles = mPrimaryContrastBoldSmallTF.clone();
            button.disabledFontStyles = mPrimaryContrastBoldDisabledSmallTF.clone();
        }

        protected function setCallToActionButtonStyles( button:Button ):void {
            setBaseButtonStyles( button, mButtonUpTexture, mButtonDownTexture, COLOR_ALTERNATIVE, COLOR_ALTERNATIVE_DISABLED );

            tintButtonIcon( button, COLOR_ALTERNATIVE_CONTRAST, -1, COLOR_ALTERNATIVE_CONTRAST_DISABLED );

            button.fontStyles = mAlternativeContrastBoldTF.clone();
            button.disabledFontStyles = mAlternativeContrastBoldDisabledTF.clone();
        }

        protected function setOutlineButtonStyles( button:Button ):void {
            var skin:FadeImageSkin = setBaseButtonStyles( button, mButtonOutlineUpTexture, mButtonUpTexture, COLOR_PRIMARY, COLOR_PRIMARY_DISABLED );
            skin.fadeOutDuration = 0.3;
            skin.fadeOutTransition = Transitions.EASE_OUT;

            if( button.defaultIcon !== null ) {
                tintButtonIcon( button, COLOR_PRIMARY, COLOR_PRIMARY_CONTRAST, COLOR_PRIMARY_DISABLED );
            }

            button.fontStyles = mPrimaryBoldTF.clone();
            button.disabledFontStyles = mPrimaryBoldDisabledTF.clone();
            button.setFontStylesForState( ButtonState.DOWN, mPrimaryContrastBoldTF.clone() );
        }

        protected function setOutlineAlternativeButtonStyles( button:Button ):void {
            var skin:FadeImageSkin = setBaseButtonStyles( button, mButtonOutlineUpTexture, mButtonUpTexture, COLOR_ALTERNATIVE, COLOR_ALTERNATIVE_DISABLED );
            skin.fadeOutDuration = 0.3;
            skin.fadeOutTransition = Transitions.EASE_OUT;

            if( button.defaultIcon !== null ) {
                tintButtonIcon( button, COLOR_ALTERNATIVE, COLOR_ALTERNATIVE_CONTRAST, COLOR_ALTERNATIVE_DISABLED );
            }

            button.fontStyles = mAlternativeBoldTF.clone();
            button.disabledFontStyles = mAlternativeBoldDisabledTF.clone();
            button.setFontStylesForState( ButtonState.DOWN, mAlternativeContrastBoldTF.clone() );
        }

        protected function setBackButtonStyles( button:Button ):void {
            var skin:FadeImageSkin = setBaseButtonStyles( button, mButtonBackUpTexture, mButtonBackDownTexture, COLOR_PRIMARY, COLOR_PRIMARY_DISABLED );
            skin.setTextureForState( ButtonState.DISABLED, mButtonBackDisabledTexture );
            skin.scale9Grid = BUTTON_BACK_SCALE9_GRID;
            button.paddingLeft = 7;
            button.minGap = mRegularPaddingSize;
            button.iconPosition = RelativePosition.LEFT;
            var icon:Image = new Image( mButtonBackIconTexture );
            icon.color = COLOR_PRIMARY_CONTRAST;
            button.defaultIcon = icon;
            button.iconOffsetY = -1;

            button.fontStyles = mPrimaryContrastBoldTF.clone();
            button.disabledFontStyles = mPrimaryContrastBoldDisabledTF.clone();
        }

        protected function setForwardButtonStyles( button:Button ):void {
            var skin:FadeImageSkin = setBaseButtonStyles( button, mButtonForwardUpTexture, mButtonForwardDownTexture, COLOR_PRIMARY, COLOR_PRIMARY_DISABLED );
            skin.setTextureForState( ButtonState.DISABLED, mButtonForwardDisabledTexture );
            skin.scale9Grid = BUTTON_FORWARD_SCALE9_GRID;
            button.paddingRight = 7;
            button.minGap = mRegularPaddingSize;
            button.iconPosition = RelativePosition.RIGHT;
            var icon:Image = new Image( mButtonForwardIconTexture );
            icon.color = COLOR_PRIMARY_CONTRAST;
            button.defaultIcon = icon;
            button.iconOffsetY = -1;

            button.fontStyles = mPrimaryContrastBoldTF.clone();
            button.disabledFontStyles = mPrimaryContrastBoldDisabledTF.clone();
        }

        protected function setQuietButtonStyles( button:Button ):void {
            var skin:FadeImageSkin = setBaseButtonStyles( button, null, mButtonUpTexture, COLOR_PRIMARY );
            skin.fadeOutTransition = Transitions.EASE_OUT;

            tintButtonIcon( button, COLOR_PRIMARY, COLOR_PRIMARY_CONTRAST );

            button.fontStyles = mPrimaryBoldTF.clone();
            button.disabledFontStyles = mPrimaryBoldDisabledTF.clone();
            button.setFontStylesForState( ButtonState.DOWN, mPrimaryContrastBoldTF.clone() );
        }

        protected function setAlternativeQuietButtonStyles( button:Button ):void {
            var skin:FadeImageSkin = setBaseButtonStyles( button, null, mButtonUpTexture, COLOR_ALTERNATIVE );
            skin.fadeOutTransition = Transitions.EASE_OUT;

            tintButtonIcon( button, COLOR_PRIMARY, COLOR_PRIMARY_CONTRAST );

            button.fontStyles = mAlternativeBoldTF.clone();
            button.disabledFontStyles = mAlternativeBoldDisabledTF.clone();
            button.setFontStylesForState( ButtonState.DOWN, mAlternativeContrastBoldTF.clone() );
        }

        protected function setHeaderQuietButtonStyles( button:Button ):FadeImageSkin {
            var skin:FadeImageSkin = setBaseButtonStyles( button, null, mButtonUpTexture, COLOR_PRIMARY, -1, 1 );
            skin.fadeOutTransition = Transitions.EASE_OUT;

            button.paddingLeft = button.paddingRight = mSmallPaddingSize;
            tintButtonIcon( button, COLOR_PRIMARY, COLOR_PRIMARY_CONTRAST );
            return skin;
        }

        protected function setHeaderQuietButtonIconOnlyStyles( button:Button ):void {
            var skin:FadeImageSkin = setHeaderQuietButtonStyles( button );
            /* Style function used for media buttons as well */
            if( button is ToggleButton ) {
                skin.defaultColor = COLOR_CONTRAST;
                skin.setColorForState( ButtonState.UP, COLOR_CONTRAST );
                skin.setColorForState( ButtonState.UP_AND_SELECTED, COLOR_CONTRAST );
                skin.setColorForState( ButtonState.DOWN, COLOR_CONTRAST );
                skin.setColorForState( ButtonState.DOWN_AND_SELECTED, COLOR_CONTRAST );
                skin.setTextureForState( ButtonState.DOWN_AND_SELECTED, mButtonUpTexture );
            }

            button.paddingLeft = button.paddingRight = 0;
            button.hasLabelTextRenderer = false;
        }

        /**
         * ButtonGroup
         */

        protected function setButtonGroupStyles( group:ButtonGroup ):void {
            group.gap = mRegularPaddingSize;
        }

        /**
         * Callout
         */

        protected function setCalloutStyles( callout:Callout ):void {
            var backgroundSkin:Image = new Image( mCalloutBackgroundTexture );
            backgroundSkin.color = COLOR_BACKGROUND;
            backgroundSkin.scale9Grid = CALLOUT_BACKGROUND_POPUP_SCALE9_GRID;
            callout.backgroundSkin = backgroundSkin;

            var upArrowSkin:Image = new Image( mCalloutUpArrowTexture );
            upArrowSkin.color = COLOR_BACKGROUND;
            callout.topArrowSkin = upArrowSkin;
            callout.topArrowGap = -0.5;

            var rightArrowSkin:Image = new Image( mCalloutRightArrowTexture );
            rightArrowSkin.color = COLOR_BACKGROUND;
            callout.rightArrowSkin = rightArrowSkin;
            callout.rightArrowGap = -1.5;

            var downArrowSkin:Image = new Image( mCalloutDownArrowTexture );
            downArrowSkin.color = COLOR_BACKGROUND;
            callout.bottomArrowSkin = downArrowSkin;
            callout.bottomArrowGap = -2.5;

            var leftArrowSkin:Image = new Image( mCalloutLeftArrowTexture );
            leftArrowSkin.color = COLOR_BACKGROUND;
            callout.leftArrowSkin = leftArrowSkin;
            callout.leftArrowGap = -1.5;

            callout.padding = mRegularPaddingSize;
        }

        /**
         * Check
         */

        protected function setCheckStyles( check:Check ):void {
            var icon:FadeImageSkin = new FadeImageSkin( mCheckUpIconTexture );
            icon.defaultColor = COLOR_CONTRAST;
            icon.selectedTexture = mCheckSelectedUpIconTexture;
            icon.setTextureForState( ButtonState.DOWN, mCheckDownIconTexture );
            icon.setTextureForState( ButtonState.DOWN_AND_SELECTED, mCheckSelectedDownIconTexture );
            icon.setTextureForState( ButtonState.DISABLED, mCheckUpIconTexture );
            icon.setTextureForState( ButtonState.DISABLED_AND_SELECTED, mCheckSelectedUpIconTexture );
            icon.setColorForState( ButtonState.UP_AND_SELECTED, COLOR_PRIMARY );
            icon.setColorForState( ButtonState.DOWN, COLOR_CONTRAST );
            icon.setColorForState( ButtonState.DOWN_AND_SELECTED, COLOR_PRIMARY );
            icon.setColorForState( ButtonState.DISABLED, COLOR_CONTRAST_DISABLED );
            icon.setColorForState( ButtonState.DISABLED_AND_SELECTED, COLOR_CONTRAST_DISABLED );
            icon.setColorForState( ButtonState.HOVER_AND_SELECTED, COLOR_PRIMARY );
            icon.fadeOutDuration = 0.25;

            check.defaultIcon = icon;
            check.gap = mSmallPaddingSize;
            check.minTouchWidth = check.minTouchHeight = mControlSize;
            check.isQuickHitAreaEnabled = true;

            check.fontStyles = mContrastRegularSmallTF.clone();
            check.disabledFontStyles = mContrastRegularDisabledSmallTF.clone();
        }

        /**
         * DataGrid
         */

        protected function setDataGridStyles( grid:DataGrid ):void {
            setScrollerStyles( grid );

            var columnResizeSkin:Quad = new Quad( 2, 1, COLOR_CONTRAST );
            grid.columnResizeSkin = columnResizeSkin;

            var columnDropIndicatorSkin:Quad = new Quad( 2, 1, COLOR_CONTRAST );
            grid.columnDropIndicatorSkin = columnDropIndicatorSkin;
            grid.extendedColumnDropIndicator = true;

            var columnDragOverlaySkin:Quad = new Quad( 1, 1, COLOR_CONTRAST );
            columnDragOverlaySkin.alpha = 0.1;
            grid.columnDragOverlaySkin = columnDragOverlaySkin;

            grid.headerDividerFactory = dataGridHeaderDividerFactory;
            grid.verticalDividerFactory = dataGridVerticalDividerFactory;
        }

        protected function setDataGridHeaderStyles( renderer:DefaultDataGridHeaderRenderer ):void {
            var backgroundSkin:Image = new Image( mDataGridHeaderUpTexture );
            backgroundSkin.color = COLOR_STAGE;
            backgroundSkin.height = mControlSize;
            backgroundSkin.scale9Grid = DATA_GRID_CELL_SCALE9_GRID;
            renderer.backgroundSkin = backgroundSkin;

            var icon:Image = new Image( mDataGridHeaderSortAscendingIconTexture );
            icon.color = COLOR_CONTRAST;
            icon.scale = 0.75;
            renderer.sortAscendingIcon = icon;

            icon = new Image( mDataGridHeaderSortDescendingIconTexture );
            icon.color = COLOR_CONTRAST;
            icon.scale = 0.75;
            renderer.sortDescendingIcon = icon;

            renderer.horizontalAlign = RelativePosition.LEFT;
            renderer.padding = mSmallPaddingSize;

            renderer.fontStyles = mContrastBoldSmallTF.clone();
            renderer.disabledFontStyles = mContrastBoldDisabledSmallTF.clone();
        }

        protected function setDataGridCellRendererStyles( renderer:DefaultDataGridCellRenderer ):void {
            const skin:FadeImageSkin = new FadeImageSkin( mDataGridCellUpTexture );
            skin.defaultColor = COLOR_BACKGROUND;
            skin.setTextureForState( ButtonState.DOWN, mDataGridCellDownTexture );
            skin.setTextureForState( ButtonState.DOWN_AND_SELECTED, mDataGridCellDownTexture );
            skin.selectedTexture = mDataGridCellSelectedTexture;
            skin.minWidth = mLargeControlSize;
            skin.minHeight = mLargeControlSize;
            skin.width = skin.height = mLargeControlSize;
            skin.scale9Grid = DATA_GRID_CELL_SCALE9_GRID;
            skin.fadeOutTransition = Transitions.EASE_OUT;
            renderer.defaultSkin = skin;

            renderer.fontStyles = mContrastRegularTF.clone();
            renderer.disabledFontStyles = mContrastRegularDisabledTF.clone();
            renderer.accessoryLabelFontStyles = mContrastRegularTF.clone();
            renderer.iconLabelFontStyles = mContrastRegularTF.clone();

            renderer.horizontalAlign = RelativePosition.LEFT;
            renderer.paddingLeft = renderer.paddingRight = mSmallPaddingSize;
            renderer.gap = mRegularPaddingSize;
            renderer.minGap = mRegularPaddingSize;
            renderer.iconPosition = RelativePosition.LEFT;
            renderer.accessoryGap = Number.POSITIVE_INFINITY;
            renderer.minAccessoryGap = mRegularPaddingSize;
            renderer.accessoryPosition = RelativePosition.RIGHT;

            renderer.accessoryLoaderFactory = imageLoaderFactory;
            renderer.iconLoaderFactory = imageLoaderFactory;
        }

        /**
         * DateTimeSpinner
         */

        protected function setDateTimeSpinnerListStyles( list:SpinnerList ):void {
            list.verticalScrollPolicy = ScrollPolicy.ON;
            list.paddingLeft = list.paddingRight = 0.5;
            list.paddingBottom = 1;
            var backgroundSkin:Image = new Image( mDateTimeSpinnerBackgroundTexture );
            backgroundSkin.color = COLOR_BACKGROUND;
            backgroundSkin.scale9Grid = DATE_TIME_SPINNER_BACKGROUND_SCALE9_GRID;
            backgroundSkin.width = mControlSize;
            list.backgroundSkin = backgroundSkin;
            var overlaySkin:Image = new Image( mDateTimeSpinnerSelectionOverlayTexture );
            overlaySkin.color = COLOR_PRIMARY;
            overlaySkin.scale9Grid = DATE_TIME_SPINNER_OVERLAY_SCALE9_GRID;
            overlaySkin.width = mControlSize;
            list.selectionOverlaySkin = overlaySkin;
            list.customItemRendererStyleName = THEME_STYLE_NAME_DATE_TIME_SPINNER_LIST_ITEM_RENDERER;
        }

        protected function setDateTimeSpinnerListItemRendererStyles( renderer:DefaultListItemRenderer ):void {
            setSpinnerListItemRendererStyles( renderer );
            renderer.paddingLeft = renderer.paddingRight = mSmallPaddingSize;
        }

        /**
         * Drawers
         */

        protected function setDrawersStyles( drawers:Drawers ):void {
            var overlaySkin:Image = new Image( mBackgroundPlainOverlayTexture );
            overlaySkin.color = COLOR_CONTRAST;
            overlaySkin.scale9Grid = BACKGROUND_SCALE9_GRID;
            drawers.overlaySkin = overlaySkin;
        }

        /**
         * Grouped list
         */

        protected function setGroupedListStyles( list:GroupedList ):void {
            setScrollerStyles( list );

            list.customItemRendererStyleName = THEME_STYLE_NAME_GROUPED_LIST_ITEM_RENDERER;
            list.customFirstItemRendererStyleName = THEME_STYLE_NAME_GROUPED_LIST_FIRST_ITEM_RENDERER;
            list.customSingleItemRendererStyleName = THEME_STYLE_NAME_GROUPED_LIST_SINGLE_ITEM_RENDERER;
            list.customLastItemRendererStyleName = THEME_STYLE_NAME_GROUPED_LIST_LAST_ITEM_RENDERER;
        }

        protected function setBaseGroupedListItemRendererStyles( renderer:DefaultGroupedListItemRenderer, upTexture:Texture, downTexture:Texture, selectedTexture:Texture ):void {
            var skin:FadeImageSkin = new FadeImageSkin( upTexture );
            skin.defaultColor = COLOR_BACKGROUND;
            skin.selectedTexture = selectedTexture;
            skin.setTextureForState( ButtonState.DOWN, downTexture );
            skin.setTextureForState( ButtonState.DOWN_AND_SELECTED, downTexture );
            skin.height = mControlSize;
            skin.minHeight = mControlSize;
            skin.scale9Grid = GROUPED_LIST_ITEM_SCALE9_GRID;

            renderer.defaultSkin = skin;
            renderer.horizontalAlign = RelativePosition.LEFT;
            renderer.minHeight = mControlSize;
            renderer.gap = mRegularPaddingSize;
            renderer.minGap = mRegularPaddingSize;
            renderer.iconPosition = RelativePosition.LEFT;
            renderer.accessoryGap = Number.POSITIVE_INFINITY;
            renderer.minAccessoryGap = mRegularPaddingSize;
            renderer.accessoryPosition = RelativePosition.RIGHT;
            renderer.paddingLeft = renderer.paddingRight = mRegularPaddingSize;
            renderer.iconPosition = RelativePosition.LEFT;
            renderer.accessoryPosition = RelativePosition.RIGHT;

            renderer.iconLoaderFactory = imageLoaderFactory;

            renderer.fontStyles = mContrastRegularTF.clone();
            renderer.disabledFontStyles = mContrastRegularDisabledTF.clone();
            renderer.accessoryLabelFontStyles = mContrastRegularTF.clone();
            renderer.iconLabelFontStyles = mContrastRegularTF.clone();
        }

        protected function setGroupedListItemRendererStyles( renderer:DefaultGroupedListItemRenderer ):void {
            setBaseGroupedListItemRendererStyles( renderer, mGroupedListItemRendererUpTexture, mGroupedListItemRendererDownTexture, mGroupedListItemRendererSelectedTexture );
        }

        protected function setGroupedListFirstItemRendererStyles( renderer:DefaultGroupedListItemRenderer ):void {
            setBaseGroupedListItemRendererStyles( renderer, mGroupedListFirstItemRendererUpTexture, mGroupedListFirstItemRendererDownTexture, mGroupedListFirstItemRendererSelectedTexture );
        }

        protected function setGroupedListLastItemRendererStyles( renderer:DefaultGroupedListItemRenderer ):void {
            setBaseGroupedListItemRendererStyles( renderer, mGroupedListLastItemRendererUpTexture, mGroupedListLastItemRendererDownTexture, mGroupedListLastItemRendererSelectedTexture );
        }

        protected function setGroupedListSingleItemRendererStyles( renderer:DefaultGroupedListItemRenderer ):void {
            setBaseGroupedListItemRendererStyles( renderer, mGroupedListSingleItemRendererUpTexture, mGroupedListSingleItemRendererDownTexture, mGroupedListSingleItemRendererSelectedTexture );
        }

        protected function setGroupedListHeaderRendererStyles( renderer:DefaultGroupedListHeaderOrFooterRenderer ):void {
            var skin:Image = new Image( mBackgroundPlainTexture );
            skin.color = COLOR_STAGE;
            skin.height = mControlSize;
            skin.scale9Grid = BACKGROUND_SCALE9_GRID;

            renderer.backgroundSkin = skin;
            renderer.horizontalAlign = RelativePosition.LEFT;
            renderer.paddingLeft = renderer.paddingRight = mRegularPaddingSize;
            renderer.contentLoaderFactory = imageLoaderFactory;

            renderer.fontStyles = mContrastBoldSmallTF.clone();
            renderer.disabledFontStyles = mContrastBoldDisabledSmallTF.clone();
        }

        protected function setGroupedListFooterRendererStyles( renderer:DefaultGroupedListHeaderOrFooterRenderer ):void {
            var skin:Image = new Image( mBackgroundPlainTexture );
            skin.color = COLOR_STAGE;
            skin.height = mSmallControlSize;
            skin.scale9Grid = BACKGROUND_SCALE9_GRID;

            renderer.backgroundSkin = skin;
            renderer.paddingTop = mSmallPaddingSize;
            renderer.horizontalAlign = RelativePosition.LEFT;
            renderer.paddingLeft = renderer.paddingRight = mRegularPaddingSize;
            renderer.contentLoaderFactory = imageLoaderFactory;

            renderer.fontStyles = mContrastBoldDisabledSmallTF.clone();
        }

        /**
         * Header
         */

        protected function setHeaderStyles( header:Header ):void {
            setHeaderWithoutBackgroundStyles( header, false );

            var skin:Image = new Image( mBackgroundHeaderTexture );
            skin.color = COLOR_CONTRAST;
            skin.scale9Grid = HEADER_BACKGROUND_SCALE9_GRID;
            skin.width = mControlSize;
            skin.height = mHeaderSize;

            header.backgroundSkin = skin;
            header.paddingLeft = header.paddingRight = mSmallPaddingSize;
            header.fontStyles = mPrimaryContrastBoldLargeTF.clone();
        }

        protected function setHeaderWithoutBackgroundStyles( header:Header, addInvisibleQuad:Boolean = true ):void {
            if( addInvisibleQuad ) {
                /* Invisible quad must be used because minHeight cannot be set on header in the theme */
                var invisibleBackground:Quad = new Quad( 1, mHeaderSize );
                invisibleBackground.alpha = 0;
                header.backgroundSkin = invisibleBackground;
            }
            header.gap = mRegularPaddingSize;
            header.paddingLeft = header.paddingRight = mRegularPaddingSize;
            header.titleGap = mRegularPaddingSize;
            header.maxHeight = mHeaderSize;
            header.titleAlign = HorizontalAlign.CENTER;
            header.fontStyles = mContrastBoldLargeTF.clone();
        }

        /**
         * Label
         */

        protected function setLabelStyles( label:Label ):void {
            label.fontStyles = mContrastRegularTF.clone();
            label.disabledFontStyles = mContrastRegularDisabledTF.clone();
        }

        protected function setHeadingLabelStyles( label:Label ):void {
            label.fontStyles = mContrastBoldLargeTF.clone();
            label.disabledFontStyles = mContrastBoldDisabledLargeTF.clone();
        }

        protected function setDetailLabelStyles( label:Label ):void {
            label.fontStyles = mContrastRegularSmallTF.clone();
            label.disabledFontStyles = mContrastRegularDisabledSmallTF.clone();
        }

        /**
         * LayoutGroup
         */

        protected function setLayoutGroupToolbarStyles( group:LayoutGroup ):void {
            var skin:Image = new Image( mBackgroundToolbarTexture );
            skin.color = COLOR_BACKGROUND;
            skin.scale9Grid = BACKGROUND_TOOLBAR_SCALE9_GRID;
            skin.width = 50;
            skin.height = 50;
            group.backgroundSkin = skin;
        }

        protected function setLayoutGroupTabBarStyles( group:LayoutGroup ):void {
            var skin:Image = new Image( mTabBarBackgroundTexture );
            skin.color = COLOR_BACKGROUND;
            skin.scale9Grid = TAB_BAR_BACKGROUND_SCALE9_GRID;
            skin.width = 48;
            skin.height = 52;
            group.backgroundSkin = skin;
        }

        protected function setLayoutGroupTabBarInvertedStyles( group:LayoutGroup ):void {
            var skin:Image = new Image( mTabBarInvertedBackgroundTexture );
            skin.color = COLOR_BACKGROUND;
            skin.scale9Grid = TAB_BAR_BACKGROUND_SCALE9_GRID;
            skin.width = 48;
            skin.height = 52;
            group.backgroundSkin = skin;
        }

        protected function setLayoutGroupTabBarWithIconsStyles( group:LayoutGroup ):void {
            if( group.backgroundSkin !== null ) {
                group.backgroundSkin.height = 78;
            }
        }

        /**
         * List
         */

        protected function setListStyles( list:List ):void {
            setScrollerStyles( list );
            var skin:Image = new Image( mBackgroundListTexture );
            skin.color = COLOR_BACKGROUND;
            skin.scale9Grid = BACKGROUND_SCALE9_GRID;
            list.backgroundSkin = skin;
        }

        protected function setItemRendererStyles( renderer:BaseDefaultItemRenderer ):void {
            const skin:FadeImageSkin = new FadeImageSkin( mListItemRendererUpTexture );
            skin.defaultColor = COLOR_BACKGROUND;
            skin.setTextureForState( ButtonState.DOWN, mListItemRendererDownTexture );
            skin.setTextureForState( ButtonState.DOWN_AND_SELECTED, mListItemRendererDownTexture );
            skin.selectedTexture = mListItemRendererSelectedTexture;
            skin.minWidth = mLargeControlSize;
            skin.minHeight = mLargeControlSize;
            skin.width = skin.height = mLargeControlSize;
            skin.scale9Grid = ITEM_RENDERER_SCALE9_GRID;
            skin.fadeOutTransition = Transitions.EASE_OUT;
            renderer.defaultSkin = skin;

            renderer.horizontalAlign = RelativePosition.LEFT;
            renderer.paddingLeft = renderer.paddingRight = mRegularPaddingSize;
            renderer.gap = mRegularPaddingSize;
            renderer.minGap = mRegularPaddingSize;
            renderer.iconPosition = RelativePosition.LEFT;
            renderer.accessoryGap = Number.POSITIVE_INFINITY;
            renderer.minAccessoryGap = mRegularPaddingSize;
            renderer.accessoryPosition = RelativePosition.RIGHT;

            renderer.iconLoaderFactory = imageLoaderFactory;
            renderer.accessoryLoaderFactory = imageLoaderFactory;

            renderer.fontStyles = mContrastRegularTF.clone();
            renderer.disabledFontStyles = mContrastRegularDisabledTF.clone();
            renderer.accessoryLabelFontStyles = mContrastRegularTF.clone();
            renderer.iconLabelFontStyles = mContrastRegularTF.clone();
        }

        /**
         * Numeric stepper
         */

        protected function setNumericStepperStyles( stepper:NumericStepper ):void {
            stepper.buttonLayoutMode = StepperButtonLayoutMode.SPLIT_HORIZONTAL;
            stepper.incrementButtonLabel = "+";
            stepper.decrementButtonLabel = "-";
        }

        protected function setNumericStepperTextInputStyles( input:TextInput ):void {
            const skin:ImageSkin = new ImageSkin( mNumericStepperInputBackgroundTexture );
            skin.defaultColor = COLOR_PRIMARY;
            skin.disabledColor = COLOR_PRIMARY_DISABLED;
            skin.scale9Grid = NUMERIC_STEPPER_INPUT_BACKGROUND_SCALE9_GRID;
            skin.minWidth = skin.minHeight = mControlSize;
            skin.width = skin.height = mControlSize;

            input.backgroundSkin = skin;
            input.isEditable = false;
            input.isSelectable = false;
            input.textEditorFactory = stepperTextEditorFactory;

            /* Make the format align to the center horizontally */
            var style:TextFormat = mPrimaryContrastBoldTF.clone();
            style.horizontalAlign = Align.CENTER;
            input.fontStyles = style;
            var disabledStyle:TextFormat = mPrimaryContrastBoldDisabledTF.clone();
            disabledStyle.horizontalAlign = Align.CENTER;
            input.disabledFontStyles = disabledStyle;
        }

        protected function setNumericStepperDecButtonStyles( button:Button ):void {
            setBaseNumericStepperButtonStyles( button, mNumericStepperDecButtonUpTexture, mNumericStepperDecButtonDownTexture, NUMERIC_BUTTON_DEC_SCALE_9_GRID );

            button.paddingLeft = mSmallPaddingSize;
        }

        protected function setNumericStepperIncButtonStyles( button:Button ):void {
            setBaseNumericStepperButtonStyles( button, mNumericStepperIncButtonUpTexture, mNumericStepperIncButtonDownTexture, NUMERIC_BUTTON_INC_SCALE_9_GRID );
        }

        protected function setBaseNumericStepperButtonStyles( button:Button, upTexture:Texture, downTexture:Texture, scale9Grid:Rectangle ):void {
            var skin:FadeImageSkin = setBaseButtonStyles( button, upTexture, downTexture, COLOR_PRIMARY, COLOR_PRIMARY_DISABLED );
            skin.fadeOutTransition = Transitions.EASE_OUT;
            skin.scale9Grid = scale9Grid;

            button.paddingLeft = 0;
            button.paddingRight = mSmallPaddingSize >> 1;
            button.keepDownStateOnRollOut = true;

            button.fontStyles = mPrimaryBoldExtraLargeTF.clone();
            button.disabledFontStyles = mPrimaryBoldExtraLargeDisabledTF.clone();
            button.setFontStylesForState( ButtonState.DOWN, mPrimaryContrastBoldExtraLargeTF.clone() );
        }

        /**
         * Panel
         */

        protected function setBasePanelStyles( panel:Panel ):void {
            setScrollerStyles( panel );

            panel.paddingLeft = panel.paddingRight = panel.paddingBottom = 0;
        }

        protected function setPanelWithPaddingStyles( panel:Panel ):void {
            setBasePanelStyles( panel );

            panel.paddingTop = panel.paddingBottom = 0;
            panel.paddingRight = mSmallPaddingSize;
            panel.paddingLeft = mSmallPaddingSize;
        }

        protected function setPanelTransparentHeaderStyles( panel:Panel ):void {
            panel.customHeaderStyleName = THEME_STYLE_NAME_TRANSPARENT_HEADER;
        }

        /**
         * Panel Screen
         */

        protected function setPanelScreenHeaderStyles( header:Header ):void {
            setHeaderStyles( header );
            header.useExtraPaddingForOSStatusBar = true;
            header.paddingLeft = header.paddingRight = mSmallPaddingSize;
        }

        protected function setPanelScreenTransparentHeaderStyles( header:Header ):void {
            setHeaderWithoutBackgroundStyles( header );
            header.useExtraPaddingForOSStatusBar = true;
            header.paddingLeft = header.paddingRight = mSmallPaddingSize;
        }

        /**
         * Page indicator
         */

        protected function setPageIndicatorStyles( pageIndicator:PageIndicator ):void {
            pageIndicator.normalSymbolFactory = pageIndicatorNormalSymbolFactory;
            pageIndicator.selectedSymbolFactory = pageIndicatorSelectedSymbolFactory;
            pageIndicator.gap = mSmallPaddingSize;
            pageIndicator.padding = mRegularPaddingSize;
            pageIndicator.minTouchWidth = mControlSize;
            pageIndicator.minTouchHeight = mControlSize;
        }

        /**
         * Picker list
         */

        protected function setPickerListStyles( list:PickerList ):void {
            if( DeviceCapabilities.isTablet( Starling.current.nativeStage ) ) {
                var dropDownManager:DropDownPopUpContentManager = new DropDownPopUpContentManager();
                dropDownManager.gap = mSmallPaddingSize >> 1;
                list.popUpContentManager = dropDownManager;
            } else {
                var manager:VerticalCenteredPopUpContentManager = new VerticalCenteredPopUpContentManager();
                manager.marginLeft = manager.marginRight = manager.marginBottom = manager.marginTop = mRegularPaddingSize;
                list.popUpContentManager = manager;
            }
        }

        protected function setPickerListSmallStyles( list:PickerList ):void {
            setPickerListStyles( list );

            list.customButtonStyleName = THEME_STYLE_NAME_PICKER_LIST_BUTTON_SMALL;
        }

        protected function setPickerListButtonStyles( button:Button ):void {
            var skin:FadeImageSkin = setBaseButtonStyles( button, mButtonPickerListUpTexture, mButtonPickerListDownTexture, COLOR_PRIMARY, COLOR_PRIMARY_DISABLED );
            skin.scale9Grid = BUTTON_FORWARD_SCALE9_GRID;
            button.paddingRight = 15;
            button.minGap = mRegularPaddingSize + 8;
            button.iconPosition = RelativePosition.RIGHT;
            var icon:Image = new Image( mPickerListButtonIcon );
            icon.color = COLOR_PRIMARY_CONTRAST;
            button.defaultIcon = icon;
            button.iconOffsetY = 0;

            button.fontStyles = mPrimaryContrastBoldTF.clone();
            button.disabledFontStyles = mPrimaryContrastBoldDisabledTF.clone();
        }

        protected function setPickerListButtonSmallStyles( button:Button ):void {
            var skin:FadeImageSkin = setBaseButtonStyles( button, mButtonPickerListSmallUpTexture, mButtonPickerListSmallDownTexture, COLOR_PRIMARY, COLOR_PRIMARY_DISABLED );
            skin.setTextureForState( ButtonState.DISABLED, mButtonPickerListSmallDisabledTexture );
            skin.scale9Grid = BUTTON_PICKER_LIST_SMALL_SCALE9_GRID;
            skin.minHeight = mSmallControlSize;
            skin.width = skin.height = mSmallControlSize;
            button.minGap = mSmallPaddingSize + (mSmallPaddingSize >> 1);
            button.paddingRight = 9;
            button.paddingLeft = mSmallPaddingSize + (mSmallPaddingSize >> 1);
            button.iconPosition = RelativePosition.RIGHT;

            var icon:Image = new Image( mPickerListButtonIcon );
            icon.color = COLOR_PRIMARY_CONTRAST;
            icon.scale = 0.75;
            button.defaultIcon = icon;
            button.iconOffsetY = 1;

            button.fontStyles = mPrimaryContrastBoldSmallTF.clone();
            button.disabledFontStyles = mPrimaryContrastBoldDisabledSmallTF.clone();
        }

        protected function setPickerListListStyles( list:List ):void {
            setScrollerStyles( list );
            if( DeviceCapabilities.isTablet( Starling.current.nativeStage ) ) {
                list.maxHeight = 250;
            }
            list.verticalScrollPolicy = ScrollPolicy.ON;
            var skin:Image = new Image( mBackgroundDropDownListTexture );
            skin.color = COLOR_BACKGROUND;
            skin.scale9Grid = DROP_DOWN_LIST_BACKGROUND_SCALE9_GRID;
            list.backgroundSkin = skin;
            list.paddingLeft = 1.5;
            list.paddingTop = 6;
            list.paddingRight = 1.5;
            list.paddingBottom = 8;
            list.customItemRendererStyleName = THEME_STYLE_NAME_DROP_DOWN_LIST_ITEM_RENDERER;
        }

        protected function setPickerListItemRendererStyles( renderer:BaseDefaultItemRenderer ):void {
            var skin:FadeImageSkin = new FadeImageSkin( mListItemRendererUpTexture );
            skin.defaultColor = COLOR_BACKGROUND;
            skin.selectedTexture = mListItemRendererSelectedTexture;
            skin.setTextureForState( ButtonState.DOWN, mListItemRendererDownTexture );
            skin.setTextureForState( ButtonState.DOWN_AND_SELECTED, mListItemRendererDownTexture );
            skin.minWidth = mControlSize;
            skin.minHeight = mLargeControlSize;
            skin.width = mControlSize;
            skin.height = mLargeControlSize;
            skin.scale9Grid = ITEM_RENDERER_SCALE9_GRID;
            skin.fadeOutTransition = Transitions.EASE_OUT;
            renderer.defaultSkin = skin;

            renderer.gap = mRegularPaddingSize;
            renderer.itemHasIcon = false;
            renderer.accessoryGap = Number.POSITIVE_INFINITY;
            renderer.minAccessoryGap = mRegularPaddingSize;
            renderer.horizontalAlign = HorizontalAlign.CENTER;
            renderer.accessoryPosition = RelativePosition.RIGHT;
            renderer.paddingTop = 0;

            renderer.fontStyles = mContrastRegularTF.clone();
            renderer.disabledFontStyles = mContrastRegularDisabledTF.clone();
            renderer.accessoryLabelFontStyles = mContrastRegularTF.clone();
            renderer.iconLabelFontStyles = mContrastRegularTF.clone();
        }

        /**
         * Progress bar
         */

        protected function setProgressBarStyles( progress:ProgressBar ):void {
            var isHorizontal:Boolean = progress.direction == Direction.HORIZONTAL;

            var fillSkin:ImageSkin;
            var fillDisabledSkin:ImageSkin;
            var backgroundSkin:ImageSkin;
            var backgroundDisabledSkin:ImageSkin;
            /* Horizontal skins */
            if( isHorizontal ) {
                backgroundSkin = getProgressBarSkin( mProgressBarHorizontalTexture );
                backgroundDisabledSkin = getProgressBarSkin( mProgressBarHorizontalTexture );
                fillSkin = getProgressBarSkin( mProgressBarHorizontalTexture );
                fillDisabledSkin = getProgressBarSkin( mProgressBarHorizontalTexture );
                backgroundSkin.minWidth = backgroundDisabledSkin.minWidth = fillSkin.minWidth = fillDisabledSkin.minWidth = mControlSize << 1;
            }
            /* Vertical skins */
            else {
                backgroundSkin = getProgressBarSkin( mProgressBarVerticalTexture );
                backgroundDisabledSkin = getProgressBarSkin( mProgressBarVerticalTexture );
                fillSkin = getProgressBarSkin( mProgressBarVerticalTexture );
                fillDisabledSkin = getProgressBarSkin( mProgressBarVerticalTexture );
                backgroundSkin.minHeight = backgroundDisabledSkin.minHeight = fillSkin.minHeight = fillDisabledSkin.minHeight = mControlSize << 1;
            }
            fillSkin.defaultColor = COLOR_PRIMARY;
            fillDisabledSkin.defaultColor = COLOR_CONTRAST;
            backgroundSkin.defaultColor = COLOR_CONTRAST_DISABLED;
            backgroundDisabledSkin.defaultColor = COLOR_CONTRAST_DISABLED;
            progress.fillSkin = fillSkin;
            progress.fillDisabledSkin = fillDisabledSkin;
            progress.backgroundSkin = backgroundSkin;
            progress.backgroundDisabledSkin = backgroundDisabledSkin;

            /* Helper */
            function getProgressBarSkin( texture:Texture ):ImageSkin {
                var skin:ImageSkin = new ImageSkin( texture );
                skin.width = mTrackSize << 1;
                skin.height = mTrackSize << 1;
                skin.scale9Grid = PROGRESS_BAR_SCALE9_GRID;
                return skin;
            }
        }

        /**
         * Radio
         */

        protected function setRadioStyles( radio:Radio ):void {
            var icon:FadeImageSkin = new FadeImageSkin( mRadioUpIconTexture );
            icon.defaultColor = COLOR_CONTRAST;
            icon.selectedTexture = mRadioSelectedUpIconTexture;
            icon.setTextureForState( ButtonState.DOWN, mRadioDownIconTexture );
            icon.setTextureForState( ButtonState.DISABLED, mRadioUpIconTexture );
            icon.setTextureForState( ButtonState.DOWN_AND_SELECTED, mRadioSelectedDownIconTexture );
            icon.setTextureForState( ButtonState.DISABLED_AND_SELECTED, mRadioSelectedUpIconTexture );
            icon.setColorForState( ButtonState.UP_AND_SELECTED, COLOR_PRIMARY );
            icon.setColorForState( ButtonState.DOWN, COLOR_CONTRAST );
            icon.setColorForState( ButtonState.DOWN_AND_SELECTED, COLOR_PRIMARY );
            icon.setColorForState( ButtonState.DISABLED, COLOR_CONTRAST_DISABLED );
            icon.setColorForState( ButtonState.DISABLED_AND_SELECTED, COLOR_CONTRAST_DISABLED );
            icon.setColorForState( ButtonState.HOVER_AND_SELECTED, COLOR_PRIMARY );
            icon.fadeOutDuration = 0.25;

            radio.defaultIcon = icon;
            radio.gap = mSmallPaddingSize;
            radio.minTouchWidth = radio.minTouchHeight = mControlSize;
            radio.fontStyles = mContrastRegularSmallTF.clone();
            radio.disabledFontStyles = mContrastRegularDisabledSmallTF.clone();
        }

        /**
         * Scroll bar
         */

        protected function setSimpleScrollBarStyles( scrollBar:SimpleScrollBar ):void {
            if( scrollBar.direction == Direction.HORIZONTAL ) {
                scrollBar.customThumbStyleName = THEME_STYLE_NAME_HORIZONTAL_SIMPLE_SCROLL_BAR_THUMB;
            } else {
                scrollBar.customThumbStyleName = THEME_STYLE_NAME_VERTICAL_SIMPLE_SCROLL_BAR_THUMB;
            }
            var padding:int = mSmallPaddingSize >> 2;
            scrollBar.paddingRight = scrollBar.paddingTop = scrollBar.paddingBottom = padding;
        }

        protected function setHorizontalSimpleScrollBarThumbStyles( thumb:Button ):void {
            var skin:Image = new Image( mScrollBarHorizontalTexture );
            skin.width = 10;
            skin.scale9Grid = SCROLL_BAR_HORIZONTAL_SCALE9_GRID;
            skin.color = COLOR_CONTRAST;
            thumb.defaultSkin = skin;
            thumb.hasLabelTextRenderer = false;
        }

        protected function setVerticalSimpleScrollBarThumbStyles( thumb:Button ):void {
            var skin:Image = new Image( mScrollBarVerticalTexture );
            skin.height = 10;
            skin.scale9Grid = SCROLL_BAR_VERTICAL_SCALE9_GRID;
            skin.color = COLOR_CONTRAST;
            thumb.defaultSkin = skin;
            thumb.hasLabelTextRenderer = false;
        }

        /**
         * Scroll container
         */

        protected function setScrollContainerStyles( container:ScrollContainer ):void {
            setScrollerStyles( container );
        }

        /**
         * Scroll text
         */

        protected function setScrollTextStyles( text:ScrollText ):void {
            setScrollerStyles( text );

            text.fontStyles = mContrastRegularTF.clone();
            text.disabledFontStyles = mContrastRegularDisabledTF.clone();

            text.padding = mRegularPaddingSize;
            text.paddingRight = mRegularPaddingSize + mSmallPaddingSize;
        }

        /**
         * Slider
         */

        protected function setSliderStyles( slider:Slider ):void {
            slider.trackLayoutMode = TrackLayoutMode.SPLIT;
            slider.minimumPadding = slider.maximumPadding = -4;

            if( slider.direction == Direction.VERTICAL ) {
                slider.customMinimumTrackStyleName = THEME_STYLE_NAME_VERTICAL_SLIDER_MINIMUM_TRACK;
                slider.customMaximumTrackStyleName = THEME_STYLE_NAME_VERTICAL_SLIDER_MAXIMUM_TRACK;
                slider.minTouchWidth = mSmallControlSize;
            } else {
                slider.customMinimumTrackStyleName = THEME_STYLE_NAME_HORIZONTAL_SLIDER_MINIMUM_TRACK;
                slider.customMaximumTrackStyleName = THEME_STYLE_NAME_HORIZONTAL_SLIDER_MAXIMUM_TRACK;
                slider.minTouchHeight = mSmallControlSize;
            }
        }

        protected function setSliderThumbStyles( thumb:Button ):void {
            var skin:Image = new Image( mSliderThumbTexture );
            skin.color = COLOR_PRIMARY_CONTRAST;
            thumb.defaultSkin = skin;
            thumb.hasLabelTextRenderer = false;
            thumb.isQuickHitAreaEnabled = true;
            thumb.minTouchWidth = thumb.minTouchHeight = mControlSize;
        }

        protected function setHorizontalSliderMinimumTrackStyles( track:Button ):void {
            var skin:ImageSkin = new ImageSkin( mSliderHorizontalTrackTexture );
            skin.defaultColor = COLOR_PRIMARY;
            skin.disabledColor = COLOR_CONTRAST;
            skin.width = mControlSize << 1;
            skin.height = mTrackSize;
            skin.scale9Grid = SLIDER_HORIZONTAL_SCALE9_GRID;

            track.defaultSkin = skin;
            track.hasLabelTextRenderer = false;
            track.isQuickHitAreaEnabled = true;
            track.minTouchHeight = mRegularPaddingSize;
        }

        protected function setHorizontalSliderMaximumTrackStyles( track:Button ):void {
            var skin:ImageSkin = new ImageSkin( mSliderHorizontalTrackTexture );
            skin.defaultColor = COLOR_CONTRAST_DISABLED;
            skin.disabledColor = COLOR_CONTRAST_DISABLED;
            skin.width = mControlSize << 1;
            skin.height = mTrackSize;
            skin.scale9Grid = SLIDER_HORIZONTAL_SCALE9_GRID;

            track.defaultSkin = skin;
            track.hasLabelTextRenderer = false;
            track.isQuickHitAreaEnabled = true;
            track.minTouchHeight = mRegularPaddingSize;
        }

        protected function setVerticalSliderMinimumTrackStyles( track:Button ):void {
            var skin:ImageSkin = new ImageSkin( mSliderVerticalTrackTexture );
            skin.defaultColor = COLOR_PRIMARY;
            skin.disabledColor = COLOR_CONTRAST;
            skin.width = mTrackSize;
            skin.height = mControlSize << 1;
            skin.scale9Grid = SLIDER_VERTICAL_SCALE9_GRID;

            track.defaultSkin = skin;
            track.hasLabelTextRenderer = false;
            track.isQuickHitAreaEnabled = true;
            track.minTouchWidth = mRegularPaddingSize;
        }

        protected function setVerticalSliderMaximumTrackStyles( track:Button ):void {
            var skin:ImageSkin = new ImageSkin( mSliderVerticalTrackTexture );
            skin.defaultColor = COLOR_CONTRAST_DISABLED;
            skin.width = mTrackSize;
            skin.height = mControlSize << 1;
            skin.scale9Grid = SLIDER_VERTICAL_SCALE9_GRID;

            track.defaultSkin = skin;
            track.hasLabelTextRenderer = false;
            track.isQuickHitAreaEnabled = true;
            track.minTouchWidth = mRegularPaddingSize;
        }

        /**
         * Spinner list
         */

        protected function setSpinnerListStyles( list:SpinnerList ):void {
            list.verticalScrollPolicy = ScrollPolicy.ON;
            list.paddingTop = 0.5;
            list.paddingBottom = 2.5;
            list.paddingLeft = list.paddingRight = mSmallPaddingSize;
            var backgroundSkin:Image = new Image( mSpinnerListBackgroundTexture );
            backgroundSkin.color = COLOR_BACKGROUND;
            backgroundSkin.scale9Grid = SPINNER_LIST_BACKGROUND_SCALE9_GRID;
            backgroundSkin.width = mTabSize << 1;
            list.backgroundSkin = backgroundSkin;
            var overlaySkin:Image = new Image( mSpinnerListSelectionOverlayTexture );
            overlaySkin.color = COLOR_PRIMARY;
            overlaySkin.scale9Grid = SPINNER_LIST_OVERLAY_SCALE9_GRID;
            overlaySkin.height = mControlSize;
            list.selectionOverlaySkin = overlaySkin;
            list.customItemRendererStyleName = THEME_STYLE_NAME_SPINNER_LIST_ITEM_RENDERER;
        }

        protected function setSpinnerListItemRendererStyles( renderer:DefaultListItemRenderer ):void {
            /* Invisible skin for measurements */
            var invisibleBackground:Quad = new Quad( 1, mLargeControlSize );
            invisibleBackground.alpha = 0;
            renderer.defaultSkin = invisibleBackground;
            renderer.paddingLeft = renderer.paddingRight = mSmallPaddingSize;
            renderer.fontStyles = mContrastRegularTF.clone();
            renderer.disabledFontStyles = mContrastRegularDisabledTF.clone();
            renderer.accessoryLabelFontStyles = mContrastRegularTF.clone();
            renderer.accessoryLabelDisabledFontStyles = mContrastRegularDisabledTF.clone();
        }

        /**
         * Tab Bar
         */

        protected function setBaseTabBarStyles( tabBar:TabBar ):void {
            tabBar.gap = mSmallPaddingSize;
            tabBar.horizontalAlign = HorizontalAlign.CENTER;
            tabBar.distributeTabSizes = false;
            /* Custom Tab that adjusts icon's color depending on the button state */
            tabBar.tabFactory = function():ToggleButton {
                return new CustomTab( COLOR_CONTRAST, COLOR_PRIMARY, COLOR_CONTRAST_DISABLED );
            };
        }

        protected function setTabBarStyles( tabBar:TabBar ):void {
            setBaseTabBarStyles( tabBar );
        }

        protected function setTabBarWithIconsStyles( tabBar:TabBar ):void {
            setBaseTabBarStyles( tabBar );
            tabBar.customTabStyleName = THEME_STYLE_NAME_TAB_WITH_ICON;
        }

        protected function setTabStyles( tab:ToggleButton ):void {
            var skin:FadeImageSkin = setBaseButtonStyles( tab, null, mTabTexture, COLOR_PRIMARY, COLOR_CONTRAST_DISABLED, 1 );
            skin.selectedTexture = mTabTexture;
            skin.setColorForState( ButtonState.DOWN, COLOR_CONTRAST_DISABLED );
            skin.setTextureForState( ButtonState.DISABLED_AND_SELECTED, mTabTexture );
            skin.fadeOutTransition = Transitions.EASE_OUT;
            skin.scale9Grid = TAB_SCALE9_GRID;
            skin.minHeight = mSmallControlSize;
            skin.height = mSmallControlSize;

            tab.gap = mSmallPaddingSize;
            tab.paddingLeft = tab.paddingRight = mRegularPaddingSize;
            tab.labelOffsetY = 0.5;

            tab.fontStyles = mContrastBoldSmallTF.clone();
            tab.selectedFontStyles = mPrimaryContrastBoldSmallTF.clone();
            tab.disabledFontStyles = mContrastBoldDisabledSmallTF.clone();
        }

        protected function setTabWithIconStyles( tab:ToggleButton ):void {
            var skin:FadeImageSkin = setBaseButtonStyles( tab, null, mTabWithIconTexture, COLOR_PRIMARY, COLOR_CONTRAST_DISABLED, 1 );
            skin.selectedTexture = mTabWithIconTexture;
            skin.setColorForState( ButtonState.DOWN, COLOR_CONTRAST_DISABLED );
            skin.setTextureForState( ButtonState.DISABLED_AND_SELECTED, mTabWithIconTexture );
            skin.fadeOutTransition = Transitions.EASE_OUT;
            skin.scale9Grid = TAB_WITH_ICON_SCALE9_GRID;
            skin.minHeight = mTabSize;
            skin.height = mTabSize;

            tab.paddingLeft = tab.paddingRight = mRegularPaddingSize;
            tab.gap = mSmallPaddingSize;
            tab.iconOffsetY = -2;
            tab.labelOffsetY = -2;
            tab.iconPosition = RelativePosition.TOP;

            tab.fontStyles = mContrastBoldSmallTF.clone();
            tab.selectedFontStyles = mPrimaryContrastBoldSmallTF.clone();
            tab.disabledFontStyles = mContrastBoldDisabledSmallTF.clone();
        }

        /**
         * Tab navigator
         */

        protected function setTabNavigatorWithIconsStyles( navigator:TabNavigator ):void {
            navigator.customTabBarStyleName = THEME_STYLE_NAME_TAB_NAVIGATOR_TAB_BAR_WITH_ICONS;
        }

        protected function setTabNavigatorTabBarStyles( tabBar:TabBar ):void {
            setBaseTabBarStyles( tabBar );

            tabBar.padding = mSmallPaddingSize;
        }

        protected function setTabNavigatorTabBarWithIconsStyles( tabBar:TabBar ):void {
            setTabNavigatorTabBarStyles( tabBar );

            tabBar.customTabStyleName = THEME_STYLE_NAME_TAB_WITH_ICON;
        }

        /**
         * Text area
         */

        protected function setTextAreaStyles( textArea:TextArea ):void {
            setScrollerStyles( textArea );

            var skin:FadeImageSkin = new FadeImageSkin( mTextInputUpTexture );
            skin.setTextureForState( TextInputState.FOCUSED, mTextInputFocusedTexture );
            skin.defaultColor = COLOR_CONTRAST;
            skin.scale9Grid = TEXT_INPUT_SCALE9_GRID;
            skin.width = mLargeControlSize * 2;
            skin.height = mLargeControlSize * 2;

            textArea.fontStyles = mContrastRegularTF.clone();
            textArea.disabledFontStyles = mContrastRegularDisabledTF.clone();

            textArea.padding = 0;
            textArea.backgroundSkin = skin;
            textArea.textEditorFactory = textAreaTextEditorFactory;
        }

        protected function setTextAreaTextEditorStyles( editor:TextFieldTextEditorViewPort ):void {
            editor.padding = 0;
            editor.paddingLeft = editor.paddingRight = mSmallPaddingSize >> 2;
            editor.focusPaddingLeft = editor.focusPaddingRight = mSmallPaddingSize >> 2;
        }

        /**
         * Text input
         */

        protected function setTextCalloutStyles( callout:TextCallout ):void {
            setCalloutStyles( callout );

            callout.fontStyles = mContrastRegularTF.clone();
            callout.fontStyles = mContrastRegularDisabledTF.clone();
        }

        /**
         * Text input
         */

        protected function setTextInputStyles( input:TextInput ):void {
            var skin:FadeImageSkin = new FadeImageSkin( mTextInputUpTexture );
            skin.setTextureForState( TextInputState.FOCUSED, mTextInputFocusedTexture );
            skin.defaultColor = COLOR_CONTRAST;
            skin.scale9Grid = TEXT_INPUT_SCALE9_GRID;
            skin.minWidth = mControlSize;
            skin.minHeight = mControlSize;
            skin.width = mControlSize;
            skin.height = mControlSize;

            input.backgroundSkin = skin;

            setBaseTextInputStyles( input );

            if( input is AutoComplete ) {
                setAutoCompleteStyles( input as AutoComplete );
            }
        }

        protected function setSearchTextInputStyles( input:TextInput ):void {
            var skin:FadeImageSkin = new FadeImageSkin( mSearchInputUpTexture );
            skin.setTextureForState( TextInputState.FOCUSED, mSearchInputFocusedTexture );
            skin.defaultColor = COLOR_CONTRAST;
            skin.scale9Grid = SEARCH_INPUT_SCALE9_GRID;
            skin.minWidth = mControlSize * 2;
            skin.minHeight = mControlSize;
            skin.width = mControlSize * 2;
            skin.height = mControlSize;
            skin.fadeOutTransition = Transitions.EASE_OUT;

            setBaseTextInputStyles( input );

            input.gap = mSmallPaddingSize;
            input.backgroundSkin = skin;
            input.paddingLeft = input.paddingRight = mRegularPaddingSize;

            var icon:Image = new Image( mSearchIconTexture );
            icon.color = COLOR_CONTRAST;
            input.defaultIcon = icon;

            if( input is AutoComplete ) {
                setAutoCompleteStyles( input as AutoComplete );
            }
        }

        protected function setTextInputTextEditorStyles( textEditor:StageTextTextEditor ):void {
            textEditor.fontFamily = "Arial";
            textEditor.fontSize = mRegularFontSize;
            textEditor.color = COLOR_CONTRAST;
            textEditor.disabledColor = COLOR_CONTRAST_DISABLED;
        }

        /**
         * ToggleSwitch
         */

        protected function setToggleSwitchStyles( toggle:ToggleSwitch ):void {
            toggle.paddingLeft = toggle.paddingRight = 0.5;
            toggle.showLabels = false;
            toggle.trackLayoutMode = TrackLayoutMode.SINGLE;
            toggle.toggleThumbSelection = true;
            toggle.minTouchWidth = toggle.minTouchHeight = mControlSize;
            toggle.isQuickHitAreaEnabled = true;
            toggle.toggleDuration = 0.4;
            /* Use ToggleButton so that the thumb can have different skin for on and off states */
            toggle.thumbFactory = function():Button {
                return new ToggleButton();
            };
            toggle.onTrackFactory = function():Button {
                return new UniflatToggleSwitchTrack( mToggleSwitchTrackTexture, COLOR_PRIMARY, COLOR_CONTRAST, COLOR_CONTRAST_DISABLED );
            };
        }

        protected function setToggleSwitchTrackStyles( track:Button ):void {
            /* Invisible skin for measurements */
            var invisibleBackground:Quad = new Quad( 50, 28 );
            invisibleBackground.alpha = 0;

            track.defaultSkin = invisibleBackground;
            track.maxWidth = 50;
            track.hasLabelTextRenderer = false;
            track.minTouchWidth = track.minTouchHeight = mControlSize;
        }

        protected function setToggleSwitchThumbStyles( thumb:Button ):void {
            var skin:Image = new Image( mToggleSwitchThumbTexture );
            skin.color = COLOR_PRIMARY_CONTRAST;
            thumb.defaultSkin = skin;
            thumb.hasLabelTextRenderer = false;
            thumb.isQuickHitAreaEnabled = true;
            thumb.minTouchWidth = thumb.minTouchHeight = mControlSize;
        }

	    /**
	     * Tree
	     */

	    protected function setTreeStyles( tree:Tree ):void {
		    this.setScrollerStyles( tree );
		    const backgroundSkin:Image = new Image( mBackgroundPlainTexture );
		    backgroundSkin.scale9Grid = BACKGROUND_SCALE9_GRID;
		    tree.backgroundSkin = backgroundSkin;
	    }

	    protected function setTreeItemRendererStyles( renderer:DefaultTreeItemRenderer ):void {
		    this.setItemRendererStyles( renderer );

		    renderer.gap = mSmallPaddingSize;
		    renderer.minGap = mSmallPaddingSize;
		    renderer.indentation = mTreeDisclosureOpenIconTexture.width;

		    var disclosureOpenIcon:ImageSkin = new ImageSkin( mTreeDisclosureOpenIconTexture );
		    disclosureOpenIcon.scale = 0.75;
		    disclosureOpenIcon.defaultColor = COLOR_CONTRAST;
		    disclosureOpenIcon.minTouchWidth = mSmallControlSize;
		    disclosureOpenIcon.minTouchHeight = mSmallControlSize;
		    renderer.disclosureOpenIcon = disclosureOpenIcon;

		    var disclosureClosedIcon:ImageSkin = new ImageSkin( mTreeDisclosureClosedIconTexture );
		    disclosureClosedIcon.scale = 0.75;
		    disclosureClosedIcon.defaultColor = COLOR_CONTRAST;
		    disclosureClosedIcon.minTouchWidth = mSmallControlSize;
		    disclosureClosedIcon.minTouchHeight = mSmallControlSize;
		    renderer.disclosureClosedIcon = disclosureClosedIcon;
	    }

        /**
         *
         *
         * Media controls
         *
         *
         */

        protected function setSeekSliderStyles( slider:SeekSlider ):void {
            slider.minHeight = 20;
            slider.minimumPadding = slider.maximumPadding = -2;
            slider.trackLayoutMode = TrackLayoutMode.SPLIT;
        }

        protected function setSeekSliderThumbStyles( thumb:Button ):void {
            var skin:Image = new Image( mSeekSliderThumbTexture );
            skin.color = COLOR_PRIMARY_CONTRAST;
            skin.width = skin.height = 20;
            thumb.defaultSkin = skin;
            thumb.hasLabelTextRenderer = false;
            thumb.isQuickHitAreaEnabled = true;
            thumb.minTouchWidth = thumb.minTouchHeight = mControlSize;
        }

        protected function setSeekSliderMinimumTrackStyles( track:Button ):void {
            var skin:Image = new Image( mSeekSliderTrackTexture );
            skin.color = COLOR_CONTRAST;
            skin.scale9Grid = SLIDER_HORIZONTAL_SCALE9_GRID;
            skin.width = skin.height = 2;

            track.defaultSkin = skin;
            track.hasLabelTextRenderer = false;
        }

        protected function setSeekSliderMaximumTrackStyles( track:Button ):void {
            var skin:Image = new Image( mSeekSliderTrackTexture );
            skin.color = COLOR_CONTRAST_DISABLED;
            skin.scale9Grid = SLIDER_HORIZONTAL_SCALE9_GRID;
            skin.width = skin.height = 2;

            track.defaultSkin = skin;
            track.hasLabelTextRenderer = false;
        }

        /**
         * Play/pause button
         */

        protected function setPlayPauseToggleButtonStyles( button:PlayPauseToggleButton ):void {
            setHeaderQuietButtonIconOnlyStyles( button );

            var icon:ImageSkin = new ImageSkin( mPlayIconTexture );
            icon.selectedTexture = mPauseIconTexture;
            icon.defaultColor = COLOR_CONTRAST;
            icon.setColorForState( ButtonState.UP, COLOR_CONTRAST );
            icon.setColorForState( ButtonState.UP_AND_SELECTED, COLOR_CONTRAST );
            icon.setColorForState( ButtonState.DOWN, COLOR_PRIMARY_CONTRAST );
            icon.setColorForState( ButtonState.DOWN_AND_SELECTED, COLOR_PRIMARY_CONTRAST );
            icon.setTextureForState( ButtonState.DOWN, mPlayIconTexture );
            icon.setTextureForState( ButtonState.DOWN_AND_SELECTED, mPauseIconTexture );

            button.defaultIcon = icon;
            button.hasLabelTextRenderer = false;
        }

        /**
         * Mute button
         */

        protected function setMuteToggleButtonStyles( button:MuteToggleButton ):void {
            setHeaderQuietButtonIconOnlyStyles( button );

            var icon:ImageSkin = new ImageSkin( mVolumeUpIconTexture );
            icon.selectedTexture = mVolumeDownIconTexture;
            icon.defaultColor = COLOR_CONTRAST;
            icon.setColorForState( ButtonState.UP, COLOR_CONTRAST );
            icon.setColorForState( ButtonState.UP_AND_SELECTED, COLOR_CONTRAST );
            icon.setColorForState( ButtonState.DOWN, COLOR_PRIMARY_CONTRAST );
            icon.setColorForState( ButtonState.DOWN_AND_SELECTED, COLOR_PRIMARY_CONTRAST );
            icon.setTextureForState( ButtonState.DOWN, mVolumeUpIconTexture );
            icon.setTextureForState( ButtonState.DOWN_AND_SELECTED, mVolumeDownIconTexture );

            button.defaultIcon = icon;
            button.hasLabelTextRenderer = false;
            button.showVolumeSliderOnHover = false;
        }

        /**
         * Full screen button
         */

        protected function setFullScreenToggleButtonStyles( button:FullScreenToggleButton ):void {
            setHeaderQuietButtonIconOnlyStyles( button );

            var icon:ImageSkin = new ImageSkin( mFullScreenEnterIconTexture );
            icon.selectedTexture = mFullScreenExitIconTexture;
            icon.defaultColor = COLOR_CONTRAST;
            icon.setColorForState( ButtonState.UP, COLOR_CONTRAST );
            icon.setColorForState( ButtonState.UP_AND_SELECTED, COLOR_CONTRAST );
            icon.setColorForState( ButtonState.DOWN, COLOR_PRIMARY_CONTRAST );
            icon.setColorForState( ButtonState.DOWN_AND_SELECTED, COLOR_PRIMARY_CONTRAST );
            icon.setTextureForState( ButtonState.DOWN, mFullScreenEnterIconTexture );
            icon.setTextureForState( ButtonState.DOWN_AND_SELECTED, mFullScreenExitIconTexture );

            button.defaultIcon = icon;
            button.hasLabelTextRenderer = false;
        }

        /**
         * Time label
         */

        protected function setTimeLabelStyles( label:TimeLabel ):void {
            label.fontStyles = mContrastBoldSmallTF.clone();
        }

        /**
         * Volume slider
         */

        protected function setVolumeSliderStyles( slider:VolumeSlider ):void {
            slider.maximumPadding = slider.minimumPadding = -2;
            slider.direction = Direction.HORIZONTAL;
            slider.trackLayoutMode = TrackLayoutMode.SPLIT;
            slider.minHeight = 20;
            slider.minTouchWidth = slider.minTouchWidth = mControlSize;
        }

        protected function setVolumeSliderThumbStyles( thumb:Button ):void {
            var skin:Image = new Image( mVolumeSliderThumbTexture );
            skin.color = COLOR_PRIMARY_CONTRAST;
            skin.width = skin.height = 20;
            thumb.defaultSkin = skin;
            thumb.hasLabelTextRenderer = false;
            thumb.isQuickHitAreaEnabled = true;
            thumb.minTouchWidth = thumb.minTouchHeight = mControlSize;
        }

        protected function setVolumeSliderMinimumTrackStyles( track:Button ):void {
            var skin:Image = new Image( mVolumeSliderTrackTexture );
            skin.color = COLOR_CONTRAST;
            skin.scale9Grid = SLIDER_HORIZONTAL_SCALE9_GRID;
            track.defaultSkin = skin;
            track.hasLabelTextRenderer = false;
        }

        protected function setVolumeSliderMaximumTrackStyles( track:Button ):void {
            var skin:Image = new Image( mVolumeSliderTrackTexture );
            skin.color = COLOR_CONTRAST_DISABLED;
            skin.scale9Grid = SLIDER_HORIZONTAL_SCALE9_GRID;
            track.defaultSkin = skin;
            track.hasLabelTextRenderer = false;
        }

        /**
         *
         *
         * Shared
         *
         *
         */

        protected function scaleButtonIcon( button:Button, scalar:Number = 1.0 ):void {
            var icon:DisplayObject = button.defaultIcon;
            if( icon ) {
                icon.scale = scalar;
            }
            var toggleButton:ToggleButton = button as ToggleButton;
            if( toggleButton ) {
                icon = toggleButton.defaultSelectedIcon;
                if( icon ) {
                    icon.scale = scalar;
                }
            }
        }

        protected function tintButtonIcon( button:Button, upColor:int, downColor:int = -1, disabledColor:int = -1 ):void {
            var iconSkin:ImageSkin = button.defaultIcon as ImageSkin;
            if( iconSkin !== null ) {
                if( downColor >= 0 && button.downIcon === null) {
                    iconSkin.setColorForState( ButtonState.DOWN, downColor );
                }
                if( disabledColor >= 0 && button.disabledIcon === null) {
                    iconSkin.setColorForState( ButtonState.DISABLED, disabledColor );
                }
                iconSkin.defaultColor = upColor;
            }
            var toggleButton:ToggleButton = button as ToggleButton;
            if( toggleButton ) {
                var icon:Image = toggleButton.defaultSelectedIcon as Image;
                if( icon ) {
                    icon.color = upColor;
                }
            }
        }

        protected function setScrollerStyles( scroller:Scroller ):void {
            scroller.verticalScrollBarFactory = scrollBarFactory;
            scroller.horizontalScrollBarFactory = scrollBarFactory;
            scroller.hasElasticEdges = false;
        }

        protected function setBaseTextInputStyles( input:TextInput ):void {
            input.paddingTop = 0;
            input.paddingLeft = 2;
            input.paddingRight = 2;

            input.fontStyles = mContrastRegularTF.clone();
            input.disabledFontStyles = mContrastRegularDisabledTF.clone();
            input.promptFontStyles = mContrastRegularTF.clone();
            input.promptDisabledFontStyles = mContrastRegularDisabledTF.clone();
        }

        /**
         *
         *
         * Font renderers / factories
         *
         *
         */

        protected function textRendererFactory():TextBlockTextRenderer {
            const renderer:TextBlockTextRenderer = new TextBlockTextRenderer();
            var style:FontStylesSet = new FontStylesSet();
            style.format = mPrimaryContrastBoldTF.clone();
            renderer.fontStyles = style;
            return renderer;
        }

        protected function popUpOverlayFactory():DisplayObject {
            var overlaySkin:Image = new Image( mBackgroundPlainOverlayTexture );
            overlaySkin.color = COLOR_CONTRAST;
            overlaySkin.scale9Grid = BACKGROUND_SCALE9_GRID;
            return overlaySkin;
        }

        protected function imageLoaderFactory():ImageLoader {
            var image:ImageLoader = new ImageLoader();
            image.color = COLOR_CONTRAST;
            return image;
        }

        protected function scrollBarFactory():SimpleScrollBar {
            return new SimpleScrollBar();
        }

        protected function textEditorFactory():ITextEditor {
            return new StageTextTextEditor();
        }

        protected function textAreaTextEditorFactory():ITextEditorViewPort {
            return new TextFieldTextEditorViewPort();
        }

        protected function stepperTextEditorFactory():TextBlockTextEditor {
            return new TextBlockTextEditor();
        }

        protected function pageIndicatorNormalSymbolFactory():DisplayObject {
            var icon:Image = new Image( mPageIndicatorTexture );
            icon.color = COLOR_CONTRAST_DISABLED;
            return icon;
        }

        protected function pageIndicatorSelectedSymbolFactory():DisplayObject {
            var icon:Image = new Image( mPageIndicatorTexture );
            icon.color = COLOR_CONTRAST;
            return icon;
        }

        protected function dataGridHeaderDividerFactory():DisplayObject {
            var skin:ImageSkin = new ImageSkin( mDataGridHeaderDividerTexture );
            skin.scale9Grid = DATA_GRID_DIVIDER_SCALE9_GRID;
            skin.minTouchWidth = mControlSize;
            skin.defaultColor = COLOR_STAGE;
            skin.width = 1;
            return skin;
        }

        protected function dataGridVerticalDividerFactory():DisplayObject {
            var skin:Image = new Image( mDataGridCellDividerTexture );
            skin.scale9Grid = DATA_GRID_DIVIDER_SCALE9_GRID;
            skin.width = 1;
            skin.color = COLOR_BACKGROUND;
            return skin;
        }

        override public function dispose():void {
            if( mAtlas ) {
                mAtlas.dispose();
                mAtlas = null;
            }

            super.dispose();
        }

    }

}

import feathers.controls.Button;
import feathers.controls.ButtonState;
import feathers.controls.ToggleButton;
import feathers.controls.ToggleSwitch;
import feathers.core.IFeathersControl;
import feathers.core.IMeasureDisplayObject;
import feathers.core.IStateContext;
import feathers.core.IStateObserver;
import feathers.core.IToggle;
import feathers.events.FeathersEventType;

import flash.geom.Rectangle;

import starling.animation.Juggler;
import starling.animation.Transitions;
import starling.core.Starling;
import starling.display.DisplayObjectContainer;
import starling.display.Image;
import starling.events.Event;
import starling.textures.Texture;

/**
 * Custom ToggleButton for TabBar - changes color of its icon (if exists) when selection state changes.
 */
class CustomTab extends ToggleButton {

    private const JUGGLER:Juggler = Starling.juggler;

    private var mUpColor:uint;
    private var mSelectedColor:uint;
    private var mDisabledColor:uint;

    public function CustomTab( upColor:uint, selectedColor:uint, disabledColor:uint ) {
        super();

        mUpColor = upColor;
        mSelectedColor = selectedColor;
        mDisabledColor = disabledColor;
    }

    override public function set isSelected( value:Boolean ):void {
        super.isSelected = value;

        var icon:Image = defaultIcon as Image;
        if( icon !== null ) {
            var iconColor:uint = _isSelected ? (_isEnabled ? mSelectedColor : mDisabledColor) : mUpColor;
            if( icon.color != iconColor ) {
                JUGGLER.tween( icon, 0.5, {
                    color: iconColor,
                    transition: Transitions.EASE_OUT
                } );
            }
        }
    }

    override public function set isEnabled( value:Boolean ):void {
        super.isEnabled = value;

        var icon:Image = defaultIcon as Image;
        if( icon !== null ) {
            var iconColor:uint = _isEnabled ? (_isSelected ? mSelectedColor : mUpColor) : mDisabledColor;
            if( icon.color != iconColor ) {
                JUGGLER.tween( icon, 0.5, {
                    color: iconColor,
                    transition: Transitions.EASE_OUT
                } );
            }
        }
    }

}

class UniflatToggleSwitchTrack extends Button {

    private const JUGGLER:Juggler = Starling.juggler;

    private var mOnColor:uint;
    private var mOffColor:uint;
    private var mDisabledColor:uint;
    private var mBaseTexture:Texture;

    private var mOnTrackSkin:Image;
    private var mOffTrackSkin:Image;
    private var mDisabledTrackSkin:Image;
    private var mOnTrackTween:uint;
    private var mOffTrackTween:uint;

    public function UniflatToggleSwitchTrack( baseTexture:Texture, onColor:uint, offColor:uint, disabledColor:uint ) {
        super();

        mBaseTexture = baseTexture;
        mOnColor = onColor;
        mOffColor = offColor;
        mDisabledColor = disabledColor;

        addEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
    }

    private function onAddedToStage( event:Event ):void {
        removeEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
        addEventListener( Event.REMOVED_FROM_STAGE, onRemovedFromStage );

        parent.addEventListener( Event.CHANGE, onToggleSwitchChanged );
    }

    private function onRemovedFromStage():void {
        removeEventListener( Event.REMOVED_FROM_STAGE, onRemovedFromStage );
        addEventListener( Event.ADDED_TO_STAGE, onAddedToStage );

        parent.removeEventListener( Event.CHANGE, onToggleSwitchChanged );
    }

    private function onToggleSwitchChanged( event:Event ):void {
        var parent:ToggleSwitch = ToggleSwitch( this.parent );
        if( parent === null ) return; // Should not happen

        if( mOffTrackSkin.parent === null ) {
            addChildAt( mOffTrackSkin, 0 );
        }
        if( parent.isSelected ) {
            mOnTrackSkin.scaleX = mOnTrackSkin.scaleY = mOnTrackSkin.alpha = 0.0;
            addChild( mOnTrackSkin );
            removePreviousTweens();
            mOffTrackTween = JUGGLER.tween( mOffTrackSkin, 0.5, {
                transition: Transitions.EASE_IN,
                alpha     : 0
            } );
            mOnTrackTween = JUGGLER.tween( mOnTrackSkin, 0.5, {
                transition: Transitions.EASE_OUT,
                scaleX    : 1,
                scaleY    : 1,
                alpha     : 1
            } );
        } else {
            removePreviousTweens();
            mOnTrackTween = JUGGLER.tween( mOnTrackSkin, 0.7, {
                transition: Transitions.EASE_OUT,
                scaleX    : 0,
                scaleY    : 0,
                alpha     : 0,
                onComplete: mOnTrackSkin.removeFromParent
            } );
            mOffTrackTween = JUGGLER.tween( mOffTrackSkin, 0.1, {
                transition: Transitions.EASE_OUT,
                alpha     : 1
            } );
        }
    }

    private function removePreviousTweens():void {
        if( mOnTrackTween > 0 ) {
            JUGGLER.removeByID( mOnTrackTween );
            mOnTrackTween = 0;
        }
        if( mOffTrackTween > 0 ) {
            JUGGLER.removeByID( mOffTrackTween );
            mOffTrackTween = 0;
        }
    }

    private function updateTracks():void {
        var toggleSwitch:ToggleSwitch = ToggleSwitch( parent );
        addChildAt( mOffTrackSkin, 0 );
        /* Add 'on' track to display list if the switch is selected */
        if( toggleSwitch !== null ) {
            if( toggleSwitch.isEnabled ) {
                if( toggleSwitch.isSelected ) {
                    removeChildAt( 0 );
                    addChild( mOnTrackSkin );
                }
                removeChild( mDisabledTrackSkin );
            } else {
                removeChildAt( 0 );
                addChild( mDisabledTrackSkin );
                removeChild( mOnTrackSkin );
            }
        }
    }

    override protected function initialize():void {
        super.initialize();

        mOnTrackSkin = new Image( mBaseTexture );
        mOnTrackSkin.color = mOnColor;
        mOnTrackSkin.width = 50;
        mOnTrackSkin.height = 28;
        mOnTrackSkin.x = mOnTrackSkin.pivotX = mBaseTexture.width * 0.5;
        mOnTrackSkin.y = mOnTrackSkin.pivotY = mBaseTexture.height * 0.5;

        mOffTrackSkin = new Image( mBaseTexture );
        mOffTrackSkin.color = mOffColor;
        mOffTrackSkin.width = 50;
        mOffTrackSkin.height = 28;

        mDisabledTrackSkin = new Image( mBaseTexture );
        mDisabledTrackSkin.color = mDisabledColor;
        mDisabledTrackSkin.width = 50;
        mDisabledTrackSkin.height = 28;

        updateTracks();
    }

    override protected function draw():void {
        if( isInvalid( INVALIDATION_FLAG_STATE ) ) {
            if( mOnTrackSkin ) {
                updateTracks();
            }
        }

        super.draw();
    }

    override public function dispose():void {
        removeEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
        removeEventListener( Event.REMOVED_FROM_STAGE, onRemovedFromStage );

        mBaseTexture = null;
        mOnTrackSkin = null;
        mOffTrackSkin = null;
        mDisabledTrackSkin = null;

        super.dispose();
    }

}

/*
 Original work Copyright 2012-2016 Bowler Hat LLC. All rights reserved.
 Modified work Copyright 2016 Marcel Piestansky

 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:

 1. Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.

 2. Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

 The views and conclusions contained in the software and documentation are those
 of the authors and should not be interpreted as representing official policies,
 either expressed or implied, of the copyright holders.
 */
/**
 * A skin for Feathers components that displays a texture. Has the ability
 * to change its texture based on the current state of the Feathers
 * component that is being skinned. Uses two Image objects to achieve
 * a fading effect when the state skin changes.
 *
 * <listing version="3.0">
 * function setButtonSkin( button:Button ):void
 * {
	 *     var skin:FadeImageSkin = new FadeImageSkin( upTexture );
	 *     skin.setTextureForState( ButtonState.DOWN, downTexture );
	 *     skin.setTextureForState( ButtonState.HOVER, hoverTexture );
	 *     button.defaultSkin = skin;
	 * }
 *
 * var button:Button = new Button();
 * button.label = "Click Me";
 * button.styleProvider = new AddOnFunctionStyleProvider( setButtonSkin, button.styleProvider );
 * this.addChild( button );</listing>
 */
class FadeImageSkin extends DisplayObjectContainer implements IMeasureDisplayObject, IStateObserver {

    protected const JUGGLER:Juggler = Starling.juggler;

    protected var mExplicitWidth:Number;
    protected var mExplicitHeight:Number;
    protected var mExplicitMinWidth:Number;
    protected var mExplicitMinHeight:Number;
    protected var mExplicitMaxWidth:Number = Number.POSITIVE_INFINITY;
    protected var mExplicitMaxHeight:Number = Number.POSITIVE_INFINITY;
    protected var mPreviousState:String;
    protected var mPreviousSkinTweenID:uint;
    protected var mActiveSkinTweenID:uint;
    protected var mColorTweenID:uint;
    protected var mToggleTransitionDC:uint;
    protected var mFadeInDuration:Number;
    protected var mFadeInTransition:String;
    protected var mFadeOutDuration:Number;
    protected var mFadeOutTransition:String;
    protected var mTweenColorChange:Boolean;
    protected var mColorTweenDuration:Number;
    protected var mColorTweenTransition:String;

    protected var mStateContext:IStateContext;
    protected var mStateToTexture:Object;
    protected var mStateToColor:Object = {};
    protected var mScale9Grid:Rectangle;

    protected var mDefaultTexture:Texture;
    protected var mDisabledTexture:Texture;
    protected var mSelectedTexture:Texture;

    protected var mDefaultColor:uint;
    protected var mDisabledColor:uint;
    protected var mSelectedColor:uint;

    protected var mPrevSkin:Image;
    protected var mActiveSkin:Image;

    public function FadeImageSkin( texture:Texture ) {
        super();

        mDefaultTexture = texture;
        mFadeInDuration = mFadeOutDuration = mColorTweenDuration = 0.5;
        mFadeInTransition = mColorTweenTransition = Transitions.EASE_OUT;
        mFadeOutTransition = Transitions.EASE_IN;
        mDefaultColor = uint.MAX_VALUE;
        mDisabledColor = uint.MAX_VALUE;
        mSelectedColor = uint.MAX_VALUE;

        mStateToTexture = {};
    }

    /**
     *
     *
     * Public API
     *
     *
     */

    /**
     * Gets the texture to be used by the skin when the context's
     * <code>currentState</code> property matches the specified state value.
     *
     * <p>If a texture is not defined for a specific state, returns
     * <code>null</code>.</p>
     *
     * @see #setTextureForState()
     */
    public function getTextureForState( state:String ):Texture {
        return mStateToTexture[state] as Texture;
    }

    /**
     * Sets the texture to be used by the skin when the context's
     * <code>currentState</code> property matches the specified state value.
     *
     * <p>If a texture is not defined for a specific state, the value of the
     * <code>defaultTexture</code> property will be used instead.</p>
     *
     * @see #defaultTexture
     */
    public function setTextureForState( state:String, texture:Texture ):void {
        if( texture !== null ) {
            mStateToTexture[state] = texture;
        } else {
            delete mStateToTexture[state];
        }
        updateTextureFromContext();
    }

    /**
     * Gets the color to be used by the skin when the context's
     * <code>currentState</code> property matches the specified state value.
     *
     * <p>If a color is not defined for a specific state, returns
     * <code>uint.MAX_VALUE</code>.</p>
     *
     * @see #setColorForState()
     */
    public function getColorForState( state:String ):uint {
        if( state in mStateToColor ) {
            return mStateToColor[state] as uint;
        }
        return uint.MAX_VALUE;
    }

    /**
     * Sets the color to be used by the skin when the context's
     * <code>currentState</code> property matches the specified state value.
     *
     * <p>If a color is not defined for a specific state, the value of the
     * <code>defaultTexture</code> property will be used instead.</p>
     *
     * <p>To clear a state's color, pass in <code>uint.MAX_VALUE</code>.</p>
     *
     * @see #defaultColor
     * @see #getColorForState()
     */
    public function setColorForState( state:String, color:uint ):void {
        if( color !== uint.MAX_VALUE ) {
            mStateToColor[state] = color;
        } else {
            delete mStateToColor[state];
        }
        updateColorFromContext();
    }

    /**
     *
     *
     * Private API
     *
     *
     */

    private function getImage( texture:Texture, image:Image ):Image {
        if( image ) {
            image.texture = texture;
        } else {
            image = new Image( texture );
        }
        if( mScale9Grid !== null && (image.scale9Grid === null || !image.scale9Grid.equals( mScale9Grid )) ) {
            image.scale9Grid = mScale9Grid;
        }
        return image;
    }

    private function resizeImage( image:Image ):void {
        if( mExplicitWidth === mExplicitWidth && //!isNaN
                image.width !== mExplicitWidth ) {
            image.width = mExplicitWidth;
        }
        if( mExplicitHeight === mExplicitHeight && //!isNaN
                image.height !== mExplicitHeight ) {
            image.height = mExplicitHeight;
        }
    }

    private function delayedTransition():void {
        mToggleTransitionDC = 0;
        updateTextureFromContext();
        updateColorFromContext();
    }

    /**
     *
     *
     * Protected API
     *
     *
     */

    protected function updateTextureFromContext():void {
        if( mStateContext === null ) {
            if( mDefaultTexture !== null && mActiveSkin === null ) {
                mActiveSkin = new Image( mDefaultTexture );
                addChildAt( mActiveSkin, 0 );
            }
            return;
        }
        var currentState:String = mStateContext.currentState;
        if( mPreviousState !== currentState ) {
            var texture:Texture = mStateToTexture[currentState] as Texture;
            if( texture === null &&
                    mDisabledTexture !== null &&
                    mStateContext is IFeathersControl && !IFeathersControl( mStateContext ).isEnabled ) {
                texture = mDisabledTexture;
            }
            var isToggle:Boolean = mStateContext is IToggle;
            if( texture === null &&
                    mSelectedTexture !== null &&
                    isToggle &&
                    IToggle( mStateContext ).isSelected ) {
                texture = mSelectedTexture;
            }
            if( texture === null ) {
                texture = mDefaultTexture;
            }

            /* By default, state change from DOWN to UP_AND_SELECTED has this flow:
             *  DOWN -> UP -> UP_AND_SELECTED
             * This delayed call prevents immediate change to UP state when it is not needed.
             * Is there a better way to prevent it? Please, show me. */
            if( mToggleTransitionDC > 0 ) {
                JUGGLER.removeByID( mToggleTransitionDC );
                mToggleTransitionDC = 0;
            }
            if( isToggle &&
                    (((mPreviousState == ButtonState.DOWN && currentState == ButtonState.UP) ||
                    (mPreviousState == ButtonState.DOWN_AND_SELECTED && currentState == ButtonState.UP_AND_SELECTED)) ||
                    ((mPreviousState == ButtonState.DOWN && currentState == ButtonState.HOVER))) ) {
                mPreviousState = null;
                mToggleTransitionDC = JUGGLER.delayCall( delayedTransition, 0.05 );
                return;
            }

            mPreviousState = currentState;
            var prevSkin:Image = null;
            var activeSkin:Image = null;
            if( mActiveSkin !== null ) {
                /* Active image already has the texture we want to transition to */
                if( mActiveSkin.texture == texture ) return;
                /* The current skin becomes previous so that it can be faded out */
                if( mActiveSkin.texture !== null ) {
                    mPrevSkin = getImage( mActiveSkin.texture, mPrevSkin );
                    mPrevSkin.color = mActiveSkin.color;
                    mPrevSkin.width = mActiveSkin.width;
                    mPrevSkin.height = mActiveSkin.height;
                    addChildAt( mPrevSkin, 0 );
                    prevSkin = mPrevSkin;
                }
            } else if( mPrevSkin !== null ) {
                mPrevSkin.removeFromParent();
            }
            /* If there is a new skin then assign it to Image */
            if( texture !== null ) {
                mActiveSkin = getImage( texture, mActiveSkin );
                mActiveSkin.color = 0xFFFFFF;
                resizeImage( mActiveSkin );
                addChild( mActiveSkin );
                activeSkin = mActiveSkin;
            } else if( mActiveSkin !== null ) {
                mActiveSkin.removeFromParent();
                mActiveSkin.texture = null;
            }
            animate( activeSkin, prevSkin );
        }
    }

    protected function updateColorFromContext():void {
        if( mStateContext === null ) {
            if( mDefaultColor !== uint.MAX_VALUE && mActiveSkin !== null && mActiveSkin.texture !== null ) {
                mActiveSkin.color = mDefaultColor;
            }
            return;
        }
        var color:uint = uint.MAX_VALUE;
        var currentState:String = mStateContext.currentState;
        if( currentState in mStateToColor ) {
            color = mStateToColor[currentState] as uint;
        }
        if( color === uint.MAX_VALUE &&
                mDisabledColor !== uint.MAX_VALUE &&
                mStateContext is IFeathersControl && !IFeathersControl( mStateContext ).isEnabled ) {
            color = mDisabledColor;
        }
        if( color === uint.MAX_VALUE &&
                mSelectedColor !== uint.MAX_VALUE &&
                mStateContext is IToggle &&
                IToggle( mStateContext ).isSelected ) {
            color = mSelectedColor;
        }
        if( color === uint.MAX_VALUE ) {
            color = mDefaultColor;
        }
        if( color !== uint.MAX_VALUE && mActiveSkin !== null && mActiveSkin.texture !== null ) {
            if( mTweenColorChange ) {
                if( mColorTweenID > 0 ) {
                    JUGGLER.removeByID( mColorTweenID );
                }
                mColorTweenID = JUGGLER.tween( mActiveSkin, mColorTweenDuration, {
                    color: color,
                    transition: mColorTweenTransition,
                    onComplete: function():void {
                        mColorTweenID = 0;
                    }
                } );
            } else {
                mActiveSkin.color = color;
            }
        }
    }

    protected function animate( activeSkin:Image, prevSkin:Image ):void {
        if( prevSkin !== null ) {
            prevSkin.alpha = 1;
            if( mPreviousSkinTweenID > 0 ) {
                JUGGLER.removeByID( mPreviousSkinTweenID );
            }
            mPreviousSkinTweenID = JUGGLER.tween( prevSkin, mFadeOutDuration, {
                alpha: 0,
                transition: mFadeOutTransition,
                onComplete: function ():void {
                    mPreviousSkinTweenID = 0;
                }
            } );
        }
        if( activeSkin !== null ) {
            activeSkin.alpha = 0;
            if( mActiveSkinTweenID > 0 ) {
                JUGGLER.removeByID( mActiveSkinTweenID );
            }
            mActiveSkinTweenID = JUGGLER.tween( activeSkin, mFadeInDuration, {
                alpha: 1,
                transition: mFadeInTransition,
                onComplete: function ():void {
                    mActiveSkinTweenID = 0;
                }
            } );
        }
    }

    protected function onStateContextChanged():void {
        updateTextureFromContext();
        updateColorFromContext();
    }

    /**
     *
     *
     * Getters / Setters
     *
     *
     */

    /**
     * When the skin observes a state context, the skin may change its
     * <code>Texture</code> based on the current state of that context.
     * Typically, a relevant component will automatically assign itself as
     * the state context of its skin, so this property is considered to be
     * for internal use only.
     *
     * @default null
     *
     * @see #setTextureForState()
     */
    public function get stateContext():IStateContext {
        return mStateContext;
    }

    public function set stateContext( value:IStateContext ):void {
        if( mStateContext === value ) {
            return;
        }
        if( mStateContext ) {
            mStateContext.removeEventListener( FeathersEventType.STATE_CHANGE, onStateContextChanged );
        }
        mStateContext = value;
        if( mStateContext ) {
            mStateContext.addEventListener( FeathersEventType.STATE_CHANGE, onStateContextChanged );
        }
        updateTextureFromContext();
        updateColorFromContext();
    }

    /**
     * The value passed to the <code>width</code> property setter. If the
     * <code>width</code> property has not be set, returns <code>NaN</code>.
     *
     * @see #width
     */
    public function get explicitWidth():Number {
        return mExplicitWidth;
    }

    override public function set width( value:Number ):void {
        if( mExplicitWidth === value ) {
            return;
        }
        if( value !== value && mExplicitWidth !== mExplicitWidth ) {
            return;
        }
        mExplicitWidth = value;
        if( mActiveSkin !== null ) {
            if( value === value ) { //!isNaN
                mActiveSkin.width = value;
            } else { // return to the original width of the texture
                mActiveSkin.readjustSize();
            }
        }
        dispatchEventWith( Event.RESIZE );
    }

    override public function get width():Number {
        return mActiveSkin ? mActiveSkin.width : NaN;
    }

    /**
     * The value passed to the <code>height</code> property setter. If the
     * <code>height</code> property has not be set, returns
     * <code>NaN</code>.
     *
     * @see #height
     */
    public function get explicitHeight():Number {
        return mExplicitHeight;
    }

    override public function set height( value:Number ):void {
        if( mExplicitHeight === value ) {
            return;
        }
        if( value !== value && mExplicitHeight !== mExplicitHeight ) {
            return;
        }
        mExplicitHeight = value;
        if( mActiveSkin !== null ) {
            if( value === value ) { //!isNaN
                mActiveSkin.height = value;
            } else { //return to the original height of the texture
                mActiveSkin.readjustSize();
            }
        }
        dispatchEventWith( Event.RESIZE );
    }

    override public function get height():Number {
        return mActiveSkin ? mActiveSkin.height : NaN;
    }

    /**
     * The value passed to the <code>minWidth</code> property setter. If the
     * <code>minWidth</code> property has not be set, returns
     * <code>NaN</code>.
     *
     * @see #minWidth
     */
    public function get explicitMinWidth():Number {
        return mExplicitMinWidth;
    }

    public function get minWidth():Number {
        if( mExplicitMinWidth === mExplicitMinWidth ) { //!isNaN
            return mExplicitMinWidth;
        }
        return 0;
    }

    public function set minWidth( value:Number ):void {
        if( mExplicitMinWidth === value ) {
            return;
        }
        if( value !== value && mExplicitMinWidth !== mExplicitMinWidth ) {
            return;
        }
        mExplicitMinWidth = value;
        dispatchEventWith( Event.RESIZE );
    }

    /**
     * The value passed to the <code>maxWidth</code> property setter. If the
     * <code>maxWidth</code> property has not be set, returns
     * <code>NaN</code>.
     *
     * @see #maxWidth
     */
    public function get explicitMaxWidth():Number {
        return mExplicitMaxWidth;
    }

    /**
     * The maximum width of the component.
     */
    public function get maxWidth():Number {
        return mExplicitMaxWidth;
    }

    /**
     * @private
     */
    public function set maxWidth(value:Number):void {
        if( mExplicitMaxWidth === value ) {
            return;
        }
        if( value !== value && mExplicitMaxWidth !== mExplicitMaxWidth ) {
            return;
        }
        mExplicitMaxWidth = value;
        dispatchEventWith( Event.RESIZE );
    }

    /**
     * The value passed to the <code>minHeight</code> property setter. If
     * the <code>minHeight</code> property has not be set, returns
     * <code>NaN</code>.
     *
     * @see #minHeight
     */
    public function get explicitMinHeight():Number {
        return mExplicitMinHeight;
    }

    public function get minHeight():Number {
        if( mExplicitMinHeight === mExplicitMinHeight ) { //!isNaN
            return mExplicitMinHeight;
        }
        return 0;
    }

    public function set minHeight( value:Number ):void {
        if( mExplicitMinHeight === value ) {
            return;
        }
        if( value !== value && mExplicitMinHeight !== mExplicitMinHeight ) {
            return;
        }
        mExplicitMinHeight = value;
        dispatchEventWith( Event.RESIZE );
    }

    /**
     * The value passed to the <code>maxHeight</code> property setter. If
     * the <code>maxHeight</code> property has not be set, returns
     * <code>NaN</code>.
     *
     * @see #maxHeight
     */
    public function get explicitMaxHeight():Number {
        return mExplicitMaxHeight;
    }

    /**
     * The maximum height of the component.
     */
    public function get maxHeight():Number {
        return mExplicitMaxHeight;
    }

    /**
     * @private
     */
    public function set maxHeight(value:Number):void {
        if( mExplicitMaxHeight === value ) {
            return;
        }
        if( value !== value && mExplicitMaxHeight !== mExplicitMaxHeight ) {
            return;
        }
        mExplicitMaxHeight = value;
        dispatchEventWith( Event.RESIZE );
    }

    /**
     * The default texture that the skin will display. If the component
     * being skinned supports states, the texture for a specific state may
     * be specified using the <code>setTextureForState()</code> method. If
     * no texture has been specified for the current state, the default
     * texture will be used.
     *
     * <p>In the following example, the default texture is specified in the
     * constructor:</p>
     *
     * <listing version="3.0">
     * var skin:FadeImageSkin = new FadeImageSkin( texture );</listing>
     *
     * <p>In the following example, the default texture is specified by
     * setting the property:</p>
     *
     * <listing version="3.0">
     * var skin:FadeImageSkin = new FadeImageSkin();
     * skin.defaultTexture = texture;</listing>
     *
     * @default null
     *
     * @see #disabledTexture
     * @see #selectedTexture
     * @see #setTextureForState()
     * @see http://doc.starling-framework.org/current/starling/textures/Texture.html starling.textures.Texture
     */
    public function get defaultTexture():Texture {
        return mDefaultTexture;
    }

    /**
     * @private
     */
    public function set defaultTexture( value:Texture ):void {
        if( mDefaultTexture === value ) {
            return;
        }
        mDefaultTexture = value;
        updateTextureFromContext();
    }

    /**
     * The texture to display when the <code>stateContext</code> is
     * an <code>IFeathersControl</code> and its <code>isEnabled</code>
     * property is <code>false</code>. If a texture has been specified for
     * the context's current state with <code>setTextureForState()</code>,
     * it will take precedence over the <code>disabledTexture</code>.
     *
     * <p>In the following example, the disabled texture is changed:</p>
     *
     * <listing version="3.0">
     * var skin:FadeImageSkin = new FadeImageSkin( upTexture );
     * skin.disabledTexture = disabledTexture;
     * button.skin = skin;
     * button.isEnabled = false;</listing>
     *
     * @default null
     *
     * @see #defaultTexture
     * @see #selectedTexture
     * @see #setTextureForState()
     * @see http://doc.starling-framework.org/current/starling/textures/Texture.html starling.textures.Texture
     */
    public function get disabledTexture():Texture {
        return mDisabledTexture;
    }

    /**
     * @private
     */
    public function set disabledTexture( value:Texture ):void {
        mDisabledTexture = value;
    }

    /**
     * The texture to display when the <code>stateContext</code> is
     * an <code>IToggle</code> instance and its <code>isSelected</code>
     * property is <code>true</code>. If a texture has been specified for
     * the context's current state with <code>setTextureForState()</code>,
     * it will take precedence over the <code>selectedTexture</code>.
     *
     * <p>In the following example, the selected texture is changed:</p>
     *
     * <listing version="3.0">
     * var skin:FadeImageSkin = new FadeImageSkin( upTexture );
     * skin.selectedTexture = selectedTexture;
     * toggleButton.skin = skin;
     * toggleButton.isSelected = true;</listing>
     *
     * @default null
     *
     * @see #defaultTexture
     * @see #disabledTexture
     * @see #setTextureForState()
     * @see http://doc.starling-framework.org/current/starling/textures/Texture.html starling.textures.Texture
     */
    public function get selectedTexture():Texture {
        return mSelectedTexture;
    }

    /**
     * @private
     */
    public function set selectedTexture( value:Texture ):void {
        mSelectedTexture = value;
    }

    /**
     * Scaling grid used for the internal images.
     *
     * @see http://doc.starling-framework.org/current/starling/display/Image.html#scale9Grid starling.display.Image
     */
    public function get scale9Grid():Rectangle {
        return mScale9Grid;
    }

    /**
     * @private
     */
    public function set scale9Grid( value:Rectangle ):void {
        mScale9Grid = value;

        if( mActiveSkin !== null ) {
            mActiveSkin.scale9Grid = value;
        }
    }

    /**
     * The duration of the fade in Tween, in seconds.
     *
     * @default 0.5
     */
    public function get fadeInDuration():Number {
        return mFadeInDuration;
    }

    /**
     * @private
     */
    public function set fadeInDuration( value:Number ):void {
        mFadeInDuration = value;
    }

    /**
     * The duration of the fade out Tween, in seconds.
     *
     * @default 0.5
     */
    public function get fadeOutDuration():Number {
        return mFadeOutDuration;
    }

    /**
     * @private
     */
    public function set fadeOutDuration( value:Number ):void {
        mFadeOutDuration = value;
    }

    /**
     * Name of the transition used to fade in current skin.
     *
     * @default starling.animation.Transitions.EASE_OUT
     *
     * @see http://doc.starling-framework.org/current/starling/animation/Transitions.html starling.animation.Transitions
     */
    public function get fadeInTransition():String {
        return mFadeInTransition;
    }

    /**
     * @private
     */
    public function set fadeInTransition( value:String ):void {
        mFadeInTransition = value;
    }

    /**
     * Name of the transition used to fade out previous skin.
     *
     * @default starling.animation.Transitions.EASE_IN
     *
     * @see http://doc.starling-framework.org/current/starling/animation/Transitions.html starling.animation.Transitions
     */
    public function get fadeOutTransition():String {
        return mFadeOutTransition;
    }

    /**
     * @private
     */
    public function set fadeOutTransition( value:String ):void {
        mFadeOutTransition = value;
    }

    /**
     * Determines if a color change is animated when component's state changes.
     * Useful when having a single skin texture for all states but various colors.
     *
     * @default false
     */
    public function get tweenColorChange():Boolean {
        return mTweenColorChange;
    }

    /**
     * @private
     */
    public function set tweenColorChange( value:Boolean ):void {
        mTweenColorChange = value;
    }

    /**
     * Duration of the tween that changes the skin color.
     *
     * @default 0.5
     */
    public function get colorTweenDuration():Number {
        return mColorTweenDuration;
    }

    /**
     * @private
     */
    public function set colorTweenDuration( value:Number ):void {
        mColorTweenDuration = value;
    }

    /**
     * Transition of the tween that changes the skin color.
     *
     * @default starling.animation.Transitions.EASE_OUT
     *
     * @see http://doc.starling-framework.org/current/starling/animation/Transitions.html starling.animation.Transitions
     */
    public function get colorTweenTransition():String {
        return mColorTweenTransition;
    }

    /**
     * @private
     */
    public function set colorTweenTransition( value:String ):void {
        mColorTweenTransition = value;
    }

    /**
     * The default color to use to tint the skin. If the component
     * being skinned supports states, the color for a specific state may
     * be specified using the <code>setColorForState()</code> method. If
     * no color has been specified for the current state, the default
     * color will be used.
     *
     * <p>A value of <code>uint.MAX_VALUE</code> means that the
     * <code>color</code> property will not be changed when the context's
     * state changes.</p>
     *
     * <p>In the following example, the default color is specified:</p>
     *
     * <listing version="3.0">
     * var skin:FadeImageSkin = new FadeImageSkin();
     * skin.defaultColor = 0x9f0000;</listing>
     *
     * @default uint.MAX_VALUE
     *
     * @see #disabledColor
     * @see #selectedColor
     * @see #setColorForState()
     */
    public function get defaultColor():uint {
        return mDefaultColor;
    }

    /**
     * @private
     */
    public function set defaultColor( value:uint ):void {
        if( mDefaultColor === value ) {
            return;
        }
        mDefaultColor = value;
        updateColorFromContext();
    }

    /**
     * The color to tint the skin when the <code>stateContext</code> is
     * an <code>IFeathersControl</code> and its <code>isEnabled</code>
     * property is <code>false</code>. If a color has been specified for
     * the context's current state with <code>setColorForState()</code>,
     * it will take precedence over the <code>disabledColor</code>.
     *
     * <p>A value of <code>uint.MAX_VALUE</code> means that the
     * <code>disabledColor</code> property cannot affect the tint when the
     * context's state changes.</p>
     *
     * <p>In the following example, the disabled color is changed:</p>
     *
     * <listing version="3.0">
     * var skin:FadeImageSkin = new FadeImageSkin();
     * skin.defaultColor = 0xffffff;
     * skin.disabledColor = 0x999999;
     * button.skin = skin;
     * button.isEnabled = false;</listing>
     *
     * @default uint.MAX_VALUE
     *
     * @see #defaultColor
     * @see #selectedColor
     * @see #setColorForState()
     */
    public function get disabledColor():uint {
        return mDisabledColor;
    }

    /**
     * @private
     */
    public function set disabledColor( value:uint ):void {
        if( mDisabledColor === value ) {
            return;
        }
        mDisabledColor = value;
        updateColorFromContext();
    }

    /**
     * The color to tint the skin when the <code>stateContext</code> is
     * an <code>IToggle</code> instance and its <code>isSelected</code>
     * property is <code>true</code>. If a color has been specified for
     * the context's current state with <code>setColorForState()</code>,
     * it will take precedence over the <code>selectedColor</code>.
     *
     * <p>In the following example, the selected color is changed:</p>
     *
     * <listing version="3.0">
     * var skin:FadeImageSkin = new FadeImageSkin();
     * skin.defaultColor = 0xffffff;
     * skin.selectedColor = 0xffcc00;
     * toggleButton.skin = skin;
     * toggleButton.isSelected = true;</listing>
     *
     * @default uint.MAX_VALUE
     *
     * @see #defaultColor
     * @see #disabledColor
     * @see #setColorForState()
     */
    public function get selectedColor():uint {
        return mSelectedColor;
    }

    /**
     * @private
     */
    public function set selectedColor( value:uint ):void {
        if( mSelectedColor === value ) {
            return;
        }
        mSelectedColor = value;
        updateColorFromContext();
    }

}
