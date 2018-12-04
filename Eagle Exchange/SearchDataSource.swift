//
//  SearchDataSource.swift
//  Eagle Exchange
//
//  Created by Alex Du on 12/3/18.
//  Copyright © 2018 Alex Du. All rights reserved.
//

import UIKit

class SearchDataSource: NSObject, UICollectionViewDataSource {
    
    var data: Data!
    var datas: Datas! = Datas()
    private var filteredobjects: [Data] = []
    private var allListItems: [Data] = []
    private var isFiltering: Bool = false
    
    func fill() {
        allListItems = datas.dataArray
    }
    
    func filter(searchTerm: String) {
        if searchTerm.isEmpty {
            isFiltering = false
            filteredobjects.removeAll()
        } else {
            isFiltering = true
            
            filteredobjects = datas.dataArray.filter({
                return $0.name.localizedCaseInsensitiveContains(searchTerm)
            })
        }
    }
    
    func object(at indexPath: IndexPath) -> Data {
        if isFiltering {
            return filteredobjects[indexPath.item]
        } else {
            return datas.dataArray[indexPath.item]
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering {
            return filteredobjects.count
        } else {
            return datas.dataArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as! SearchCell
        
        let item = object(at: indexPath)
        cell.fill(with: item)
        
        return cell
    }
    

}
