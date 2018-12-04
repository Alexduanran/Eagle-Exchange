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
    private var filteredobjects: [EventDetail] = []
    private var allListItems: [EventDetail] = []
    private var isFiltering: Bool = false
    
    func fill() {
        allListItems = [EventDetail(name: "Ticket for BC vs. BU Hockey Game", seller: "Alex Du", description: "III", price: "15"),
        EventDetail(name: "Ticket for Creed 2", seller: "Alex Du", description: "III", price: "20"),
        EventDetail(name: "Gold Pass Rent", seller: "Alex Du", description: "III", price: "15"),
        EventDetail(name: "Ticket for BC vs. BU Hockey Game", seller: "Alex Du", description: "III", price: "15"),
        EventDetail(name: "Ticket for Marshmello’s Concert", seller: "Alex Du", description: "III", price: "150"),
        EventDetail(name: "Justice by Michael Sandal", seller: "Alex Du", description: "III", price: "15"),
        EventDetail(name: "Fundraising for Chipotle", seller: "Alex Du", description: "III", price: "15"),
        EventDetail(name: "Anda Curso Elemental", seller: "Alex Du", description: "III", price: "80"),
        EventDetail(name: "Fundraising for Donuts!", seller: "Alex Du", description: "III", price: "11")]
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
