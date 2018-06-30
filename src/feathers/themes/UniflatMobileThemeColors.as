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

    /**
     * Class defining colors for the Uniflat mobile theme.
     * You can provide instance of this class when initializing the
     * theme to adjust its default colors.
     */
    public class UniflatMobileThemeColors {

        private var mColorStage:int = 0xFFFFFF;
        private var mColorBackground:int = 0xFFFFFF;
        private var mColorPrimary:int = 0xFFFFFF;
        private var mColorPrimaryDisabled:int = 0xFFFFFF;
        private var mColorPrimaryContrast:int = 0xFFFFFF;
        private var mColorPrimaryContrastDisabled:int = 0xFFFFFF;
        private var mColorAlt:int = 0xFFFFFF;
        private var mColorAltDisabled:int = 0xFFFFFF;
        private var mColorAltContrast:int = 0xFFFFFF;
        private var mColorAltContrastDisabled:int = 0xFFFFFF;
        private var mColorContrast:int = 0xFFFFFF;
        private var mColorContrastDisabled:int = 0xFFFFFF;

        public function UniflatMobileThemeColors() {
        }

        public static function get Builder():UniflatMobileThemeColorsBuilder {
            return new UniflatMobileThemeColorsBuilder();
        }

        public function set colorStage( value:int ):void {
            mColorStage = value;
        }

        public function set colorBackground( value:int ):void {
            mColorBackground = value;
        }

        public function set colorPrimary( value:int ):void {
            mColorPrimary = value;
        }

        public function set colorPrimaryDisabled( value:int ):void {
            mColorPrimaryDisabled = value;
        }

        public function set colorPrimaryContrast( value:int ):void {
            mColorPrimaryContrast = value;
        }

        public function set colorPrimaryContrastDisabled( value:int ):void {
            mColorPrimaryContrastDisabled = value;
        }

        public function set colorAlt( value:int ):void {
            mColorAlt = value;
        }

        public function set colorAltDisabled( value:int ):void {
            mColorAltDisabled = value;
        }

        public function set colorAltContrast( value:int ):void {
            mColorAltContrast = value;
        }

        public function set colorAltContrastDisabled( value:int ):void {
            mColorAltContrastDisabled = value;
        }

        public function set colorContrast( value:int ):void {
            mColorContrast = value;
        }

        public function set colorContrastDisabled( value:int ):void {
            mColorContrastDisabled = value;
        }

        public function get colorStage():int {
            return mColorStage;
        }

        public function get colorBackground():int {
            return mColorBackground;
        }

        public function get colorPrimary():int {
            return mColorPrimary;
        }

        public function get colorPrimaryDisabled():int {
            return mColorPrimaryDisabled;
        }

        public function get colorPrimaryContrast():int {
            return mColorPrimaryContrast;
        }

        public function get colorPrimaryContrastDisabled():int {
            return mColorPrimaryContrastDisabled;
        }

        public function get colorAlt():int {
            return mColorAlt;
        }

        public function get colorAltDisabled():int {
            return mColorAltDisabled;
        }

        public function get colorAltContrast():int {
            return mColorAltContrast;
        }

        public function get colorAltContrastDisabled():int {
            return mColorAltContrastDisabled;
        }

        public function get colorContrast():int {
            return mColorContrast;
        }

        public function get colorContrastDisabled():int {
            return mColorContrastDisabled;
        }

    }

}

import feathers.themes.UniflatMobileThemeColors;

class UniflatMobileThemeColorsBuilder {

    private var mInstance:UniflatMobileThemeColors;

    public function UniflatMobileThemeColorsBuilder():void {
        mInstance = new UniflatMobileThemeColors();
    }

    public function setColorStage( value:int ):UniflatMobileThemeColorsBuilder {
        mInstance.colorStage = value;
        return this;
    }

    public function setColorBackground( value:int ):UniflatMobileThemeColorsBuilder {
        mInstance.colorBackground = value;
        return this;
    }

    public function setColorPrimary( value:int ):UniflatMobileThemeColorsBuilder {
        mInstance.colorPrimary = value;
        return this;
    }

    public function setColorPrimaryDisabled( value:int ):UniflatMobileThemeColorsBuilder {
        mInstance.colorPrimaryDisabled = value;
        return this;
    }

    public function setColorPrimaryContrast( value:int ):UniflatMobileThemeColorsBuilder {
        mInstance.colorPrimaryContrast = value;
        return this;
    }

    public function setColorPrimaryContrastDisabled( value:int ):UniflatMobileThemeColorsBuilder {
        mInstance.colorPrimaryContrastDisabled = value;
        return this;
    }

    public function setColorAlt( value:int ):UniflatMobileThemeColorsBuilder {
        mInstance.colorAlt = value;
        return this;
    }

    public function setColorAltDisabled( value:int ):UniflatMobileThemeColorsBuilder {
        mInstance.colorAltDisabled = value;
        return this;
    }

    public function setColorAltContrast( value:int ):UniflatMobileThemeColorsBuilder {
        mInstance.colorAltContrast = value;
        return this;
    }

    public function setColorAltContrastDisabled( value:int ):UniflatMobileThemeColorsBuilder {
        mInstance.colorAltContrastDisabled = value;
        return this;
    }

    public function setColorContrast( value:int ):UniflatMobileThemeColorsBuilder {
        mInstance.colorContrast = value;
        return this;
    }

    public function setColorContrastDisabled( value:int ):UniflatMobileThemeColorsBuilder {
        mInstance.colorContrastDisabled = value;
        return this;
    }

    public function build():UniflatMobileThemeColors {
        return mInstance;
    }

}