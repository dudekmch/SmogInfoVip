//
//  StationRouter.swift
//  SmogInfoVip
//
//  Created by Pawel Dudek on 06.02.2018.
//  Copyright (c) 2018 cookieIT. All rights reserved.
//

import UIKit

@objc protocol StationRoutingLogic {
    func routeToSensor()
}

protocol StationDataPassing {
    var dataStore: StationDataStore? { get }
}

class StationRouter: NSObject, StationRoutingLogic, StationDataPassing {
    weak var viewController: StationViewController?
    var dataStore: StationDataStore?
    
    // MARK: Routing
    
    func routeToSensor(){
        let storyboard = UIStoryboard(name: "Sensor", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "SensorViewController") as! SensorViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToSensor(source: dataStore!, destination: &destinationDS)
        navigateToSensor(source: viewController!, destination: destinationVC)
    }
    
    // MARK: Navigation
    
    func navigateToSensor(source: StationViewController, destination: SensorViewController)
    {
      source.show(destination, sender: nil)
    }
    
//     MARK: Passing data
    
    func passDataToSensor(source: StationDataStore, destination: inout SensorDataStore)
    {
      destination.stationData = source.stationData
    }
}
