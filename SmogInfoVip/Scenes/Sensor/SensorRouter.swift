//
//  SensorRouter.swift
//  SmogInfoVip
//
//  Created by Pawel Dudek on 07.02.2018.
//  Copyright (c) 2018 cookieIT. All rights reserved.
//

import UIKit

@objc protocol SensorRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol SensorDataPassing {
    var dataStore: SensorDataStore? { get }
}

class SensorRouter: NSObject, SensorRoutingLogic, SensorDataPassing {
    weak var viewController: SensorViewController?
    var dataStore: SensorDataStore?
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: SensorViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: SensorDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
