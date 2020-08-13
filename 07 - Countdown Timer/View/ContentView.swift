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
                self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    self.currentDate = Date()
                }
            }
            
            Button("Print dates") {
                print("now: \(Date())")
                print("current: \(self.currentDate)")
                print("selected: \(self.selectedDateStart)")
                print("tomorrow: \(self.tomorrow)")
            }
             
            Group {
                Text("Days: \(daysBetween)")
                Text("Hours: \(hoursBetween)")
                Text("Minutes: \(minutesBetween)")
                Text("Seconds: \(secondsBetween)")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
