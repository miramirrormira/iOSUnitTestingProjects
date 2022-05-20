# 1. Test Zero: This is a check of our infrastructure. It confirms that our basic test plumbing is corrent.
   ```
   func test_zero(){
        XCTFail("Tests not yet implemented in MyClassTests")
    }
   ```
# 2. Check if the test code can reach the production code that we want to test.
   ```
    func test_methodOne(){
        let sut = MyClass()
        sut.methodOne()
        
        // normally, assert something
    }
   ```
   sut stands for **system under test**
   ```
   @testable import LifeCycle
   ```
   MyClass is defaulted to internal accesss, @testable makes internal declarations visible.
   Anything declared private remains off-limits, even to tests. This means the test suit cannot access a private method in MyClass. 

# 3. Observe Object Life Cycles to Learn the Phases of a Test
   ## The Four-Phase Test:
   1. The test creates an instance of MyClass (create the thing)
   2. It invokes a method on the instance (call the thing)
   3. It asserts an outcome (assert the thing)
   4. It destroys the instance (destroy the thing)
   
   ## Why the Four-Phase Test:
   so that the tests should reach the same outcomes regardless of the following:
   1. whether a single test is run by itself
   2. whether all tests are run together
   3. whether the test order changes

   The final step of the four-phase test is handled by the compiler, and the 1st to the 3rd steps are testing code written by us. It's recommended to separate the 3 steps with blank lines.

   ## How XCTest manages Test Cases:
   1. XCTest searches for all classes that inherit from XCTestCase.
   2. For each such class, it finds every test method. These are methods whose names start with *test*, take no arguments, and have no return value.
   3. For each such test method, it create an instance of the class. Using Objective-C runtime magic, it remembers which test method that instance will run.
   4. XCTest collects the instances of the subclass into a test suite.
   5. When it's finished creating all test cases, only then does XCTest begin running them.
   

   *Test fixture*: the "stuff the test needs in order to run."

   ## setUp() and tearDown()
   The *test runner* in *XCTest* guarantees the following sequence for each test case:
   1. call setUp()
   2. call the test method
   3. call tearDown()

   Only use the setUp template method for test fixtures shared by most tests in a suite.
   
   ```
    class MyClassTests: XCTestCase {
        private var sut : MyClass!
        
        override func setUp() {
            super.setUp()
            sut = MyClass()
        }
        
        override func tearDown() {
            sut = nil
            super.tearDown()
        }
        
        func test_methodOne(){
            sut.methodOne()
            // normally, assert something
        }
        
        func test_methodTwo() {
            sut.methodTwo()
            // normally, assert something
        }
    }
   ```
   