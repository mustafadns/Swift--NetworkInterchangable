//
//  LocalService.swift
//  NetworkInterchangable
//
//  Created by Mustafa DANIŞAN on 14.06.2024.
//


// JSON doyasından çekilen data 
import Foundation

class LocalService : NetworkService {
    var type: String = "Localservice"
    func download(_ resorce : String) async throws -> [User] {
        guard let path = Bundle.main.path(forResource: resorce, ofType: "json") else {
            fatalError("Resorce not found")
        }
        let data = try Data (contentsOf: URL(filePath: path))
        return try JSONDecoder().decode([User].self, from: data)
    }
    
}
