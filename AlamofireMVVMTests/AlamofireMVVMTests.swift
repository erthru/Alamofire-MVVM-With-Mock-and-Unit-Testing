//
//  AlamofireMVVMTests.swift
//  AlamofireMVVMTests
//
//  Created by Suprianto Djamalu on 11/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import XCTest
@testable import AlamofireMVVM

import RxSwift

class AlamofireMVVMTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testApi(){
        
        let e = expectation(description: "Alamofire")
        
        let api = Api()
        api.fetchPosts(completion: { posts, error in
            
            XCTAssertEqual(error, false)
            
            let didPostsNil = posts?.count == 0
            
            XCTAssertEqual(didPostsNil, false)
            
            e.fulfill()
        })
        
        waitForExpectations(timeout: 10.0, handler: nil)
        
    }

    func testPostViewModel(){
        
        let api = ApiMock()
        
        let viewModel = PostViewModel(api: api)
        viewModel.getPosts()
        
        viewModel.posts.subscribe{
            XCTAssertEqual($0.element![0].title, "Test")
        }.disposed(by: DisposeBag())
        
    }

}
