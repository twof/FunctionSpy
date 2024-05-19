/// Produces an empty closure with the same signature as the passed function. Resulting closure does nothing but return `result`.
public func emptyClosure<A, Result>(_ closure: (A) -> Result, result: Result) -> @Sendable (A) -> Result {
  { (_: A) in result }
}

/// Produces an empty closure with the same signature as the passed function. Resulting closure does nothing but return `result`.
public func emptyClosure<A, B, Result>(_ closure: (A, B) -> Result, result: Result) -> @Sendable (A, B) -> Result {
  { (_: A, _: B) in result }
}

/// Produces an empty closure with the same signature as the passed function. Resulting closure does nothing but return `result`.
public func emptyClosure<A, B, C, Result>(_ closure: (A, B, C) -> Result, result: Result) -> @Sendable (A, B, C) -> Result {
  { (_: A, _: B, _: C) in result }
}

/// Produces an empty closure with the same signature as the passed function. Resulting closure does nothing but return `result`.
public func emptyClosure<A, B, C, D, Result>(_ closure: (A, B, C, D) -> Result, result: Result) -> @Sendable (A, B, C, D) -> Result {
  { (_: A, _: B, _: C, _: D) in result }
}

/// Produces an empty closure with the same signature as the passed function. Resulting closure does nothing.
public func emptyClosure<A>(_ closure: (A) -> Void) -> @Sendable (A) -> Void {
  { (_: A) in }
}

/// Produces an empty closure with the same signature as the passed function. Resulting closure does nothing.
public func emptyClosure<A, B>(_ closure: (A, B) -> Void) -> @Sendable (A, B) -> Void {
  { (_: A, _: B) in }
}

/// Produces an empty closure with the same signature as the passed function. Resulting closure does nothing.
public func emptyClosure<A, B, C>(_ closure: (A, B, C) -> Void) -> @Sendable (A, B, C) -> Void {
  { (_: A, _: B, _: C) in }
}

/// Produces an empty closure with the same signature as the passed function. Resulting closure does nothing.
public func emptyClosure<A, B, C, D>(_ closure: (A, B, C, D) -> Void) -> @Sendable (A, B, C, D) -> Void {
  { (_: A, _: B, _: C, _: D) in }
}

/// Produces an empty closure with the same signature as the passed function. Resulting closure does nothing but return `result`.
public func emptyClosure<A, Result>(_ closure: (A) async throws -> Result, result: Result) -> @Sendable (A) async throws -> Result {
  { (_: A) in result }
}

/// Produces an empty closure with the same signature as the passed function. Resulting closure does nothing but return `result`.
public func emptyClosure<A, B, Result>(_ closure: (A, B) async throws -> Result, result: Result) -> @Sendable (A, B) async throws -> Result {
  { (_: A, _: B) in result }
}

/// Produces an empty closure with the same signature as the passed function. Resulting closure does nothing but return `result`.
public func emptyClosure<A, B, C, Result>(_ closure: (A, B, C) async throws -> Result, result: Result) async throws -> @Sendable (A, B, C) -> Result {
  { (_: A, _: B, _: C) in result }
}

/// Produces an empty closure with the same signature as the passed function. Resulting closure does nothing but return `result`.
public func emptyClosure<A, B, C, D, Result>(_ closure: (A, B, C, D) async throws -> Result, result: Result) -> @Sendable (A, B, C, D) async throws -> Result {
  { (_: A, _: B, _: C, _: D) in result }
}
