//
//  CellViewModel.swift
//  CALayerSpeedDemo
//
//  Crafted by Mike Gilroy on 19/03/2018.
//  Copyright © 2018 CraftAppCo. All rights reserved.
//

import UIKit

struct CellViewModel {
	
	let title: String
	let accessoryType: UITableViewCellAccessoryType 
	let action: (() -> Void)?
	
	init(title: String, accessoryType: UITableViewCellAccessoryType = .none, action: (() -> Void)? = nil) {
		self.title = title
		self.accessoryType = accessoryType
		self.action = action
	}
}
