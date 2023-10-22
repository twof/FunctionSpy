/// Tracks function calls. See `SpyProtoco` for more.
public class Spy: SpyProtocol {
  public private(set) var callCount = 0
  public private(set) var callParams: [()] = []
  
  func increment() {
    self.callCount += 1
  }
  
  func recordCall() {
    self.callParams.append(())
  }
}

/// Tracks function calls. See `SpyProtoco` for more.
public class Spy1<A>: SpyProtocol {
  public private(set) var callCount = 0
  public private(set) var callParams: [A] = []
  
  func increment() {
    self.callCount += 1
  }
  
  func recordCall(_ a: A) {
    self.callParams.append(a)
  }
}

/// Tracks function calls. See `SpyProtoco` for more.
public class Spy2<A, B>: SpyProtocol {
  public private(set) var callCount = 0
  public private(set) var callParams: [(A, B)] = []
  
  func increment() {
    self.callCount += 1
  }
  
  func recordCall(_ a: A, _ b: B) {
    self.callParams.append((a, b))
  }
}

/// Tracks function calls. See `SpyProtoco` for more.
public class Spy3<A, B, C>: SpyProtocol {
  public private(set) var callCount = 0
  public private(set) var callParams: [(A, B, C)] = []
  
  func increment() {
    self.callCount += 1
  }
  
  func recordCall(_ a: A, _ b: B, _ c: C) {
    self.callParams.append((a, b, c))
  }
}

/// Tracks function calls. See `SpyProtoco` for more.
public class Spy4<A, B, C, D>: SpyProtocol {
  public private(set) var callCount = 0
  public private(set) var callParams: [(A, B, C, D)] = []
  
  func increment() {
    self.callCount += 1
  }
  
  func recordCall(_ a: A, _ b: B, _ c: C, _ d: D) {
    self.callParams.append((a, b, c, d))
  }
}
