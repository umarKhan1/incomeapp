//
//  TransactionModelEnum.swift
//  GuessGame
//
//  Created by Muhammad Omar on 24/07/2025.
//

enum TransactionModelEnum:String, CaseIterable, Identifiable {
    case income,expense
    var id : Self {
        self
    }
    var title: String {
        switch self{
            case .income:
            return "Income"
        case .expense:
            return "Expense"
        }
    }
    
}
