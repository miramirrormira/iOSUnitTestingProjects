XCTFail()
XCTAssertTrue()
XCTAssertFalse()

Eliminating branches from test code makes it easier to understand. We want test code to be extremely simple. xUnitTest Patterns lists conditional test logic as test smell.
```
# BAD testing pattern, avoid conditions
if !success {
    XCTFAIL()
}
```


### Describe Objects upon failure
Some assertions can describe the objects, e.g.
XCTAssertNil(myObject)

Have your struct conform to CustomStringConvertible in order to control how the object describe itself in UnitTests.
```
struct StructWithDescription: CustomStringConvertible {
    let x: Int
    let y: Int
    var description: String {"\(x), \(y)"}
}

func test_assetNil_withSelfDescribingType(){
    let value: StructWithDescription? = StructWithDescription(x: 1, y: 2)
    XCTAssertNil(value)
}
```


### Assert Equality
XCTAssertEqual(exp1, exp2)
No need to assign exp1 as actual exp2 as expected, the order doesn't matter. But just pick one order and stick to it.

```
func test_assertEqual() {
    let actual = "actual"
    XCTAssertEqual(actual, "expected")
}
```

**Optional**
```
    func test_assertEqual_withOptionals(){
        let actual: String? = "actual"
        XCTAssertEqual(actual, "expected")
    }
```
When we are testing whether an optional type is equal to an expected value. We don't have to wrap the expected value in an optional type, the XCTest API will do it for us. This will make our testing code simpler and clearer. 

**Fudge Equality with Doubles and Floats**
Floating-point numbers are approximations. (Floats and Doubles)
```
    func test_floatingPointDanger(){
        let result = 0.1 + 0.2
        XCTAssertEqual(result, 0.3)
    }
    
    func test_floatingPointFixed() {
        let result = 0.1 + 0.2
        XCTAssertEqual(result, 0.3, accuracy: 0.0001)
    }
```
