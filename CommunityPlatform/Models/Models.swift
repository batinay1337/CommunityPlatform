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



struct CommunitySocialMediaAccounts: Decodable {
    let idCommunitySocialMediaAccounts: Int
    let FacebookLink: String
    let InstagramLink: String
    let TwitterLink: String
}


struct CommunityLeader: Decodable {
    let idCommunityLeader: Int
    let CommunityLeaderName: String
    let CommunityLeaderSurname: String
    let CommunityLeaderPassword: String
    let Student_idStudent: Int
}

struct Student_has_Communities: Decodable {
    let Student_idStudent: Int
    let Communities_idCommunities: Int
}

struct Communities: Decodable {
    let idCommunities: Int
    let CommunityName: String
    let YearOfFoundation: String
    let CommunityEMail: String
    let PurposeOfTheCommunity: String
    let CommunityProfileImage: String 
    let CommunityPictures:String
    let CommunityVideo:String
    let Admins_idAdmin: Int
    let CommunitySocialMediaAccounts_idCommunitySocialMediaAccounts: Int
    let CommunityLeader_idCommunityLeader: Int
}
