//
//  Post.swift
//  UIBaseComponents
//
//  Created by Александр Смирнов on 16.03.2022.
//

import Foundation

struct Posts: Decodable {

    struct Article: Decodable {
        let author: String
        var description: String
        var image: String
        var likes: Int
        var views: Int
        
        var publishedLikesAtString: String {
            return "Likes: \(self.likes)"
        }
        var publishedViewsAtString: String {
            return "Views: \(self.views)"
        }
    }
    let articles: [Article]
}
