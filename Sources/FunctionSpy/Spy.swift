import Foundation

/// Tracks function calls. See `SpyProtocol` for more.
final public class Spy<each A>: SpyProtocol, @unchecked Sendable {
  private let lock = NSLock()
  private var _callCount = 0
  private var _callParams: [(repeat each A)] = []
  
  public var callCount: Int {
    lock.lock()
    defer { lock.unlock() }
    return _callCount
  }
  
  public var callParams: [(repeat each A)] {
    lock.lock()
    defer { lock.unlock() }
    return _callParams
  }
  
  func increment() {
    lock.lock()
    defer { lock.unlock() }
    _callCount += 1
  }
  
  func recordCall(_ a: repeat each A) {
    lock.lock()
    defer { lock.unlock() }
    _callParams.append((repeat each a))
  }
}
