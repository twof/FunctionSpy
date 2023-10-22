import XCTest

public protocol SpyProtocol {
  associatedtype Params
  var count: Int { get }
  var callParams: [Params] { get }
}

public extension SpyProtocol {
  func assertCalledOnce() {
    if count > 1 {
      XCTFail("Function was called more than once")
    } else if count < 1 {
      XCTFail("Function was not called")
    }
  }
}
