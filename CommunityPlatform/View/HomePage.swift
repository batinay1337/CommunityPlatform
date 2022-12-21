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
             
                
                ControlGroup {
                    Text("Hello World")
                    Button(action: {
                        
                    }) {
                        Text("Click me")
                    }
                }
                .foregroundColor(.red)
                .padding()

            }
        }
        .navigationBarBackButtonHidden(true)
    }
    

}

struct Mainpage_Previews: PreviewProvider {
    static var previews: some View {
        Mainpage()
    }
    
}
