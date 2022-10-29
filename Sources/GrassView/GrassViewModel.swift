//
//  File.swift
//  
//
//  Created by 김민성 on 2022/10/29.
//

import Foundation
import SwiftUI

extension GrassView {
    class GrassViewModel: ObservableObject {
        @Published var touchedLocation: CGPoint = CGPoint()
        @Published var selectedDate: String
        @Published var isDragEnd: Bool = false
        
        private let feedback = UISelectionFeedbackGenerator()
        private let formatter: DateFormatter
        
        init(formatter: DateFormatter ){
            self.formatter = formatter
            self._selectedDate = Published(initialValue: formatter.string(from: Date()))
        }
        
        func moveLocation(_ location: CGPoint) {
            touchedLocation = location
        }
        
        func checkContain(rect: CGRect) -> Bool {
            return rect.contains(touchedLocation)
        }
        
        func checkSelected(date: String) -> Bool {
            return selectedDate == date
        }
        
        func changeDate(date: String) {
            if !checkSelected(date: date){
                feedback.prepare()
                selectedDate = date
                feedback.selectionChanged()
            }
            
        }
        
        func startDrag() {
            isDragEnd = false
        }
        
        func endDrag() {
            isDragEnd = true
        }
        
        func tapTwice() {
            isDragEnd = false
            touchedLocation = CGPoint()
            selectedDate = formatter.string(from: Date())
        }
        
        
    }

}
