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
    @Published var leaders: [CommunityLeader] = []
    @Published var communityis: [Communities] = []
    @Published var socialmedias: [CommunitySocialMediaAccounts] = []
    
    
    func getUsers() {
        guard let url = URL(string: "https://community.batinay.dev/api/Student") else { fatalError("Missing URL") }
        
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = nil
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        let session = URLSession(configuration: configuration)
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
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
    
    func getSocialMedia() {
        guard let url = URL(string: "http://localhost:3000/api/CommunitySocialMediaAccounts") else { fatalError("Missing URL") }
        
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = nil
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        let session = URLSession(configuration: configuration)
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode([CommunitySocialMediaAccounts].self, from: data)
                        self.socialmedias = decodedUsers
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
    
    func getCommunity() {
        guard let url = URL(string: "http://localhost:3000/api/Communities") else { fatalError("Missing URL") }
        
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = nil
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        let session = URLSession(configuration: configuration)
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode([Communities].self, from: data)
                        self.communityis = decodedUsers
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
    
    
    func getAdmins() {
        guard let url = URL(string: "https://community.batinay.dev/api/Admins") else { fatalError("Missing URL") }
        
        
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = nil
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        let session = URLSession(configuration: configuration)
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
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
    
    
    
    
    func getCommunityLeader() {
        guard let url = URL(string: "https://community.batinay.dev/api/CommunityLeader") else { fatalError("Missing URL") }
        
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = nil
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        let session = URLSession(configuration: configuration)
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode([CommunityLeader].self, from: data)
                        self.leaders = decodedUsers
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
        guard let url = URL(string: "https://community.batinay.dev/api/CommunityLeader") else { fatalError("Invalid CREATE URL") }
        
        
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
    
    func createCommunities(parameters: [String: Any]) {
        // Set the URL for the POST request
        guard let url = URL(string: "http://localhost:3000/api/Communities") else { fatalError("Invalid CREATE URL") }
        
        
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
                    let result = try JSONDecoder().decode(Communities.self, from: data)
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

    func updateStudent(parameters: [String: Any]) {
        // Set the URL for the POST request
        guard let url = URL(string: "http://localhost:3000/api/Student") else { fatalError("Invalid CREATE URL") }
        
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        // Create the POST request
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("error: ", error)
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(Communities.self, from: data)
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
    
    func deleteCommunities(parameters: [String: Any]) {
        // Set the URL for the POST request
        guard let url = URL(string: "http://localhost:3000/api/Communities") else { fatalError("Invalid CREATE URL") }
        
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        // Create the POST request
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("error: ", error)
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(Communities.self, from: data)
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
