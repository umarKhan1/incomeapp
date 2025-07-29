//
//  BalanceView.swift
//  IncomeApplication
//
//  Created by Muhammad Omar on 24/07/2025.
//


import SwiftUI
struct BalanceTransactionCard: View {
    var income : String
    var expense : String
    var balance : String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8).fill(.primaryTheme)
            VStack(alignment: .leading, spacing: 15) {
                
                HStack {
                    VStack {
                        Text("Balance").font(.system(size: 15, weight: .semibold, )).foregroundColor(.white)
                        Text("\(balance)").font(.system(size: 50, weight: .semibold, )).foregroundColor(.white)
                    }
                    
                    Spacer()
                }.padding(.top)
                
                HStack(spacing: 25) {
                    VStack (alignment: .leading, spacing: 5){
                        Text("Expense").font(.system(size: 15, weight: .semibold, )).foregroundColor(.white)
                        Text("\(expense)").font(.system(size: 15, weight: .semibold, )).foregroundColor(.white)
                        
                    }
                    VStack (alignment: .leading, spacing: 5){
                        Text("Income").font(.system(size: 15, weight: .semibold, )).foregroundColor(.white)
                        Text("\(income)").font(.system(size: 15, weight: .semibold, )).foregroundColor(.white)
                        
                    }
                }
                
            Spacer()
            }.padding(.horizontal)
            
            
        }.shadow(color: .black.opacity(0.2),radius: 8, x: 0, y: 5).frame(height: 150).padding(.top, 100).padding(.horizontal)
        
        
    }
}
#Preview {
    BalanceTransactionCard(income: "", expense: "", balance:  "")
}
