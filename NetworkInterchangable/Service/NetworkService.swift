//
//  NetworkService.swift
//  NetworkInterchangable
//
//  Created by Mustafa DANIŞAN on 14.06.2024.
//


// Ön yüzde tanımlamalarını yapıp işlevselleştirmek için yazılmış service
import Foundation

protocol NetworkService {
    func download(_ resorce : String) async throws -> [User]
    var type : String {get}
}
