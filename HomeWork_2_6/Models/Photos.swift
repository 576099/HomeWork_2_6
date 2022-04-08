//
//  Photos.swift
//  HomeWork_2_5
//
//  Created by Александр Смирнов on 07.04.2022.
//

import Foundation

struct Photos: Decodable {

    struct Images: Decodable {
        let imageName: String
    }
    
    let images: [Images]
}
