import XCTest

public protocol SpyProtocol {
  associatedtype Params
  var callCount: Int { get }
  var callParams: [Params] { get }
}

public extension SpyProtocol {
  func assertCalledOnce() {
    if callCount > 1 {
      XCTFail("Function was called more than once")
    } else if callCount < 1 {
      XCTFail("Function was not called")
    }
  }
}
