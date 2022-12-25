//
//  CommsSocialMediaView.swift
//  CommunityPlatform
//
//  Created by Batınay Ünsel on 25.12.2022.
//

import SwiftUI

struct CommsSocialMediaView: View {
    @EnvironmentObject var network: Network
    
    @State private var communitySocialID: Int = 1
   
    @State private var FacebookLink: String = ""
    @State private var InstagramLink: String = ""
    @State private var TwitterLink: String = ""
    
    
    
    var body: some View {
        VStack{
            
            
            Text("Social Media Accounts")
                .fontWeight(.bold)
                .foregroundColor(.orange)
                .padding(.top)
                .font(.callout)
                .padding(.bottom,1)
            
            ForEach(network.socialmedias, id: \.idCommunitySocialMediaAccounts) { item in
                if item.idCommunitySocialMediaAccounts == communitySocialID{
                    
                    
                    HStack{
                        Text("Facebook:")
                            .fontWeight(.semibold)
                            .font(.callout)
                            .foregroundColor(Color("WhiteColor"))
                        
                        Text(item.FacebookLink)
                            .font(.caption2)
                            .padding(.trailing)
                            .foregroundColor(Color("TextColor"))
                    }
                    
                    HStack{
                        Text("Instagram:")
                            .fontWeight(.semibold)
                            .font(.callout)
                            .foregroundColor(Color("WhiteColor"))
                        
                        Text(item.InstagramLink)
                            .font(.caption2)
                            .padding(.trailing)
                            .foregroundColor(Color("TextColor"))
                    }
                    
                    HStack{
                        Text("Twitter:")
                            .fontWeight(.semibold)
                            .font(.callout)
                            .foregroundColor(Color("WhiteColor"))
                        
                        Text(item.TwitterLink)
                            .font(.caption2)
                            .padding(.trailing)
                            .foregroundColor(Color("TextColor"))
                    }
                }
            }
        }.onAppear {
            network.getSocialMedia()
        }
    }
}

struct CommsSocialMediaView_Previews: PreviewProvider {
    static var previews: some View {
        CommsSocialMediaView().environmentObject(Network())
    }
}
