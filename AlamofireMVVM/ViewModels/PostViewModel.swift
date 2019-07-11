//
//  PostViewModel.swift
//  AlamofireMVVM
//
//  Created by Suprianto Djamalu on 11/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class PostViewModel{
    
    var api: Api!
    var posts = BehaviorRelay<[Post]>(value: [])
    
    init(api: Api) {
        self.api = api
    }
    
    func getPosts(){
        
        api.fetchPosts(completion: { posts, error in
            self.posts.accept(posts!)
        })
        
    }
    
}
