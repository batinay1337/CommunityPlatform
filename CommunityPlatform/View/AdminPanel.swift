//
//  AdminPanel.swift
//  CommunityPlatform
//
//  Created by Batınay Ünsel on 23.12.2022.
//

import SwiftUI

struct AdminPanel: View {
    
    @EnvironmentObject var network: Network
    
    let welcomeName: String
    
    @State private var Student_idStudent = ""
    @State private var CommunityLeaderPassword = ""
    
    
      
    
    var body: some View {
        NavigationView{
            ScrollView{
                HStack{
                    Text("Welcome \(welcomeName)!")
                        .bold()
                        .font(.title2)
                }
                
                VStack{
                    Text("Community Leaders")
                    .fontWeight(.semibold)
                    .font(.title3)
                    .padding(.trailing,150)
                    
                    
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(network.admins, id: \.idAdmin) { item in
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.white)
                                        .frame(width: 126, height: 176)
                                        
                                    
                                    RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(red: 0.25, green: 0.21, blue: 0.21, opacity: 0.77)).rotationEffect(.degrees(-180))
                                    .frame(width: 110, height: 115)
                                    .padding(.bottom,35)
                                    
                                    VStack{
                                        
                                        Image("avatarPerson")
                                            .padding(.bottom,10)
                                            
                                           
                                            
                                        
                                        Text(item.AdminName)
                                            .fontWeight(.semibold)
                                            .font(.callout)
                                            .foregroundColor(Color("WhiteColor"))
                                            
                                    }
                                }
                                .padding(.horizontal,5)
                                
                            }
                        }
                    }
                    
                    
                        Text("Communities")
                        .fontWeight(.semibold)
                        .font(.title3)
                        .padding(.trailing,200)
                        .padding(.top,40)
                        
                        
                        
                            VStack {
                                ForEach(network.admins, id: \.idAdmin) { item in
                                    
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.white)
                                        .frame(width: 344, height: 176)
                                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.14), radius: 17, y: 8)
                                        
                                        RoundedRectangle(cornerRadius: 12)
                                        .fill(Color(red: 0.87, green: 0.88, blue: 1)).rotationEffect(.degrees(-180))
                                        .frame(width: 145, height: 161)
                                        .padding(.trailing,180)
                                        
                                        Image("avatarPerson")
                                            .padding(.bottom,10)
                                            .padding(.trailing,180)
                                        
                                        VStack{
                                            
                                            Text("Cassie Valdez")
                                                .fontWeight(.semibold)
                                                .font(.callout)
                                                .foregroundColor(Color("WhiteColor"))
                                                .padding(.trailing,-300)
                                        }
                                    }
                                    .padding(.horizontal,5)
                                }
                            }
                            
                        }
                        .padding(.top,40)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct AdminPanel_Previews: PreviewProvider {
    static var previews: some View {
        AdminPanel(welcomeName:"Admin").environmentObject(Network())
    }
}
