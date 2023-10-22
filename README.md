# FunctionSpy

## Installation
### SPM
```swift
.package(url: "https://github.com/twof/FunctionSpy", .upToNextMajor(from: "1.0.0"))
```

## Usage
FunctionSpy is a small library that provides a Spy for use in testing dependency injected functions.

Imagine you have a function called `pickUpBlock` which when given the position of a block, will move a robotic arm if the position is past a certain threshhold. When you test this function, you don't want a real robotic arm to move, you just want to test the pure logic so you inject the robotic arm movement as a dependency.

```swift
func pickUpBlock(blockPosition: Float, moveArm: (Float) -> Void = moveArm) {
  if blockPosition >= 15.0 {
    moveArm(blockPosition)
  }
}
```

This function has no real output, rather it has a side effect: the movement of the robotic arm. We can test for that side effect by testing that the `moveArm` function gets called. This library provides `spy` which wraps a function and provides a Spy in return. The Spy tells you how many times the wrapped function was called and with what parameters.

```swift
func testMoveArmPastThreshold() {
  let (armSpy, fn) = spy({ (_: Float) in })
  pickUpBlock(blockPosition: 15, moveArm: fn)
  XCTAssertEqual(armSpy.callCount, 1)
  XCTAssertEqual(armSpy.callParams[0], 15.0 as Float)
}

func testMoveArmBeforeThreshold() {
  let (armSpy, fn) = spy({(_: Float) in })
  pickUpBlock(blockPosition: 14.9, moveArm: fn)
  XCTAssertEqual(armSpy.callCount, 0)
}
```

Since you usually just want to mock in an empty closure or a closure that just returns a value, this library provides some helpers for that as well. Wrap the live dependency in `emptyClosure` to get an empty closure in the same shape as the live dependency

```swift
func testMoveArmPastThreshold() {
  let (armSpy, fn) = spy(emtpyClosure(moveArm))
  pickUpBlock(blockPosition: 15, moveArm: fn)
  XCTAssertEqual(armSpy.callCount, 1)
  XCTAssertEqual(armSpy.callParams[0], 15.0 as Float)
}
```

If you're coming from Python and you're missing some of the helper functions on `MagicMock`, you can implement them in an extension on `SpyProtocol`. For example:
```swift
public extension SpyProtocol {
  func assertCalledOnce() {
    if callCount > 1 {
      XCTFail("Function was called more than once")
    } else if callCount < 1 {
      XCTFail("Function was not called")
    }
  }
}
```

Feel free to open a PR if you'd like to add a helper function to the library!

## Note from the developer
When I started writing this, I thought I'd be able to use parameter packs, but they're very buggy as of Swift 5.9. (example [one](https://github.com/apple/swift/issues/69317), [two](https://github.com/apple/swift/issues/69313), [three](https://github.com/apple/swift/issues/69028)) Because of that, this library only supports functions with up to 4 parameters. If you need more, open an issue or a PR, and I'll be happy to add more overloads. For now I'm assuming [YAGNI](https://en.wikipedia.org/wiki/You_aren%27t_gonna_need_it).