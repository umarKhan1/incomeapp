//
//  TransactionView.swift
//  GuessGame
//
//  Created by Muhammad Omar on 24/07/2025.
//

import SwiftUI
struct TransactionView: View {
    let model: TranactionModel
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Text(model.displayDate)
                Spacer()
            }.background(.date.opacity(0.4)).clipShape(RoundedRectangle(cornerRadius: 5))
            HStack {
                Image(systemName: model.transactionType == .income ? "arrow.up.forward": "arrow.down.forward").resizable(capInsets: EdgeInsets()).frame(width: 20, height: 20).foregroundColor(model.transactionType == .expense ? .red: .green)
                VStack(alignment: .leading, spacing: 5.0) {
                    
                    HStack{
                        Text(model.title)  .font(.custom("Poppins-Regular", size:20).weight(.semibold))
                            .foregroundColor(.black)
                        Spacer()
                        Text(model.currenyDisplay)  .font(.custom("Poppins-Regular", size:20).weight(.semibold))
                            .foregroundColor(.black)
                        
                    }
                    
                    Text("Completed")  .font(.custom("Poppins-Regular", size:17).weight(.semibold))
                        .foregroundColor(.black)
                    
                }
                
                
                
            }
        }.listRowSeparator(.hidden)
    }
}


