//
//  SensorPresenter.swift
//  SmogInfoVip
//
//  Created by Pawel Dudek on 07.02.2018.
//  Copyright (c) 2018 cookieIT. All rights reserved.
//

import UIKit

protocol SensorPresentationLogic {
    func presentSomething(response: Sensor.Something.Response)
    func presentHeader(response: Sensor.Header.Response)
}

class SensorPresenter: SensorPresentationLogic {

    weak var viewController: SensorDisplayLogic?

    // MARK: Do something

    func presentSomething(response: Sensor.Something.Response) {
        let viewModel = Sensor.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }

    func presentHeader(response: Sensor.Header.Response) {
        if let response = response.text {
            let viewModel = Sensor.Header.ViewModel(headerText: response)
            viewController?.displayHeader(viewModel: viewModel)
        } else {
            let viewModel = Sensor.Header.ViewModel()
            viewController?.displayHeader(viewModel: viewModel)
        }
    }
}
