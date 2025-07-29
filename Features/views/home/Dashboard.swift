//
//  Dashboard.swift
//  GuessGame
//
//  Created by Muhammad Omar on 24/07/2025.
//


import SwiftUI
struct Dashboard: View {
    @StateObject private var dashboard = BalaceViewModel()
    var body: some View {
    
            VStack {
                BalanceTransactionCard(income: dashboard.incomeAmount, expense: dashboard.expenseAmount, balance: dashboard.balanceAmount)
                List{
                    ForEach(dashboard.transactionmodel) { model in
                        
                        Button {
                            dashboard.transactionToEdit = model
                        } label: {
                            TransactionView(model:model)
                        }.foregroundStyle(Color.black)
                    }.onDelete(perform: dashboard.ondelete)
                }
                
                Button(action:{
                    dashboard.navigationForTransaction = true
                }) {
                    Text("Add Transaction").font(.custom("Poppins-SemiBold", size: 16))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 42)
                }.background(Color.primaryTheme)
                    .cornerRadius(6)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 60)
                
            }.scrollContentBackground(.hidden).ignoresSafeArea(.all).navigationDestination(item: $dashboard.transactionToEdit, destination: { transactionToEdit in
                TransactionScreen(transaction: $dashboard.transactionmodel, transactionEdit: dashboard.transactionToEdit)
            }).navigationDestination(isPresented: $dashboard.navigationForTransaction) {
                TransactionScreen(transaction: $dashboard.transactionmodel)
            }
        }
    
}


#Preview {
    Dashboard()
}

