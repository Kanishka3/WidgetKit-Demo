//
//  combine-object.swift
//  quote-generator
//
//  Created by Kanishka on 22/07/20.
//

import Foundation
import Combine 

public class TimerObject : ObservableObject {
    @Published public var currentText: String = "I slept and dreamt that life was joy. I awoke and saw that life was service. I acted and behold, service was joy"
    var num = 0
  
   public init(){
            Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { (timer) in
                self.currentText = QuoteList[self.num]
                self.UpdateText()
            }
        
    }
    @objc private func UpdateText(){
        if num < QuoteList.count - 1 {
        num = num + 1
        self.currentText = QuoteList[num]
        }}
}
 
