//
//  WeatherListViewController.swift
//  WeatherApp
//
//  Created by Anthony Merle on 14/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class WeatherListViewController: UIViewController, WeatherListInterface {

    @IBOutlet weak var tableView: UITableView!
    private(set) var predictions: [Prediction] = []

    var presenter: WeatherListPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTableView()
        presenter.loadPredictions()
    }

    private func initTableView() -> Void {
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func updateView() {
        predictions = presenter.predictions
        
        tableView.reloadData()
    }
    
    func setLoading(_ isLoading: Bool) {
    }
}

extension WeatherListViewController: UITableViewDelegate, UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return predictions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "predictionCell", for: indexPath) as! PredictionTableViewCell
        
        let prediction = predictions[indexPath.row]
        
        configCell(cell, withPrediction: prediction)
        
        return cell
    }
    
    private func configCell(_ cell: PredictionTableViewCell, withPrediction prediction: Prediction) -> Void {
        
        let date = presenter.dateString(forPrediction: prediction)
        let temp = presenter.celciusString(forPrediction: prediction)
        
        cell.setDate(date)
        cell.setTemperature(temp)
        
        if let weather = prediction.weathers.first {
            cell.setIconName(weather.iconName)
        }
    }
}
