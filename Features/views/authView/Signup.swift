//
//  Signup.swift
//  Educational Application
//
//  Created by Muhammad Omar on 09/07/2025.
//

import SwiftUI
struct SignupView: View {
   @StateObject private var TextFieldObject = AuthViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView{
            VStack (
                alignment: .leading,
                spacing: 10
            ) {
                Image(systemName: "arrowshape.backward").font(.system(size: 16)).padding(.bottom,69).onTapGesture {
                    dismiss()
                }
                Text("Create your account").frame(maxWidth: .infinity, alignment: .center).font(.custom("Poppins-SemiBold", size: 27,)).padding(.bottom,30)
                LabeledTextField(label: "Name", text: $TextFieldObject.userName, placeholder: "ex OmarKhan", keyboard: .default,
                error: TextFieldObject.userNameError
                )
                LabeledTextField(label: "Email", text: $TextFieldObject.email, placeholder: "ex: omar@gmail.com", keyboard: .emailAddress,
                error: TextFieldObject.emailError
                )
             SecureTextField(label: "Password", text: $TextFieldObject.password, placeholder: "**********",
             error: TextFieldObject.passwordError
             )
                SecureTextField(label: " Confrim Password", text: $TextFieldObject.confirmPassword, placeholder: "**********", error: TextFieldObject.confirmPasswordError)
         
                Button(action: TextFieldObject.SignUpVaildation) {
                    Text("Sign up")
                      .font(.custom("Poppins-SemiBold", size: 16))
                      .foregroundColor(.white)
                      .frame(maxWidth: .infinity, minHeight: 42)
                }
                .background(Color.primaryTheme)
                .cornerRadius(6)
                .padding(.horizontal, 16)
                .padding(.bottom, 20)

                Text("or signup with").frame(maxWidth: .infinity, alignment: .center).font(.custom("Poppins-Regular", size: 16)).foregroundStyle(.gray).padding(.bottom,20)
                HStack  {
                    
                    SocialLoginView(buttonImageTitle: "google") {
                    }
                    
                    SocialLoginView(buttonImageTitle: "facebook") {
                    }
                    
                    SocialLoginView(buttonImageTitle: "twitter") {
                    }
                    
                }.frame(maxWidth: .infinity,
                
                ).frame(maxWidth: .infinity, alignment: .center).padding(.bottom,20)
                
                HStack(spacing: 0) {
                    Text("Have an account? ")
                        .foregroundColor(.gray).padding(.trailing,3)
                    
                    Button(action: {
                       dismiss()
                    }) {
                        Text("SIGN IN")
                            .foregroundColor(.primaryTheme)
                            .fontWeight(.regular)
                    }
                }
                .font(.system(size: 14)) .frame(maxWidth: .infinity)
                Spacer()
            }.padding(.horizontal,40).frame(maxWidth: .infinity, alignment: .center).alert("Signed up!", isPresented: $TextFieldObject.showSuccess) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Your account has been created successfully.")
            }
        }}
}


#Preview {
    SignupView()
}

