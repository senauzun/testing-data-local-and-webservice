//
//  NetworkService.swift
//  NetworkInterchangable
//
//  Created by Sena Uzun on 1.02.2023.
//

import Foundation


protocol NetworkService {
    func download(_ resourceName: String) async throws -> [User]
    var type : String { get }
}
