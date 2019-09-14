//
//  Photo.swift
//  Torre
//
//  Created by Fernando Gallo on 14/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation

struct Photo: Decodable {
    let url: String
    
    enum CodingKeys: CodingKey {
        case url
    }
    
    enum PhotoKey: CodingKey {
        case photo
    }
    
    init(from decoder: Decoder) throws {
        let rootKeys = try decoder.container(keyedBy: PhotoKey.self)
        let photoContainer = try rootKeys.nestedContainer(keyedBy: CodingKeys.self,
                                                               forKey: .photo)
        try url =  photoContainer.decode(String.self, forKey: .url)
    }
    
}
