//
//  Network.swift
//  CommunityPlatform
//
//  Created by Batınay Ünsel on 23.12.2022.
//


import SwiftUI

class Network: ObservableObject {
    @Published var students: [StudentModel] = []

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
}
