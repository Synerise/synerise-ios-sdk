//
//  InAppMessagesDictionaryData.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2022 Synerise. All rights reserved.
//

import Foundation

// swiftlint:disable all
class InAppMessagesDictionaryData {
  static func getBasicFullscreen(includeSafeArea: Bool = false) -> [AnyHashable: Any] {
    return [
      "campaignHash": "12345",
      "variantIdentifier": "678910",
      "variantValue": [
        "template": "FULLSCREEN",
        "includeSafeArea": includeSafeArea,
        "html": """
        <style>.in-app-wrapper *{font-family: 'Roboto', sans-serif;}.in-app-wrapper{text-align: center; position: relative; background: #fff; box-shadow: 0 30px 80px 0 rgba(35, 41, 54, 0.2); width: auto; padding: 0 30px; height: 100vh; display: flex; flex-direction: column; flex-wrap: nowrap; align-content: center; justify-content: center; align-items: center;}.in-app-title{font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.5; letter-spacing: -0.67px; text-align: center; color: #13171e; margin: 12px;}.in-app-subtitle{font-size: 16px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: -0.47px; text-align: center; color: #13171e;}.in-app-close{position: absolute; z-index: 1; width: 50px; height: 50px; border: 0; top: 0; right: 0; cursor: pointer; background-color: #6a6a6a;}.in-app-close{position: absolute; z-index: 1; width: 50px; height: 50px; border: 0; top: 0; right: 0; cursor: pointer; background-color: transparent;}.in-app-close:after, .in-app-close:before{content: ''; position: absolute; height: 2px; width: 50%; top: 50%; left: 12px; margin-top: -1px; background: #13171e;}.in-app-close:after{-webkit-transform: rotate(-45deg); -moz-transform: rotate(-45deg); -ms-transform: rotate(-45deg); -o-transform: rotate(-45deg); transform: rotate(-45deg); height: 2px; margin-top: -2px;}.in-app-close:before{-webkit-transform: rotate(45deg); -moz-transform: rotate(45deg); -ms-transform: rotate(45deg); -o-transform: rotate(45deg); transform: rotate(45deg); height: 2px; margin-top: -2px;}.in-app-wrapper-inner img{width: 100%; max-width: 162px; margin-bottom: 25px;}.in-app-wrapper-inner button{margin-top: 25px; border-radius: 6px; background-color: #0b68ff; padding: 18px; color: #fff; border: 0; width: 100%; font-size: 14px;}</style> <div class='in-app-wrapper'> <link href='https://fonts.googleapis.com/css2?family=Roboto&display=swap' rel='stylesheet'> <div class='in-app-wrapper-inner'> <div class='in-app-close'></div><img src='https://upload.snrcdn.net/9bbb7035ecf3565cceed63d321d7d9b31236850d/default/origin/7976029bfade4f4c88e62f5759cb0c17.png' alt='Image'> <p class='in-app-title'>New products</p><p class='in-app-subtitle'>Let yourself be delighted with the new series of shoes for the summer </p><button>Learn more</button> </div></div><script>(function (){var close=document.querySelector('.in-app-close'); close.addEventListener('click', function (){SRInApp.close(); SRInApp.trackCustomEvent('inapp.custom',{'action': 'close'}, 'Custom event from In-App message');}); var button=document.querySelector('.in-app-wrapper-inner button'); button.addEventListener('click', function (){SRInApp.trackCustomEvent('inapp.custom',{'action': 'call to action'}, 'Custom event from In-App message'); SRInApp.openUrl('https://www.synerise.com')});})(); </script>
        """
      ]
    ]
  }

  static func getBasicModal(includeSafeArea: Bool = false) -> [AnyHashable: Any] {
    return [
      "campaignHash": "12345",
      "variantIdentifier": "678910",
      "variantValue": [
        "template": "MODAL",
        "includeSafeArea": includeSafeArea,
        "html": """
        <style>.in-app-wrapper *{font-family: 'Roboto', sans-serif;}.in-app-wrapper{text-align: center; position: relative; background: #00000045; box-shadow: 0 30px 80px 0 rgba(35, 41, 54, 0.2); width: auto; padding: 0 30px; height: 100vh; display: flex; flex-direction: column; flex-wrap: nowrap; align-content: center; justify-content: center; align-items: center;}.in-app-title{font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.5; letter-spacing: -0.67px; text-align: center; color: #13171e; margin: 12px;}.in-app-subtitle{font-size: 16px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: -0.47px; text-align: center; color: #13171e;}.in-app-close{position: absolute; z-index: 1; width: 50px; height: 50px; border: 0; top: 0; right: 0; cursor: pointer; background-color: #6a6a6a;}.in-app-close{position: absolute; z-index: 1; width: 50px; height: 50px; border: 0; top: 0; right: 0; cursor: pointer; background-color: transparent;}.in-app-close:after, .in-app-close:before{content: ''; position: absolute; height: 2px; width: 50%; top: 50%; left: 12px; margin-top: -1px; background: #13171e;}.in-app-close:after{-webkit-transform: rotate(-45deg); -moz-transform: rotate(-45deg); -ms-transform: rotate(-45deg); -o-transform: rotate(-45deg); transform: rotate(-45deg); height: 2px; margin-top: -2px;}.in-app-close:before{-webkit-transform: rotate(45deg); -moz-transform: rotate(45deg); -ms-transform: rotate(45deg); -o-transform: rotate(45deg); transform: rotate(45deg); height: 2px; margin-top: -2px;}.in-app-wrapper-inner img{width: 100%; max-width: 142px; margin-bottom: 25px;}.in-app-wrapper-inner button{margin-top: 25px; border-radius: 6px; background-color: #0b68ff; padding: 18px; color: #fff; border: 0; width: 100%; font-size: 14px;}.in-app-wrapper-inner{background: #fff; border-radius: 6px; padding: 20px; position: relative;}</style> <div class='in-app-wrapper'> <link href='https://fonts.googleapis.com/css2?family=Roboto&display=swap' rel='stylesheet'> <div class='in-app-wrapper-inner'> <div class='in-app-close'></div><img src='https://upload.snrcdn.net/9bbb7035ecf3565cceed63d321d7d9b31236850d/default/origin/7976029bfade4f4c88e62f5759cb0c17.png' alt='Image'> <p class='in-app-title'>New products</p><p class='in-app-subtitle'>Let yourself be delighted with the new series of shoes for the summer </p><button>Learn more</button> </div></div><script>(function (){var close=document.querySelector('.in-app-close'); close.addEventListener('click', function (){SRInApp.close(); SRInApp.trackCustomEvent('inapp.custom',{'action': 'close'}, 'Custom event from In-App message');}); var button=document.querySelector('.in-app-wrapper-inner button'); button.addEventListener('click', function (){SRInApp.trackCustomEvent('inapp.custom',{'action': 'call to action'}, 'Custom event from In-App message'); SRInApp.openUrl('https://www.synerise.com')}); var inapp=document.querySelector('.in-app-wrapper'); inapp.addEventListener('click', function (event){if (event.target.getAttribute('class')=='in-app-wrapper'){SRInApp.close(); SRInApp.trackCustomEvent('inapp.custom',{'action': 'click outside modal'}, 'Custom event from In-App message');}});})(); </script>
        """
      ]
    ]
  }

