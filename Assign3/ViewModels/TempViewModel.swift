//
//  TempViewModel.swift
//  Assign3
//
//  Created by Kendra Ferguson on 10/30/23.
//

import Foundation

class TempViewModel: ObservableObject {
    
    @Published var temperatures = [Array(-129...134), Array(-90...57)]
    @Published var conversionType = 0
    @Published var selectedTemp = 32
    @Published var convertedTemp = 0.00
    @Published var convertedTempText = "0.00 \u{2103}"
    
    func defaultTemp() {
        
        //if F to C
        if conversionType == 0 {
            selectedTemp = 32
            convertedTempText = "0.0 \u{2109}"
        }
        else {
            selectedTemp = 0
            convertedTempText = "32.0 \u{2103}"
        }
    }

    /**
        Converts temperature between celsius and fahrenheit and formats it into a string
        @param integer rempresenting the temperature to convert
     */
    func convertTemp(myTemp: Int) {
        
        //fahrenheit to celsius
        if conversionType == 0 {
            convertedTemp = (Double(myTemp) - 32.0) * (5.0 / 9.0)
            convertedTempText = String(format: "%.2f \u{2103}", convertedTemp)
        }
        
        //celsius to fahrenheit
        else {
            convertedTemp = (Double(myTemp) * (9.0 / 5.0)) + 32.0
            convertedTempText = String(format: "%.2f \u{2109}", convertedTemp)
        }
        
    }
}
