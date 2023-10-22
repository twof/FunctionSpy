import XCTest

public protocol SpyProtocol {
  associatedtype Params
  var callCount: Int { get }
  var callParams: [Params] { get }
}

public extension SpyProtocol {
  /// XCTFails if the function was called more or less than once
  func assertCalledOnce() {
    if callCount > 1 {
      XCTFail("Function was called more than once")
    } else if callCount < 1 {
      XCTFail("Function was not called")
    }
  }
}
