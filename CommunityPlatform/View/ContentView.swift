//
//  ContentView.swift
//  CommunityPlatform
//
//  Created by Batınay Ünsel on 22.12.2022.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        NavigationView{
//            SignIn()
//        }
//
//    }
//}

struct ContentView: View {
    
    var network = Network()
    
    var body: some View {
        
        NavigationView{
            SignIn().environmentObject(network)
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
