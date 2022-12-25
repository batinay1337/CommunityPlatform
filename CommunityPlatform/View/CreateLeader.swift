//
//  CreateLeader.swift
//  CommunityPlatform
//
//  Created by Batınay Ünsel on 24.12.2022.
//

import SwiftUI

struct CreateLeader: View {
    @EnvironmentObject var network: Network
    
    let welcomeName: String
    
    @State private var Student_idStudent = ""
    @State private var CommunityLeaderName = ""
    @State private var CommunityLeaderSurname = ""
    @State private var CommunityLeaderPassword = ""
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                
                Text("Assign a student as a community leader:")
                    .padding(.top, 60)
                    .foregroundColor(.red)
                
                TextField("Enter Student ID...", text: $Student_idStudent)
                
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.03), radius: 6, y: 7)
                    .frame(width: 343, height: 53)
                    .cornerRadius(8)
                    .foregroundColor(Color("TextColor"))
                
                
                TextField("Enter Student Name...", text: $CommunityLeaderName)
                
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.03), radius: 6, y: 7)
                    .frame(width: 343, height: 53)
                    .cornerRadius(8)
                    .foregroundColor(Color("TextColor"))
                
                TextField("Enter Student Surname...", text: $CommunityLeaderSurname)
                
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.03), radius: 6, y: 7)
                    .frame(width: 343, height: 53)
                    .cornerRadius(8)
                    .foregroundColor(Color("TextColor"))
                    
                
                TextField("Enter leader password", text: $CommunityLeaderPassword)
                
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.03), radius: 6, y: 7)
                    .frame(width: 343, height: 53)
                    .cornerRadius(8)
                    .foregroundColor(Color("TextColor"))
                    
                
                Text("Assign")
                    .onTapGesture {
                        //determine login validity
                        
                        
                        
                        
//                            let hashedPass = self.hashPassword(hashPassword(adminPassword))
                        if Student_idStudent != "" && CommunityLeaderPassword != "" {
                            let parameters: [String: Any] =  ["CommunityLeaderName": CommunityLeaderName,"CommunityLeaderSurname": CommunityLeaderSurname,"CommunityLeaderPassword" : CommunityLeaderPassword, "Student_idStudent": Student_idStudent]
                            
                            network.createCommunityLeader(parameters: parameters)
                        } else {
                            print("No data")
                        }
                        
                        
                        
                        
                    }
                    .frame(width: 267, height: 61)
                    .background(Color(.red))
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 32, y: 14)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                    .disabled(Student_idStudent.isEmpty)
                    .disabled(CommunityLeaderPassword.isEmpty)
                
                
            }
        }
    }
    
}

struct CreateLeader_Previews: PreviewProvider {
    static var previews: some View {
        CreateLeader(welcomeName: "Admin").environmentObject(Network())
    }
}
