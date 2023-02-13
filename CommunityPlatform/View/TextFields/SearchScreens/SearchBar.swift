//
//  SearchBar.swift
//  CommunityPlatform
//
//  Created by Batınay Ünsel on 13.02.2023.
//

import SwiftUI

//
//  MainScreen.swift
//  Ben Iyiyim App
//
//  Created by Batınay Ünsel on 7.02.2023.
//

import SwiftUI

struct SearchBar: View {

//    @Binding var text: String
    @State private var searchText = ""
    @State private var isOn = false
    var body: some View {
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 12)
            .fill(Color.white)
            .frame(width: 267, height: 61)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 32, y: 14)
            
            
            TextField("Search your communities", text: $searchText)
                .padding(.horizontal,80)
                .font(.subheadline)
                .foregroundColor(Color("WhiteColor"))
            
            RoundedRectangle(cornerRadius: 10)
            .fill(Color(red: 0.34, green: 0.40, blue: 0.99))
            .frame(width: 44.17, height: 45)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 32, y: 14)
            .offset(x:103)
            
            
            Image("searchbarwhite")
                .offset(x:103)
            
        }
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}



