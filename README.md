# EarlGrey-bootcamp

This bootcamp serves as an introduction point into the EarlGrey framework and other testing tools for iOS. It covers a majority of the common scenarios one might encounter while developing tests for iOS applications.

Fork this repo and request evaluation from ETT members experienced in developing EarlGrey tests.

Software:

- Xcode 7.x.x (Try to remain consistent with the version that the development team is using)
- Cocoapods
- EarlGrey

#EarlGrey Basics

## Task #0: Setup

##### Useful material and links: 

- [Objective-C Basics] (http://tryobjectivec.codeschool.com/levels/1)
- [Xcode Cheat Sheet] (http://www.git-tower.com/blog/xcode-cheat-sheet)
- [Cocoapods] (https://cocoapods.org/)
- [EarlGrey Framework README] (https://github.com/google/EarlGrey)
- [EarlGrey Install & Run instructions] (https://github.com/google/EarlGrey/blob/master/docs/install-and-run.md)


##### Objective:

1. Set up EarlGrey framework on the sample app
2. Add a test that launches the app and tests for the presence of a keyWindow

##### Description:

If you are new to Objective-C, I would recommend running through the Objective-C Basics course on Codeschool. It's a quick and gamified way to familiarize yourself with the basics of Objective-C syntax. If you are familiar with Java/C most of the underlying concepts should not be new to you.

Follow the installation instructions from the EarlGrey Install & Run instructions. We will be using Cocoapods to install EarlGrey, so make sure you have it installed on your machine. 

 **NOTE:** You should add your test target in the xcodeproj file, and then open xcworkspace only after you have installed the pod. Additionally to run the project on a simulator below 9.1, you will have to change "Deployment Target" to something lower (e.g. 8.0)

In order to complete this task you will need to create your first test class and write a simple test. If you're having trouble check out the EarlGrey Framework README link for examples of how the API works.

## Task #1: Exploring the EarlGrey APIs

##### Useful material and links: 

- [iOS Accessibility Inspector] (https://developer.apple.com/library/ios/technotes/TestingAccessibilityOfiOSApps/TestAccessibilityiniOSSimulatorwithAccessibilityInspector/TestAccessibilityiniOSSimulatorwithAccessibilityInspector.html) 
- [EarlGrey Cheat Sheet] (https://github.com/google/EarlGrey/blob/master/docs/cheatsheet/cheatsheet.png)
- [EarlGrey Example Tests] (https://github.com/google/EarlGrey/blob/master/Demo/EarlGreyExample/EarlGreyExampleTests/EarlGreyExampleTests.m)

##### Objective:

1. Add a test that selects a Pivot from the table view, and makes sure their job title and projects leading value is displayed in the detail view.

## Task #2: Adding accessibility labels

##### Useful material and links: 

- [EarlGrey Tests - Source code examples] (https://github.com/google/EarlGrey/tree/master/Tests/FunctionalTests/Sources)

##### Objective:
1. Add an accessibility label to the table view that contains the ETT Pivots
2. Add an accessibility label to the text entry field in the details view
3. Use your newly created accessibility labels to write a new test, one that loops through the the rows and taps on each and then enters some text into the detail view's text field.

##### Description:

In order to complete this task you will need to figure out where in the source code to add your accessibility labels. Hint: A good starting point is to look where other screen elements are being styled/initialized

Once you have added accessibility labels you can confirm your additions by using the accessibility inspector. Use some new EarlGrey functions in order to select specific rows in the table view, and to enter text into your text field.

## Task #3: Creating custom matchers, actions, and assertions

##### Useful material and links: 

- [EarlGrey APIs] (https://github.com/google/EarlGrey/blob/master/docs/api.md)

##### Objective:

1. Create a custom matcher, action and assertion
2. Use your new skills in your tests (either create new ones or modify existing tests to use your new matchers, actions and assertions)

##### Description:

In order to complete this task, create at least one of each: custom matcher, action, an assertion and implement them in your tests.

## Task #4: Stubbing network requests

##### Useful material and links: 

- [Nocilla] (https://github.com/luisobo/Nocilla)
- [OHHTTPStubs] (https://github.com/AliSoftware/OHHTTPStubs)
- [Charles Proxy on the iOS Simulator] (https://www.charlesproxy.com/documentation/faqs/ssl-connections-from-within-iphone-applications/)

##### Objective:

1. Install Nocilla or OHHTTPStubs on the bootcamp app
2. Use the network stubbing tool of your choice to stub the network request being used to fetch ETT Pivots and give them new job titles

##### Description:

Get used to all the different ways you can stub network requests. You can use Charles Proxy to intercept the content of the network calls from the app, and edit it for your stub.

In order to complete this task, create a test class that makes use of network stubbing to create new values for ETT Pivots, and verifies them using the skills you've learned up until this point.

