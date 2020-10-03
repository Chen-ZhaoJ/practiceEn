# Sinch iOS SDK

Welcome to Sinch iOS SDK, https://developers.sinch.com

Copyright 2014-2019, Sinch Mobile AB (reg. no 556969-5397)


## Features

- Sinch SDK for iOS
- PSTN Calling
     * Make data calls to regular phone numbers
- App-to-App Calling
     * Make and receive voice and video calls
     * Call both native (iOS and Android) and web clients
- Video Calling
     * Make video calls to both native (iOS and Android) and web clients
- Conference Calling

Should you encounter any bugs, glitches, lack of functionality or
other problems using our SDK, please send us an email to dev@sinch.com.
Your help in this regard is greatly appreciated.


## Quick Start

- Install Sinch via CocoaPod (pod 'SinchRTC') or download it on [www.sinch.com](https://www.sinch.com/docs/resources/downloads/index_vvv.html#sinchvvvdownloads)

- Read User Guide at https://developers.sinch.com

- Read Reference Docs (in `docs/`)

- Look at the sample apps inside the SDK package for inspiration


## Documentation

The User Guide is available at https://developers.sinch.com and contains:

- Instructions for first-time developers
- Using Sinch in your app for making app-to-phone, app-to-app and conference calls
- Using Sinch in your app for making video calls
- Using Sinch in your app for sending and receiving messages
- Other information about Sinch, such as creating your app, note on export
  regulations and more.

Reference documentation is available in `docs/`.

## Samples

Sample code is available under samples/

- App-to-App Calling sample: SinchCalling.xcodeproj

- App-to-Phone (PSTN) Calling sample: SinchPSTN.xcodeproj

- App-to-App Calling sample using CallKit and VoIP Push Notifications:
     SinchCallKit.xcodeproj
     This sample requires you to create and upload Apple VoIP Push Notification
     certificates in the Sinch portal.

- App-to-App Video calling sample: SinchVideo.xcodeproj

- App-to-App Video calling sample with video filter applied: SinchVideoFilter.xcodeproj
