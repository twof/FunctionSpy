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
func pickUpBlock(blockPosition: Double, moveArm: (Double) -> Void = moveArm) {
  if blockPosition >= 15.0 {
    moveArm(blockPosition)
  }
}
```

This function has no real output, rather it has a side effect: the movement of the robotic arm. We can test for that side effect by testing that the `moveArm` function gets called. This library provides `spy` which wraps a function and provides a Spy in return. The Spy tells you how many times the wrapped function was called and with what parameters.

```swift
@Test
func testMoveArmPastThreshold() {
  let (armSpy, fn) = spy({(_: Double) in })
  pickUpBlock(blockPosition: 15, moveArm: fn)
  #expect(armSpy.callCount == 1)
  #expect(armSpy.callParams[0] == 15.0)
}

@Test
func testMoveArmBeforeThreshold() {
  let (armSpy, fn) = spy({(_: Double) in })
  pickUpBlock(blockPosition: 14.9, moveArm: fn)
  #expect(armSpy.callCount == 0)
}
```

Since you usually just want to mock in an empty closure or a closure that just returns a value, this library provides some helpers for that as well. Wrap the live dependency in `emptyClosure` to get an empty closure in the same shape as the live dependency

```swift
@Test
func testMoveArmPastThreshold() {
  let (armSpy, fn) = spy(emptyClosure(moveArm))
  pickUpBlock(blockPosition: 15, moveArm: fn)
  #expect(armSpy.callCount == 1)
  #expect(armSpy.callParams[0] == 15.0)
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
