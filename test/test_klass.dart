part of directive;

class A {}

class D {}

mixin Q {}

class B extends A {}

class C implements B {}

class Z with D {}

class X extends A implements D {}

class K with Q implements D {}

class S extends A with Q implements D {}
