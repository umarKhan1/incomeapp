//
//  PasswordTextFieldSubView.swift
//  GuessGame
//
//  Created by Muhammad Omar on 03/07/2025.
//

import SwiftUI

struct SecureTextField: View {
  let label: String
  @Binding var text: String
  let placeholder: String
   
  @State private var isSecure = true
    let error: String?
  var body: some View {
    VStack(alignment: .leading, spacing: 6) {
      Text(label)
        .font(.custom("Poppins-Regular", size: 14))
        .foregroundColor(.secondary)

      HStack {
        Group {
          if isSecure {
            SecureField(placeholder, text: $text)
          } else {
            TextField(placeholder, text: $text)
          }
        }
        Button {
          isSecure.toggle()
        } label: {
          Image(systemName: isSecure ? "eye.slash" : "eye")
            .foregroundColor(.gray)
        }
      }
      .padding(.vertical, 14)
      .padding(.horizontal, 12)
      .background(Color(.systemGray6))
      .cornerRadius(8).overlay(
        RoundedRectangle(cornerRadius: 8)
          .stroke(error == nil ? Color.clear : Color.red, lineWidth: 1)
      )

   
      if let erorr = error {
          Text(erorr)
          .font(.caption)
          .foregroundColor(.red)
      }
    }
  }
}
