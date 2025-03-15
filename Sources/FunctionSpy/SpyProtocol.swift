import XCTest
import Testing

/// Tracks function calls.
/// NOTE: This is not thread safe. Data races are possible during concurrent execution. Open an issue on the repo if you need thread
/// safety.
public protocol SpyProtocol {
  associatedtype Params
  
  /// Number of times the function was called
  var callCount: Int { get }
  
  /// Params passed to the funciton
  var callParams: [Params] { get }
}

public extension SpyProtocol {
  /// XCTFails if the function was called more or less than once
  func assertCalledOnce() {
    if callCount > 1 {
      let message = "Function was called more than once"
      XCTFail(message)
      Issue.record("Function was called more than once")
    } else if callCount < 1 {
      let message = "Function was not called"
      XCTFail(message)
      Issue.record("Function was not called")
    }
  }
}
