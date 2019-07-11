//
//  Api.swift
//  AlamofireMVVM
//
//  Created by Suprianto Djamalu on 11/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import Alamofire

class Api {
        
    func fetchPosts(completion: @escaping ([Post]?, Bool) -> ()){
        
        AF.request("https://jsonplaceholder.typicode.com/posts").responseJSON(completionHandler: { data in
            
            switch data.result{
                case .success(_):
                    try? completion(JSONDecoder().decode([Post].self, from: data.data!), false)
                    break
                case .failure(let err):
                    print(err)
                    completion(nil, true)
                    break
            }
            
        })
        
    }
    
}
