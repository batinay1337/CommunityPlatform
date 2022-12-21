//
//  SignIn.swift
//  CommunityPlatform
//
//  Created by Batınay Ünsel on 22.12.2022.
//


import SwiftUI

import CommonCrypto

struct SignIn: View {
    
    @State private var userName = "root"
    @State private var password = "toor"
    @State private var isSecured: Bool = true
    
    
    
    @State private var isLoginValidStu: Bool = false
    @State private var isLoginValidAdmin: Bool = false
    @State private var shouldShowLoginAlert: Bool = false
    
    
    
    func hashPassword(_ password: String) -> String {
      let salt = "my-salt-value"
      let saltedPassword = password + salt
      let data = saltedPassword.data(using: .utf8)!
      let hash = data.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) -> [UInt8] in
        var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        CC_SHA256(bytes.baseAddress, CC_LONG(data.count), &hash)
          
        return hash
      }
      return hash.map { String(format: "%02x", $0) }.joined()
    }
    
    
    
    
    var body: some View {
        NavigationView{
            
            
            
            VStack{
                Image("SignInImage")
                
                TextField("Enter user name...", text: $userName)
                
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.03), radius: 6, y: 7)
                    .frame(width: 343, height: 53)
                    .cornerRadius(8)
                    .foregroundColor(Color("TextColor"))
                    .padding(.top, 40)
                
                
                
                PasswordField("Password", text: $password)
                
                
                NavigationLink(destination: Mainpage(), isActive: self.$isLoginValidStu) {
                    /*
                     Here we put the content view of `NavigationLink`.
                     It could be any `View` even `Button` but in this
                     example we use a `Text` with `onTapGesture`.
                     */
                    Text("Sign in")
                        .onTapGesture {
                            //determine login validity
                            
                            //MARK: DOUBLE HASH FCKN MUTHİŞ
                            let hashedPass = self.hashPassword(hashPassword(password))
                            
                            //MARK: QUERYDEN GELEN PASSWORD SELECT BURADAKI HASH STRINGI ILE YER DEĞİŞTİRECEK
                            
                            let isLoginValid = self.userName == "root" && hashedPass == "27eb25f2b8cfc542244d56b861064b006307df4a2f0e0f6ce144be42dba381e4"
                            
                            //trigger logic
                            if isLoginValid {
                                self.isLoginValidStu = true //trigger NavigationLink
                            }
                            else {
                                self.shouldShowLoginAlert = true //trigger Alert
                            }
                        }
                    
                    
                    .frame(width: 267, height: 61)
                    .background(Color(red: 0.34, green: 0.40, blue: 0.99))
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 32, y: 14)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .padding(.top)
                }
                
                
                
                HStack{
                    Text("For admin -> ")
                    
                    NavigationLink(destination: AdminLogin(), isActive: self.$isLoginValidAdmin) {
                        /*
                         Here we put the content view of `NavigationLink`.
                         It could be any `View` even `Button` but in this
                         example we use a `Text` with `onTapGesture`.
                         */
                        Text("Login")
                            .onTapGesture {
                                
                                //trigger logic
                                self.isLoginValidAdmin = true //trigger NavigationLink
                                
                               
                            }
                    }
                }
                .padding(.top)
                .padding(.bottom)
            }
            .alert(isPresented: $shouldShowLoginAlert) {
                Alert(title: Text("Email/Password incorrect"))
            }
        }
    }
}




struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
