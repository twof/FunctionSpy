import XCTest

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
      XCTFail("Function was called more than once")
    } else if callCount < 1 {
      XCTFail("Function was not called")
    }
  }
}

/// Tracks function calls.
/// NOTE: This is not thread safe. Data races are possible during concurrent execution. Open an issue on the repo if you need thread
/// safety.
public protocol SpyActorProtocol: Actor {
  associatedtype Params
  
  /// Number of times the function was called
  var callCount: Int { get }
  
  /// Params passed to the funciton
  var callParams: [Params] { get }
}

public extension SpyActorProtocol {
  /// XCTFails if the function was called more or less than once
  func assertCalledOnce() {
    if callCount > 1 {
      XCTFail("Function was called more than once")
    } else if callCount < 1 {
      XCTFail("Function was not called")
    }
  }
}
