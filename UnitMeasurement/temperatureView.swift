//
//  temperatureView.swift
//  UnitMeasurement
//
//  Created by Daffashiddiq on 02/06/21.
//

import SwiftUI

struct temperatureView: View {
    @State var temperature = 0
    @State var temperatureTarget = 0
    @State var temperatureAmount = ""
    let temperatures = ["Celcius", "Fahrenheit", "Kelvin"]
    
    var temperatureResult: Measurement<UnitTemperature> {
        var startTemp: Measurement<UnitTemperature>
        if temperature == 0 {
            startTemp = Measurement(value: Double(temperatureAmount) ?? 0, unit: UnitTemperature.celsius)
        } else if temperature == 1 {
            startTemp = Measurement(value: Double(temperatureAmount) ?? 0, unit: UnitTemperature.fahrenheit)
            startTemp = startTemp.converted(to: UnitTemperature.celsius)
        } else {
            startTemp = Measurement(value: Double(temperatureAmount) ?? 0, unit: UnitTemperature.kelvin)
            startTemp = startTemp.converted(to: UnitTemperature.celsius)
        }
        
        switch temperatures[temperatureTarget] {
        case "Celcius":
            return startTemp
        case "Fahrenheit":
            return startTemp.converted(to: UnitTemperature.fahrenheit)
        case "Kelvin":
            return startTemp.converted(to: UnitTemperature.kelvin)
        default:
            return Measurement<UnitTemperature>(value: 0, unit: UnitTemperature.celsius)
        }
    }
    
    var body: some View {
        Section(header: Text("Temperature Converter")) {
            Picker("Based Temperature", selection: $temperature) {
                ForEach(0 ..< temperatures.count) {
                    Text("\(self.temperatures[$0])")
                }
            }.pickerStyle(SegmentedPickerStyle())
            TextField("Temperature Amount", text: $temperatureAmount)
                .keyboardType(.decimalPad)
            Picker("Convert to", selection: $temperatureTarget) {
                ForEach(0 ..< temperatures.count) {
                    Text("\(self.temperatures[$0])")
                }
            }.pickerStyle(SegmentedPickerStyle())
            Text("\(temperatureResult.value)")
        }
    }
}

struct temperatureView_Previews: PreviewProvider {
    static var previews: some View {
        temperatureView()
    }
}
