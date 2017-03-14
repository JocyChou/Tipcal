# Pre-work - *TipCal*

**TipCal** is a tip calculator application for iOS.

Submitted by: **Siyu Zhou**

Time spent: **12** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [X] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [X] Setting page to change and remember tip percentages that are available on tip calculating page.

- [X] The keyboard is automatically pop-up and draw-back when the user start editing and tap other area respectively.

- [X] Store user’s setting after press on the save button on setting page.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/EfPoAaB.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Implement UI animations and update contents within pages in appropriate viewControl lifeCycle.

Understand the hierarchy in view layouts while checking each subviews of current view.

Store the user preferred tip percentages when entered on setting page using user’s defaults database, and update these data on tip calculating page.

Only store user’s settings after press the save button on setting page.

Always have default tip percentages on tip calculating page if there is no change on setting page.

Always have stored tip percentages shows on tip calculating page and on setting page while using the App.

## License

Copyright [2017] [Siyu Zhou]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

