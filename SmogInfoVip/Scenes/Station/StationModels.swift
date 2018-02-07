import UIKit

enum Station {

    enum StationName {
        struct Request {

        }

        struct Response {
            init?(data: Data) {
                self.success = true
                self.data = data
            }

            init() {
                self.success = false
            }

            var success: Bool

            var data: Data?
        }

        struct ViewModel {
            let stationDtoList: [StationDTO]
        }
    }
}
