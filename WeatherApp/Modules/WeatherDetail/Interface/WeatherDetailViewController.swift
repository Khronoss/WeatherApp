//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by Anthony Merle on 15/07/2017.
//  Copyright © 2017 Anthony Merle. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController, WeatherDetailInterface {
    
    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var temperatureTitleView: UILabel!
    @IBOutlet weak var windTitleView: UILabel!
    @IBOutlet weak var humidityTitleView: UILabel!
    
    @IBOutlet weak var descriptionView: UILabel!
    
    @IBOutlet weak var temperatureValueView: UILabel!
    @IBOutlet weak var windValueView: UILabel!
    @IBOutlet weak var humidityValueView: UILabel!

    private var prediction: Prediction?
    
    var localizator: WordingLocalization? = nil
    var presenter: WeatherDetailPresenter? = nil
    var predictionFormatter: PredictionInformationsFormatter?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initTitleViews()
        updatePredictionInfosIfViewLoaded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func initTitleViews() -> Void {
        temperatureTitleView.text = localized("temperature").capitalized
        windTitleView.text = localized("wind").capitalized
        humidityTitleView.text = localized("humidity").capitalized
    }
    
    private func localized(_ key: String) -> String {
        return localizator?.localized(key) ?? key
    }

    func updateView(withPrediction prediction: Prediction) {
        self.prediction = prediction
        
        updateViewTitle()
        updatePredictionInfosIfViewLoaded()
    }

    private func updateViewTitle() -> Void {
        guard let prediction = self.prediction else {
            return
        }
        
        title = predictionFormatter?.dateString(forPrediction: prediction)
    }

    private func updatePredictionInfosIfViewLoaded() -> Void {
        guard isViewLoaded, self.prediction != nil else {
            return
        }
        
        updateTemperature()
        updateWind()
        updateHumidity()
        updateDescription()
    }

    private func updateTemperature() -> Void {
        temperatureValueView.text = predictionFormatter?.celciusString(forPrediction: prediction!)
    }
    
    private func updateWind() -> Void {
        windValueView.text = predictionFormatter?.windSpeedString(forPrediction: prediction!)
    }
    
    private func updateHumidity() -> Void {
        humidityValueView.text = predictionFormatter?.humidityString(forPrediction: prediction!)
    }
    
    private func updateDescription() -> Void {
        descriptionView.text = prediction!.weathers.first!.fullInfo.capitalized
    }

    func setIconImage(_ icon: UIImage) {
        iconView.image = icon
    }
}
