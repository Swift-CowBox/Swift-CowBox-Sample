//
//  Copyright 2024 North Bronson Software
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Benchmark
import FoodTruckKit
import Foundation

@MainActor let benchmarks = {
  Benchmark.defaultConfiguration.metrics = .default
  Benchmark.defaultConfiguration.timeUnits = .microseconds
  Benchmark.defaultConfiguration.maxDuration = .seconds(86400)
  Benchmark.defaultConfiguration.maxIterations = .count(1000)
  
  Benchmark("FoodTruckModel.init") { benchmark in
    benchmark.startMeasurement()
    let model = FoodTruckModel()
    benchmark.stopMeasurement()
    precondition(model.orders.count == 24_000)
    blackHole(model)
  }
  
  Benchmark("FoodTruckModel.sortedOrders") { benchmark in
    let model = FoodTruckModel()
    benchmark.startMeasurement()
    let orders = model.orders.sorted(using: [KeyPathComparator(\Order.status, order: .reverse)])
    benchmark.stopMeasurement()
    precondition(orders.count == 24_000)
    blackHole(model)
    blackHole(orders)
  }
  
  Benchmark("FoodTruckModel.markOrderAsCompleted") { benchmark in
    let model = FoodTruckModel()
    let id = model.orders[23_999].id
    benchmark.startMeasurement()
    model.markOrderAsCompleted(id: id)
    benchmark.stopMeasurement()
    precondition(model.orders[23_999].status == .completed)
    precondition(model.orders.count == 24_000)
    blackHole(model)
  }
  
  Benchmark("FoodTruckModel.orders.equal") { benchmark in
    let model = FoodTruckModel()
    var orders = model.orders
    orders[23_999].status = .completed
    let id = model.orders[23_999].id
    model.markOrderAsCompleted(id: id)
    benchmark.startMeasurement()
    precondition(model.orders == orders)
    benchmark.stopMeasurement()
    precondition(model.orders.count == 24_000)
    blackHole(model)
    blackHole(orders)
  }
}