  static func getBasicTopBar(includeSafeArea: Bool = false) -> [AnyHashable: Any] {
    return [
      "campaignHash": "12345",
      "variantIdentifier": "678910",
      "variantValue": [
        "template": "TOP_BAR",
        "includeSafeArea": includeSafeArea,
        "html": """
        <style>.in-app-wrapper *{font-family: 'Roboto', sans-serif;}.in-app-wrapper{position: relative; background: #fff; box-shadow: 0 30px 80px 0 rgba(35, 41, 54, 0.2); width: auto; padding: 15px;}.in-app-title{font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.5; letter-spacing: -0.67px; text-align: center; color: #13171e; margin: 12px;}.in-app-subtitle{font-size: 16px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: -0.47px; text-align: center; color: #13171e;}.in-app-close{position: absolute; z-index: 1; width: 50px; height: 50px; border: 0; top: 0; right: 0; cursor: pointer; background-color: #6a6a6a;}.in-app-close{position: absolute; z-index: 1; width: 50px; height: 50px; border: 0; top: 0; right: 0; cursor: pointer; background-color: transparent;}.in-app-close:after, .in-app-close:before{content: ''; position: absolute; height: 2px; width: 50%; top: 50%; left: 12px; margin-top: -1px; background: #13171e;}.in-app-close:after{-webkit-transform: rotate(-45deg); -moz-transform: rotate(-45deg); -ms-transform: rotate(-45deg); -o-transform: rotate(-45deg); transform: rotate(-45deg); height: 2px; margin-top: -2px;}.in-app-close:before{-webkit-transform: rotate(45deg); -moz-transform: rotate(45deg); -ms-transform: rotate(45deg); -o-transform: rotate(45deg); transform: rotate(45deg); height: 2px; margin-top: -2px;}</style> <div class='in-app-wrapper'> <link href='https://fonts.googleapis.com/css2?family=Roboto&display=swap' rel='stylesheet'> <div class='in-app-close'></div><p class='in-app-title'>New products</p><p class='in-app-subtitle'>Let yourself be delighted with the new series of shoes for the summer </p></div><script>(function (){var close=document.querySelector('.in-app-close'); close.addEventListener('click', function (){SRInApp.close(); SRInApp.trackCustomEvent('inapp.custom',{'action': 'close'}, 'Custom event from In-App message');});})(); </script>
        """
      ]
    ]
  }

  static func getBasicBottomBar(includeSafeArea: Bool = false) -> [AnyHashable: Any] {
    return [
      "campaignHash": "12345",
      "variantIdentifier": "678910",
      "variantValue": [
        "template": "BOTTOM_BAR",
        "includeSafeArea": includeSafeArea,
        "html": """
        <style>.in-app-wrapper *{font-family: 'Roboto', sans-serif;}.in-app-wrapper{position: relative; background: #fff; box-shadow: 0 30px 80px 0 rgba(35, 41, 54, 0.2); width: auto; padding: 15px;}.in-app-title{font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.5; letter-spacing: -0.67px; text-align: center; color: #13171e; margin: 12px;}.in-app-subtitle{font-size: 16px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: -0.47px; text-align: center; color: #13171e;}.in-app-close{position: absolute; z-index: 1; width: 50px; height: 50px; border: 0; top: 0; right: 0; cursor: pointer; background-color: #6a6a6a;}.in-app-close{position: absolute; z-index: 1; width: 50px; height: 50px; border: 0; top: 0; right: 0; cursor: pointer; background-color: transparent;}.in-app-close:after, .in-app-close:before{content: ''; position: absolute; height: 2px; width: 50%; top: 50%; left: 12px; margin-top: -1px; background: #13171e;}.in-app-close:after{-webkit-transform: rotate(-45deg); -moz-transform: rotate(-45deg); -ms-transform: rotate(-45deg); -o-transform: rotate(-45deg); transform: rotate(-45deg); height: 2px; margin-top: -2px;}.in-app-close:before{-webkit-transform: rotate(45deg); -moz-transform: rotate(45deg); -ms-transform: rotate(45deg); -o-transform: rotate(45deg); transform: rotate(45deg); height: 2px; margin-top: -2px;}</style> <div class='in-app-wrapper'> <link href='https://fonts.googleapis.com/css2?family=Roboto&display=swap' rel='stylesheet'> <div class='in-app-close'></div><p class='in-app-title'>New products</p><p class='in-app-subtitle'>Let yourself be delighted with the new series of shoes for the summer</p></div><script>(function (){var close=document.querySelector('.in-app-close'); close.addEventListener('click', function (){SRInApp.close(); SRInApp.trackCustomEvent('inapp.custom',{'action': 'close'}, 'Custom event from In-App message');});})(); </script>
        """
      ]
    ]
  }

