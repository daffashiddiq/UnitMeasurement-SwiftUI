//
//  ContentView.swift
//  UnitMeasurement
//
//  Created by Daffashiddiq on 01/06/21.
//

import SwiftUI

struct ContentView: View {
    let measurements = ["Length","Temperature","Time","Volume"]
    
    @State var measurement = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Choose your measurement")) {
                    Picker("Measurements", selection: $measurement) {
                        ForEach(0 ..< measurements.count) {
                            Text("\(self.measurements[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                if measurement == 1 {
                    temperatureView()
                } else if measurement == 0 {
                    lengthView()
                } else if measurement == 2 {
                    timeView()
                } else {
                    volumeView()
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
