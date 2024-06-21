//
//  WebSevice.swift
//  NetworkInterchangable
//
//  Created by Mustafa DANIŞAN on 14.06.2024.
//

// Web'den direkt çekilen data
import Foundation

enum NetworkError : Error {
    case invalidUrl
    case invalidServerResponse
}

class WebSevice : NetworkService{
    var type: String = "Webservice"
    
    func download(_ resorce : String) async throws -> [User] {
        guard let url = URL(string : resorce) else {
            throw NetworkError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkError.invalidServerResponse
        }
        return try JSONDecoder().decode([User].self, from: data)
    }
}