  static func getDebugFullScreen(includeSafeArea: Bool = false) -> [AnyHashable: Any] {
    return [
      "campaignHash": "12345",
      "variantIdentifier": "678910",
      "variantValue": [
        "template": "FULLSCREEN",
        "includeSafeArea": includeSafeArea,
        "html": """
        <style>
        h1{margin-top:35px;font-size:20px}#debug,h1{margin-bottom:5px}#debug,#wrapper{padding:5px}body{background:#ff0}#debug{overflow:hidden;background-color:#000;color:#fff;white-space:pre-wrap;word-break:break-word}button{margin-bottom:3px}.in-app-close{border:0;position:absolute;z-index:1;width:50px;height:50px;top:0;right:0;cursor:pointer;background-color:transparent}.in-app-close:after,.in-app-close:before{content:'';position:absolute;width:50%;top:50%;left:12px;background:#13171e}.in-app-close:after{-webkit-transform:rotate(-45deg);-moz-transform:rotate(-45deg);-ms-transform:rotate(-45deg);-o-transform:rotate(-45deg);transform:rotate(-45deg);height:2px;margin-top:-2px}.in-app-close:before{-webkit-transform:rotate(45deg);-moz-transform:rotate(45deg);-ms-transform:rotate(45deg);-o-transform:rotate(45deg);transform:rotate(45deg);height:2px;margin-top:-2px}
        </style>
        <script type="text/javascript">
        function closeAndTrigger() {
          const params = {
            "method": "closeAndTrigger"
          };
          SRInApp.closeAndTrigger("test.closeAndTrigger", params, "Close and Trigger");
        }
        function hideAndTrigger() {
          const params = {
            "method": "hideAndTrigger"
          };
          SRInApp.hideAndTrigger("test.hideAndTrigger", params, "Hide and Trigger");
        }
        function trackCustomEvent() {
          const params = {
            'status': 'ok'
          };
          SRInApp.trackCustomEvent('test.custom', params, 'Custom Event');
        }

        function handleCustomAction() {
          const params = {
            "test": "TEST"
          };
          SRInApp.handleCustomAction("custom_Action", params);
        }

        function handleCustomMethod() {
          const params = {
            "test": "TEST"
          };
          document.getElementById('debug').innerText = 'PENDING...';
          SRInApp.customMethod("custom_Method", params, 2000)
          .then(function(result) {
            document.getElementById('debug').innerText = 'SUCCESS: ' + JSON.stringify(result);
          })
          .catch(function(error) {
            document.getElementById('debug').innerText = 'ERROR: ' + error;
          });
        }

        function resize(template) {
          SRInApp.resize(template, function(x, y) {
            document.getElementById('debug').innerText = 'SRInApp.resize callback: function(' + x + ', ' + y + ')';  
          });
        }

        function getDeviceData() {
          const deviceData = SRInApp.getDeviceData();
          document.getElementById('debug').innerText = deviceData.appVersion +', ' + deviceData.os + ' ' + deviceData.osVersion + ', ' + deviceData.language + ', ' + deviceData.deviceWidth + 'x' + deviceData.deviceHeight + ', dark mode: ' + deviceData.darkMode
        }

        function getContextFromApp() {
          const context = SRInApp.getContextFromApp();
          document.getElementById('debug').innerText = JSON.stringify(context);
        }

        function getComponentSize() {
          const componentSize = SRInApp.getComponentSize();
          document.getElementById('debug').innerText = componentSize.width + 'x' + componentSize.height;
        }
        </script>
        <div id="wrapper">
          <div class='in-app-close'></div>
          <h1>Debug In-App Message</h1>
          <hr/>
          <div id="debug"></div>
          <hr/>
          <button onclick="SRInApp.close();">CLOSE</button>
          <button onclick="closeAndTrigger();">CLOSE AND TRIGGER</button><br/>
          <button onclick="SRInApp.hide();">HIDE</button>
          <button onclick="hideAndTrigger();">HIDE AND TRIGGER</button>
          <hr/>
          <button onclick="SRInApp.openUrl('http://www.google.pl');">URL ACTION</button>
          <button onclick="SRInApp.openDeeplink('sample-swift://flow/left-menu/settings');">DEEPLINKI ACTION</button>
          <hr/>
          <button onclick="trackCustomEvent();">TRACK CUSTOM EVENT</button>
          <button onclick="handleCustomAction();">HANDLE CUSTOM ACTION</button>
          <button onclick="handleCustomMethod();">HANDLE CUSTOM METHOD</button>
          <hr/>
          <button onclick="resize('FULLSCREEN');">RESIZE (FULL SCREEN)</button>
          <button onclick="resize('TOP_BAR');">RESIZE (TOP BAR)</button>
          <button onclick="resize('BOTTOM_BAR');">RESIZE (BOTTOM BAR)</button>
          <hr/>
          <button onclick="getDeviceData();">GET DEVICE DATA</button>
          <button onclick="getContextFromApp();">GET CONTEXT FROM APP</button>
          <button onclick="getComponentSize();">GET COMPONENT SIZE</button>
        </div>
        <script>
        document.querySelector(".in-app-close").addEventListener("click",(function(){SRInApp.close()}));
        </script>
        """
      ]
    ]
  }

