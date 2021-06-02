//
//  lengthView.swift
//  UnitMeasurement
//
//  Created by Daffashiddiq on 02/06/21.
//

import SwiftUI

struct lengthView: View {
    @State var length = 0
    @State var lengthTarget = 0
    @State var lengthAmount = ""
    let lengths = ["m", "Km", "feet","Yards","Miles"]
    
    var lengthResult: Measurement<UnitLength> {
        var startLength: Measurement<UnitLength>
        if length == 0 {
            startLength = Measurement(value: Double(lengthAmount) ?? 0, unit: UnitLength.meters)
        } else if length == 1 {
            startLength = Measurement(value: Double(lengthAmount) ?? 0, unit: UnitLength.kilometers)
            startLength = startLength.converted(to: UnitLength.meters)
        } else if length == 2 {
            startLength = Measurement(value: Double(lengthAmount) ?? 0, unit: UnitLength.feet)
            startLength = startLength.converted(to: UnitLength.meters)
        } else if length == 3 {
            startLength = Measurement(value: Double(lengthAmount) ?? 0, unit: UnitLength.yards)
            startLength = startLength.converted(to: UnitLength.meters)
        } else {
            startLength = Measurement(value: Double(lengthAmount) ?? 0, unit: UnitLength.miles)
            startLength = startLength.converted(to: UnitLength.meters)
        }
        
        switch lengths[lengthTarget] {
        case "m":
            return startLength
        case "Km":
            return startLength.converted(to: UnitLength.kilometers)
        case "feet":
            return startLength.converted(to: UnitLength.feet)
        case "Yards":
            return startLength.converted(to: UnitLength.yards)
        case "Miles":
            return startLength.converted(to: UnitLength.miles)
        default:
            return Measurement<UnitLength>(value: 0, unit: UnitLength.meters)
        }
    }
    
    var body: some View {
        Section(header: Text("Length Converter")) {
            Picker("Based Length", selection: $length) {
                ForEach(0 ..< lengths.count) {
                    Text("\(self.lengths[$0])")
                }
            }.pickerStyle(SegmentedPickerStyle())
            TextField("Length Amount", text: $lengthAmount)
                .keyboardType(.decimalPad)
            Picker("Convert to", selection: $lengthTarget) {
                ForEach(0 ..< lengths.count) {
                    Text("\(self.lengths[$0])")
                }
            }.pickerStyle(SegmentedPickerStyle())
            Text("\(lengthResult.value)")
        }
    }
}


struct lengthView_Previews: PreviewProvider {
    static var previews: some View {
        lengthView()
    }
}
