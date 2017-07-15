//
//  WeatherListViewController.swift
//  WeatherApp
//
//  Created by Anthony Merle on 14/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class WeatherListViewController: UIViewController, WeatherListInterface {

    private let showDetailSegue = "showDetails"
    
    @IBOutlet weak var loadingView: LoadingView!
    @IBOutlet weak var tableView: UITableView!
    
    private var selectedPrediction: Prediction?
    private(set) var predictions: [Prediction] = []

    var localizator: WordingLocalization?
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
        loadingView.isHidden = !isLoading
    }
    
    func presentError(_ error: NSError) {
        let alert = createAlert(withText: error.localizedDescription)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func createAlert(withText text: String) -> UIAlertController {
        let alert = UIAlertController(title: nil, message: text, preferredStyle: .alert)
        
        var actionTitle = localized("ok")
        var action = UIAlertAction(title: actionTitle.uppercased(), style: .destructive) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        
        actionTitle = localized("reload")
        action = UIAlertAction(title: actionTitle.uppercased(), style: .default, handler: { (action) in
            self.presenter.loadPredictions()
            
            alert.dismiss(animated: true, completion: nil)
        })
        alert.addAction(action)
        
        return alert
    }
    
    private func localized(_ text: String) -> String {
        return localizator?.localized(text) ?? text
    }
    
    func reloadPrediction(atIndex index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func presentDetail(forPrediction prediction: Prediction) -> Void {
        selectedPrediction = prediction
        
        performSegue(withIdentifier: showDetailSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier! == showDetailSegue {
            prepareDetailController(segue.destination)
        }
    }
    
    private func prepareDetailController(_ controller: UIViewController) -> Void {
        guard let detailInterface = controller as? WeatherDetailInterface else {
            return
        }
        
        presenter.initializeDetailModule(withInterface: detailInterface, andPrediction: selectedPrediction!)
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
        
        if let icon = presenter.icon(forPrediction: prediction) {
            cell.setIcon(icon)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let prediction = predictions[indexPath.row]
        
        presentDetail(forPrediction: prediction)
    }
}
