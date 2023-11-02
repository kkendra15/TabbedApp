//
//  LoanView.swift
//  Assign3
//
//  Created by Kendra Ferguson on 10/27/23.
//

import SwiftUI

struct LoanView: View {
    
    @StateObject private var viewModel = LoanViewModel()
    
    private var interestFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.multiplier = 1
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    private var yearFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        return formatter
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
                .frame(height: 10)
            Text("Loan Calculator")
                .font(.largeTitle)
                .bold()
                .padding(20)
            Spacer()
                .frame(height: 30)
            
            TextField("Enter Principle", text: $viewModel.principleText)
                .textFieldStyle(.roundedBorder)
            
            Group {
                
                Stepper("Interest", value: $viewModel.interestRate, in: 0.01...20.00, step: 0.01)
                    .padding(.vertical, 15)
                
                HStack {
                    Text("Annual Rate")
                    Spacer()
                    Text("\(NSNumber(value: viewModel.interestRate), formatter: interestFormatter)")
                }
                .padding(.vertical, 15)
                
                HStack {
                    Text("Number of Years")
                    Spacer()
                    Text("\(NSNumber(value: viewModel.loanLifetime), formatter: yearFormatter)")
                }
                .padding(.vertical, 15)
                
                Slider(value: $viewModel.loanLifetime, in: 10...30, step: 5, minimumValueLabel: Text("10"), maximumValueLabel: Text("30"), label: {
                    Text("Temperature Conversion")
                })
                .padding(.vertical, 15)
                
                Button(action: {
                    viewModel.computeLoan()
                    }) {
                    Text("Calculate")
                      .padding(15)
                      .foregroundColor(.white)
                      .background(Capsule()  .foregroundColor(.black))
                      }
                    .padding(.vertical, 15)
                Spacer()
                    .frame(height: 30)
                
                HStack {
                    Text("Monthly Payment")
                    Spacer()
                    Text("\(viewModel.monthlyPaymentText)")
                }
            } //end group
           
          Spacer()
        } //end VStack
        .padding(.horizontal, 20)
    
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.errorMessage)
            )
        }
    }
}

struct LoanView_Previews: PreviewProvider {
    static var previews: some View {
        LoanView()
    }
}