  static func getContextFromAppDebugBottomBar(includeSafeArea: Bool = false) -> [AnyHashable: Any] {
    return [
      "campaignHash": "12345",
      "variantIdentifier": "678910",
      "variantValue": [
        "template": "BOTTOM_BAR",
        "includeSafeArea": includeSafeArea,
        "html": """
        <style>
        h1{margin-top:35px;font-size:20px}#debug,h1{margin-bottom:5px}#debug,#wrapper{padding:5px}body{min-height:260px;background:#ff0}#debug{height: 80px;overflow:scroll;background-color:#000;color:#fff;white-space:pre-wrap;word-break:break-word}button{margin-bottom:3px}.in-app-close{border:0;position:absolute;z-index:1;width:50px;height:50px;top:0;right:0;cursor:pointer;background-color:transparent}.in-app-close:after,.in-app-close:before{content:'';position:absolute;width:50%;top:50%;left:12px;background:#13171e}.in-app-close:after{-webkit-transform:rotate(-45deg);-moz-transform:rotate(-45deg);-ms-transform:rotate(-45deg);-o-transform:rotate(-45deg);transform:rotate(-45deg);height:2px;margin-top:-2px}.in-app-close:before{-webkit-transform:rotate(45deg);-moz-transform:rotate(45deg);-ms-transform:rotate(45deg);-o-transform:rotate(45deg);transform:rotate(45deg);height:2px;margin-top:-2px}
        </style>
        <script type="text/javascript">
        SRInApp.onContextFromApp = function(context) {
          document.getElementById('info').innerText = 'Context was updated!';
          setTimeout(function() {
            document.getElementById('info').innerText = '';
          }, 3000);
        };
        function getContextFromApp() {
          const context = SRInApp.getContextFromApp();
          document.getElementById('debug').innerText = JSON.stringify(context);
        }
        </script>
        <div id="wrapper">
          <div class='in-app-close'></div>
          <h1>Context from app Debug In-App Message</h1>
          <hr/>
          <div id="debug"></div>
          <div id="info"></div>
          <hr/>
          <button onclick="getContextFromApp();">GET CONTEXT FROM APP</button>
        </div>
        <script>
        const context = SRInApp.getContextFromApp();
        document.getElementById('debug').innerText = JSON.stringify(context);
        document.querySelector(".in-app-close").addEventListener("click",(function(){SRInApp.close()}));
        </script>
        """
      ]
    ]
  }

  static func getHandleCustomMethodDebugBottomBar(includeSafeArea: Bool = false) -> [AnyHashable: Any] {
    return [
      "campaignHash": "12345",
      "variantIdentifier": "678910",
      "variantValue": [
        "template": "BOTTOM_BAR",
        "includeSafeArea": includeSafeArea,
        "html": """
        <style>
        h1{margin-top:35px;font-size:18px}.debug,h1{margin-bottom:5px}#wrapper{font-size: 14px}.debug,#wrapper{padding:5px}body{min-height:260px;background:#ff0}.debug{overflow:hidden;background-color:#000;color:#fff;white-space:pre-wrap;word-break:break-word}button{margin-bottom:3px}.in-app-close{border:0;position:absolute;z-index:1;width:50px;height:50px;top:0;right:0;cursor:pointer;background-color:transparent}.in-app-close:after,.in-app-close:before{content:'';position:absolute;width:50%;top:50%;left:12px;background:#13171e}.in-app-close:after{-webkit-transform:rotate(-45deg);-moz-transform:rotate(-45deg);-ms-transform:rotate(-45deg);-o-transform:rotate(-45deg);transform:rotate(-45deg);height:2px;margin-top:-2px}.in-app-close:before{-webkit-transform:rotate(45deg);-moz-transform:rotate(45deg);-ms-transform:rotate(45deg);-o-transform:rotate(45deg);transform:rotate(45deg);height:2px;margin-top:-2px}
        </style>
        <script type="text/javascript">
        function handleCustomMethod1() {
          const params = { "test": "TEST" };
          document.getElementById('debug1').innerText = 'PENDING...';
          SRInApp.customMethod("handleCustomMethod_noDelay", params)
          .then(function(result) {
            document.getElementById('debug1').innerText = 'SUCCESS: ' + JSON.stringify(result);
          })
          .catch(function(error) {
            document.getElementById('debug1').innerText = 'ERROR: ' + error;
          });
        }
        function handleCustomMethod2() {
          const params = { "test": "TEST" };
          document.getElementById('debug2').innerText = 'PENDING...';
          SRInApp.customMethod("handleCustomMethod_delay5sec", params)
          .then(function(result) {
            document.getElementById('debug2').innerText = 'SUCCESS: ' + JSON.stringify(result);
          })
          .catch(function(error) {
            document.getElementById('debug2').innerText = 'ERROR: ' + error;
          });
        }
        function handleCustomMethod3() {
          const params = { "test": "TEST" };
          document.getElementById('debug3').innerText = 'PENDING...';
          SRInApp.customMethod("handleCustomMethod_delay10sec", params)
          .then(function(result) {
            document.getElementById('debug3').innerText = 'SUCCESS: ' + JSON.stringify(result);
          })
          .catch(function(error) {
            document.getElementById('debug3').innerText = 'ERROR: ' + error;
          });
        }
        function handleCustomMethod4() {
          const params = { "test": "TEST" };
          document.getElementById('debug4').innerText = 'PENDING...';
          SRInApp.customMethod("handleCustomMethod_delay20sec", params)
          .then(function(result) {
            document.getElementById('debug4').innerText = 'SUCCESS: ' + JSON.stringify(result);
          })
          .catch(function(error) {
            document.getElementById('debug4').innerText = 'ERROR: ' + error;
          });
        }
        </script>
        <div id="wrapper">
          <div class='in-app-close'></div>
          <h1>Handle Custom Method Debug In-App Message</h1>
          <hr/>
          <div id="info"></div>
          <hr/>
          <div id="debug1" class="debug">&nbsp;</div>
          <div id="debug2" class="debug">&nbsp;</div>
          <div id="debug3" class="debug">&nbsp;</div>
          <div id="debug4" class="debug">&nbsp;</div>
          <hr/>
          <button onclick="handleCustomMethod1();">HANDLE CUSTOM METHOD</button>
          <button onclick="handleCustomMethod2();">HANDLE CUSTOM METHOD (DELAY 5 SEC)</button>
          <button onclick="handleCustomMethod3();">HANDLE CUSTOM METHOD (DELAY 10 SEC)</button>
          <button onclick="handleCustomMethod4();">HANDLE CUSTOM METHOD (DELAY 20 SEC)</button>
        </div>
        <script>
        document.querySelector(".in-app-close").addEventListener("click",(function(){SRInApp.close()}));

        document.getElementById('info').innerText = 'INFO SHOULD LOAD AFTER 10 SECONDS...';
        setTimeout(function() {
          document.getElementById('info').innerText = 'INFO LOADED';
        }, 10000);
        </script>
        """
      ]
    ]
  }

