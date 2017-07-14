# WeatherApp
A simple weather iOS application that shows the weather from [openweathermap](http://openweathermap.org)

# Goal
The main goal is to display the weather forecast for the 16 next days for Paris, France.

## <a name="more-features"></a>more features
In adition to the main feature of the application, I could implement more [sexy things](https://www.youtube.com/watch?v=37FGwDMMZEg) that I'll list over the time in this section.

#Why?
Mainly for showing off my skill to you who is reding this file ;) (also for benchworking some stuffs that will go into the [more features](#more-features) section)

#What language ?
I'll be using the **SWIFT** language.

Firstly because the number of technologies for developping an iOS application in 2017 is not so big (Objective-C, SWIFT, and cross-platform technos like Cordova using Javascript).
Givent those choices, I feel most comfortable with SWIFT, it's clear, fast, can gives you robust code.

#What technologies ?
At the time I'm writing this section, the app is still a newborn baby, so I don't realy know what fancy technologies I'll be using.

For sure, I'll be using native frameworks, like UIKit, CocoaTouch, AutoLayout and maybe others like CoreData.

###How I handled dependencies

For the dependency manager, I choose to use [**Carthage**](https://github.com/Carthage/Carthage) for its lightweightness and simplicity of use.

I decided to not use **Cocoapods** because it makes a lot of black magic under the hood, like creating (and forcing you to use) an XCode Workspace containing your project, and I find it sometimes pretty annoying when it shows up some obscure errors while fetching dependencies or getting a new update.

Why not **Swift package manager**, though ? Well... the only reason for the is that I don't know it enougth yet for using it to show of my skills. But I think it will clearly be the next reference to the Swift development comunity !

###What dependencies I used

At this time, there are only two dependencies. Those are Alamofire, and AlamofireImage.

I don't have a lot to say about it, I choose them for handling the network layer and because I think their syntax and usage are pretty easy and nice.

#Any good practices ?
I'll definitely try to stick to the **TDD** practice. That's a good way to think of the [architecture](#the-architecture) and logic before runing, head down, somewhere we don't really know.

Other practices like keeping concerns as mostly and thoughtfully separated, keeping code clean by not making any very big functions and by using explicit variables, functions, and classes names.

## <a name="the-architecture"></a>Talking about architecture
In this application I'll take advantage of the [**MVP**](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93presenter) architecture (Model-View-Presenter)

The iOS environment uses the **MVC** (Model-View-Controller) pattern. Which has some problems as all the logic (interface and business) are sticked to the Controller part, giving birth to objects that take hundreds or even thousands of lines of code in a single file.

The **MVP** patterns tends to separate the interface and the business logic, sticking the interface management into the View part, and the business logic in the Presenter one.

In a more technical way, the View of the **MVP** pattern contains also the **UIViewController**, and the Presenter is just a **PONSO** (aka Pure Old NSObject) which is wayyyyyy nicer and easier for testing the business logic <3
