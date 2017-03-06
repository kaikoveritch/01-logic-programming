import LogicKit

enum Person: Term {

   case Petr, Nicolas, Kaiko
   case Trudi, John

    func equals(_ other: Term) -> Bool {
        return (other is Person) && (other as! Person == self)
    }

}

func is_student(who: Term) -> Goal {
   return   (who === Person.Petr)     ||
            (who === Person.Nicolas)  ||
            (who === Person.Kaiko)
}

func all_students() -> [Person] {
   var list = Array<Person>()
   let x = Variable(named: "x")
   let q = is_student(who: x)
   let results = q(State())
   for substitution in results {
      for (_,value) in substitution.reified() {
         list += [value as! Person]
      }
   }
   return list
}
