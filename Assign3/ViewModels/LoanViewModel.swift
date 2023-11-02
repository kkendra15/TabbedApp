//
//  LoanViewModel.swift
//  Assign3
//
//  Created by Kendra Ferguson on 10/30/23.
//

import Foundation

class LoanViewModel: ObservableObject {
    
    @Published var principleText = ""
    @Published var interestRate = 0.01
    @Published var loanLifetime = 0.0
    @Published var monthlyPaymentText = "$0.00"
    
    @Published var errorMessage = ""
    @Published var showAlert = false
    
    func computeLoan() {
        
        //ensure that principle entered was an integer
        guard let principle = Int(principleText) else {
            errorMessage = "Invalid principle value"
            showAlert = true
            return
        }
        
        var monthlyPayment: Double
        var temp: Double
        let monthlyInterest = interestRate / 100.0 / 12.0
        let totalPayments = loanLifetime * 12.0
        
        //compute monthly payment
        temp = pow((1.0 + monthlyInterest), totalPayments)
        monthlyPayment = Double(principle) * monthlyInterest * temp
        temp = temp - 1.0
        monthlyPayment = monthlyPayment / temp
        
        monthlyPaymentText = String(format:"$%.2f", monthlyPayment)
        
    }
    
}
