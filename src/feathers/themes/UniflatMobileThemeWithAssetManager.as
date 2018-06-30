/*
 * Copyright 2015-2018 Bowler Hat LLC, Marcel Piestansky
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

	import starling.core.Starling;
	import starling.events.Event;
    import starling.utils.AssetManager;

    /**
     * Dispatched when the theme's assets are loaded, and the theme has
     * initialized. Feathers component will not be skinned automatically
     * by the theme until this event is dispatched.
     *
     * @eventType starling.events.Event.COMPLETE
     */
    [Event(name="complete", type="starling.events.Event")]

    /**
     * The Uniflat theme for mobile Feathers apps.
     *
     * <p>This version of the theme loads the assets at runtime. To use
     * embedded assets, see <code>UniflatMobileTheme</code> instead.</p>
     *
     * <p>To use this theme, the following files must be included when packaging
     * your app:</p>
     * <ul>
     *     <li>images/uniflat_mobile.png</li>
     *     <li>xml/uniflat_mobile.xml</li>
     * </ul>
     */
    public class UniflatMobileThemeWithAssetManager extends BaseUniflatMobileTheme implements IAsyncTheme {

        protected static const ATLAS_NAME:String = "uniflat_mobile";
        protected var mAssetManager:AssetManager;
        protected var mReady:Boolean;

        /**
         * Constructor.
         * @param assetsBasePath The root folder of the assets.
         * @param assetManager An optional pre-created AssetManager. The scaleFactor property must be equal to Starling.contentScaleFactor. To load assets with a different scale factor, use multiple AssetManager instances.
         */
        public function UniflatMobileThemeWithAssetManager( assetsBasePath:String = "./", assetManager:AssetManager = null ) {
            loadAssets( assetsBasePath, assetManager )
        }

        /**
         * The paths to each of the assets, relative to the base path.
         */
        protected var mAssetPaths:Vector.<String> = new <String>
                [
                            "xml/" + ATLAS_NAME + ".xml",
                            "images/" + ATLAS_NAME + ".png"
                ];

        override public function dispose():void {
            super.dispose();
            if( mAssetManager ) {
                mAssetManager.removeTextureAtlas( ATLAS_NAME );
                mAssetManager = null;
            }
        }

        override protected function initialize():void {
            initializeTextureAtlas();
            super.initialize();
        }

        protected function initializeTextureAtlas():void {
            mAtlas = mAssetManager.getTextureAtlas( ATLAS_NAME );
        }

        protected function onAssetManagerProgress( progress:Number ):void {
            if( progress < 1 ) {
                return;
            }
            initialize();
	        mReady = true;
            dispatchEventWith( Event.COMPLETE );
        }

        protected function loadAssets( assetsBasePath:String, assetManager:AssetManager ):void {
            var oldScaleFactor:Number = -1;
            if( assetManager ) {
                oldScaleFactor = assetManager.scaleFactor;
                assetManager.scaleFactor = 2;
            } else {
                assetManager = new AssetManager( 2 );
            }
            mAssetManager = assetManager;
            /* Add a trailing slash, if needed */
            if( assetsBasePath.lastIndexOf( "/" ) != assetsBasePath.length - 1 ) {
                assetsBasePath += "/";
            }
            var assetPaths:Vector.<String> = mAssetPaths;
            var assetCount:int = assetPaths.length;
            for( var i:int = 0; i < assetCount; i++ ) {
                var asset:String = assetPaths[i];
                mAssetManager.enqueue( assetsBasePath + asset );
            }
            if( oldScaleFactor != -1 ) {
                /* Restore the old scale factor, just in case */
                mAssetManager.scaleFactor = oldScaleFactor;
            }
            mAssetManager.loadQueue( onAssetManagerProgress );
        }

	    public function isCompleteForStarling( starling:Starling ):Boolean {
		    return mReady;
	    }
    }
}
