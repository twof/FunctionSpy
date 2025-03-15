import Foundation

/// Tracks function calls. See `SpyProtocol` for more.
final public class Spy<each A>: SpyProtocol, @unchecked Sendable {
  private let callCountLock = NSLock()
  private let callParamsLock = NSLock()
  public var callCount: Int {
    callCountLock.lock()
    defer { callCountLock.unlock() }
    return _callCount
  }
  public var callParams: [(repeat each A)] {
    callParamsLock.lock()
    defer { callParamsLock.unlock() }
    return _callParams
  }
  private var _callCount = 0
  private var _callParams: [(repeat each A)] = []
  
  func increment() {
    callCountLock.lock()
    defer { callCountLock.unlock() }
    self._callCount += 1
  }
  
  func recordCall(_ a: repeat each A) {
    callParamsLock.lock()
    defer { callParamsLock.unlock() }
    self._callParams.append((repeat each a))
  }
}
