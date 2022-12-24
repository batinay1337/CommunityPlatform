//
//  HomePage.swift
//  CommunityPlatform
//
//  Created by Batınay Ünsel on 22.12.2022.
//

import SwiftUI

struct Mainpage: View {
    var body: some View {
       
            
            
            NavigationView{
                VStack{
                    
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
            }
        }
        
    }
    
    

}

struct Mainpage_Previews: PreviewProvider {
    static var previews: some View {
        Mainpage()
    }
    
}
