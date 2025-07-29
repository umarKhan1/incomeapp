//
//  BalanceModel.swift
//  BalanceModel
//
//  Created by Muhammad Omar on 29/07/2025.
//


import Foundation

final class BalaceViewModel: ObservableObject {
    @Published  var navigationForTransaction = false
    @Published  var transactionmodel:[TranactionModel] = [
    ]
    @Published  var transactionToEdit: TranactionModel?
    @Published  var showEditTransactionView: Bool = false
    
    var expenseAmount: String {
        let amount = transactionmodel.filter({$0.transactionType == .expense}).reduce(0) { $0 + $1.amount }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        return numberFormatter.string(from: NSNumber(value: amount)) ?? "0.0"
    }
    var incomeAmount: String {
        let amount = transactionmodel.filter({$0.transactionType == .income}).reduce(0) { $0 + $1.amount }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        return numberFormatter.string(from: NSNumber(value: amount)) ?? "0.0"
    }
    
    var balanceAmount: String {
       
        let incomeAmount = transactionmodel.filter({$0.transactionType == .income}).reduce(0) { $0 + $1.amount }
        let expnseAmount = transactionmodel.filter({$0.transactionType == .expense}).reduce(0) { $0 + $1.amount }
      let  balanceAmount = incomeAmount - expnseAmount
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        return numberFormatter.string(from: NSNumber(value: balanceAmount)) ?? "0.0"
    }
    func ondelete(at offsets: IndexSet) {
        transactionmodel.remove(atOffsets: offsets)
    }
    
}
