//
//  ContentView.swift
//  SwiftUI_iOS13_DatePicker
//
//  Created by bakhaan on 2021/02/11.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedDate = Date()
    
    var presentDateStyle: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 HH:mm:ss"
        return formatter.string(from: selectedDate)
    }
    
    var dateClosedRange: ClosedRange<Date> {
        let startDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        let endDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())
        
        return startDate!...endDate!
    }
    
    var body: some View {
        VStack {
            
//            DatePicker(selection: $selectedDate, displayedComponents: .date) {
//                Text("Selected Date")
//            }
//            .labelsHidden()
//
//            Text(presentDateStyle)
            
            // Date 범위 제한하기
            // Date()... -> 이전 날짜 선택X
            // ...Date() -> 이후 날짜 선택X
            DatePicker(selection: $selectedDate, in: Date()...) {
                Text("Range Date")
            }
            
            // Date 범위 직접 지정
            DatePicker(selection: $selectedDate, in: dateClosedRange) {
                Text("ClosedRange Date")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
