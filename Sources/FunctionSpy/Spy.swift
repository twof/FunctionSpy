/// Tracks function calls. See `SpyProtocol` for more.
final public class Spy<each A>: SpyProtocol, @unchecked Sendable {
  public private(set) var callCount = 0
  public private(set) var callParams: [(repeat each A)] = []
  
  func increment() {
    self.callCount += 1
  }
  
  func recordCall(_ a: repeat each A) {
    self.callParams.append((repeat each a))
  }
}
