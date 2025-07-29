//
//  TranactionModel.swift
//  IncomeApp
//
//  Created by Muhammad Omar on 24/07/2025.
//


import Foundation

struct TranactionModel: Identifiable, Hashable {
    let id = UUID()
    let amount: Double
    let transactionType: TransactionModelEnum
    let date: Date
    let title: String
    var displayDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: date)
    }
    var currenyDisplay: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        return numberFormatter.string(from: NSNumber(value: amount)) ?? "$.00"
    }
    
    
    
}
