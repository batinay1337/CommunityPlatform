//
//  PasswordField.swift
//  CommunityPlatform
//
//  Created by Batınay Ünsel on 22.12.2022.
//


import SwiftUI
import Foundation
import CommonCrypto


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




struct  PasswordField: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    
    
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
            }
    
    var body: some View {
        
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)
                        .frame(width: 343, height: 53)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.03), radius: 6, y: 7)
                        .cornerRadius(8)
                        .foregroundColor(Color("TextColor"))
                        
                } else {
                    TextField(title, text: $text)
                        .frame(width: 343, height: 53)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.03), radius: 6, y: 7)
                        .cornerRadius(8)
                        .foregroundColor(Color("TextColor"))
                    
                        
                }
                
                
            }
            
            Button(action: {
                isSecured.toggle()
                print("HASHEDVALUE: \(hashPassword(text))")
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            }
            
            
            
            
            
        }
        
    }
}
