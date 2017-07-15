//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by Anthony Merle on 15/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController, WeatherDetailInterface {

    var presenter: WeatherDetailPresenter? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateView(withPrediction prediction: Prediction) {
    }
    
    func setIconImage(_ icon: UIImage) {
    }
}
