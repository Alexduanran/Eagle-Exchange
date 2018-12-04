//
//  SecondViewController.swift
//  Eagle Exchange
//
//  Created by Alex Du on 11/15/18.
//  Copyright © 2018 Alex Du. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var presenter: SearchPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Search"
        setup()
        
        presenter.fill()
        searchCollectionView.reloadData()
    }
    
    func setup() {
        searchBar.placeholder = "Search"
        
        presenter = SearchPresenter(viewController: self)
        searchBar.delegate = presenter
        searchCollectionView.dataSource = presenter.dataSource
        searchCollectionView.delegate = presenter
    }
    
    func reloadView() {
        searchCollectionView.reloadData()
    }
    
    
}

