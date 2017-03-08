import LogicKit

enum Person: Term {

   case Petr, Nicolas, Kaiko, Alex, Raphael, Aslam
   case Trudi, John

    func equals(_ other: Term) -> Bool {
        return (other is Person) && (other as! Person == self)
    }

}

enum Course: Term {

   case Semantics, Security, Juggling

   func equals(_ other: Term) -> Bool {
      return (other is Course) && (other as! Course == self)
   }

}

enum Year: Term {

case y2015, y2016, y2017

   func equals(_ other: Term) -> Bool {
      return (other is Year) && (other as! Year == self)
   }

}

func is_student(who: Term) -> Goal {
   return   (who === Person.Petr)      ||
            (who === Person.Nicolas)   ||
            (who === Person.Kaiko)     ||
            (who === Person.Alex)      ||
            (who === Person.Raphael)   ||
            (who === Person.Aslam)
}

func is_course(what: Term) -> Goal {
   return   (what === Course.Semantics) ||
            (what === Course.Security)  ||
            (what === Course.Juggling)
}

func is_year(what: Term) -> Goal {
   return   (what === Year.y2015)  ||
            (what === Year.y2016)  ||
            (what === Year.y2017)
}

func all_students() -> [Person] {
   var list = Array<Person>()
   let x = Variable(named: "x")
   let q = is_student(who: x)
   for solution in solve(q) {
      list += [solution[x] as! Person]
   }
   return list
}

func attends(who: Term, course: Term, year: Term) -> Goal {
   return is_student(who: who) && is_course(what: course) && is_year(what: year) &&
      (
         ((who === Person.Petr) && (course === Course.Semantics) && (year === Year.y2017))      ||
         ((who === Person.Petr) && (course === Course.Security) && (year === Year.y2016))       ||
         ((who === Person.Nicolas) && (course === Course.Semantics) && (year === Year.y2017))   ||
         ((who === Person.Nicolas) && (course === Course.Security) && (year === Year.y2016))    ||
         ((who === Person.Nicolas) && (course === Course.Juggling) && (year === Year.y2015))    ||
         ((who === Person.Kaiko) && (course === Course.Semantics) && (year === Year.y2017))     ||
         ((who === Person.Kaiko) && (course === Course.Security) && (year === Year.y2016))      ||
         ((who === Person.Alex) && (course === Course.Semantics) && (year === Year.y2016))      ||
         ((who === Person.Alex) && (course === Course.Security) && (year === Year.y2015))       ||
         ((who === Person.Raphael) && (course === Course.Semantics) && (year === Year.y2016))   ||
         ((who === Person.Raphael) && (course === Course.Security) && (year === Year.y2015))    ||
         ((who === Person.Raphael) && (course === Course.Juggling) && (year === Year.y2017))    ||
         ((who === Person.Aslam) && (course === Course.Semantics) && (year === Year.y2016))     ||
         ((who === Person.Aslam) && (course === Course.Semantics) && (year === Year.y2017))     ||
         ((who === Person.Aslam) && (course === Course.Security) && (year === Year.y2016))
      )
}