  static func getComponentSizingDebugBottomBar(includeSafeArea: Bool = false) -> [AnyHashable: Any] {
    return [
      "campaignHash": "12345",
      "variantIdentifier": "678910",
      "variantValue": [
        "template": "FULLSCREEN",
        "includeSafeArea": includeSafeArea,
        "html": """
        <style>
        h1{margin-top:35px;font-size:20px}#debug,h1{margin-bottom:5px}#debug,#wrapper{padding:5px}body{min-height:260px;background:#ff0}#debug{height: 80px;overflow:scroll;background-color:#000;color:#fff;white-space:pre-wrap;word-break:break-word}button{margin-bottom:3px}.in-app-close{border:0;position:absolute;z-index:1;width:50px;height:50px;top:0;right:0;cursor:pointer;background-color:transparent}.in-app-close:after,.in-app-close:before{content:'';position:absolute;width:50%;top:50%;left:12px;background:#13171e}.in-app-close:after{-webkit-transform:rotate(-45deg);-moz-transform:rotate(-45deg);-ms-transform:rotate(-45deg);-o-transform:rotate(-45deg);transform:rotate(-45deg);height:2px;margin-top:-2px}.in-app-close:before{-webkit-transform:rotate(45deg);-moz-transform:rotate(45deg);-ms-transform:rotate(45deg);-o-transform:rotate(45deg);transform:rotate(45deg);height:2px;margin-top:-2px}
        </style>
        <script type="text/javascript">
        SRInApp.onComponentSizeChange = function(width, height) {
          document.getElementById('info').innerText = 'Component size was changed! (' + width + 'x' + height + ')';
          setTimeout(function() {
            document.getElementById('info').innerText = '';
          }, 3000);
        };
        function getComponentSize() {
          const componentSize = SRInApp.getComponentSize();
          document.getElementById('debug').innerText = componentSize.width + 'x' + componentSize.height;
        }
        function setComponentSize() {
          const width = Number(document.getElementById('width').value);
          const height = Number(document.getElementById('height').value);
          SRInApp.setComponentSize(width, height);
        }
        </script>
        <div id="wrapper">
          <div class='in-app-close'></div>
          <h1>Sizing Debug In-App Message</h1>
          <hr/>
          <div id="debug"></div>
          <div id="info"></div>
          <hr/>
          <button onclick="getComponentSize();">GET COMPONENT SIZE</button>
          <hr/>
          <form id="form">
            <fieldset>
              <legend>Width</legend>
              <input id="width" type="number" key="width"/>
            </fieldset>
            <fieldset>
              <legend>Height</legend>
              <input id="height" type="number" key="height"/>
            </fieldset>
          </form>
          <button onclick="setComponentSize();">SET COMPONENT SIZE</button>
        </div>
        <script>
        const componentSize = SRInApp.getComponentSize();
        document.getElementById('debug').innerText = componentSize.width + ' pt' + ' x ' + componentSize.height + ' pt';
        document.querySelector(".in-app-close").addEventListener("click",(function(){SRInApp.close()}));
        </script>
        """
      ]
    ]
  }

