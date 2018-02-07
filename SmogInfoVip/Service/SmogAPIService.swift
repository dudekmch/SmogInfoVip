import Foundation
import Alamofire

class SmogAPIService {

    func getAllStation(result: @escaping (_ response: Station.StationName.Response) -> Void){
        Alamofire.request("http://api.gios.gov.pl/pjp-api/rest/station/findAll")
                 .responseJSON { apiResponse in
                     switch apiResponse.result {
                     case .success:
                        result(Station.StationName.Response(data: apiResponse.data!)!)
                     case .failure:
                         result(Station.StationName.Response())
                     }
                 }
    }
}
