//
//  CreateCommunity.swift
//  CommunityPlatform
//
//  Created by Batınay Ünsel on 25.12.2022.
//

import SwiftUI

struct CreateCommunity: View {
    
    @EnvironmentObject var network: Network
    
    let welcomeAdminName: String
    let welcomeAdminId: Int
    
    @State private var  CommunityName = ""
    @State private var YearOfFoundation = ""
    @State private var CommunityEMail = ""
    @State private var PurposeOfTheCommunity = ""
    @State private var CommunityProfileImage = ""
    @State private var CommunityPictures = ""
    @State private var CommunityVideo = ""
    @State private var CommunitySocialMediaAccounts_idCommunitySocialMediaAccounts: Int = 0
    @State private var CommunityLeader_idCommunityLeader: Int = 0
    
    
    @State private var shouldShowErrorAlert: Bool = false
    @State private var isCommunityCreated: Bool = false
    @State private var isCommunityExist: Bool = false
    @State private var idenleader: Int = 0
    
    @State private var deleteCom: Int = 0
    
    @State private var isDeleteCom: Bool = false
    
    
    
    func findLeaderid(CommunityLeader_idCommunityLeader: Int)-> Int{
        
        self.network.getCommunityLeader()
        for leader in self.network.leaders {
            if leader.Student_idStudent == CommunityLeader_idCommunityLeader {
                self.idenleader = leader.idCommunityLeader
            }

        }
        return idenleader
    }
    
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    
                    Text("Create a community:")
                        .padding(.top, 60)
                        .foregroundColor(.red)
                    
                    
                    