  static func getStorageDebugFullScreen(includeSafeArea: Bool = false) -> [AnyHashable: Any] {
    return [
      "campaignHash": "12345",
      "variantIdentifier": "678910",
      "variantValue": [
        "template": "FULLSCREEN",
        "includeSafeArea": includeSafeArea,
        "html": """
        <style>
        h1{margin-top:35px;font-size:20px}#debug,h1{margin-bottom:5px}#debug,#wrapper{padding:5px}body{background:#ff0}#debug{overflow:hidden;background-color:#000;color:#fff;white-space:pre-wrap;word-break:break-word}button{margin-bottom:3px}.in-app-close{border:0;position:absolute;z-index:1;width:50px;height:50px;top:0;right:0;cursor:pointer;background-color:transparent}.in-app-close:after,.in-app-close:before{content:'';position:absolute;width:50%;top:50%;left:12px;background:#13171e}.in-app-close:after{-webkit-transform:rotate(-45deg);-moz-transform:rotate(-45deg);-ms-transform:rotate(-45deg);-o-transform:rotate(-45deg);transform:rotate(-45deg);height:2px;margin-top:-2px}.in-app-close:before{-webkit-transform:rotate(45deg);-moz-transform:rotate(45deg);-ms-transform:rotate(45deg);-o-transform:rotate(45deg);transform:rotate(45deg);height:2px;margin-top:-2px}
        </style>
        <script type="text/javascript">
        function getItem() {
          const key = document.getElementById('key1').value;
          const cacheValue = SRInApp.storage.getItem(key);
          document.getElementById('debug').innerText = cacheValue + ' (' + typeof cacheValue + ')';
        }
        function removeItem() {
          const key = document.getElementById('key1').value;
          SRInApp.storage.removeItem(key, function() {
            document.getElementById('debug').innerText = 'SUCCESS';
          }, function(error) {
            document.getElementById('debug').innerText = 'ERROR: ' + error;
          });
        }
        function setItem() {
          const key = document.getElementById('key2').value;
          const value = document.getElementById('value2').value;
          SRInApp.storage.setItem(key, value, function() {
            document.getElementById('debug').innerText = 'SUCCESS';
          }, function(error) {
            document.getElementById('debug').innerText = 'ERROR: ' + error;
          });
        }
        function setStringItem() {
          const key = document.getElementById('key3').value;
          SRInApp.storage.setItem(key, "Sample string", function() {
            document.getElementById('debug').innerText = 'SUCCESS';
          }, function(error) {
            document.getElementById('debug').innerText = 'ERROR: ' + error;
          });
        }
        function setNumberItem() {
          const key = document.getElementById('key3').value;
          SRInApp.storage.setItem(key, 12345, function() {
            document.getElementById('debug').innerText = 'SUCCESS';
          }, function(error) {
            document.getElementById('debug').innerText = 'ERROR: ' + error;
          });
        }
        function setBooleanItem() {
          const key = document.getElementById('key3').value;
          SRInApp.storage.setItem(key, true, function() {
            document.getElementById('debug').innerText = 'SUCCESS';
          }, function(error) {
            document.getElementById('debug').innerText = 'ERROR: ' + error;
          });
        }
        function setObjectItem() {
          const key = document.getElementById('key3').value;
          SRInApp.storage.setItem(key, { "test": "TEST" }, function() {
            document.getElementById('debug').innerText = 'SUCCESS';
          }, function(error) {
            document.getElementById('debug').innerText = 'ERROR: ' + error;
          });
        }
        function setArrayItem() {
          const key = document.getElementById('key3').value;
          SRInApp.storage.setItem(key, [1, "Hello", "World", true], function() {
            document.getElementById('debug').innerText = 'SUCCESS';
          }, function(error) {
            document.getElementById('debug').innerText = 'ERROR: ' + error;
          });
        }
        function setNullItem() {
          const key = document.getElementById('key3').value;
          SRInApp.storage.setItem(key, null, function() {
            document.getElementById('debug').innerText = 'SUCCESS';
          }, function(error) {
            document.getElementById('debug').innerText = 'ERROR: ' + error;
          });
        }
        function setUndefinedItem() {
          const key = document.getElementById('key3').value;
          SRInApp.storage.setItem(key, undefined, function() {
            document.getElementById('debug').innerText = 'SUCCESS';
          }, function(error) {
            document.getElementById('debug').innerText = 'ERROR: ' + error;
          });
        }
        function clearAllItems() {
          SRInApp.storage.clear(function() {
            document.getElementById('debug').innerText = 'SUCCESS';
          }, function(error) {
            document.getElementById('debug').innerText = 'ERROR: ' + error;
          });
        }
        </script>
        <div id="wrapper">
          <div class='in-app-close'></div>
          <h1>Storage Debug In-App Message</h1>
          <hr/>
          <div id="debug"></div>
          <hr/>
          <form id="form">
            <fieldset>
              <legend>Key</legend>
              <input id="key1" type="text" key="key" value="Test"/>
            </fieldset>
          </form>
          <button onclick="getItem();">GET ITEM</button>
          <button onclick="removeItem();">REMOVE ITEM</button>
          <hr/>
          <form id="form">
            <fieldset>
              <legend>Key</legend>
                <input id="key2" type="text" key="key"/>
            </fieldset>
            <fieldset>
              <legend>Value</legend>
              <input id="value2" type="text" key="value"/>
            </fieldset>
          </form>
          <button onclick="setItem();">SET ITEM</button>
          <hr/>
          <form id="form">
            <fieldset>
              <legend>Key</legend>
              <input id="key3" type="text" key="key"/>
            </fieldset>
          </form>
          <button onclick="setStringItem();">SET SAMPLE STRING ITEM</button>
          <button onclick="setNumberItem();">SET SAMPLE NUMBER ITEM</button>
          <button onclick="setBooleanItem();">SET SAMPLE BOOLEAN ITEM</button>
          <button onclick="setObjectItem();">SET SAMPLE OBJECT ITEM</button>
          <button onclick="setArrayItem();">SET SAMPLE ARRAY ITEM</button>
          <button onclick="setNullItem();">SET NULL ITEM</button>
          <button onclick="setUndefinedItem();">SET UNDEFINED ITEM</button>
          <hr/>
          <button onclick="clearAllItems();">CLEAR ALL ITEMS</button>
        </div>
        <script>
        const cacheValue = SRInApp.storage.getItem("Test");
        document.getElementById('debug').innerText = cacheValue + ' (' + typeof cacheValue + ')';
        document.querySelector(".in-app-close").addEventListener("click",(function(){SRInApp.close()}));
        </script>
        """
      ]
    ]
  }

