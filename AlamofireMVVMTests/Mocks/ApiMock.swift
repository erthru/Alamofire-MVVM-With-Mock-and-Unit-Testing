//
//  ApiMock.swift
//  AlamofireMVVMTests
//
//  Created by Suprianto Djamalu on 11/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
@testable import AlamofireMVVM

class ApiMock: Api{
    
    override func fetchPosts(completion: @escaping ([Post], Bool) -> ()){
        
        var posts = [Post]()
        posts.append(Post(id: 1, title: "Test", body: "Testing Body Lorep Ipsum"))
        
        completion(posts, false)
        
    }
    
}
