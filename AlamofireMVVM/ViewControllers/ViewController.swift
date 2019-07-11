//
//  ViewController.swift
//  AlamofireMVVM
//
//  Created by Suprianto Djamalu on 11/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    let viewModel = PostViewModel(api: Api())
    let disposeBag = DisposeBag()
    
    let tableView: UITableView = {
        let view = UITableView()
        view.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        dataBinding()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        viewModel.getPosts()
    }

    private func dataBinding(){
        viewModel.posts.subscribe { _ in 
            self.tableView.reloadData()
        }.disposed(by: disposeBag)
    }
    
    private func setupView(){
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        
        cell?.textLabel!.text = viewModel.posts.value[indexPath.row].title
        
        print(viewModel.posts.value[indexPath.row].title)
        
        return cell!
    }
    
}

