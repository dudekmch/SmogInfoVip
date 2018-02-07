import UIKit

protocol StationBusinessLogic {
    func getStationData(request: Station.StationName.Request)
    func setDataStore(data: StationDTO)
}

protocol StationDataStore {
    var stationData: StationDTO? {get set}
}

class StationInteractor: StationBusinessLogic, StationDataStore {
    var stationData: StationDTO?
    
    var presenter: StationPresentationLogic?
//    var worker: StationWorker?
    var smogApiService: SmogAPIService?


    func getStationData(request: Station.StationName.Request) {
        smogApiService = SmogAPIService()
        smogApiService?.getAllStation(result: { response in
            self.presenter?.presentSomething(response: response)
        })
    }
    
    func setDataStore(data: StationDTO){
        self.stationData = data
    }
}