  static func getInternalMethodDebugFullScreen(includeSafeArea: Bool = false) -> [AnyHashable: Any] {
    return [
      "campaignHash": "12345",
      "variantIdentifier": "678910",
      "variantValue": [
        "template": "FULLSCREEN",
        "includeSafeArea": includeSafeArea,
        "html": """
        <style>
        h1{margin-top:35px;font-size:20px}#debug,h1{margin-bottom:5px}#debug,#wrapper{padding:5px}body{background:#ff0}#debug{overflow:hidden;background-color:#000;color:#fff;white-space:pre-wrap;word-break:break-word}button{margin-bottom:3px}.in-app-close{border:0;position:absolute;z-index:1;width:50px;height:50px;top:0;right:0;cursor:pointer;background-color:transparent}.in-app-close:after,.in-app-close:before{content:'';position:absolute;width:50%;top:50%;left:12px;background:#13171e}.in-app-close:after{-webkit-transform:rotate(-45deg);-moz-transform:rotate(-45deg);-ms-transform:rotate(-45deg);-o-transform:rotate(-45deg);transform:rotate(-45deg);height:2px;margin-top:-2px}.in-app-close:before{-webkit-transform:rotate(45deg);-moz-transform:rotate(45deg);-ms-transform:rotate(45deg);-o-transform:rotate(45deg);transform:rotate(45deg);height:2px;margin-top:-2px}
        </style>
        <script type="text/javascript">
        function internalMethodOnSuccess (object) {
            document.getElementById('debug').innerText = JSON.stringify(object);
        };
        function internalMethodOnError (object) {
          document.getElementById('debug').innerText = JSON.stringify(object);
        }
        function getUuid() {
          SRInApp.internalMethod("Client/getUuid", null, internalMethodOnSuccess, internalMethodOnError)
        }
        function destroySession() {
          SRInApp.internalMethod("Client/destroySession", null, internalMethodOnSuccess, internalMethodOnError)
        }
        function getPromotions() {
          const params = {
            "limit": 20,
            "page": 1,
            "includeVouchers": true,
            "includeMeta": true,
            "statuses": [],
            "types": [],
            "sortParameters": {
              "createdAt": "DESC",
              "updatedAt": "ASC"
            }
          };
          SRInApp.internalMethod("Promotions/getPromotions", JSON.stringify(params), internalMethodOnSuccess, internalMethodOnError)
        }
        function getPromotion() {
          const params = {
            "uuid": "a888d493-968f-498c-888c-70f66894e228"
          };
          SRInApp.internalMethod("Promotions/getPromotions", JSON.stringify(params), internalMethodOnSuccess, internalMethodOnError)
        }
        function activatePromotion() {
          const params = {
            "identifier": {
              "uuid": "a888d493-968f-498c-888c-70f66894e228"
            },
            "pointsToUse": 555
          };
          SRInApp.internalMethod("Promotions/activatePromotion", JSON.stringify(params), internalMethodOnSuccess, internalMethodOnError)
        }
        function activatePromotionByUuid() {
          const params = {
            "uuid": "a888d493-968f-498c-888c-70f66894e228"
          };
          SRInApp.internalMethod("Promotions/activatePromotionByUuid", JSON.stringify(params), internalMethodOnSuccess, internalMethodOnError)
        }
        function activatePromotionByCode() {
          const params = {
            "code": "d139125e-88a2-4146-a1b3-d766b94d859d"
          };
          SRInApp.internalMethod("Promotions/activatePromotionByCode", JSON.stringify(params), internalMethodOnSuccess, internalMethodOnError)
        }
        function deactivatePromotionByUuid() {
          const params = {
            "uuid": "a888d493-968f-498c-888c-70f66894e228"
          };
          SRInApp.internalMethod("Promotions/deactivatePromotionByUuid", JSON.stringify(params), internalMethodOnSuccess, internalMethodOnError)
        }
        function deactivatePromotionByCode() {
          const params = {
            "code": "d139125e-88a2-4146-a1b3-d766b94d859d"
          };
          SRInApp.internalMethod("Promotions/deactivatePromotionByCode", JSON.stringify(params), internalMethodOnSuccess, internalMethodOnError)
        }
        function activatePromotionsBatch() {
          const params = {
            "identifiers": [
              {
                "uuid": "d139125e-88a2-4146-a1b3-d766b94d859d"
              }
            ]
          };
          SRInApp.internalMethod("Promotions/activatePromotionsBatch", JSON.stringify(params), internalMethodOnSuccess, internalMethodOnError)
        }
        function deactivatePromotionsBatch() {
          const params = {
            "identifiers": [
              {
                "uuid": "d139125e-88a2-4146-a1b3-d766b94d859d"
              }
            ]
          };
          SRInApp.internalMethod("Promotions/deactivatePromotionsBatch", JSON.stringify(params), internalMethodOnSuccess, internalMethodOnError)
        }
        function getOrAssignVoucher() {
          const params = {
            "poolUuid": "0852547b-a6d1-438e-b5f3-d5af4f7dd9de"
          };
          SRInApp.internalMethod("Vouchers/getOrAssignVoucher", JSON.stringify(params), internalMethodOnSuccess, internalMethodOnError)
        }
        function assignVoucherCode() {
          const params = {
            "poolUuid": "0852547b-a6d1-438e-b5f3-d5af4f7dd9de"
          };
          SRInApp.internalMethod("Vouchers/assignVoucherCode", JSON.stringify(params), internalMethodOnSuccess, internalMethodOnError)
        }
        function getAssignedVoucherCodes() {
          SRInApp.internalMethod("Vouchers/getAssignedVoucherCodes", null, internalMethodOnSuccess, internalMethodOnError)
        }
        function generateDocument() {
          const params = {
            "slug": "dawidslug",
            "productId": "12345",
            "itemsIds": ["item1", "item2", "item3"],
            "itemsExcluded": ["item4", "item5"],
            "additionalFilters": "color:red,size:M",
            "filtersJoiner": "and",
            "additionalElasticFilters": "brand:nike",
            "elasticFiltersJoiner": "none",
            "displayAttribute": ["name", "price", "image"],
            "includeContextItems": false,
            "params": {
              "sort": "price_asc",
              "limit": 10
            }
          };
          SRInApp.internalMethod("Content/generateDocument", JSON.stringify(params), internalMethodOnSuccess, internalMethodOnError)
        }
        function getRecommendationsV2() {
          const params = {
            "slug": "similar",
            "additionalFilters": "string",
            "itemIdExcluded": ["string"],
            "filtersJoiner": "AND",
            "additionalElasticFilters": "string",
            "elasticFiltersJoiner": "string",
            "displayAttribute": ["string"],
            "includeContextItems": true,
            "itemsIds": ["id1", "id2"],
            "product:retailer_part_no": "id1"
          };
          SRInApp.internalMethod("Content/getRecommendationsV2", JSON.stringify(params), internalMethodOnSuccess, internalMethodOnError)
        }
        function generateScreenView() {
          const params = {
            "feedSlug": "drzewkafeed",
            "params": {
              "test1": "TEST_1",
              "test2": "TEST_2"
            }
          };
          SRInApp.internalMethod("Content/generateScreenView", JSON.stringify(params), internalMethodOnSuccess, internalMethodOnError)
        }
        function generateBrickworks() {
          const params = {
            "schemaSlug": "konradTestuje",
            "recordId": "7726c219-1deb-4154-9374-d3145de3c833",
            "context": {
              "param": 123
            },
            "fieldContext": {
              "similarProducts": {
                "itemId": "c8a42eb1-2582-403e-8497-976f28b479ee",
                "additionalFilter": "brand == TEST"
              }
            }
          };
          SRInApp.internalMethod("Content/generateBrickworks", JSON.stringify(params), internalMethodOnSuccess, internalMethodOnError)
        }
        </script>
        <div id="wrapper">
          <div class='in-app-close'></div>
          <h1>Internal Method Debug In-App Message</h1>
          <hr/>
          <button onclick="getUuid();">Client/getUuid</button><br/>
          <button onclick="destroySession();">Client/destroySession</button><br/>
          <button onclick="getPromotions();">Promotions/getPromotions</button><br/>
          <button onclick="getPromotion();">Promotions/getPromotion</button><br/>
          <button onclick="activatePromotion();">Promotions/activatePromotion</button><br/>
          <button onclick="activatePromotionByUuid();">Promotions/activatePromotionByUuid</button><br/>
          <button onclick="activatePromotionByCode();">Promotions/activatePromotionByCode</button><br/>
          <button onclick="deactivatePromotionByUuid();">Promotions/deactivatePromotionByUuid</button><br/>
          <button onclick="deactivatePromotionByCode();">Promotions/deactivatePromotionByCode</button><br/>
          <button onclick="activatePromotionsBatch();">Promotions/activatePromotionsBatch</button><br/>
          <button onclick="deactivatePromotionsBatch();">Promotions/deactivatePromotionsBatch</button><br/>
          <button onclick="getOrAssignVoucher();">Vouchers/getOrAssignVoucher</button><br/>
          <button onclick="assignVoucherCode();">Vouchers/assignVoucherCode</button><br/>
          <button onclick="getAssignedVoucherCodes();">Vouchers/getAssignedVoucherCodes</button><br/>
          <button onclick="generateDocument();">Content/generateDocument</button><br/>
          <button onclick="getRecommendationsV2();">Content/getRecommendationsV2</button><br/>
          <button onclick="generateScreenView();">Content/generateScreenView</button><br/>
          <button onclick="generateBrickworks();">Content/generateBrickworks</button><br/>
          <hr/>
          <div id="debug"></div>
          <script>
          document.querySelector(".in-app-close").addEventListener("click",(function(){SRInApp.close()}));
          </script>
        </div>
        """
      ]
    ]
  }

