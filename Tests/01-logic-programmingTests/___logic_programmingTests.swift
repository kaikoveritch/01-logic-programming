import XCTest
@testable import ___logic_programming

import LogicKit

class ___logic_programmingTests: XCTestCase {
   func testExample() {
      // This is an example of a functional test case.
      // Use XCTAssert and related functions to verify your tests produce the correct results.
      print("\n\n[Début des tests]")
      print("\n[Test 1]")
      do{ // All students
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
      print("\n[Test 2]")
      do{ // All students in semantics 2017
         let x = Variable(named: "x")
         let y = Course.Semantics
         let z = Year.y2017
         let attendance = attends(who: x, course: y, year: z)
         for solution in solve(attendance){
            print("x = \(solution[x]), y = \(solution[y]), z = \(solution[z])")
         }
      }
      print("\n[Test 3]")
      do{ // All students in semantics (all years)
         let x = Variable(named: "x")
         let y = Course.Semantics
         let z = Variable(named: "z")
         let attendance = attends(who: x, course: y, year: z)
         for solution in solve(attendance){
            print("x = \(solution[x]), y = \(solution[y]), z = \(solution[z])")
         }
      }
      print("\n[Test 4]")
      do{ // All courses for Aslam
         let x = Person.Aslam
         let y = Variable(named: "y")
         let z = Variable(named: "z")
         let attendance = attends(who: x, course: y, year: z)
         for solution in solve(attendance){
            print("x = \(solution[x]), y = \(solution[y]), z = \(solution[z])")
         }
      }
      print("\n[Fin des tests]\n\n")
      //   XCTAssertEqual(___logic_programming().text, "Hello, World!")
   }


    static var allTests : [(String, (___logic_programmingTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
