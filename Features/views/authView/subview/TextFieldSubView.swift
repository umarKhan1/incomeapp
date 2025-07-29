//
//  TextFieldSubView.swift
//  GuessGame
//
//  Created by Muhammad Omar on 03/07/2025.
//
import SwiftUI

struct LabeledTextField: View {
  let label: String
  @Binding var text: String
  let placeholder: String
  let keyboard: UIKeyboardType
    let error: String?

  var body: some View {
    VStack(alignment: .leading, spacing: 6) {
      Text(label)
        .font(.custom("Poppins-Regular", size: 14))
        .foregroundColor(.secondary)

      TextField(placeholder, text: $text)
        .keyboardType(keyboard)
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
