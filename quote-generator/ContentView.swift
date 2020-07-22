//
//  ContentView.swift
//  quote-generator
//
//  Created by Kanishka on 22/07/20.
//

import SwiftUI


public var QuoteList = [
    "You only live once, but if you do it right, once is enough.",
    "My life is my message",
    "Life isn’t about finding yourself. Life is about creating yourself ",
    "The greatest pleasure in life is what people say you cannot do ",
    "Life is really simple, but we insist on making it complicated",
    "You change your life by changing your heart",
    "When you want to live a happy life, tie it to a goal, not to people or objects",
    "Life is not a problem to be solved, but a reality to be experienced ",
    "If your life goes along too easily, you become soft.",
    "Be in love with your life. Every detail of it. ",
    "If you are alive, there is a purpose for life",
    "Live life to the fullest, and focus on the positive",
    "I choose to make the rest of my life, the best of my life.",
    "The only real failure in life is the failure to try.",
    
]

public struct ContentView: View {
    
    @ObservedObject public var texts = TimerObject()
    public var body: some View {
        Text(texts.currentText)
            .font(.callout)
            .bold()
            .padding(20)
            
    }
}


 
