import Foundation
import Combine

final class AuthViewModel: ObservableObject {
    
    @Published var userName        = ""
    @Published var email           = ""
    @Published var password        = ""
    @Published var confirmPassword = ""

   
    @Published var userNameError: String?        = nil
    @Published var emailError: String?           = nil
    @Published var passwordError: String?        = nil
    @Published var confirmPasswordError: String? = nil

   
    @Published var showSuccess = false

  
    func loginValidation() -> Bool {
        var valid = true

        if email.trimmingCharacters(in: .whitespaces).isEmpty {
            emailError = "This field is required"
            valid = false
        } else if !(email.contains("@") && email.contains(".")) {
            emailError = "Enter a valid email"
            valid = false
        } else {
            emailError = nil
        }

        if password.isEmpty {
            passwordError = "This field is required"
            valid = false
        } else if password.count < 8 {
            passwordError = "At least 8 characters"
            valid = false
        } else {
            passwordError = nil
        }
        return valid
    }

    

    
    
    func validate() -> Bool {
        var valid = true

        // Name
        if userName.trimmingCharacters(in: .whitespaces).isEmpty {
            userNameError = "This field is required"
            valid = false
        } else {
            userNameError = nil
        }

        // Email (simple check)
        if email.trimmingCharacters(in: .whitespaces).isEmpty {
            emailError = "This field is required"
            valid = false
        } else if !(email.contains("@") && email.contains(".")) {
            emailError = "Enter a valid email"
            valid = false
        } else {
            emailError = nil
        }

        // Password
        if password.isEmpty {
            passwordError = "This field is required"
            valid = false
        } else if password.count < 8 {
            passwordError = "At least 8 characters"
            valid = false
        } else {
            passwordError = nil
        }

        // Confirm
        if confirmPassword.isEmpty {
            confirmPasswordError = "This field is required"
            valid = false
        } else if confirmPassword != password {
            confirmPasswordError = "Passwords do not match"
            valid = false
        } else {
            confirmPasswordError = nil
        }

        return valid
    }

    func loginValidate() {
        if loginValidation() {
            showSuccess = true
            email = ""
            password = ""
            emailError = nil
            passwordError = nil
        }
    }
    
    /// Called when the user taps “Sign up”
    func SignUpVaildation() {
        if validate() {
            // all good → trigger success
            showSuccess = true
            email = ""
            password = ""
            emailError = nil
            passwordError = nil
        }
    }
}
