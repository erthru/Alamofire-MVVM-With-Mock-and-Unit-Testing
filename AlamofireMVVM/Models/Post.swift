//
//  Post.swift
//  AlamofireMVVM
//
//  Created by Suprianto Djamalu on 11/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation

struct Post: Decodable{
    let id: Int
    let title: String
    let body: String
}
