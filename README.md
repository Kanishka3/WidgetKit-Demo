# WidgetKit-Demo

Index: 


- [WidgetKit 101](#Widgets-101) 
- [Widget Design](#Design) 
  - [Styles Supported](#Styles-Supported)
- [WidgetKit](#WidgetKit)
  - [Static Configuration](#Static-Configuration)
  - [Intent Configuration](#Intent-Configuration)
  - [Smart Stacks Relevance](#Smart-Stacks-Relevance)


## Widgets 101 

![Screenshot 2020-07-23 at 4 52 00 AM](https://user-images.githubusercontent.com/27673762/88239266-874d1c00-cca1-11ea-8241-f140c212dea0.png)

- Content projected should be relevant to user according time of the day 
- Try to make sure that the widget supports different sizes and is customizable (can be done using intents)
- Make it simple 
- Remember, the widget stays on home screen, the place where user hangs for 5-10 seconds before they hop to some other app! 


## Design 
### Styles Supported 

 ![Illustration of the design](https://user-images.githubusercontent.com/27673762/88238301-ecebd900-cc9e-11ea-9f3b-4d84c012083f.jpg)

Important Notes: 
- Widgets are meant to project important data from your app.
- Widgets are not mini apps 
- Widgets should not include the app name or app icon unless it is aggregator of content from some other source (example: News App) In the case you are using app icons, locate it on top right of your app.
- Widgets should not have scrolling or animations.

## WidgetKit

![Screenshot 2020-07-23 at 8 59 54 AM](https://user-images.githubusercontent.com/27673762/88249724-ee2efd00-ccc2-11ea-9ee3-a2c6deb9f19e.png)

### Static Configuration 
![configurationDisplayName(_Quote Widget_)](https://user-images.githubusercontent.com/27673762/88246872-7c9e8100-ccb9-11ea-823d-85bcf8b8891b.jpg)
 
 Static Configuration is the object which helps you configure the content shown in the widget. 
 
 It is used like this: 
 
 ```swift
struct Quote_Widget: Widget {
    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: "Widget",
                            intent: ConfigurationIntent.self,
                            provider: Provider(),
                            placeholder: PlaceholderView()) { entry in
            Quote_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("The Name")
        .description("....")
    }
}
 ```
 
 Along with StaticConfiguration, you also need an Entry, Provider and something like a `Quote_WidgetDisplayName` to use it. 
 
#### Entry

Consider it is like data structure that you are going to use throughout your app. Your Entry should conform to `TimelineEntry` and include other data that you are going to use throughout the widget (like the news headline for news app). Like here, we need an entry like following: 

 ```swift 

struct SimpleEntry: TimelineEntry {
    public let date: Date
    public let text: String
    public let relevance: TimelineEntryRelevance?
}


```

#### Provider

Provider is the object which is going to tell the StaticConfiguration to update. Your provider should conform to `IntentTimelineProvider`.  So, here is where the snapshot and updating the time entries stuff goes.



#### Placholder 

The placeholder view is a view that displays a generic representation of the widget. WidgetKit shows this view on the lock screen, and before rendering the widget’s content. 



### IntentConfiguration 



----- 




### Smart Stacks Relevance 

Smart Stacks is a new feature on iOS 14 which shows relevant Widget according time and utility. 
The system can handle and predict how relevant a widget is on a smart smart stack using _Timeline Entry Relevance_.
Quoting from documentation: 

The range of the `scale` is entirely up to you and could be 1 to 100, 50 to 5000, or any other range of positive numbers that’s meaningful to you. WidgetKit calculates the relative difference of scores between entries, so the absolute values don’t matter.
#### How to use it: 
In the entry you are using, add `public let relevance: TimelineEntryRelevance?` (for more, check the project)
