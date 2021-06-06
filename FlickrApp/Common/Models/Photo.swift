//
//  Photo.swift
//  FlickrBringDatafromApi
//
//  Created by Chinmay Gawde on 03/06/21.
//

import Foundation

import Foundation
struct Photo : Codable {
    let id : String?
    let urlo : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case urlo = "url_o"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        urlo = try values.decodeIfPresent(String.self, forKey: .urlo)
        
    }
    
}
