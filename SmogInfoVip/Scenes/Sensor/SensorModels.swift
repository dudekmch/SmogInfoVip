//
//  SensorModels.swift
//  SmogInfoVip
//
//  Created by Pawel Dudek on 07.02.2018.
//  Copyright (c) 2018 cookieIT. All rights reserved.
//

import UIKit

enum Sensor {
    // MARK: Use cases

    enum Something {
        struct Request {

        }

        struct Response {

        }

        struct ViewModel {

        }
    }

    enum Header {
        struct Request {

        }

        struct Response {
            init(headerText: String) {
                self.text = headerText
            }
            init() {
            }

            var text: String?
        }

        struct ViewModel {
            init(headerText: String) {
                self.text = headerText
            }
            init(){
                self.text = "NA"
            }
            var text: String
        }
    }
}
