import XCTest
@testable import FunctionSpy
import Foundation

final class FunctionSpyTests: XCTestCase {
  func testRealisticAsyncThrowingExample() async throws {
    let (counter, fn) = spy({ "Hello" })
    let reverseFact = try await reverseCatFact(getCatFact: fn)
    XCTAssertEqual(reverseFact, "olleH")
    XCTAssertEqual(counter.callCount, 1)
  }
  
  func testMoveArmPastThreshold() {
    let (armSpy, fn) = spy(emptyClosure(fireAndForgetRobotArm))
    pickUpBlock(blockPosition: 15, moveArm: fn)
    XCTAssertEqual(armSpy.callCount, 1)
    XCTAssertEqual(armSpy.callParams[0], 15.0 as Float)
  }

  func testMoveArmBeforeThreshold() {
    let (armSpy, fn) = spy({(_: Float) in })
    pickUpBlock(blockPosition: 14.9, moveArm: fn)
    XCTAssertEqual(armSpy.callCount, 0)
  }
  
  func testSyncExampleB() {
    let (counter, fn) = spy(emptyClosure(fireAndForgetRobotArmB))
    pickUpBlock(blockPosition: 15, moveArm: fn)
    XCTAssertEqual(counter.callCount, 1)
    XCTAssert(counter.callParams[0] == (15.0 as Float, ""))
    
    let (otherCounter, otherFn) = FunctionSpy.spy(emptyClosure(fireAndForgetRobotArmB))
    pickUpBlock(blockPosition: 14.9, moveArm: otherFn)
    XCTAssertEqual(otherCounter.callCount, 0)
    XCTAssert(otherCounter.callParams.isEmpty)
  }
  
  func testSyncExampleC() {
    let (counter, fn) = spy(emptyClosure(fireAndForgetRobotArmC))
    pickUpBlock(blockPosition: 15, moveArm: fn)
    XCTAssertEqual(counter.callCount, 1)
    XCTAssert(counter.callParams[0] == (15.0 as Float, "", FactResponse(fact: "")))
    
    let (otherCounter, otherFn) = FunctionSpy.spy(emptyClosure(fireAndForgetRobotArmC))
    pickUpBlock(blockPosition: 14.9, moveArm: otherFn)
    XCTAssertEqual(otherCounter.callCount, 0)
    XCTAssert(otherCounter.callParams.isEmpty)
  }
  
  func testSyncExampleD() {
    let (counter, fn) = spy(emptyClosure(fireAndForgetRobotArmD))
    pickUpBlock(blockPosition: 15, moveArm: fn)
    XCTAssertEqual(counter.callCount, 1)
    XCTAssert(counter.callParams[0] == (15.0 as Float, "", FactResponse(fact: ""), URL(string: "http://google.com")!))
    
    let (otherCounter, otherFn) = FunctionSpy.spy(emptyClosure(fireAndForgetRobotArmD))
    pickUpBlock(blockPosition: 14.9, moveArm: otherFn)
    XCTAssertEqual(otherCounter.callCount, 0)
    XCTAssert(otherCounter.callParams.isEmpty)
  }
  
  func testAssertOnceNotCalled() async throws {
    let (spy, _) = spy({ })
    
    XCTExpectFailure("Function was not called")
    spy.assertCalledOnce()
  }
  
  func testAssertOnceCalled() async throws {
    let (spy, fn) = spy({ })
    fn()
    spy.assertCalledOnce()
  }
  
  func testAssertOnceCalledMore() async throws {
    let (spy, fn) = spy({ })
    fn()
    fn()
    
    XCTExpectFailure("Function was called more than once")
    spy.assertCalledOnce()
  }
  
  func testEmptyClosureWithParamAndReturn() {
    let (spy, fn) = spy(emptyClosure(time(forTimezone:), result: 10))
    let result = fn("PST")
    XCTAssertEqual(result, 10)
    spy.assertCalledOnce()
  }
}

func time(forTimezone timezone: String) -> Int {
  return 10
}

func pickUpBlock(blockPosition: Float, moveArm: (Float) -> Void = fireAndForgetRobotArm) {
  if blockPosition >= 15.0 {
    moveArm(blockPosition)
  }
}

func pickUpBlock(blockPosition: Float, moveArm: (Float, String) -> Void = fireAndForgetRobotArmB) {
  if blockPosition >= 15.0 {
    moveArm(blockPosition, "")
  }
}

func pickUpBlock(blockPosition: Float, moveArm: (Float, String, FactResponse) -> Void = fireAndForgetRobotArmC) {
  if blockPosition >= 15.0 {
    moveArm(blockPosition, "", FactResponse(fact: ""))
  }
}

func pickUpBlock(blockPosition: Float, moveArm: (Float, String, FactResponse, URL) -> Void = fireAndForgetRobotArmD) {
  if blockPosition >= 15.0 {
    moveArm(blockPosition, "", FactResponse(fact: ""), URL(string: "http://google.com")!)
  }
}

func fireAndForgetRobotArm(position: Float) {
  print("arm moved")
}

func fireAndForgetRobotArmB(position: Float, b: String) {
  print("arm moved")
}

func fireAndForgetRobotArmC(position: Float, b: String, c: FactResponse) {
  print("arm moved")
}

func fireAndForgetRobotArmD(position: Float, b: String, c: FactResponse, d: URL) {
  print("arm moved")
}


func getCatFact() async throws -> String {
  let (data, _) = try await URLSession.shared.data(from: URL(string: "https://catfact.ninja/fact")!)
  let factResponse = try JSONDecoder().decode(FactResponse.self, from: data)
  
  return factResponse.fact
}

func reverseCatFact(getCatFact: () async throws -> String = getCatFact) async throws -> String {
  let fact = try await getCatFact()
  return String(fact.reversed())
}

struct FactResponse: Decodable, Equatable {
  let fact: String
}
