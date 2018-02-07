import Foundation

struct StationDTO: Decodable{
    let id: Int
    let stationName: String
    
    init(id: Int, name: String){
        self.id = id
        self.stationName = name
    }
}
