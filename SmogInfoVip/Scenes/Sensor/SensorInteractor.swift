//
//  SensorInteractor.swift
//  SmogInfoVip
//
//  Created by Pawel Dudek on 07.02.2018.
//  Copyright (c) 2018 cookieIT. All rights reserved.
//

import UIKit

protocol SensorBusinessLogic {
    func doSomething(request: Sensor.Something.Request)
    func getHeader()
}

protocol SensorDataStore {
    var stationData: StationDTO? { get set }
}

class SensorInteractor: SensorBusinessLogic, SensorDataStore {
    var stationData: StationDTO?

    var presenter: SensorPresentationLogic?
    var worker: SensorWorker?
    //var name: String = ""

    // MARK: Do something

    func doSomething(request: Sensor.Something.Request) {
        worker = SensorWorker()
        worker?.doSomeWork()

        let response = Sensor.Something.Response()
        presenter?.presentSomething(response: response)
    }

    func getHeader() {
        if let stationData = self.stationData {
            let response = Sensor.Header.Response(headerText: stationData.stationName)
            presenter?.presentHeader(response: response)

        } else {
            let response = Sensor.Header.Response()
            presenter?.presentHeader(response: response)
        }
    }

}
