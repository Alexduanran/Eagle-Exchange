//
//  EventDetail.swift
//  Eagle Exchange
//
//  Created by Alex Du on 11/18/18.
//  Copyright © 2018 Alex Du. All rights reserved.
//

import Foundation
import Firebase
    
var ticketListItems: [EventDetail] = []
var eventsListItems: [EventDetail] = []
var textbooksListItems: [EventDetail] = []
var universalListItems: [EventDetail] = []
var allListsItems: [EventDetail] = ticketListItems + eventsListItems + textbooksListItems
var sellerIndex: Int = 0


struct EventDetail {
    var name = ""
    var seller = ""
    var description = ""
    var price = ""
}

