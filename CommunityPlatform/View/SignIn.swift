//
//  SignIn.swift
//  CommunityPlatform
//
//  Created by Batınay Ünsel on 22.12.2022.
//


import SwiftUI

import CommonCrypto




struct SignIn: View {
    
    @EnvironmentObject var network: Network
   
    
    @State private var userName = "Batinay"
    @State private var password = "1234"
    @State private var isSecured: Bool = true
    
    
    @State private var isLoginValidStu: Bool = false
    @State private var isLoginValidAdmin: Bool = false
    @State private var shouldShowLoginAlert: Bool = false
    
    //for easteregg admin login channel
    
    @State private var isAdminEaster: Bool = false
    @State private var isAdminEasterButton: Int = 0
    
    
    
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
                
                    
                    Text("Sign in")
                        .onTapGesture {
                            //determine login validity
                            
                            
                            let hashedPass = self.hashPassword(hashPassword(password))
                            
                            //MARK: QUERYDEN GELEN PASSWORD SELECT BURADAKI HASH STRINGI ILE YER DEĞİŞTİRECEK
                            
                            var isLoginValid = false
                            
                            self.network.getUsers()
                            
                            
                            for student in self.network.students {
                                if student.StudentPassword == hashedPass && student.StudentName == userName{
                                    isLoginValid = true
                                    print(student.StudentPassword)
                                    
                                }
                            }
                            
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
                    .navigationDestination(isPresented: self.$isLoginValidStu) {
                        Mainpage().environmentObject(Network())
                    }
//                    .disabled(userName.isEmpty)
//                    .disabled(password.isEmpty)
                    .onAppear {
                                network.getUsers()
                            }
                
                
                HStack{
                    
                    NavigationLink {
                        AdminLogin().environmentObject(Network())
                    } label: {
                        Text(" ")
                        if isAdminEaster == true{
                            Text("Admin").bold()
                            Label("Login", systemImage: "bolt.fill").bold()
                        }
                    }
                   
                }
                .padding(.top)
                .padding(.bottom)
                
                
                
                Button {
                    //Code here before changing the bool value
                    
                    self.isAdminEasterButton += 1
                    
                    if self.isAdminEasterButton == 6 {
                        self.isAdminEaster = true
                    }
                    
                } label: {
                    Text(" ")
                    if self.isAdminEasterButton > 2 {
                        Label("",systemImage: "bolt.fill").bold()
                            .foregroundColor(Color(red: 0.34, green: 0.40, blue: 0.99))
                    }
                }
                .offset(x:160,y:50)
                .frame(width: 20, height: 20)
                
                
                
            }
            .onAppear {
                        network.getUsers()
                    }
            .alert(isPresented: $shouldShowLoginAlert) {
                Alert(title: Text("Email/Password incorrect"))
            }
            
        }
        
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn().environmentObject(Network())
    }
}

