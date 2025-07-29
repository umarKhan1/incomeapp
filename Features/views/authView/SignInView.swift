import SwiftUI

struct SignInView: View {
    @StateObject private var logintextFieldObject = AuthViewModel()
    @State private var navigateToSignup = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 58, height: 58)
                        .padding(.vertical, 20)
                    
                    Text("Login")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.custom("Poppins-SemiBold", size: 27))
                        .padding(.bottom, 90)
                    
                    LabeledTextField(
                        label: "Email",
                        text: $logintextFieldObject.email,
                        placeholder: "ex: omar@gmail.com",
                        keyboard: .emailAddress,
                        error: logintextFieldObject.emailError
                    )
                    .padding(.bottom, 20)
                    
                    SecureTextField(
                        label: "Password",
                        text: $logintextFieldObject.password,
                        placeholder: "**********",
                        error: logintextFieldObject.passwordError
                    )
                    .padding(.bottom, 30)
                    
                    Button(action: logintextFieldObject.loginValidate
                           
                    ) {
                        Text("Login")
                            .font(.custom("Poppins-SemiBold", size: 16))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 42)
                    }
                    .background(Color.primaryTheme)
                    .cornerRadius(6)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 30).navigationDestination(isPresented: $logintextFieldObject.showSuccess) {
                        Dashboard().navigationBarBackButtonHidden(true)
                        
                        
                    }
                    
                    Text("------------- or login with -------------")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.custom("Poppins-Regular", size: 16))
                        .foregroundStyle(.gray)
                        .padding(.bottom, 35)
                    
                    HStack {
                        SocialLoginView(buttonImageTitle: "google") {}
                        SocialLoginView(buttonImageTitle: "facebook") {}
                        SocialLoginView(buttonImageTitle: "twitter") {}
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 20)
                    
                    Spacer()
                    
                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(.gray)
                        
                        Button(action: {
                            navigateToSignup = true
                        }) {
                            Text("SIGN UP")
                                .foregroundColor(.primaryTheme)
                                .fontWeight(.regular)
                        }
                    }
                    .font(.system(size: 14))
                    .frame(maxWidth: .infinity)
                    
                    
                    
                    Spacer()
                }
                .padding(.horizontal, 40)
                .frame(maxWidth: .infinity, alignment: .center) .navigationDestination(isPresented: $navigateToSignup) {
                    SignupView().navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}

#Preview {
    SignInView()
}
