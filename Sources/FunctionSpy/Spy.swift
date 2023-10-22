public class Spy: SpyProtocol {
  public private(set) var count = 0
  public private(set) var callParams: [()] = []
  
  func increment() {
    self.count += 1
  }
  
  func recordCall() {
    self.callParams.append(())
  }
}

public class Spy1<A>: SpyProtocol {
  public private(set) var count = 0
  public private(set) var callParams: [A] = []
  
  func increment() {
    self.count += 1
  }
  
  func recordCall(_ a: A) {
    self.callParams.append(a)
  }
}

public class Spy2<A, B>: SpyProtocol {
  public private(set) var count = 0
  public private(set) var callParams: [(A, B)] = []
  
  func increment() {
    self.count += 1
  }
  
  func recordCall(_ a: A, _ b: B) {
    self.callParams.append((a, b))
  }
}

public class Spy3<A, B, C>: SpyProtocol {
  public private(set) var count = 0
  public private(set) var callParams: [(A, B, C)] = []
  
  func increment() {
    self.count += 1
  }
  
  func recordCall(_ a: A, _ b: B, _ c: C) {
    self.callParams.append((a, b, c))
  }
}

public class Spy4<A, B, C, D>: SpyProtocol {
  public private(set) var count = 0
  public private(set) var callParams: [(A, B, C, D)] = []
  
  func increment() {
    self.count += 1
  }
  
  func recordCall(_ a: A, _ b: B, _ c: C, _ d: D) {
    self.callParams.append((a, b, c, d))
  }
}
