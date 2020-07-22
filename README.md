# WidgetKit-Demo


## Design 

### Styles Supported 


![Design Demo](https://user-images.githubusercontent.com/27673762/88223349-f10afd00-cc84-11ea-8977-7bc408727d83.png)



Important Notes: 
- Widgets are meant to project important data from your app.
- Widgets are not mini apps 
- Widgets should not have scrolling or animations.

## WidgetKit
### Timeline Entry Relevance: Smart Stacks relevance 
Smart Stacks is a new feature on iOS 14 which shows relevant Widget according time and utility. 

Quoting from documentation: 

The range of the `scale` is entirely up to you and could be 1 to 100, 50 to 5000, or any other range of positive numbers that’s meaningful to you. WidgetKit calculates the relative difference of scores between entries, so the absolute values don’t matter.
#### How to use it: 
In the entry you are using, add `public let relevance: TimelineEntryRelevance?` (for more, check the project)
