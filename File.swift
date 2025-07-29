//
//  File.swift
//  GuessGame
//
//  Created by Muhammad Omar on 27/06/2025.
//

import SwiftUI
struct LoignView: View {
    @State var username: String = ""
    var body: some View {
            VStack {
                TextField("User Name", text: $username)
                    .padding(.horizontal, 16)
                    .font(.system(size: 12, weight: .semibold))
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius:9)
                            .stroke(Color.black.opacity(0.6), lineWidth: 1)
                    )
                    .padding(.horizontal, 20)
                
        }
    }
}

#Preview {
    LoignView()
}
