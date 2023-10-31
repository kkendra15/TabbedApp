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
    @Published var monthlyPaymentText = "0.00"
    
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
        var totalPayments: Int
        
        //compute monthly payment
       // monthlyPayment =
        
    }
    
}
