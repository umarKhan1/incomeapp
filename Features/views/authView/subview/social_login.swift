//
//  social_login.swift
//  GuessGame
//
//  Created by Muhammad Omar on 24/07/2025.
//
import SwiftUI
struct SocialLoginView: View{
    let buttonImageTitle: String
    let action: () -> Void
    var body: some View{
        Button(action: action, label: {
            Image(buttonImageTitle)
                .resizable()
                .renderingMode(.original)    // so Facebook blue stays blue
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
        }) .frame(width: 86, height: 42)
            .background(Color(.systemGray6))
            .cornerRadius(12).padding(.trailing,20)
    }
}
