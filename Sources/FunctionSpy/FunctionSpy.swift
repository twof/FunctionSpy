public func spy<Result>(
  _ closure: @escaping @Sendable () -> Result
) -> (Spy, @Sendable () -> Result) {
  let spy = Spy()
  return (spy, {
    spy.increment()
    spy.recordCall()
    return closure()
  })
}

public func spy<A, Result>(
  _ closure: @escaping @Sendable (A) -> Result
) -> (Spy1<A>, @Sendable (A) -> Result) {
  let spy = Spy1<A>()
  return (spy, { a in
    spy.increment()
    spy.recordCall(a)
    return closure(a)
  })
}

public func spy<A, B, Result>(
  _ closure: @escaping @Sendable (A, B) -> Result
) -> (Spy2<A, B>, @Sendable (A, B) -> Result) {
  let spy = Spy2<A, B>()
  return (spy, { a, b in
    spy.increment()
    spy.recordCall(a, b)
    return closure(a, b)
  })
}

public func spy<A, B, C, Result>(
  _ closure: @escaping @Sendable (A, B, C) -> Result
) -> (Spy3<A, B, C>, @Sendable (A, B, C) -> Result) {
  let spy = Spy3<A, B, C>()
  return (spy, { a, b, c in
    spy.increment()
    spy.recordCall(a, b, c)
    return closure(a, b, c)
  })
}

public func spy<A, B, C, D, Result>(
  _ closure: @escaping @Sendable (A, B, C, D) -> Result
) -> (Spy4<A, B, C, D>, @Sendable (A, B, C, D) -> Result) {
  let spy = Spy4<A, B, C, D>()
  return (spy, { a, b, c, d in
    spy.increment()
    spy.recordCall(a, b, c, d)
    return closure(a, b, c, d)
  })
}
