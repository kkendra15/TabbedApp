//
//  TempViewModel.swift
//  Assign3
//
//  Created by Kendra Ferguson on 10/30/23.
//

import Foundation

class TempViewModel: ObservableObject {
    
    @Published var temperatures = [Array(-129...134), Array(-90...57)]
    @Published var conversionType = 0;
    @Published var convertedTemp = 0
    @Published var convertedTempText = "0"

    
    func convertTemp(selectedTemp: Int) {
        
        //fahrenheit to celsius
        if selectedTemp == 0 {
            convertedTemp = (selectedTemp - 32) * 5 / 9
            convertedTempText = String("\(convertedTemp) \u{2109}")
        }
        
        //selsius to fahrenheit
        else {
            convertedTemp = (selectedTemp * 9 / 5) + 32
            convertedTempText = String("\(convertedTemp)  \u{2103}")
        }
        
    }
}
