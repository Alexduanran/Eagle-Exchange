//
//  SearchDataSource.swift
//  Eagle Exchange
//
//  Created by Alex Du on 12/3/18.
//  Copyright © 2018 Alex Du. All rights reserved.
//

import UIKit

class SearchDataSource: NSObject, UICollectionViewDataSource {
    
    private var filteredobjects: [EventDetail] = []
    private var allListItems: [EventDetail] = []
    private var isFiltering: Bool = false
    
    func fill() {
        allListItems = allListsItems
    }
    
    func filter(searchTerm: String) {
        if searchTerm.isEmpty {
            isFiltering = false
            filteredobjects.removeAll()
        } else {
            isFiltering = true
            
            filteredobjects = allListItems.filter({
                return $0.name.localizedCaseInsensitiveContains(searchTerm)
            })
        }
    }
    
    func object(at indexPath: IndexPath) -> EventDetail {
        if isFiltering {
            return filteredobjects[indexPath.item]
        } else {
            return allListItems[indexPath.item]
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering {
            return filteredobjects.count
        } else {
            return allListItems.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as! SearchCell
        
        let item = object(at: indexPath)
        cell.fill(with: item)
        
        return cell
    }
    

}