  static func getVariousTestCreation(includeSafeArea: Bool = false) -> [AnyHashable: Any] {
    return [
      "campaignHash": "12345",
      "variantIdentifier": "678910",
      "variantValue": [
        "template": "BOTTOM_BAR",
        "includeSafeArea": includeSafeArea,
        "html": """
        <style>
        body {
          background-color: ivory;
        }
        .bottom-bar, .top-bar {
            padding: 80px 20px;
            background-color: ivory;
        }
        .full-screen {
          padding: 80px 20px;
          background-color: ivory;
        }
        </style>
        <div id="webview-simulation" class="bottom-bar">
          <div id="message-content">
            <button id="full">to full</button>
            <button id="top">to top</button>
            <button id="bottom">to bottom</button>
            <button onclick="SRInApp.close()">CLOSE</button>
            <p id="info"> Example message </p>
          </div>
        </div>
        <script type="text/javascript">
        (function(){
          const info = document.querySelector('#info')
          document.querySelector('#full').addEventListener('click', function(){
            info.innerText = "full"
            SRInApp.resize('FULLSCREEN', resizeCallbackFull)
          })  
          document.querySelector('#top').addEventListener('click', function(){
            info.innerText = "top"
            SRInApp.resize('TOP_BAR', resizeCallbackTop)
          })  
          document.querySelector('#bottom').addEventListener('click', function(){
            info.innerText = "bottom"
            SRInApp.resize('BOTTOM_BAR', resizeCallbackBottom)
          })  
          function resizeCallbackFull (width, height) {
            const body = container.contentDocument.body;
            const container = document.getElementById('webview-simulation');
            container.classList.remove('bottom-bar');
            container.classList.remove('top-bar');
            container.classList.add('full-screen');
            body.style.height = '100%';
            console.log("Changed to fullscreen");
          };

          function resizeCallbackTop (width, height) {
            const body = container.contentDocument.body;
            const container = document.getElementById('webview-simulation');
            container.classList.remove('full-screen');
            container.classList.remove('bottom-bar');
            container.classList.add('top-bar');
            body.style.height = height + 'px';
            console.log("Changed to top bar");
          };

          function resizeCallbackBottom (width, height) {
            const body = container.contentDocument.body;
            const container = document.getElementById('webview-simulation');
            container.classList.remove('full-screen');
            container.classList.remove('top-bar');
            container.classList.add('bottom-bar');
            body.style.height = height + 'px';
            console.log("Changed to bottom bar");
          };
        }())
        </script>
        """
      ]
    ]
  }
}
