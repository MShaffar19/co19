/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Object: if T1 is Object then:
 *  - if T0 is an unpromoted type variable with bound B then T0 <: T1 iff
 *      B <: Object
 *  - if T0 is a promoted type variable X & S then T0 <: T1 iff S <: Object
 *  - if T0 is FutureOr<S> for some S, then T0 <: T1 iff S <: Object.
 *  - if T0 is S* for any S, then T0 <: T1 iff S <: T1
 *  - if T0 is Null, dynamic, void, or S? for any S, then the subtyping does not
 *      hold (per above, the result of the subtyping query is false).
 *  - Otherwise T0 <: T1 is true.
 * @description Check that if T0 is an unpromoted type variable with bound B
 * but B is not subtype of Object then T0 is not subtype of T1
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as a class member of type T1. Assignment to static and instance class
 * variables is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from right_object_fail_A01_t01.dart and 
 * class_member_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
class B {}
class T0 extends B {}

T0 t0Instance = new T0();
Object t1Instance = new Object();





class ClassMemberTestStatic {
  static Object s;

  ClassMemberTestStatic(T0 val) {
    s = val; //# 01: compile-time error
  }

  static staticTest() {
    s = t0Instance; //# 04: compile-time error
  }

  static set staticSetter(T0 val) {
    s = val; //# 02: compile-time error
  }

  static Object get staticGetter => t0Instance; //# 03: compile-time error
}

class ClassMemberTestPublic {
  Object m;

  ClassMemberTestPublic(T0 val) {
    m = val; //# 05: compile-time error
  }

  ClassMemberTestPublic.short(this.m);

  ClassMemberTestPublic.validConstructor() {}

  test(T0 val) {
    m = val; //# 08: compile-time error
  }

  set setter(T0 val) {
    m = val; //# 07: compile-time error
  }

  Object get getter => t0Instance; //# 09: compile-time error
}

class ClassMemberTestPrivate {
  Object _m;

  ClassMemberTestPrivate(T0 val) {
    _m = val; //# 10: compile-time error
  }

  ClassMemberTestPrivate.short(this._m);

  ClassMemberTestPrivate.validConstructor() {}

  test(T0 val) {
    _m = val; //# 12: compile-time error
  }

  set setter(T0 val) {
    _m = val; //# 11: compile-time error
  }
}

class ClassMemberTestInitFail {
  static Object s = t0Instance; //# 13: compile-time error
  Object m = t0Instance; //# 14: compile-time error
}




test<T extends B?>(T t0Instance) {
  
  new ClassMemberTestStatic(t0Instance); //# 01: compile-time error
  ClassMemberTestStatic.staticSetter = t0Instance; //# 02: compile-time error
  ClassMemberTestStatic.staticGetter; //# 03: compile-time error
  ClassMemberTestStatic.staticTest(); //# 04: compile-time error
  new ClassMemberTestPublic(t0Instance); //# 05: compile-time error
  new ClassMemberTestPublic.validConstructor().m = t0Instance; //# 06: compile-time error
  new ClassMemberTestPublic.validConstructor().setter = t0Instance; //# 07: compile-time error
  new ClassMemberTestPublic.validConstructor().test(t0Instance); //# 08: compile-time error
  new ClassMemberTestPublic.validConstructor().getter; //# 09: compile-time error
  new ClassMemberTestPrivate(t0Instance); //# 10: compile-time error
  new ClassMemberTestPrivate.validConstructor().setter = t0Instance; //# 11: compile-time error
  new ClassMemberTestPrivate.validConstructor().test(t0Instance); //# 12: compile-time error
  ClassMemberTestInitFail.s; //# 13: compile-time error
  new ClassMemberTestInitFail(); //# 14: compile-time error

}

main() {
  test<T0>(t0Instance);
}
