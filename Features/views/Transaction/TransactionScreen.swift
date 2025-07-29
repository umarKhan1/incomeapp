//
//  TransactionScreen.swift
//  GuessGame
//
//  Created by Muhammad Omar on 25/07/2025.
//

import SwiftUI


struct TransactionScreen: View {
    @State private var amount = 0.0
    @State private var transactionTypeSelection: TransactionModelEnum = .income
    @State private var amountTextField = ""
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @Environment(\.dismiss) var dissmiss
    @Binding var transaction: [TranactionModel]
    
    var transactionEdit: TranactionModel?
    
    var numberFormater: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
    
    var body: some View {
        VStack {
            TextField("0.0", value: $amount, formatter: numberFormater).font(.custom("Poppins-Semubold", size: 35,)).multilineTextAlignment(.center).keyboardType(.numberPad)
            Rectangle().frame(height: 1).foregroundColor(Color.gray).opacity(0.2).padding(.horizontal,30)
            
            Picker("Select Currency", selection: $transactionTypeSelection) {
                ForEach(TransactionModelEnum.allCases){
                    tranaction in Text(tranaction.title).tag(tranaction)
                }
            }
            
            
            
            TextField("Enter Title", text: $amountTextField).font(.custom( "Poppins-Semubold", size: 20)).textFieldStyle(RoundedBorderTextFieldStyle()).padding([.horizontal, .vertical], 20)
            
            Button(action: {
                guard amountTextField.count >= 4 else {
                    alertTitle = "Error"
                    alertMessage = "Title must be atleast 5 character long"
                    showAlert = true
                 return
                }
                let addingTransaction = TranactionModel(amount: amount, transactionType: transactionTypeSelection, date: Date(), title: amountTextField)
                
               if let transactionEdit = transactionEdit {
                 
                    transaction[transaction.firstIndex(of: transactionEdit)!] = addingTransaction
               }else {
                   transaction.append(addingTransaction)}
                dissmiss()
                
            }, label: {
                Text(transactionEdit != nil ?"Update Transaction" : "Create Transaction")
                    .font(.custom("Poppins-SemiBold", size: 16))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 42)
            }).background(Color.primaryTheme)
                .cornerRadius(6)
                .padding(.horizontal, 16)
                .padding(.bottom, 30)
            
       Spacer()
        }.padding(.vertical, 40).alert(alertTitle, isPresented: $showAlert, actions: {
            Button("Okay", action: {})
        }, message: {
            Text(alertMessage)
        }).onAppear() {
            
            if let transactionEdit = transactionEdit {
                amountTextField = transactionEdit.title
                amount = transactionEdit.amount
                transactionTypeSelection = transactionEdit.transactionType
            }
          
        }
    }
}

#Preview {
    TransactionScreen(transaction: .constant([]))
}
