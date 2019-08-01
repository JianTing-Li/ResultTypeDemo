//
//  ViewController.swift
//  ResultTypeDemo
//
//  Created by Jian Ting Li on 7/31/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let apiClient = YelpAPIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiClient.searchBusinesses { result in
            switch result {
            case .failure(let error):
                print("error: \(error)")
            case .success(let code):
                print("code: \(code)")
            }
        }
    }
    
}

