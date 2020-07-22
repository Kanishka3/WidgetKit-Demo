//
//  Customizable_Widget.swift
//  Customizable-Widget
//
//  Created by Kanishka on 22/07/20.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    public func snapshot(for configuration: ConfigurationIntent, with context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    public func timeline(for configuration: ConfigurationIntent, with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for offset in 0..<20 {
            let entrytime = Calendar.current.date(byAdding: .minute, value: offset, to: currentDate)!
            let entryToAdd = SimpleEntry(date: entrytime, configuration: configuration)
            entries.append(entryToAdd)
//            print(entrytime.description)
            print(entryToAdd.date)
            
        }
      
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    public let date: Date
    public let configuration: ConfigurationIntent
}

struct PlaceholderView : View {
   @State private var item = TimerObject()
    var body: some View {
        Text(item.currentText)
    }
}

struct Customizable_WidgetEntryView : View {
    var entry: Provider.Entry
    @State private var item = TimerObject()
    var body: some View {
        Text(item.currentText)
    }
}

@main
struct Customizable_Widget: Widget {
    private let kind: String = "Customizable_Widget"

    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider(), placeholder: PlaceholderView()) { entry in
            Customizable_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct Customizable_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Customizable_WidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
