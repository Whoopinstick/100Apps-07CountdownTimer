//
//  ContentView.swift
//  07 - Countdown Timer
//
//  Created by Kevin Paul on 8/10/20.
//  Copyright © 2020 Whoopinstick. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDate: Date = Date()
    var selectedDateStart: Date {
        let date = selectedDate
        let cal = Calendar(identifier: .gregorian)
        let dateStart = cal.startOfDay(for: date)
        return dateStart
    }
    var body: some View {
        VStack {
            Text("Select a date in the future:")
            
            DatePicker("Select a date", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                .labelsHidden()
            
            Button("Start Countdown") {
                print("selected date: \(self.selectedDate)")
                print("selected date start: \(self.selectedDateStart)")
            }
            
            Text("current to selected start: \(Date().distance(to: selectedDateStart))")
            
            Group {
                Text("Days: \(Date().distance(to: selectedDateStart) / 24 / 60 / 60, specifier: "%.0f")")
                Text("Hours: \((Date().distance(to: selectedDateStart)  / 60 / 60).truncatingRemainder(dividingBy: 24.0), specifier: "%.0f")")
                Text("Minutes: \((Date().distance(to: selectedDateStart) / 60).truncatingRemainder(dividingBy: 60.0), specifier: "%.0f")")
                Text("Seconds: \(Date().distance(to: selectedDateStart).truncatingRemainder(dividingBy: 60.0), specifier: "%.0f")")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
