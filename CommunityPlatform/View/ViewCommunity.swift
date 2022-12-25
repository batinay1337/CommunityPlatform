//
//  ViewCommunity.swift
//  CommunityPlatform
//
//  Created by Batınay Ünsel on 25.12.2022.
//

import SwiftUI

struct ViewCommunity: View {
    @EnvironmentObject var network: Network
    
    let item: Communities
   
    
    var body: some View {
        
        NavigationView{
            ScrollView{

                        
                        
                        VStack{
                            Image("SignInImage")
                            
                            Text(item.CommunityName)
                                .bold()
                                .font(.title2)
                                .padding()
                            
                            Text("Purpose of Community:")
                                .fontWeight(.semibold)
                                .foregroundColor(.brown)
                                .padding(.trailing,150)
                                .padding(.top)
                                .font(.callout)
                            
                                .padding(.bottom,1)
                            
                            Text(item.PurposeOfTheCommunity)
                                .fontWeight(.semibold)
                                .font(.callout)
                                .foregroundColor(Color("WhiteColor"))
                            //.padding(.trailing,150)
                            
                            
                            Text("Year Of Foundation:")
                                .fontWeight(.semibold)
                                .foregroundColor(.brown)
                                .padding(.trailing,150)
                                .padding(.top)
                                .font(.callout)
                            
                                .padding(.bottom,1)
                            
                            Text(item.YearOfFoundation)
                                .fontWeight(.semibold)
                                .font(.callout)
                                .foregroundColor(Color("WhiteColor"))
                            //.padding(.trailing,150)
                            
                            
                            
                            
                            
                            
                            
                        }
           
                        
                        ForEach(network.leaders, id: \.idCommunityLeader) { leader in
                            if leader.idCommunityLeader == item.CommunityLeader_idCommunityLeader {
                                Text("CommunityLeader:")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.green)
                                    .padding(.trailing,150)
                                    .padding(.top)
                                    .font(.callout)
                                
                                    .padding(.bottom,1)
                                
                                HStack{
                                    
                                    
                                    
                                    Text(leader.CommunityLeaderName)
                                        .fontWeight(.semibold)
                                        .font(.callout)
                                        .foregroundColor(Color("WhiteColor"))
                                    //.padding(.trailing,150)
                                    Text(leader.CommunityLeaderSurname)
                                        .fontWeight(.semibold)
                                        .font(.callout)
                                        .foregroundColor(Color("WhiteColor"))
                                    //.padding(.trailing,150)
                                    
                                    
                                }
                            }
                        }
                        
                        
                VStack{
                    
                    
                    Text("Social Media Accounts")
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                        .padding(.top)
                        .font(.callout)
                        .padding(.bottom,1)
                    
                    ForEach(network.socialmedias, id: \.idCommunitySocialMediaAccounts) { social in
                        if social.idCommunitySocialMediaAccounts == item.CommunitySocialMediaAccounts_idCommunitySocialMediaAccounts{
                            
                            
                            HStack{
                                Text("Facebook:")
                                    .fontWeight(.semibold)
                                    .font(.callout)
                                    .foregroundColor(Color("WhiteColor"))
                                
                                Text(social.FacebookLink)
                                    .font(.caption2)
                                    .padding(.trailing)
                                    .foregroundColor(Color("TextColor"))
                            }
                            
                            HStack{
                                Text("Instagram:")
                                    .fontWeight(.semibold)
                                    .font(.callout)
                                    .foregroundColor(Color("WhiteColor"))
                                
                                Text(social.InstagramLink)
                                    .font(.caption2)
                                    .padding(.trailing)
                                    .foregroundColor(Color("TextColor"))
                            }
                            
                            HStack{
                                Text("Twitter:")
                                    .fontWeight(.semibold)
                                    .font(.callout)
                                    .foregroundColor(Color("WhiteColor"))
                                
                                Text(social.TwitterLink)
                                    .font(.caption2)
                                    .padding(.trailing)
                                    .foregroundColor(Color("TextColor"))
                            }
                        }
                    }
                }.onAppear {
                    network.getSocialMedia()
                }
               
                
                VStack{
                    
                    
                    Text("Community Photos")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.top)
                        .font(.callout)
                        .padding(.bottom,1)
                    
                    
                    Image("climbing")
                    Image("climbing2")
                    
                    
                }
                
                
            }.onAppear {
                network.getCommunity()
                network.getCommunityLeader()
            }
        }
    }
}

//struct ViewCommunity_Previews: PreviewProvider {
//    static var previews: some View {
//        ViewCommunity().environmentObject(Network())
//    }
//}
