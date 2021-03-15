//
//  ChecklistItem.swift
//  Checklist
//
//  Created by savvycom2021 on 3/15/21.
//

import Foundation
class ChecklistItem{
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }

}
