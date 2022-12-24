//
//  AdminLogin.swift
//  CommunityPlatform
//
//  Created by Batınay Ünsel on 22.12.2022.
//

import SwiftUI
import CommonCrypto

struct AdminLogin: View {
    @EnvironmentObject var network: Network
    
    @State private var adminName = "Batinay"
    @State private var adminPassword = "1234"
    @State private var isSecured: Bool = true
    
    
    @State private var isLoginValid: Bool = false
    @State private var welcomeName  = ""
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
                
                Text("ADMIN LOGIN")
                    .bold()
                    .font(.title)
                
                
                TextField("Enter user name...", text: $adminName)
                
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.03), radius: 6, y: 7)
                    .frame(width: 343, height: 53)
                    .cornerRadius(8)
                    .foregroundColor(Color("TextColor"))
                    .padding(.top, 40)
                
                
                
                PasswordField("Password", text: $adminPassword)
                
               
                
                NavigationLink(destination: AdminPanel(welcomeName: welcomeName).environmentObject(network), isActive: self.$isLoginValid) {
                    /*
                     Here we put the content view of `NavigationLink`.
                     It could be any `View` even `Button` but in this
                     example we use a `Text` with `onTapGesture`.
                     */
                    
                    
                    
                    Text("Sign in")
                        .onTapGesture {
                            //determine login validity
                            
                            
                            let hashedPass = self.hashPassword(hashPassword(adminPassword))
                            
                            //MARK: QUERYDEN GELEN PASSWORD SELECT BURADAKI HASH STRINGI ILE YER DEĞİŞTİRECEK
                            
                            var isLoginValid = false
                            
                            self.network.getAdmins()
                            
                            
                            for admin in self.network.admins {
                                
                                if admin.AdminPassword == adminPassword && admin.AdminName == adminName{
                                    isLoginValid = true
                                    self.welcomeName = admin.AdminName
                                    
                                    
                                }
                                
                                
                            }
                            
                            
                            
                            
                            
                            
                            
                            //trigger logic
                            if isLoginValid {
                                self.isLoginValid = true //trigger NavigationLink
                                
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
                .disabled(adminName.isEmpty)
                .disabled(adminPassword.isEmpty)
                
                
                
                
                
            }
            .alert(isPresented: $shouldShowLoginAlert) {
                Alert(title: Text("Email/Password incorrect"))
            }
            .onAppear {
                network.getAdmins()
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
    

}



struct AdminLogin_Previews: PreviewProvider {
    static var previews: some View {
        AdminLogin().environmentObject(Network())
    }
}

