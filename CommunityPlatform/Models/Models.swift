//
//  Models.swift
//  CommunityPlatform
//
//  Created by Batınay Ünsel on 22.12.2022.
//

import Foundation
import SwiftUI

struct DataModel: Decodable {
    let error: Bool
    let message: String
    let data: [PostModel]
}

struct PostModel: Decodable {
    let id: Int
    let StudentName: String
    let StudentSurname: String
    let StudentAddress: String
    let StudentPhoneNumber: String
    let BirthDate: Date
    let YearOfRegistration: Int
    let Department: String
    let ClassYear: Int
    let StudentPassword: String
    
    
}
