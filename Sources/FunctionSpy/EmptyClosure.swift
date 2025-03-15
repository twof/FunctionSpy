/// Produces an empty closure with the same signature as the passed function. Resulting closure does nothing but return `result`.
public func emptyClosure<each A, Result: Sendable>(_ closure: @Sendable (repeat each A) -> Result, result: Result) -> @Sendable (repeat each A) -> Result {
  { (_: repeat each A) in result }
}

/// Produces an empty closure with the same signature as the passed function. Resulting closure does nothing.
public func emptyClosure<each A>(_ closure: @Sendable (repeat each A) -> Void) -> @Sendable (repeat each A) -> Void {
  { (_: repeat each A) in }
}

/// Produces an empty closure with the same signature as the passed function. Resulting closure does nothing but return `result`.
public func emptyClosure<each A, Result: Sendable>(_ closure: @Sendable (repeat each A) async throws -> Result, result: Result) -> @Sendable (repeat each A) async throws -> Result {
  { (_: repeat each A) in result }
}