                    TextField("Enter community name...*", text: $CommunityName)
                    
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.03), radius: 6, y: 7)
                        .frame(width: 343, height: 53)
                        .cornerRadius(8)
                        .foregroundColor(Color("TextColor"))
                    
                    
                    TextField("Enter foundatiton year...*", text: $YearOfFoundation)
                    
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.03), radius: 6, y: 7)
                        .frame(width: 343, height: 53)
                        .cornerRadius(8)
                        .foregroundColor(Color("TextColor"))
                    
                    
                    
                    
                    TextField("Enter community e-mail...*", text: $CommunityEMail)
                    
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.03), radius: 6, y: 7)
                        .frame(width: 343, height: 53)
                        .cornerRadius(8)
                        .foregroundColor(Color("TextColor"))
                    
                    
                    
                    
                    TextField("Enter purpose of community", text: $PurposeOfTheCommunity)
                    
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.03), radius: 6, y: 7)
                        .frame(width: 343, height: 53)
                        .cornerRadius(8)
                        .foregroundColor(Color("TextColor"))
                   
                    Text("Enter social media accounts id*")
                        .font(.caption2)
                        .padding(.trailing)
                        .foregroundColor(Color("TextColor"))
                        .padding(.bottom,-15)
                        .padding(.trailing,150)
                        .padding(.top, 50)
                    
                    
                    TextField("Enter social media accounts id???", value:  $CommunitySocialMediaAccounts_idCommunitySocialMediaAccounts, formatter: NumberFormatter())
                    
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.03), radius: 6, y: 7)
                        .frame(width: 343, height: 53)
                        .cornerRadius(8)
                        .foregroundColor(Color("TextColor"))
                    
                    Text("Enter community leader's student id*")
                        .font(.caption2)
                        .padding(.trailing)
                        .foregroundColor(Color("TextColor"))
                        .padding(.bottom,-15)
                        .padding(.trailing,120)
                    
                    TextField("Enter community leader's student id...*", value: $CommunityLeader_idCommunityLeader, formatter: NumberFormatter())
                    
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.03), radius: 6, y: 7)
                        .frame(width: 343, height: 53)
                        .cornerRadius(8)
                    
                        .foregroundColor(Color("TextColor"))
                    
                  
                    NavigationLink(destination: AdminPanel(welcomeAdminName: welcomeAdminName, welcomeAdminId: welcomeAdminId), isActive: self.$isCommunityCreated) {
                        /*
                         Here we put the content view of `NavigationLink`.
                         It could be any `View` even `Button` but in this
                         example we use a `Text` with `onTapGesture`.
                         */
                        Text("Create")
                            .onTapGesture {
                                // Check if CommunityLeader_idCommunityLeader exists in leaders array
                                let idenLeader: Int = findLeaderid(CommunityLeader_idCommunityLeader: CommunityLeader_idCommunityLeader)
                                
                                
                                self.network.getCommunity()
                                
                                for comm in self.network.communityis {
                                    if comm.CommunityName == CommunityName {
                                        self.isCommunityExist = true
                                    }
                                }
                                
                                
                                // If CommunityLeader_idCommunityLeader does not exist in leaders array, show an error
                                if idenLeader == 0 {
                                    self.shouldShowErrorAlert = true // trigger Alert
                                }
                                // If CommunityLeader_idCommunityLeader exists in leaders array, create community
                                else {
                                    let parameters: [String: Any] =  ["CommunityName" : CommunityName, "YearOfFoundation" : YearOfFoundation,"CommunityEMail": CommunityEMail,"PurposeOfTheCommunity" : PurposeOfTheCommunity,"CommunityProfileImage" : CommunityProfileImage,"CommunityPictures" : CommunityPictures,"CommunityVideo" : CommunityVideo,"Admins_idAdmin" : welcomeAdminId,"CommunitySocialMediaAccounts_idCommunitySocialMediaAccounts" : CommunitySocialMediaAccounts_idCommunitySocialMediaAccounts, "CommunityLeader_idCommunityLeader" : idenLeader]
                                    self.network.createCommunities(parameters: parameters)
                                    self.isCommunityCreated = true // trigger NavigationLink
                                }
                            }
                        /*
                         Here we put the content view of `NavigationLink`.
                         It could be any `View` even `Button` but in this
                         example we use a `Text` with `onTapGesture`.
                         */
                    }
                    .frame(width: 267, height: 61)
                    .background(Color(.red))
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 32, y: 14)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .padding(.top)
                    
                    .disabled(CommunityName.isEmpty)
                    .onAppear {
                        network.getCommunityLeader()
                    }
                    .alert(isPresented: $shouldShowErrorAlert) {
                        Alert(title: Text("Error"), message: Text("Community Leader does not exist."), dismissButton: .default(Text("OK")))
                        
                        
                    }
                    .alert(isPresented: $isCommunityExist) {
                        Alert(title: Text("Error"), message: Text("Community exist."), dismissButton: .default(Text("OK")))
                        
                        
                    }


                   

                        
                    
                    
                }
                
                Text("Delete community:")
                    .padding(.top, 60)
                    .foregroundColor(.red)
                
                
                Text("Enter community's id*")
                    .font(.caption2)
                    .padding(.trailing)
                    .foregroundColor(Color("TextColor"))
                    .padding(.bottom,-15)
                    .padding(.trailing,120)
                
                TextField("Enter community's id...*", value: $deleteCom, formatter: NumberFormatter())
                
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.03), radius: 6, y: 7)
                    .frame(width: 343, height: 53)
                    .cornerRadius(8)
                
                    .foregroundColor(Color("TextColor"))
                
                
                Text("DELETE")
                    .onTapGesture {
                        deletePost(indes: deleteCom)
                     
                        
                    }
                    .frame(width: 267, height: 61)
                    .background(Color(.red))
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 32, y: 14)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .padding(.top)
                    
                
                
                
            }
            
            
        }
        
    }
    
    private func deletePost(indes: Int) {
        
            
            self.network.getCommunity()
            for item in self.network.communityis {
                if item.idCommunities == indes{
                    
                    
                    let parameters: [String: Any] =  ["idCommunities": item.idCommunities,"CommunityName" : item.CommunityName, "YearOfFoundation" : item.YearOfFoundation,"CommunityEMail": item.CommunityEMail,"PurposeOfTheCommunity" : item.PurposeOfTheCommunity,"CommunityProfileImage" : item.CommunityProfileImage,"CommunityPictures" : item.CommunityPictures,"CommunityVideo" : item.CommunityVideo,"Admins_idAdmin" : item.Admins_idAdmin,"CommunitySocialMediaAccounts_idCommunitySocialMediaAccounts" : item.CommunitySocialMediaAccounts_idCommunitySocialMediaAccounts, "CommunityLeader_idCommunityLeader" : item.CommunityLeader_idCommunityLeader]
                    
                    self.network.deleteCommunities(parameters: parameters)
                    self.network.getUsers()
                }
            }
        }
}


struct CreateCommunity_Previews: PreviewProvider {
    static var previews: some View {
        CreateCommunity(welcomeAdminName: "Admin", welcomeAdminId: 1).environmentObject(Network())
    }
}
