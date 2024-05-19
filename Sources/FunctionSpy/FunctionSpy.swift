/// Wraps a function in a spy
/// - Parameter closure: The function to wrap
/// - Returns: The spy and and the wrapped function
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

/// Wraps a function in a spy
/// - Parameter closure: The function to wrap
/// - Returns: The spy and and the wrapped function
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

/// Wraps a function in a spy
/// - Parameter closure: The function to wrap
/// - Returns: The spy and and the wrapped function
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

/// Wraps a function in a spy
/// - Parameter closure: The function to wrap
/// - Returns: The spy and and the wrapped function
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

/// Wraps a function in a spy
/// - Parameter closure: The function to wrap
/// - Returns: The spy and and the wrapped function
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

/// Wraps a function in a spy
/// - Parameter closure: The function to wrap
/// - Returns: The spy and and the wrapped function
public func spy<Result>(
  _ closure: @escaping @Sendable () throws -> Result
) -> (Spy, @Sendable () throws -> Result) {
  let spy = Spy()
  return (spy, {
    spy.increment()
    spy.recordCall()
    return try closure()
  })
}

/// Wraps a function in a spy
/// - Parameter closure: The function to wrap
/// - Returns: The spy and and the wrapped function
public func spy<A, Result>(
  _ closure: @escaping @Sendable (A) throws -> Result
) -> (Spy1<A>, @Sendable (A) throws -> Result) {
  let spy = Spy1<A>()
  return (spy, { a in
    spy.increment()
    spy.recordCall(a)
    return try closure(a)
  })
}

/// Wraps a function in a spy
/// - Parameter closure: The function to wrap
/// - Returns: The spy and and the wrapped function
public func spy<A, B, Result>(
  _ closure: @escaping @Sendable (A, B) throws -> Result
) -> (Spy2<A, B>, @Sendable (A, B) throws -> Result) {
  let spy = Spy2<A, B>()
  return (spy, { a, b in
    spy.increment()
    spy.recordCall(a, b)
    return try closure(a, b)
  })
}

/// Wraps a function in a spy
/// - Parameter closure: The function to wrap
/// - Returns: The spy and and the wrapped function
public func spy<A, B, C, Result>(
  _ closure: @escaping @Sendable (A, B, C) throws -> Result
) -> (Spy3<A, B, C>, @Sendable (A, B, C) throws -> Result) {
  let spy = Spy3<A, B, C>()
  return (spy, { a, b, c in
    spy.increment()
    spy.recordCall(a, b, c)
    return try closure(a, b, c)
  })
}

/// Wraps a function in a spy
/// - Parameter closure: The function to wrap
/// - Returns: The spy and and the wrapped function
public func spy<A, B, C, D, Result>(
  _ closure: @escaping @Sendable (A, B, C, D) throws -> Result
) -> (Spy4<A, B, C, D>, @Sendable (A, B, C, D) throws -> Result) {
  let spy = Spy4<A, B, C, D>()
  return (spy, { a, b, c, d in
    spy.increment()
    spy.recordCall(a, b, c, d)
    return try closure(a, b, c, d)
  })
}

/// Wraps a function in a spy
/// - Parameter closure: The function to wrap
/// - Returns: The spy and and the wrapped function
public func spy<Result>(
  _ closure: @escaping @Sendable () async throws -> Result
) -> (Spy, @Sendable () async throws -> Result) {
  let spy = Spy()
  return (spy, {
    spy.increment()
    spy.recordCall()
    return try await closure()
  })
}

/// Wraps a function in a spy
/// - Parameter closure: The function to wrap
/// - Returns: The spy and and the wrapped function
public func spy<A, Result>(
  _ closure: @escaping @Sendable (A) async throws -> Result
) -> (Spy1<A>, @Sendable (A) async throws -> Result) {
  let spy = Spy1<A>()
  return (spy, { a in
    spy.increment()
    spy.recordCall(a)
    return try await closure(a)
  })
}

/// Wraps a function in a spy
/// - Parameter closure: The function to wrap
/// - Returns: The spy and and the wrapped function
public func spy<A, B, Result>(
  _ closure: @escaping @Sendable (A, B) async throws -> Result
) -> (Spy2<A, B>, @Sendable (A, B) async throws -> Result) {
  let spy = Spy2<A, B>()
  return (spy, { a, b in
    spy.increment()
    spy.recordCall(a, b)
    return try await closure(a, b)
  })
}

/// Wraps a function in a spy
/// - Parameter closure: The function to wrap
/// - Returns: The spy and and the wrapped function
public func spy<A, B, C, Result>(
  _ closure: @escaping @Sendable (A, B, C) async throws -> Result
) -> (Spy3<A, B, C>, @Sendable (A, B, C) async throws -> Result) {
  let spy = Spy3<A, B, C>()
  return (spy, { a, b, c in
    spy.increment()
    spy.recordCall(a, b, c)
    return try await closure(a, b, c)
  })
}

/// Wraps a function in a spy
/// - Parameter closure: The function to wrap
/// - Returns: The spy and and the wrapped function
public func spy<A, B, C, D, Result>(
  _ closure: @escaping @Sendable (A, B, C, D) async throws -> Result
) -> (Spy4<A, B, C, D>, @Sendable (A, B, C, D) async throws -> Result) {
  let spy = Spy4<A, B, C, D>()
  return (spy, { a, b, c, d in
    spy.increment()
    spy.recordCall(a, b, c, d)
    return try await closure(a, b, c, d)
  })
}

