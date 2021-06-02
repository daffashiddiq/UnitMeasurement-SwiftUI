//
//  timeView.swift
//  UnitMeasurement
//
//  Created by Daffashiddiq on 02/06/21.
//

import SwiftUI

struct timeView: View {
    @State var time = 0
    @State var timeTarget = 0
    @State var timeAmount = ""
    let times = ["Secs", "Mins", "Hours"]
    var timeResult: Measurement<UnitDuration> {
        var startTime: Measurement<UnitDuration>
        if time == 0 {
            startTime = Measurement(value: Double(timeAmount) ?? 0, unit: UnitDuration.seconds)
        } else if time == 1 {
            startTime = Measurement(value: Double(timeAmount) ?? 0, unit: UnitDuration.minutes)
            startTime = startTime.converted(to: UnitDuration.seconds)
        } else {
            startTime = Measurement(value: Double(timeAmount) ?? 0, unit: UnitDuration.hours)
            startTime = startTime.converted(to: UnitDuration.seconds)
        }
        
        switch times[timeTarget] {
        case "Secs":
            return startTime
        case "Mins":
            return startTime.converted(to: UnitDuration.minutes)
        case "Hours":
            return startTime.converted(to: UnitDuration.hours)
        default:
            return Measurement<UnitDuration>(value: 0, unit: UnitDuration.seconds)
        }
    }
    
    var body: some View {
        Section(header: Text("Time Converter")) {
            Picker("Based Time", selection: $time) {
                ForEach(0 ..< times.count) {
                    Text("\(self.times[$0])")
                }
            }.pickerStyle(SegmentedPickerStyle())
            TextField("Time Amount", text: $timeAmount)
                .keyboardType(.decimalPad)
            Picker("Convert to", selection: $timeTarget) {
                ForEach(0 ..< times.count) {
                    Text("\(self.times[$0])")
                }
            }.pickerStyle(SegmentedPickerStyle())
            Text("\(timeResult.value)")
        }
    }
    
}

struct timeView_Previews: PreviewProvider {
    static var previews: some View {
        timeView()
    }
}
