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

import FoodTruckKit

let size = MemoryLayout<Order>.size
print("size: \(size)")
// Struct: 137
// CowBox: 8

let stride = MemoryLayout<Order>.stride
print("stride: \(stride)")
// Struct: 144
// CowBox: 8

let alignment = MemoryLayout<Order>.alignment
print("alignment: \(alignment)")
// Struct: 8
// CowBox: 8
