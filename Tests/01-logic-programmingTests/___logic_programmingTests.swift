import XCTest
@testable import ___logic_programming

import LogicKit

class ___logic_programmingTests: XCTestCase {
   func testExample() {
      // This is an example of a functional test case.
      // Use XCTAssert and related functions to verify your tests produce the correct results.
      do{
         let x = Variable(named: "x")
         let q = is_student(who: x)
         print("Who are students ?")
         let results = q(State())
         for substitution in results {
            for (_, value) in substitution.reified() {
               print("- \(value)")
            }
         }
      }
      do{
         let q = is_student(who: Person.Trudi)
         print("Is Trudi a student ?")
         let results = q(State())
         for substitution in results {
            for (_, value) in substitution.reified() {
               print("- \(value)")
            }
         }
      }
      do{
         let students = all_students()
         print("[", terminator: "")
         for i in students.indices.dropLast() {
            print("\(students[i]), ", terminator: "")
         }
         if students.isEmpty {
            print("]")
         } else {
            print("\(students[students.endIndex - 1])]")
         }
      }
      //   XCTAssertEqual(___logic_programming().text, "Hello, World!")
   }


    static var allTests : [(String, (___logic_programmingTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
