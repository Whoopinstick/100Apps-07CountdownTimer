//
//  ContentView.swift
//  07 - Countdown Timer
//
//  Created by Kevin Paul on 8/10/20.
//  Copyright © 2020 Whoopinstick. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDate: Date = Date().addingTimeInterval(86400)
    @State private var currentDate = Date()
    @State private var timer: Timer?
    
    var tomorrow: Date {
        let currentDate = Date()
        var dateComponent = DateComponents()
        dateComponent.day = 1
        let dayPlusOne = Calendar.current.date(byAdding: dateComponent, to: currentDate)
        
        return dayPlusOne ?? Date()
        
    }
    
    var selectedDateStart: Date {
        let date = selectedDate
        let cal = Calendar(identifier: .gregorian)
        let dateStart = cal.date(bySettingHour: 0, minute: 0, second: 0, of: date)
        return dateStart ?? Date()
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
                //print("tomorrow: \(self.tomorrow)")
            }
            
            //Text("current to selected start: \(currentDate.distance(to: selectedDateStart))")
            
            Group {
                Text("Days: \(currentDate.distance(to: selectedDateStart) / 86400, specifier: "%.0f")")
                Text("Hours: \((currentDate.distance(to: selectedDateStart)  / 60 / 60).truncatingRemainder(dividingBy: 24.0), specifier: "%.0f")")
                Text("Minutes: \((currentDate.distance(to: selectedDateStart) / 60).truncatingRemainder(dividingBy: 60.0), specifier: "%.0f")")
                Text("Seconds: \(currentDate.distance(to: selectedDateStart).truncatingRemainder(dividingBy: 60.0), specifier: "%.0f")")
                
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
