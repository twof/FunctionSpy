/// Wraps a function in a spy
/// - Parameter closure: The function to wrap
/// - Returns: The spy and and the wrapped function
public func spy<each A, Result>(
  _ closure: @escaping @Sendable (repeat each A) -> Result
) -> (Spy<repeat each A>, @Sendable (repeat each A) -> Result) {
  let spy = Spy<repeat each A>()
  
  return (spy, { (a: repeat each A) -> Result in
    Task {
      await spy.increment()
      await spy.recordCall(repeat each a)
    }
    
    return closure(repeat each a)
  })
}

/// Wraps a function in a spy
/// - Parameter closure: The function to wrap
/// - Returns: The spy and and the wrapped function
public func spy<each A, Result>(
  _ closure: @escaping @Sendable (repeat each A) throws -> Result
) -> (Spy<repeat each A>, @Sendable (repeat each A) throws -> Result) {
  let spy = Spy<repeat each A>()
  
  return (spy, { (a: repeat each A) throws -> Result in
    Task {
      await spy.increment()
      await spy.recordCall(repeat each a)
    }
    
    return try closure(repeat each a)
  })
}

/// Wraps a function in a spy
/// - Parameter closure: The function to wrap
/// - Returns: The spy and and the wrapped function
public func spy<each A, Result>(
  _ closure: @escaping @Sendable (repeat each A) async -> Result
) -> (Spy<repeat each A>, @Sendable (repeat each A) async -> Result) {
  let spy = Spy<repeat each A>()
  
  return (spy, { (a: repeat each A) async -> Result in
    await spy.increment()
    await spy.recordCall(repeat each a)
    return await closure(repeat each a)
  })
}


/// Wraps a function in a spy
/// - Parameter closure: The function to wrap
/// - Returns: The spy and and the wrapped function
public func spy<each A, Result>(
  _ closure: @escaping @Sendable (repeat each A) async throws -> Result
) -> (Spy<repeat each A>, @Sendable (repeat each A) async throws -> Result) {
  let spy = Spy<repeat each A>()
  
  return (spy, { (a: repeat each A) async throws -> Result in
    await spy.increment()
    await spy.recordCall(repeat each a)
    return try await closure(repeat each a)
  })
}
