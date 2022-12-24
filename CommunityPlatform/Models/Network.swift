//
//  Network.swift
//  CommunityPlatform
//
//  Created by Batınay Ünsel on 23.12.2022.
//


import SwiftUI

class Network: ObservableObject {
    @Published var students: [StudentModel] = []
    @Published var admins: [Admin] = []
    
    func getUsers() {
        guard let url = URL(string: "http://localhost:3000/api/Student") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode([StudentModel].self, from: data)
                        self.students = decodedUsers
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
    
    func getAdmins() {
        guard let url = URL(string: "http://localhost:3000/api/Admins") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode([Admin].self, from: data)
                        self.admins = decodedUsers
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
    
    func createCommunityLeader(parameters: [String: Any]) {
        // Set the URL for the POST request
        guard let url = URL(string: "http://localhost:3000/api/CommunityLeader") else { fatalError("Invalid CREATE URL") }
        
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        // Create the POST request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("error: ", error)
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(CommunityLeader.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                }else {
                    print("No data")
                }
                
                
            }catch let JsonError {
                print("fetch json error:", JsonError.localizedDescription)
            }
        }.resume()
    }


    
    
}
