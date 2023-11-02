//
//  TempView.swift
//  Assign3
//
//  Created by Kendra Ferguson on 10/27/23.
//

import SwiftUI

struct TempView: View {
    
    @StateObject private var viewModel = TempViewModel()
 //   @State private var selectedTemp = 0

    var body: some View {

        VStack(alignment: .center) {
            Spacer()
                .frame(height: 10)
            Text("Temperature Conversion")
                .font(.title)
                .bold()
                .padding(20)
           
            Picker("Conversion Title", selection: $viewModel.conversionType) {
                Text("\u{2109} \u{2B62} \u{2103}").tag(0) //F to C
                Text("\u{2103} \u{2B62} \u{2109}").tag(1) //C to F
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            .onChange(of: viewModel.conversionType) { _ in    //change default value
                viewModel.defaultTemp()
            }
            
            Picker("Temperature Selection", selection: $viewModel.selectedTemp) {
                ForEach(viewModel.temperatures[viewModel.conversionType], id: \.self) {
                    
                    //display farenheit wheel
                    if viewModel.conversionType == 0 {
                        Text(String($0) + " \u{2109}")
                    }
                    
                    //display celsius wheel
                    else {
                        Text(String($0) + " \u{2103}")
                    }
                    
                }
            }
            .pickerStyle(.wheel)
            .onChange(of: viewModel.selectedTemp) { tag in    //change default value
                viewModel.convertTemp(myTemp: tag)
            }
            Text("\(viewModel.convertedTempText)")
               
            
            
            
            Spacer()
        } //end VStack
        
    }
}

struct TempView_Previews: PreviewProvider {
    static var previews: some View {
        TempView()
    }
}
