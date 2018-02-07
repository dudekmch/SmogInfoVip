//
//  StationPresenter.swift
//  SmogInfoVip
//
//  Created by Pawel Dudek on 06.02.2018.
//  Copyright (c) 2018 cookieIT. All rights reserved.
//

import UIKit

protocol StationPresentationLogic {
    func presentSomething(response: Station.StationName.Response)
}

class StationPresenter: StationPresentationLogic {
    weak var viewController: StationDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: Station.StationName.Response) {
        
        let viewModel = Station.StationName.ViewModel(stationDtoList: prepareStationDtoListFrom(data: response.data!))
        viewController?.displayStation(viewModel: viewModel)
    }
    
    private func prepareStationDtoListFrom(data: Data) -> [StationDTO] {
        do {
            var stationDTOs = (try JSONDecoder().decode([StationDTO].self, from: data))
            stationDTOs = sortASCList(list: stationDTOs)
            return stationDTOs
        } catch {
            print(error)
           return [StationDTO]()
        }
    }
    
    fileprivate func sortASCList(list: [StationDTO]) -> [StationDTO] {
        let sortedStationDTOs = list.sorted(by: { (this: StationDTO, that: StationDTO) -> Bool in
            return (that.stationName > this.stationName)
        })
        return sortedStationDTOs
    }
}
