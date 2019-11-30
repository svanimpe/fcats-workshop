# Server-side Swift workshop

This repository contains the finished "Fcats" (Cat Facts) projects.

## Prerequisites

You will need the following to run the projects:

- Xcode 11
- [Homebrew](https://brew.sh)
- MongoDB and the MongoDB C Driver

To install MongoDB and its C driver, first install Homebrew, then run the following commands:

```
brew tap mongodb/brew
brew install mongodb-community
brew install mongo-c-driver
```

You can now start MongoDB with the following command:

```
brew services start mongodb-community
```

## Example 1: Hello from Kitura

This example covers project initialization, basic routing, and rendering [Stencil](https://github.com/stencilproject/Stencil) templates.

To run this project, either open **Package.swift** in Xcode, or execute `swift run` from the project's root directory.

If you're using Xcode, set the working directory to the project's root directory, or Xcode won't find your **Views** directory. You can set the working directory by editing the current scheme (to the right of the stop button) and going into **Run** ▸ **Options**.

If you want to recreate this project from scratch, use the following commands to create a new Swift package:

```
mkdir Hello
cd Hello
swift package init --type executable
```

## Example 2: Fcats

This example is a step up from the previous one. Its goal is to show how you can architect a more complex app.

The app is split into modules to allow for automated testing:

- **Main** is an executable target and contains bootstrap code. It sets up a router and starts the server.
- **Fcats** is a library containing all of the app's functionality.
- **FcatsTests** is a test target for **Fcats**. I've included a few end-to-end tests as an example.

> **Note**: This app's architecture is a simplified version of the architecture for [Around The Table](https://github.com/svanimpe/around-the-table), which is a full-scale server-side Swift project.

To run or test this app, you'll need to import the database. Go to the project's root directory and run `mongorestore` to import the **dump** directory and create the **fcats** database. To access this database from Swift, this project uses the official [MongoDB driver for Swift](https://github.com/mongodb/mongo-swift-driver).

## Example 3: Fcats (iOS)

This example is a basic iOS app that uses [KituraKit](https://github.com/IBM-Swift/KituraKit) to talk to the Kitura back-end from the previous example. KituraKit's API mirrors Kitura's codable routing API, making it easy for you to call your back-end from an iOS app.

KituraKit was added to the Xcode project using **File** ▸ **Swift Packages** ▸ **Add Package Dependency**. Xcode 11 supports adding Swift packages as a dependency, so you no longer need to use CocoaPods or Carthage for dependencies that support the Swift Package Manager.

## Useful links

- [Kitura's home page](https://www.kitura.io) is a good starting point to find documentation.
- [Swift@IBM's Slack channel](http://slack.kitura.io/) is the best place to ask questions and get help.
- [Stencil](https://github.com/stencilproject/Stencil) is Swift's most popular template language.
- [Stencil for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=svanimpe.stencil) is a Visual Studio Code extension that adds syntax highlighting, autocompletion, snippets and indentation support for Stencil.
- [MongoDB's official driver for Swift](https://github.com/mongodb/mongo-swift-driver) makes it easy to use MongoDB in a Swift project.
- [KituraKit](https://github.com/IBM-Swift/KituraKit) is an iOS client library for Kitura.
- [Around The Table](https://github.com/svanimpe/around-the-table) is a full-scale server-side Swift project that has been open sourced and documented to serve as a case study.
