//
//  SearchPresenter.swift
//  Eagle Exchange
//
//  Created by Alex Du on 12/3/18.
//  Copyright © 2018 Alex Du. All rights reserved.
//

import UIKit

class SearchPresenter: NSObject, UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    weak var viewController: SecondViewController?
    let dataSource: SearchDataSource = SearchDataSource()

    
    init(viewController: SecondViewController?) {
        super.init()
        self.viewController = viewController
    }
    
    func fill() {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        dataSource.filter(searchTerm: searchText)
        viewController?.reloadView()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        
        dataSource.filter(searchTerm: "")
        viewController?.reloadView()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let edgeInsets = self.collectionView(collectionView, layout: collectionViewLayout, insetForSectionAt: indexPath.section)
//
//        return CGSize(width: collectionView.frame.width - edgeInsets.left - edgeInsets.right, height: 145.0)
//    }
}
