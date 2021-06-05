//
//  volumeView.swift
//  UnitMeasurement
//
//  Created by Daffashiddiq on 02/06/21.
//

import SwiftUI

struct volumeView: View {
    @State var volume = 0
    @State var volumeTarget = 0
    @State var volumeAmount = ""
    let volumes = ["ml", "liters", "cups", "pints","gallons"]
    var textColor: Bool {
        return volumeAmount == "0" ? true : false
    }
    var volumeResult: Measurement<UnitVolume> {
        var startVolume: Measurement<UnitVolume>
        if volume == 0 {
            startVolume = Measurement(value: Double(volumeAmount) ?? 0, unit: UnitVolume.milliliters)
        } else if volume == 1 {
            startVolume = Measurement(value: Double(volumeAmount) ?? 0, unit: UnitVolume.liters)
            startVolume = startVolume.converted(to: UnitVolume.milliliters)
        } else if volume == 2 {
            startVolume = Measurement(value: Double(volumeAmount) ?? 0, unit: UnitVolume.cups)
            startVolume = startVolume.converted(to: UnitVolume.milliliters)
        } else if volume == 3 {
            startVolume = Measurement(value: Double(volumeAmount) ?? 0, unit: UnitVolume.pints)
            startVolume = startVolume.converted(to: UnitVolume.milliliters)
        } else {
            startVolume = Measurement(value: Double(volumeAmount) ?? 0, unit: UnitVolume.gallons)
            startVolume = startVolume.converted(to: UnitVolume.milliliters)
        }
        
        switch volumes[volumeTarget] {
        case "ml":
            return startVolume
        case "liters":
            return startVolume.converted(to: UnitVolume.liters)
        case "cups":
            return startVolume.converted(to: UnitVolume.cups)
        case "pints":
            return startVolume.converted(to: UnitVolume.pints)
        case "gallons":
            return startVolume.converted(to: UnitVolume.gallons)
        default:
            return Measurement<UnitVolume>(value: 0, unit: UnitVolume.milliliters)
        }
    }
    
    var body: some View {
        Section(header: Text("Volume Converter")) {
            Picker("Based Volume", selection: $volume) {
                ForEach(0 ..< volumes.count) {
                    Text("\(self.volumes[$0])")
                }
            }.pickerStyle(SegmentedPickerStyle())
            TextField("Length Amount", text: $volumeAmount)
                .keyboardType(.decimalPad)
                .background(textColor ? Color.red : Color.white)
            Picker("Convert to", selection: $volumeTarget) {
                ForEach(0 ..< volumes.count) {
                    Text("\(self.volumes[$0])")
                }
            }.pickerStyle(SegmentedPickerStyle())
            Text("\(volumeResult.value)")
        }
    }
}

struct volumeView_Previews: PreviewProvider {
    static var previews: some View {
        volumeView()
    }
}
