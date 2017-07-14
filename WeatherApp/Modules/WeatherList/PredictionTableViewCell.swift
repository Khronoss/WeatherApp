//
//  PredictionTableViewCell.swift
//  WeatherApp
//
//  Created by Anthony Merle on 14/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class PredictionTableViewCell: UITableViewCell {

    @IBOutlet private weak var iconView: UIImageView!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setDate(_ date: String) -> Void {
        dateLabel.text = date
    }

    func setTemperature(_ temp: String) -> Void {
        temperatureLabel.text = temp
    }
    
    func setIcon(withName name: String) -> Void {
        let imgExtension = "png"
        
        let imageUrlPath = "https://openweathermap.org/img/w/\(name).\(imgExtension)"

        Alamofire.request(imageUrlPath).responseImage { (response) in
            if let image = response.result.value {
                self.iconView.image = image
            }
        }
    }
}
