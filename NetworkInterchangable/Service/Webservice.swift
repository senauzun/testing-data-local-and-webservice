//
//  Webservice.swift
//  NetworkInterchangable
//
//  Created by Sena Uzun on 1.02.2023.
//

import Foundation


enum NetworkError : Error {
    case invalidUrl
    case invalidServerResponse
}

class Webservice : NetworkService {
    
    var type : String = "Webservice"
    
    func download(_ resource: String) async throws -> [User] {
        
        guard let url = URL(string: resource) else {
            throw NetworkError.invalidUrl
        }
        
        
        let (data , reponse) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = reponse as? HTTPURLResponse , httpResponse.statusCode == 200 else {
                throw NetworkError.invalidServerResponse
            
        }
        return try JSONDecoder().decode([User].self, from: data)
    }
  
    
}
