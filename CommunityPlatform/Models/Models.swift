//
//  Models.swift
//  CommunityPlatform
//
//  Created by Batınay Ünsel on 22.12.2022.
//

import Foundation
import SwiftUI



struct StudentModel: Decodable
{
    
    let idStudent: Int
    let StudentName: String
    let StudentSurname: String
    let StudentAddress: String
    let StudentPhoneNumber: String
    let StudentBirthDate:String
    let YearOfRegistration: Int
    let Department: String
    let ClassYear: Int
    let StudentPassword: String
}


struct Admin: Decodable {
    
    let idAdmin: Int
    let AdminPassword: String
    let AdminName: String
    let AdminSurname: String
    let AdminPhoneNumber: String
    let AdminEMail: String
}



struct CommunitySocialMediaAccounts {
    let idCommunitySocialMediaAccounts: Int
    let FacebookLink: String
    let InstagramLink: String
    let TwitterLink: String
}


struct CommunityLeader: Decodable {
    let idCommunityLeader: Int
    let CommunityLeaderPassword: String
    let Student_idStudent: Int
}



struct Communities: Decodable {
    let idCommunities: Int
    let CommunityName: String
    let YearOfFoundation: Date
    let HeadOfCommunity: String
    let CommunityEMail: String
    let PurposeOfTheCommunity: String
//    let CommunityProfileImage: CGImageSource
//    let CommunityPictures:CGImageSource
//    let CommunityVideo:CGImageSource
    let Admin_idAdmin: Int
    let CommunitySocialMediaAccounts_idCommunitySocialMediaAccounts: Int
    let CommunityLeader_idCommunityLeader: Int
}
