//
//  ContentView.swift
//  07 - Countdown Timer
//
//  Created by Kevin Paul on 8/10/20.
//  Copyright © 2020 Whoopinstick. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    
    @State private var selectedDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    @State private var currentDate = Date()
    @State private var timer: Timer?
    @State private var isStarted = false
    
    var selectedDateStart: Date {
        let date = selectedDate
        let startOfDay = Calendar.current.dateInterval(of: .day, for: date)?.start ?? date
        return startOfDay
    }
    
    var daysBetween: Int {
        let between = Calendar.current.dateComponents([.day], from: currentDate, to: selectedDateStart).day ?? 0
        return between
    }
    
    var hoursBetween: Int {
        let between = Calendar.current.dateComponents([.hour], from: currentDate, to: selectedDateStart).hour ?? 0
        return between % 24
    }
    
    var minutesBetween: Int {
        let between = Calendar.current.dateComponents([.minute], from: currentDate, to: selectedDateStart).minute ?? 0
        return between % 60
    }
    
    var secondsBetween: Int {
        let between = Calendar.current.dateComponents([.second], from: currentDate, to: selectedDateStart).second ?? 0
        return between % 60
    }
    
    var body: some View {
        VStack {
            Text("Select a date in the future:")
            
            DatePicker("Select a date", selection: $selectedDate, in: tomorrow..., displayedComponents: .date)
                .labelsHidden()
            
            
            Button("Start Countdown") {
                self.isStarted.toggle()
                self.currentDate = Date()
                
                if self.isStarted {
                    self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                        self.currentDate = Date()
                    }
                } else {
                    self.timer?.invalidate()
                }
            }
            .padding()
            
            if isStarted {
                VStack {
                    HStack(alignment: .center) {
                        Spacer()
                        Text("Days")
                        Spacer()
                        Text("Hours")
                        Spacer()
                        Text("Minutes")
                        Spacer()
                        Text("Seconds")
                        Spacer()
                    }
                    HStack(alignment: .center) {
                        Spacer()
                        Text("\(daysBetween)")
                        Spacer()
                        Text("\(hoursBetween)")
                        Spacer()
                        Text("\(minutesBetween)")
                        Spacer()
                        Text("\(secondsBetween)")
                        Spacer()
                    }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
