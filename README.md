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
- [EarlGrey Example Tests] (https://github.com/google/EarlGrey/blob/master/Demo/EarlGreyExample/EarlGreyExampleTests/EarlGreyExampleTests.m)

##### Objective:
Add a test that selects a Pivot from the table view, and makes sure their job title and projects leading value is displayed in the detail view.
