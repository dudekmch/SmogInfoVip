//
//  StationTableViewCell.swift
//  SmogInfoVip
//
//  Created by Pawel Dudek on 07.02.2018.
//  Copyright © 2018 cookieIT. All rights reserved.
//

import UIKit

class StationTableViewCell: UITableViewCell {
    
    static let identifier = "StationTableViewCell"
    
    var stationName: String?
    var stationId: Int?
    
    @IBOutlet weak var stationNameLabel: UILabel!
    
    func setStationData(id: Int, name: String){
        self.stationId = id
        stationNameLabel.text = name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
}
