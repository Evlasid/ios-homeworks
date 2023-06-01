//
//  Post.swift
//  Novigation
//
//  Created by Евгений Сидоров on 18.05.2023.
//

import UIKit

struct Post {
    let author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
    static func createPost() -> [Post] {
        var post = [Post]()
    post.append(Post(author: "Белки",
                     description: "Четыре белки в грезде",
                     image: "belki", likes: 11,
                     views: 22))
    post.append(Post(author: "Лев",
                     description: "Маленький тигренок рычит",
                     image: "leon", likes: 11,
                     views: 22))
    post.append(Post(author: "Обезьяна",
                     description: "Манькая обезьяна отдыхает, закинув руки за голову",
                     image: "monkey", likes: 11,
                     views: 33))
    post.append(Post(author: "Моржи",
                     description: "Моржи смеются над проходями рядом людьми",
                     image: "smile", likes: 11,
                     views: 44))
    return post
    }
}

