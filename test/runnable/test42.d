// REQUIRED_ARGS: -d

module test42;

import std.stdio;
import std.c.stdio;
import std.string;

/***************************************************/

class Foo {
    template myCast(T) {
        T myCast(U)(U val) {
            return cast(T) val;
        }
    }
}

void test1()
{
  Foo foo = new Foo;
  int i = foo.myCast!(int)(1.0);
} 

/***************************************************/

template A()
{
  static T foo(T)(T t) { return 7 + t; }
}

struct Bar
{
  mixin A!() a;
}

void test2()
{
  auto i = A!().foo(1);
  assert(i == 8);
  i = Bar.a.foo!(int)(2);
  assert(i == 9);
  i = Bar.a.foo(3);
  assert(i == 10);
}

/***************************************************/

void test3()
{
    auto i = mixin("__LINE__");
    writefln("%d", i);
    assert(i == 51);
}

/***************************************************/

class C4
{
    void Stamp(){}

    this() { }

    S4 cursor;
}

struct S4
{
}

void test4()
{
}

/***************************************************/

char a5 = (cast(char[])['a']) [$-1];

void test5()
{
    assert(a5 == 'a');
}

/***************************************************/

void foo6a() {
        do
                debug {}
        while (true);
}

void foo6b() {
        while (true)
                debug {}
}

void foo6c() {
        with (Object.init)
                debug {}
}

void foo6d() {
        synchronized debug {}
}

void foo6e() {
        volatile debug {}
}

void test6()
{
}

/***************************************************/

class C7 {
    public this(){
    }
}

interface I7 {
    void fnc();
}

void test7()
{
    char[][] t;
    foreach( char[] c; t ){
        new class( c ) C7, I7 {
            public this( char[] c ){
                super();
            }
            void fnc(){
            }
        };
    }
}

/***************************************************/

const ulong[] A8 = ([1LU])[0..$];

void test8()
{
    assert(A8[0] == 1);
}

/***************************************************/

void test9()
{
    writeln(long.max.stringof);
    writeln(ulong.max.stringof);
    assert(long.max.stringof == "9223372036854775807L");
    assert(ulong.max.stringof == "18446744073709551615LU");
}

/***************************************************/

const ulong[] A10 = [1UL];
const ulong[] B10 = A10 ~ [1UL];

void test10()
{
}

/***************************************************/

class Base11 {
        private final void foo() {}
}

class Derived11 : Base11 {
        void foo() {}
}

void test11()
{
}

/***************************************************/

void test12()
{
    int[] bar;
    assert((bar ~ 1).length == bar.length + 1);

    int[][] baz;
    assert((baz ~ cast(int[])[1]).length == baz.length + 1);

    char[][] foo;
    assert((foo ~ cast(char[])"foo").length == foo.length + 1);
    assert((cast(char[])"foo" ~ foo).length == foo.length + 1);

    printf("%d\n", (foo ~ cast(char[])"foo")[0].length);

    assert((foo ~ [cast(char[])"foo"]).length == foo.length + 1);

    char[] qux;
    assert(([qux] ~ cast(char[])"foo").length == [qux].length + 1);

    assert(([cast(dchar[])"asdf"] ~ cast(dchar[])"foo").length == [cast(dchar[])"asdf"].length + 1);

    string[] quux;
    auto quuux = quux.dup;
    quuux ~= "foo";
    assert (quuux.length == quux.length + 1);
}

/***************************************************/

int prop() { return 3; }

void test13()
{
  auto x = prop;
  assert(x == 3);
}

/***************************************************/

void recurse(ref int i)
{
    int j = i;
    recurse(j);
}

void test14()
{
}

/***************************************************/

void bar15(void delegate(int) dg)
{
    dg(7);
}

class C15
{
    int x;

    private void callback(int i)
    {
	x = i + 3;
    }

    void foo()
    {
	bar15(&callback);
	assert(x == 10);
    }
}

void test15()
{
    C15 c = new C15();

    c.foo();
}

/***************************************************/

void bar16(int i, ...) { }

void foo16() { }
void foo16(int) { }

void test16()
{
    bar16(1, cast(void function())&foo16);
}

/***************************************************/

void foo17(char[4] buf, dchar c) { }
void foo17(string s) { }
void foo17(wstring s) { }


void test17()
{
    wstring w;
    .foo17(w);
}

/***************************************************/

struct S18
{
  version (Dversion2)
  {
    static void opCall(string msg) { assert(0); }
  }
    static void opCall() { }
}

void test18()
{
    S18();
}

/***************************************************/

class C19
{
  version (Dversion2)
  {
    static void opCall(string msg) { assert(0); }
  }
    static void opCall() { }
}

void test19()
{
    C19();
}

/***************************************************/

extern (System) void test20()
{
}

/***************************************************/

void func21()
{
}

int foo21()
{
   return *cast(int*)&func21;
}

void test21()
{
    foo21();
}

/***************************************************/

void bar22(alias T)()
{
	assert(3 == T);
}

class Test22
{
	int a;
	mixin bar22!(a);
}

void test22()
{
	Test22 t = new Test22();
	t.a = 3;
	t.bar22();
}

/***************************************************/

static this()
{
   printf("one\n");
}

static this()
{
   printf("two\n");
}

static ~this()
{
   printf("~two\n");
}

static ~this()
{
   printf("~one\n");
}

void test23()
{
}

/***************************************************/

class Foo24
{
    static string gen()
    {
        return "abc";
    }
}

auto s24 = Foo24.gen();

void test24()
{
    assert(s24 == "abc");
}

/***************************************************/

void test25()   
{   
    int[10] arrayA = [0,1,2,3,4,5,6,7,8,9];   
    foreach(int i; arrayA)   
    {   
        writeln(i);   
    }   
}

/***************************************************/

struct BaseStruct {
  int n;
  char c;
}

typedef BaseStruct MyStruct26;

void myFunction(MyStruct26) {}

void test26()
{
  myFunction(MyStruct26(0, 'x'));
}

/************************************/

const char[][7] DAY_NAME = [
        DAY.SUN: "sunday", "monday", "tuesday", "wednesday",
          "thursday", "friday", "saturday"
];

enum DAY { SUN, MON, TUE, WED, THU, FRI, SAT }

void test27()
{
    assert(DAY_NAME[DAY.SUN] == "sunday");
    assert(DAY_NAME[DAY.MON] == "monday");
    assert(DAY_NAME[DAY.TUE] == "tuesday");
    assert(DAY_NAME[DAY.WED] == "wednesday");
    assert(DAY_NAME[DAY.THU] == "thursday");
    assert(DAY_NAME[DAY.FRI] == "friday");
    assert(DAY_NAME[DAY.SAT] == "saturday");
}

/***************************************************/

void test28()
{
}

/***************************************************/

struct C29 {

    C29 copy() { return this; }
}

void foo29(C29 _c) {

    foo29( _c.copy() );
}

void test29() {

    C29 c;

    //foo(c);
}

/***************************************************/

class Foo30
{
    int i;
}

typedef Foo30 Bar30;

void test30()
{
    Bar30 testBar = new Bar30();
    auto j = testBar.i;
}

/***************************************************/

template Tuple31(T...) { alias T Tuple31; }
alias Tuple31!(int,int) TType31;

void bar31(TType31) {
}

void test31()
{
}

/***************************************************/

template Foo32(T : S!(T), alias S)
{
    alias int Foo32;
}

struct Struct32(T)
{
}

void test32()
{
    Foo32!(Struct32!(int)) f;
}

/***************************************************/

void test33()
{
    string a = "a";
    string b = "b";
    string c = a ~ b;
    assert(c == "ab");
}

/***************************************************/

void foo34(in string s)
{
    string t = s;
}

void test34()
{
}

/***************************************************/

struct S35
{
   string toString()
   {
       return "foo";
   }
}

void test35()
{   S35 s;
    auto t = typeid(S35);
    writefln("s = %s", s);
    writefln("s = %s", t);
    auto tis = cast(TypeInfo_Struct)t;
    writefln("s = %s", tis);
    writefln("s = %s", tis.xtoString);
    assert(tis.xtoString != null);
}

/***************************************************/

void test36()
{
    void[0] x;
    auto y = x;
    alias x z;
}

/***************************************************/

template isStaticArray(T : U[], U)
{
    const bool isStaticArray = is(typeof(U) == typeof(T.init));
}

template isStaticArray(T, U = void)
{
    const bool isStaticArray = false;
}

template isStaticArray(T : T[N], size_t N)
{
    const bool isStaticArray = true;
}

static assert (isStaticArray!(int[51]));
static assert (isStaticArray!(int[][2]));
static assert (isStaticArray!(char[][int][11]));
static assert (!isStaticArray!(int[]));
static assert (!isStaticArray!(int[char]));
static assert (!isStaticArray!(int[1][]));

static assert(isStaticArray!(void[0]));

void test37()
{
}

/***************************************************/

template Foo38(T)
{
    const bool Foo38 = false;
}

template Foo38(T : U[N], U, size_t N)
{
    const bool Foo38 = true;
}

void test38()
{
    static assert (Foo38!(int[51]));
}

/***************************************************/

void test39()
{
}

/***************************************************/

void test40()
{
    static x = [[1.0, 2.0], [3.0, 4.0]]; // works
    assert(x[0][0] == 1.0);
    assert(x[0][1] == 2.0);
    assert(x[1][0] == 3.0);
    assert(x[1][1] == 4.0);

    auto y = [[1.0, 2.0], [3.0, 4.0]]; // fails
    assert(y[0][0] == 1.0);
    assert(y[0][1] == 2.0);
    assert(y[1][0] == 3.0);
    assert(y[1][1] == 4.0);
}

/***************************************************/

struct S41
{
    int[4] a;
}

shared int x41;
shared S41 s41;

void test41()
{
    printf("&x = %p\n", &x41);
    printf("&s = %p\n", &s41);
    assert((cast(int)&s41 & 0xF) == 0);
}

/***************************************************/

int test42(string[] args = null)
{
   foreach(p; args){
      version(dummy) int i;
   }
   return 0;
}


/***************************************************/

void foo43(float length, byte b)
{
//    b /= cast(cfloat) length;
}

void test43()
{
}

/***************************************************/

void test44()
{
    ifloat f = 1.0fi;
//    f *= 2.0fi; // illegal but compiles
    writefln("%s", f);
//    assert(f == 0i);
}

/***************************************************/

int foo45(int i)
{
   if(i==0){
      return 2;
   }
   assert(0);
}

void test45()
{
   version (Windows)  // this test fails in -release because asserts will be removed
   {
   assert(foo45(0)==2);
   try{
      foo45(1);
   }catch{
      return cast(void)0;
   }
   assert(0);
   }
}

/***************************************************/


void va_copy46(out void* dest, void* src)
{
    dest = src;
}

void test46()
{
}

/***************************************************/

void test47()
{
    enum { _P_WAIT, _P_NOWAIT, _P_OVERLAY };

    alias _P_WAIT P_WAIT;
    alias _P_NOWAIT P_NOWAIT;
}

/***************************************************/

void f48(int x)
{
    const(char)[] blah = (x == 1 ? "hello".dup : "world");
}

void test48()
{
    f48(1);
}

/***************************************************/

void test49()
{
    assert((25.5).stringof ~ (3.01).stringof == "25.53.01");
    assert(25.5.stringof ~ 3.01.stringof == "25.53.01");
}

/***************************************************/

class Ap50
{
    ulong size;
    static uint valuex;

    void update(ubyte input, int i)
    {
	valuex =
	    (((size + i) & 1) == 0) ?
		    0 :
		    input;
    }
}

void test50()
{
}

/***************************************************/

int* foo51()
{
    assert(is(typeof(return) == int*));
    return null;
}

void test51()
{
    foo51();
}

/***************************************************/

template Foo52(ulong U)
{
    int Foo52 = 1;
}

template Foo52(uint U)
{
    int Foo52 = 2;
}

template Foo52(ubyte U)
{
    int Foo52 = 3;
}


void test52()
{
    const uint u = 3;
    auto s = Foo52!(u);
    assert(s == 2);
}

/***************************************************/

void test53()
{
    extern int x;
}

/***************************************************/

void func54(string delegate() dg)
{
        dg();
}

void test54()
{
    string[] k=["adf","AsdfadSF","dfdsfassdf"];
    foreach(d;k)
    {
	printf("%.*s\n", d.length, d.ptr);
	string foo() {assert(d!="");return d;}
	func54(&foo);
	func54(delegate string() {assert(d!="");return d;});             
    }
}

/***************************************************/

class DebugInfo 
{
    typedef int CVHeaderType ;
    enum anon:CVHeaderType{ CV_NONE, CV_DOS, CV_NT, CV_DBG }
}

void test55()
{
}

/***************************************************/

template T56() { int i; }

struct S56 {
    alias T56!() data;
}

class C56 {
    alias T56!() data;
}

void test56()
{
    S56.data.i = 3;
    C56.data.i = 4;
    assert(S56.data.i == 4);
}

/***************************************************/

void writecrossing(bool goal)
{
  writeln(goal?"escape":"return");
}

void test57()
{
    writecrossing(true);
    writecrossing(false);
}

/***************************************************/

void f58(int n) {}
void g58(char[] s) {}

char[][] a58;

class bar58
{
        int i;

        void func() {
                f58(i);

                foreach (s; a58) {
                        if (s == s){}
                        if (s[0..0] == "" && s[0..0])
                                g58(s);
                }

                f58(i);
        }
}

void test58()
{
}

/***************************************************/

void test59()
{
    int[] array = new int[5];
    uint check = 0;
    foreach (it; array.ptr .. array.ptr + array.length) {
        ++check;
    }
    assert(check == array.length);
}

/***************************************************/

final class Foo60()
{
    void bar()
    {
        int baz;
        baz = 1;
    }
}

void test60()
{
    auto foo = new Foo60!();
}

/***************************************************/

class ZipEntry61
{
    ZipEntryInfo61 info;
    this() {}
}
struct ZipEntryInfo61 {}

void test61()
{
}

/***************************************************/

void test62()
{
   int foo() { return 0; }
   int bar() { return 0; }

   auto t1 = typeid(typeof(foo));   
   auto t2 = typeid(typeof(bar));

   t1.tsize();
}

/***************************************************/

struct S63
{
    int a;
    static int foo()
    {
	return a.sizeof;
    }
}

void test63()
{
    int x = S63.a.sizeof;
    assert(x == 4);
    assert(S63.foo() == 4);
}

/***************************************************/

string[] foo64()
{
    return [[]];
}

void test64()
{
    auto a = foo64();
    assert(a.length == 1);
    assert(a[0].length == 0);
}

/***************************************************/

string[][] foo65()
{
    string[][] result = [];
    string[] s = [];
    result ~= [s];
    return result;
}

void test65()
{
    auto s = foo65();
    assert(s.length == 1);
    assert(s[0].length == 0);
}

/***************************************************/

string[][] foo66()
{
    string[] strings = ["a","bc"];
    string [][] result = [];
    foreach (s; strings)
    {
        result ~= [s];
    }
    return result;
}

void test66()
{
    auto s = foo66();
    assert(s.length == 2);
    assert(s[0].length == 1);
    assert(s[0][0].length == 1);
    assert(s[1].length == 1);
    assert(s[1][0].length == 2);
}

/***************************************************/

template Tuple67(A...)
{
    alias A Tuple67;
}

template Bar67()
{
    const s = "a bar";
}

void test67()
{
    alias Tuple67!(Bar67!()) tuple;
    static const i = 0;
    alias tuple[0] bara;
    alias tuple[i] barb;

    static assert(bara.s == "a bar");
    static assert(barb.s == "a bar");
}

/***************************************************/

template Tuple68(A...)
{
    alias A Tuple68;
}

size_t foo68()
{
    return 1;
}

void test68()
{
    alias Tuple68!("one", "two") tuple;
    static assert(tuple[foo68()] == "two");
}

/***************************************************/

class Base69 {}

class Da69 : Base69 {}
class Db69 : Base69 {}

void test69()
{   int i;
    auto b = i ? new Da69 : new Db69;
    assert(is(typeof(b) == Base69));
}

/***************************************************/

struct Bar70
{
        Bar70[] bars;
}

void test70()
{
        Bar70 node;
}

/***************************************************/

template Foo71(string s)
{
    string b = s;
}

void test71()
{
    size_t s = Foo71!(
"helloabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
"helloabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
"helloabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
"helloabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
"helloabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
"helloabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
"helloabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
"helloabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
"helloabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
"helloabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
"helloabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
"When dealing with complex template tuples, it's very easy to overflow the
maximum symbol length allowed by OPTLINK.  This is, simply put, a damn shame,
because it prevents otherwise completely legal code from compiling and linking
with DMDWin, whereas it works perfectly fine when using DMDNix or GDC.  
I know that this is neither a simple nor a small issue to fix: either the
ancient, nearly-immutable OPTLINK would have to be modified, or DMDWin would
have to be changed to output a more reasonable format, in which case a new
linker would probably have to be written.  Until then, this issue should stand
as a reminder that DMDWin is inherently limited.
Oplink isn't the issue. The OMF file format has a hard limit. This results in
the only solutions being: convert DMD to use some other .obj format or have DMD
do something else for name mangling.
In talking to Walter, the issue is that it's easy to get symbols that have more
info in them than can be fit into the limit. (the limit has already stretched
by gziping the symbols.)
The simple solution I have proposed is to just MD5 (or what not) the symbols.
The only issue (besides a vanishingly small chance of a hash collision) is that
this looses information so you can't look at a symbol and directly determine
what it was. My answer to that is, who cares? The only place where hashing
provides less info than compressing is in a debugger and it can grab the full
symbol from a table in the static data segment.
I suppose as a stopgap measure that'd work fine, and might even be controlled
by a compiler switch, so that in the general case debugger info wouldn't be
affected.  And what's more -- the only time these issues come up is with
templates, which a lot of debuggers have serious problems with anyway, so..
I would set it up as a method of last resort. It wouldn't be used unless the
symbol can't be used any other way.
"
	).b.length;
}

/***************************************************/

class B72 { this(bool b, string c){} }

class C72 : B72
{
        this()
        {
                alias typeof(super(false,"hello")) foo;
                super(false,"hello");
        }
}

void test72()
{
}

/***************************************************/

template Foo73()
{
    mixin ("const int x = 3;");
    //const int x = 3;

    static if (x == 3)
    {
	pragma(msg, "success");
    }
}

alias Foo73!() foo73;

void test73()
{
}

/***************************************************/

alias uint foo74;

void simple_func_t(T)(T s, foo74 i)
{
    assert(s == "hello");
    assert(i == 3);
}

void test74()
{
    simple_func_t("hello", 3);
}

/***************************************************/

void foo75(T)(T[] x ...)
{
    assert(x.length == 3);
    assert(x[0] == 2);
    assert(x[1] == 3);
    assert(x[2] == 4);
    assert(is(T == int));
}

void test75()
{
    foo75(2,3,4);
}

/***************************************************/

void delegate(U) Curry(A, U...)(void delegate(A,U) dg,A arg)
{
  struct ArgRecord {
    A arg;
    typeof(dg) callback;

    void OpCall(U args) { callback(arg,args); }
  }
  auto temp = new ArgRecord;
  temp.arg = arg;
  temp.callback = dg;
  return &temp.OpCall;
}

void delegate(A) Seq(A...)(void delegate(A)[] dgs...)
{
  return Curry(delegate void(void delegate(A)[] dgs1,A args)
               {
                 foreach(dg; dgs1)
                   dg(args);
               },
               dgs);
}

struct Foo76
{
  void fred(int i) {}
}

void test76()
{
  void delegate(int) tmp;
  auto bob = new Foo76;
  auto dan = new Foo76;

  tmp = Seq!(int)(&bob.fred);             // this works
  tmp = Seq!(int)(&bob.fred, &dan.fred);  // this works
  tmp = Seq      (&bob.fred);             // this doesn't
  tmp = Seq      (&bob.fred, &dan.fred);  // neither does this
}

/***************************************************/

int x77;

void foo77()
{
    x77 = 1;

    static if(true)
    {
    }
    else
    {
    }
}

void test77()
{
    foo77();
    assert(x77 == 1);
}

/***************************************************/

class Foo78
{
  template TBar(T)
  {
    T x;                   // Compiles, but is implicitly static
    void func(T t)   // Ok, non-static member template function
    { assert(t == 2); assert(this.bar == 42); }    
  }
  int bar = 42;
}

void test78()
{
  alias Foo78 Foo;
  Foo.TBar!(int).x = 2;
  //Foo.TBar!(int).func(2); // error, since funcx is not static

  Foo f = new Foo;
  Foo g = new Foo;

  f.TBar!(int).func(2); // works

  f.TBar!(int).x = 10;
  g.TBar!(int).x = 20;
  assert(f.TBar!(int).x == 20); // prints 20
}

/***************************************************/

class C79
{
}

void test79()
{
    C79 c = new C79();
    writeln(c.__vptr);
    writeln(c.__vptr[0]);
    writeln(cast(void*)c.classinfo);
    assert(c.__vptr[0] == cast(void*)c.classinfo);
    writeln(c.__monitor);
    assert(c.__monitor == null);
    synchronized (c)
    {
	writeln(c.__monitor);
	assert(c.__monitor !is null);
    }
}

/***************************************************/

class Test80{
  template test(){
    enum int test=1;
  }
}

void test80()
{
  assert(Test80.test!()==1);
  assert((new Test80).test!()==1);
}

/***************************************************/

class Test81
{
  static const test2=1;
  template test(){
    static const int test=1;
  }
}

void test81()
{
  auto a=new Test81;
  static assert(typeof(a).test2==1);//ok
  alias typeof(a) t;
  static assert(t.test!()==1);//ok
  static assert(typeof(a).test!()==1);//syntax error
}

/***************************************************/

deprecated
{
    alias real A82;
    void foo82(A82 x) {    }
}

void test82()
{
}

/***************************************************/

class Bar83
{
    deprecated void foo(int param)
    {
    }

    void foo(string param)
    {
    }
}

void test83()
{
    Bar83 b = new Bar83;
    string str = "bar";
    b.foo(str);
}

/***************************************************/

void test84()
{
    int[0][10] arr;
    printf("%u\n", &arr[9] - &arr[0]);
    auto i = &arr[9] - &arr[0];
    assert(i == 0);
}

/***************************************************/

class myid
{
    string buf;
    this(string str )
    {
	    buf = str;
    }
}
struct Lex
{
    static myid myidinst;
    static void Init()
    {
	    myidinst = new myid("abc");
    }
}

void test85()
{
    Lex.Init();
    assert(cast(myid)(Lex.myidinst) !is null);
}

/***************************************************/

struct Time
{
  long ticks;
}

struct Stamps
{
    Time    created,        /// time created
            accessed,       /// last time accessed
            modified;       /// last time modified
}

Stamps getTimeStamps()
{
    foreach(i; 0..10) { }
    Stamps                    time = void;

    time.modified = Time(20);
    time.accessed = Time(20);
    time.created  = Time(20);
    return time;
}

Time accessed ()
{
    foreach(i; 0..10) { }
    return timeStamps(4).accessed;
}

Stamps timeStamps (int name)
{
  return getTimeStamps();
}

void test86()
{

  assert(accessed().ticks == 20);
}

/***************************************************/

const bool foo87 = is(typeof(function void() { }));
const bar87      = is(typeof(function void() { }));

void test87()
{
    assert(foo87 == true);
    assert(bar87 == true);
}

/***************************************************/

int function() wrap88(void function()) { return null; }

void test88()
{
	printf("test88\n");
	if (0)
	    wrap88(&test88)();
}

/***************************************************/

struct S89
{
        static const float[2] z = 3;
}

class C89
{
        static const float[2] z = 3;
}

void bar89(float f) { assert(f == 3); }

void test89()
{
	printf("test89\n");
        bar89(S89.z[0]);
        bar89(S89.z[1]);
        bar89(C89.z[0]);
        bar89(C89.z[1]);
}

/***************************************************/

void trigger(char[] txt)
{
        txt[0] = 'x';

        scope(exit)
        {
                txt[0] = 'x';
        }

        return;
}

void test90()
{
}

/***************************************************/

void test91()
{
    enum ABC { a, b, c }
    assert(ABC.stringof == "ABC");
}

/***************************************************/

int x92;

int f92() {
    x92++;
    return 0;
}

void test92()
{
    int[1] a;
    a[f92()] += 42L;
    assert(x92 == 1);
}

/***************************************************/

void test93()
{
    void foo() { }
    static assert(is(typeof(1 || foo()) == void));
    static assert(is(typeof(1 && foo()) == void));
}

/***************************************************/

void foo94(T)()
{
}

struct f94(alias func=foo94!(int))
{
}

void test94()
{
    f94!() myf;
}

/***************************************************/

struct X95
{
   import std.c.stdio;
}

void test95()
{
   X95.std.c.stdio.printf("hello\n");
}

/***************************************************/

template foo96(alias bar)
{
    pragma(msg, bar.stringof ~ " " ~ typeof(bar).stringof);
    static assert((bar.stringof ~ " " ~ typeof(bar).stringof) == "myInt int" ||
	(bar.stringof ~ " " ~ typeof(bar).stringof) == "myBool bool");
    void foo96() {}
}

void test96()
{
    int myInt;
    bool myBool;

    foo96!(myInt)();
    foo96!(myBool)();
}

/***************************************************/

void test97()
{
    const short[] ct = cast(short[]) [cast(byte)1, 1];
    writeln(ct);
    assert(ct.length == 2 && ct[0] == 1 && ct[1] == 1);

    short[] rt = cast(short[]) [cast(byte)1, cast(byte)1].dup;
    writeln(rt);
    assert(rt.length == 1 && rt[0] == 257);
}

/***************************************************/

class Foo98
{
    string foo = "abc";
    size_t i = 0;

    void bar()
    {
	printf("%c\n", foo[i]);
	i++;
	printf("%c\n", foo[i]);
	assert(foo[i] == 'b');
    }
}

void test98()
{
    auto f = new Foo98();
    f.bar();
}

/***************************************************/

template implicitlyConverts99(S, T)
{
    enum bool implicitlyConverts99 = T.sizeof >= S.sizeof
        && is(typeof({S s; T t = s;}()));
}

static assert(!implicitlyConverts99!(long, short));

void test99()
{
}

/***************************************************/

void test100()
{
  {
    real r = ulong.max;
    printf("r = %Lg, ulong.max = %llu\n", r, ulong.max);
    ulong d = cast(ulong)r;
    printf("d = %llx, ulong.max = %llx\n", d, ulong.max);
    assert(d == ulong.max);
  }
  {
    real r = ulong.max - 1;
    printf("r = %Lg, ulong.max = %llu\n", r, ulong.max);
    ulong d = cast(ulong)r;
    printf("d = %llx, ulong.max = %llx\n", d, ulong.max);
    assert(d == ulong.max - 1);
  }
}

/***************************************************/

auto e101(int x) { return 5; }

void test101()
{
    assert(is(typeof(e101(3)) == int));
}

/***************************************************/

void test102()
{
    typedef const(char)[] A;
    A stripl(A s)
    {
	uint i;
	return s[i .. $];
    }
}

/***************************************************/

version(X86)
{
int x103;

void external(...)
{
    printf("external: %d\n", *cast (int *) _argptr);
    x103 = *cast (int *) _argptr;
}

class C103
{
    void method ()
    {
	void internal (...)
	{
	    printf("internal: %d\n", *cast (int *)_argptr);
	    x103 = *cast (int *) _argptr;
	}

	internal (43);
	assert(x103 == 43);
    }
}

void test103()
{
    external(42);
    assert(x103 == 42);
    (new C103).method ();
}
}
else version(X86_64)
{
    pragma(msg, "Not ported to x86-64 compatible varargs, yet.");
    void test103() {}
}
else
    static assert(false, "Unknown platform");

/***************************************************/

class C104
{
    template Bar()
    {
    }
}

static assert(!is(typeof(C104.Bar.foo)));

void test104()
{
}

/***************************************************/

template Templ(T)
{
    const char [] XXX = Type.mangleof;
    alias T Type;
}

void test105()
{
    Templ!(int).Type x;
    auto s = Templ!(int).XXX;
    writeln(s);
    assert(s == "i");
}

/***************************************************/

class foo107 {}
typedef foo107 bar107;
void x107()
{
   bar107 a = new bar107();
   bar107 b = new bar107();
   bool c = (a == b);
}

void test107()
{
}

/***************************************************/

struct Foo108
{
    char[] byLine()()
    {
	return null;
    }
}

void test108()
{   Foo108 foo;

    foreach (char c; foo.byLine)
    {
    } 
}

/***************************************************/

void test109()
{
    double x[] = new double[1];
    assert(x[0] != 0);
}

/***************************************************/

void test110()
{
    struct C {
	int[0] b;
    }
    static C g_c2_ = {  };
}

/***************************************************/

template Foo111(T...) {
    alias T Foo111;
}

void test111()
{
    auto y = (Foo111!(int) x){ return 0; };
}

/***************************************************/

bool isNull(string str) {
        return str is null;
}

const bool foo112 = isNull("hello!");

void test112()
{
    assert(!foo112);
}

/***************************************************/

void test113()
{
  for (int j=1; j<2; j++) {
    int x = (j<0) ? -j : j;
    int q=0;
    for (int i=0; i<x; i++) ++q;
    assert(q!=0);
  }
}

/***************************************************/

struct VariantN
{
    static int opCall(int value)
    {
        return 0;
    }

    void foo()
    {
        VariantN v;
	v.bar(42, 5);
    }

    void bar(int value, int i)
    {
        int args[2] = [ VariantN(value), VariantN(i) ];
    }
}

void test114()
{
}

/***************************************************/

class B115 : A115!(B115) { }
class A115(T) { }

void test115()
{
}

/***************************************************/

struct Foo116 {
    this(U...)(U values)  { }
}

void test116()
{
  new Foo116;
}

/***************************************************/

void test117()
{
    float f = 7;
    f = f * 2;
    assert(f == 14);

    double d = 7;
    d = d * 2;
    assert(d == 14);

    real r = 7;
    r = r * 2;
    assert(r == 14);
}

/***************************************************/

void test118()
{
    int foo(real x)
    {
	real y = -x*-x;
	return cast(int)y;  
    }

    auto i = foo(4.0);
    assert(i == 16);
}

/***************************************************/

class A119
{
    static class B119 : C119.D { }
}

abstract class C119
{
    static class D { }
}

void test119()
{
}

/***************************************************/

class A120 {
    class B120 : C120.D { }
}

class C120 : E120 {
    static class D { }
}

interface E120 { }

void test120()
{
}

/***************************************************/

void test121()
{
    static assert(null is null);
}   

/***************************************************/

T[] find123(alias pred, T)(T[] input) {
   while (input.length > 0) {
      if (pred(input[0])) break;
      input = input[1 .. length];
   }
   return input;
}

void test123()
{
    int[] a = [ 1, 2, 3, 4, -5, 3, -4 ];
    find123!(function bool(int i) { return i < 0; })(a);
}


/***************************************************/

static assert(!is(typeof((){(){}
         ;-()
{};})));

/***************************************************/

struct Foobar;

/***************************************************/

int test124()
{   int result;
    dchar[] aa;
    alias uint foo_t;

    foreach (foo_t i, dchar d; aa)
    {
    }
    return result;
}

/***************************************************/

int foo125(int x)
{
    while (1)
    {
	if (x)
	    return 3;
	x++;
    }
}

void test125()
{
    foo125(4);
}

/***************************************************/

int foo126(int x)
{
    while (1)
    {
	if (x)
	    return 3;
	x++;
    }
    assert(0);
}

void test126()
{
    foo126(4);
}

/***************************************************/

struct S127(T, int topology = 1)
{
    this(T value) { }
}

void cons127(int t)(S127!(int, t) tail)
{
}

void test127()
{
    S127!(int)(1);
    S127!(int, 1) lst;
    cons127(lst);
}

/***************************************************/

struct S128(T, int topology = 1)
{
    this(T value) { }
}

void cons128(int t)(S128!(int, t) tail)
{
}

void test128()
{
    S128!(int, 1)(1);
    S128!(int) lst;
    cons128(lst);
}

/***************************************************/

struct R129(R : E[], E)
{
    E[] forward;
    static R129 opCall(E[] range)
    {
        R129 result = {};
        result.forward =  range;
        return result;
    }
}

R129!(E[]) retro129(E)(E[] r)
{
    return R129!(E[])(r);
}

int begin129(F)(R129!(F) range)
{
    return 0;
}

void test129()
{
    int[] a = [ 1, 2, 3 ];
    auto r = retro129(a);
    auto i = begin129(r);
}

/***************************************************/

struct S130
{
  byte[3] x;
}

__gshared S130 e130;

const(S130) example130() { return e130; }

void test130()
{
}

/***************************************************/

void foo131(real z) {}

void test131()
{
    real F = 1;
    foo131( 1 + (F*3*2.1) );
}

/***************************************************/

float getFloat() {
    return 11468.78f;
}

void test132()
{
    uint i = cast(uint) 11468.78f;
    assert(i == 11468);

    uint j = cast(uint) getFloat();
    assert(j == 11468);
}

/***************************************************/

template T133(string s) {
    const string T133 = s;
}

string f133(string s) {
    return s;
}

void test133()
{
    int foo;
    //writeln(foo.stringof);
    assert ("foo" == f133(foo.stringof));
    assert ("foo" == T133!(foo.stringof));
}

/***************************************************/

public struct foo134
{
    public this(real aleft)
    {
    } 
}

class bar134
{
    final void fun(foo134 arg = foo134(0.)) { } 
}

/***************************************************/

void test135()
{
    char[char[3]] ac;
    char[3] c = "abc";
    ac["abc"]='a';
    assert(ac[c]=='a');    

    char[dchar[3]] ad;
    dchar[3] d = "abc"d;
    ad["abc"d]='a';
    assert(ad[d]=='a');
}

/***************************************************/

void test136()
{
    struct S { int i[3]; }
    enum S s = S(8);
    const int i  = s.i[2];
    assert(i == 8);
}

/***************************************************/

struct Particle {
    char[16] name;
}

class ReadSystem {
    size_t[char[16]] pKindsIdx;

    void t(Particle p)
    {   auto idx=p.name in pKindsIdx;
    }
}

void test137()
{
    char[16] n;
    size_t[char[16]] aa;
    auto r=n in aa; // works
}

/***************************************************/

long test138(int y)
{
    return *cast(long*)(&y);
}

/***************************************************/

void test139()
{
   auto famousNamedConstants = 
    [ "pi" : 3.14, "e" : 2.71, "moving sofa" : 2.22 ];

    assert(famousNamedConstants["e"]==2.71);
}

/***************************************************/

int* get140()  {  return (new int[4]).ptr; }

void test140()
{
  int* p = get140();
  p[0..3] = 0;
  p[0] = 7;
}

/***************************************************/

class Foo141 {
    Foo141 next;
    void start()
    in { assert (!next); } body
    { 
        void* p = cast(void*)this;
    }
}

/***************************************************/

void a142(int b = 1+2)(){};

void test142()
{
    a142!(1+2)();
    a142();
}

/***************************************************/

class A143
{
    invariant() { }
    void fill() { }
}


class B143 : A143
{
    void fill() { }
}

void test143()
{
    auto b = new B143();
    b.fill();
}

/***************************************************/

struct Pair
{
    static Pair opCall(uint a, uint b) { return Pair.init; }
}

struct Stack
{
    Pair pop() { return Pair.init; }
}

void test144()
{
    Stack stack;
    Pair item = stack.pop;
}

/***************************************************/

struct Ashes {
    int ashes = cast(int)0;
}
void funky (Ashes s = Ashes()) { }

struct S145 {
    real a = 0, b = 0;
}

void func145(S145 s = S145()) { }

void test145()
{
    funky();
    func145();
}

/***************************************************/

string foo146(T...)(T args)
{
    string ret;

    foreach(arg; args) {
        ret = arg;
    }

    assert(ret=="b"); // passes
    return ret;
}

void test146()
{
    string s = foo146("b");
    assert(s == "b"); // fails
}

/***************************************************/

void test147()
{
    string s = "foo";
    dchar c = 'x';
    s ~= c;
    assert(s == "foox");

    wstring ws = "foo";
    ws ~= c;
    assert(ws == "foox");
}

/***************************************************/

void test148()
{
    string a = "\U00091234";
    string b;

    b ~= "\U00091234";

    if (a != b) {
	    assert(0);
    }
}

/***************************************************/

void test149()
{
  long[1] b = void;
  b[0] = -1L;
  b[0] >>>= 2;
  assert( (b[0]) == 0x3FFFFFFFFFFFFFFFL);
}

/***************************************************/

bool foo150()
{
    int x;
    return cast(void*) (x & 1) == null;
}

/***************************************************/
// 3521

void crash(int x)
{
  if (x==200) return;
   asm { int 3; }
}

void test151()
{
   int x;
   bug3521(&x);
}

void bug3521(int *a){
    int c = 0;
    *a = 0;
    if ( *a || (*a != (c = 200)) ) 
       crash(c);
}

/***************************************************/

string foo152(T...)() {
    return "";
}

void test152() {
    foo152!(int, char)();
}

/***************************************************/

int get_value()
{
    return 1;
}

int[2] array1;
int[2] array2;

int foo153(ulong a1, ulong extra, ulong extra2, ulong extra3)
{
    if (!((a1 & 1) | (get_value() | array1[cast(uint)(a1^1)])))
        return 0;

    if (0 >= array2[cast(uint)(a1^1)])
        return 0;

    return 1;
}

void test153()
{
    foo153(0, 0, 0, 0);
}

/***************************************************/

class B154 : A154
{
}

enum SomeEnum
{
    EnumMember = 10
}

class A154
{
    SomeEnum someEnum()
    {
        return SomeEnum.EnumMember;
    }
}

void test154()
{
    auto b = new B154();
    assert(cast(int)b.someEnum == 10);
}

/***************************************************/

struct Qwert {
    Yuiop.Asdfg hjkl;
}

struct Yuiop {
    struct Asdfg {
        int zxcvb;
    }
}

/***************************************************/

void f156(Value156.Id t)
{
    assert(cast(int)t == 1);
}

struct Value156 {
  public static enum Id {
    A,
    B
  }
}

void test156()
{
  Value156.Id t = Value156.Id.B;
  f156(t);
}

/***************************************************/

X157 x157;
enum X157 { Y };

interface Foo157 {
    Policy157 fn();
}

enum Policy157 {Default, Cached, Direct}

void test157()
{
}

/***************************************************/

class X158 {
  Y158.NY t;
  enum NX { BLA, BLA1 }
}

class Y158 {
  enum NY { FOO, BAR }
  X158.NX nx;
}

/***************************************************/

struct Foo159 {
    Bar.Baz x;

    struct Bar {
        struct Baz {}
    }
}

/***************************************************/

void test160()
{
  long[1] b = void;
  b[0] = -1L;
  b[0] >>>= 2;
  assert( (b[0]) == 0x3FFFFFFFFFFFFFFFL);
  int i = -1;
  assert(i >>>2 == 0x3FFFFFFF);
}

/***************************************************/

class A161 {
    struct B {
        D161 x;

        struct C {}
    }
}


struct D161 {}

class C161
{
    A a;

    struct A
    {
        uint m;
    }

    enum 
    {
        E = 0
    }
}

/***************************************************/

interface A162
{
    C162 foo();
    C162 foo() const;
}

class B162 : A162
{
    C162 foo() { return null; }
    C162 foo() const { return null; }
}

abstract class C162 : A162
{
    C162 foo() { return null; }
    C162 foo() const { return null; }
}

/***************************************************/

void func163( A... )( string name, string v )
{
}

void test163()
{
    func163!( int, long, float )( "val", "10" );
    func163!()( "tmp", "77" );
    alias func163!() TMP; TMP( "tmp", "77" );
}

/***************************************************/

class A164
{
    B164 foo() { return null; }
    B164 foo() const { return null; }
}

abstract class B164 : A164
{
    final B164 foo() { return null; }
    final B164 foo() const { return null; }
}

/***************************************************/

class A165
{
    B165 foo() { return null; }
    const(B165) foo() const { return null; }
}

abstract class B165 : A165
{
    final B165 foo() { return null; }
    final const(B165) foo() const { return null; }
}

/***************************************************/

struct A166 {
   B166  xxx;
   static this () { }
}

struct B166 {}

/***************************************************/

void test167()
{
    typedef byte[] Foo;
    Foo bar;
    foreach(value; bar){}
}

/***************************************************/

void x168(T)() {
    static assert(false);
}

template y168(T) {
    const bool y168 = is(typeof( { x168!(T)(); } ));
}

static assert(!y168!(int));

/***************************************************/

void test169()
{    
    int AssociativeArray;        
    int[int] foo;    
    foreach (x; foo)    {    }
}

/***************************************************/

FwdEnum this_fails;

enum : int
{
        E170 =  2
}

enum FwdEnum : int
{
        E2 =  E170
}

/***************************************************/

abstract class Address {
    abstract int nameLen();
}

class Class171 : Address {
    FwdStruct z;

    struct FwdStruct  {  }

    int nameLen()    { return 0; }
}

void test171 ()
{
        Class171 xxx = new Class171;
}

/***************************************************/

struct Foo172
{
    enum bool BAR = is (typeof({}()));
    static assert (BAR == is (typeof({}())));
}

/***************************************************/

const char[][ 89 ] ENUM_NAME = [ 1:"N0" ];

void test173()
{    
    switch(`Hi`.dup) {
        case ENUM_NAME[1]:
	default:
		break;
    }
}

/***************************************************/

class A174 {
    void x() {  }
}

class B174 : A174 {
    override void x() {
        assert(0);
    }
    final void do_x() {
        super.x();
    }
}

void test174()
{
    auto b = new B174();
    b.do_x();
}

/***************************************************/

void badvariadic(...) {}

static assert(!is(typeof(mixin(badvariadic()))));

/***************************************************/

struct Foo176
{
    int x;
}

Foo176 getFoo(Foo176 irrelevant)
{
    Foo176 p = Foo176(400);
    if ( p.x > p.x )
        return irrelevant;
    else
        return p;        
}

void test176()
{
   assert(getFoo( Foo176(0) ).x == 400);
}

/***************************************************/

int test177()
{
    long[1] c = [0]; // must be long

    int [1] d = [1];
    int k = 0;    
    if (!d[0]) 
       k = 1;       
    k = d[0] + k + k;

    if (c[0]) assert(c[0]);

    return k;
}

/***************************************************/

struct S178 {
    int x;

    template T(int val) {
	enum S178 T = { val };
    }
}

const x178 = S178.T!(0);

/***************************************************/

double[100_000] arr = 0.0;

/***************************************************/

typedef ireal BUG3919;
alias typeof(BUG3919.init*BUG3919.init) ICE3919;
alias typeof(BUG3919.init/BUG3919.init) ICE3920;

/***************************************************/

struct S179 {
    char a, b, c, d;
}

void show(char[] args...) {
    assert(args[0]=='A');
    assert(args[1]=='L');
    assert(args[2]=='D');
    assert(args[3]=='O');
}

void A179( S179 ss ) {
    show( ss.a, ss.b, ss.c, ss.d );
}

void test179()
{
    S179 ss3;
    ss3.a = 'A';
    ss3.b = 'L';
    ss3.c = 'D';
    ss3.d = 'O';
    A179( ss3 );
}

/***************************************************/

struct XY { union { int x, y; } }
struct AHolder {
    XY aa;
    void a(XY x) { aa = x; }
}
struct AB {
    AHolder aHolder;
    XY b;
    void a(XY x) { aHolder.a(x); }
}
struct Main {
    AB ab;

    void setB() { ab.b = XY(); }
    void f() {
        ab.a(XY.init);
        setB();
    }
}

/***************************************************/

void fooa181(int x, int y, int[0] a, int z, int t)
{
    if (!(x == 2 && y == 4 && z == 6 && t == 8))
	assert(0);
}

void foob181(int x, int y, int[0] a)
{
    if (!(x == 2 && y == 4))
	assert(0);
}

void fooc181(int[0] a, int x, int y)
{
    if (!(x == 2 && y == 4))
	assert(0);
}

void food181(int[0] a)
{
}

void test181()
{
    int[0] arr = 0;
    fooa181(2, 4, arr, 6, 8);
    foob181(2, 4, arr);
    fooc181(arr, 2, 4);
    food181(arr);
}

/***************************************************/
// 4042

template isQObjectType(T)
{
    enum isQObjectType = is(T.__isQObjectType);
}

template QTypeInfo(T)
{
    static if (!isQObjectType!T)
    {       
        enum size = T.sizeof;
    }
}

struct QList(T)
{
    alias QTypeInfo!T TI;
    int x;

    void foo()
    {
        x++;
    }
}

void exec(QList!(QAction) actions) {}

interface IQGraphicsItem
{
}

abstract
	class QGraphicsObject : IQGraphicsItem
{
}

class QGraphicsWidget : QGraphicsObject
{
}

class QAction
{
    void associatedGraphicsWidgets(QList!(QGraphicsWidget) a)
    {
        QList!(QGraphicsWidget) x;
    }
}

void test182()
{
}

/***************************************************/

enum { a183 = b183() }

int b183() { return 0; }

/***************************************************/

struct Z184 {
    int bar = 1;
    union { Foo184 foo; }
}

struct Foo184 { size_t offset = 0;}

/***************************************************/

struct BB185
{
  Item185[1] aa;
}

struct CC185
{
  Item185 aa;
}

struct Item185
{
  byte data;
}

/***************************************************/

const PM_QS_INPUT = QS_INPUT;
const QS_INPUT = 2;

/***************************************************/

alias A187 B187;
const int A187 = 1;

/***************************************************/

int foo188(int[3] s)
{
    return s[0] + s[1] + s[2];
}

void test188()
{
    int[3] t = [1,3,4];
    auto i = foo188(t);
    if (i != 8)
	assert(0);
}

/***************************************************/

template X189(alias fn) {
    alias typeof(fn) X189;
}

void a189()(T1189 x) {
    alias X189!(T1189.foo) P; //line 7

    x.foo();
}

class T1189 {
    void foo() {
	printf("T1.foo()\n");
    }
}

class T2189 : T1189 {
    void bla() {
	printf("T2.blah()\n");
        assert(false); //line 19
    }
}

void test189() {
    a189!()(new T2189());
}

/***************************************************/

void test190()
{
    string s;

    if (true) scope(exit) s ~= "a";
    if (false) { } else scope(exit) s ~= "b";
    if (true) scope(exit) scope(exit) s ~= "c";
    foreach(x; 1..2) scope(exit) s ~= "d";
    if (true) L1: scope(exit) s ~= "e";
    do scope(exit) s ~= "f"; while (false);
    int i; while (++i == 1) scope(exit) s ~= "g";
    try { } finally scope(exit) s ~= "h";
    assert(s == "abcdefgh");
}

/***************************************************/

struct S191 {
  int last = 0;
  S191 opCall(int i) {
    printf("%d %d\n", last, i);
    assert(i == 1 && last == 0 || i == 2 && last == 1 || i == 3 && last == 1);
    last = i;
    return this;
  }
}

void test191()
{
  S191 t;
  t(1)(2);
  t(3);
}

/***************************************************/

enum foo192 {
    item,
}

//pragma(msg, foo.mangleof);
static assert(foo192.mangleof == "E6test426foo192");

/***************************************************/

void test193()
{
    enum Shapes
    {
	Circle, Square
    }

    int i;
    Shapes s;

    pragma(msg, i.stringof);
    pragma(msg, s.stringof);

    static assert(i.stringof == "i");
    static assert(s.stringof == "s");
}

/***************************************************/

void test194()
{
    uint[][] b = [[ 1, 2, ]];
}

/***************************************************/

alias int T195;

class C195
{
    int yum = x195;
}

const T195 x195 = 0;

/***************************************************/

union A196 {
    double[2] a;
    double[2] b;        
}

union B196 {
public:
     double[2] a;
     double[2] b;        
}

static assert(A196.sizeof == B196.sizeof);

/***************************************************/

template Compileable(int z) { bool OK;}

struct Bug3569 {
    int bar() { return 7; }
}

struct Bug3569b {
    Bug3569 foo;
    void crash() {
        static assert(!is(typeof(Compileable!(foo.bar()))));
        static assert(!is(typeof(Compileable!((foo = Bug3569.init).bar()))));
    }
}

void test197()
{
}

/***************************************************/

void test198()	// Bugzilla 4506
{
    int c = 1;
    for (int k = 0; k < 2; k++) {
        assert((k == 0 && c == 1) || (k == 1 && c == -1));
        c *= -1;
    }
}

/***************************************************/

// Bugzilla 4514
void g199(void delegate(void*, void*) d) { }

struct X199 {
    void f(void*, void*) {}
    void n()
    {
        g199(&f);
    }
}

/***************************************************/
// Bugzilla 4443

struct Struct4443
{
    int x;
    char[5] unused;
}

void foo4443(Struct4443 *dest, Struct4443[] arr)
{
    int junk = arr[$-1].x;
    if (dest || arr[$-1].x) {
        *dest = arr[$-1];
    }
}

void test200()
{
    Struct4443[1] a;
    Struct4443 info;
    foo4443(&info, a);
}

/***************************************************/

// Bugzilla 2931

struct Bug2931 {
        int val[3][4];
}

struct Outer2931 {
        Bug2931 p = Bug2931(67);  // Applies to struct static initializers too
        int zoom = 2;
        int move = 3;
        int scale = 4;
}

int bug2931()
{
  Outer2931 v;
  assert(v.move==3);
  assert(v.scale == 4);
  return v.zoom;
}

int bug2931_2()
{
  Outer2931 v;
  assert(v.move==3);
  for (int i = 0; i < 4; i++)
  { for (int j = 0; j < 3; j++)
    {
	printf("[%d][%d] = %d\n", j, i, v.p.val[j][i]);
	if (i == 0 && j == 0)
	    assert(v.p.val[j][i] == 67);
	else
	    assert(v.p.val[j][i] == 0);
    }
  }
  printf("v.zoom = %d\n", v.zoom);
  assert(v.scale == 4);
  return v.zoom;
}

static assert(bug2931()==2);

void test201() {
    assert(bug2931()==2);
    assert(bug2931_2()==2);
}


/***************************************************/

import std.stdarg;

void foo202(int x, ...) {
    printf("%d arguments\n", _arguments.length);
    for (int i = 0; i < _arguments.length; i++) {   
        int j = va_arg!(int)(_argptr);
        printf("\t%d\n", j);
	assert(j == i + 2);
    }
}

void fooRef202(ref int x, ...) {
    printf("%d arguments\n", _arguments.length);
    for (int i = 0; i < _arguments.length; i++) {   
        int j = va_arg!(int)(_argptr);
        printf("\t%d\n", j);
	assert(j == i + 2);
    }
}

void test202()
{
    foo202(1, 2, 3, 4, 5);

    printf("---\n");

    int x = 1;
    fooRef202(x, 2, 3, 4, 5);
}

/***************************************************/
// Bugzilla 1418

class A203
{
    char name = 'A';
    class B203
    {
        char name = 'B';
    }
}

void test203()
{
    class C203
    {
    char name = 'C';
    }

    auto a = new A203;
    auto b = a.new B203;
    auto c = new C203;

    writeln(a.tupleof); // prints: A
    writeln(b.tupleof); // prints: B main.A
    writeln(c.tupleof); // prints: C 0000
    assert(a.tupleof.length == 1 && a.tupleof[0] == 'A');
    assert(b.tupleof.length == 1 && b.tupleof[0] == 'B');
    assert(c.tupleof.length == 1 && c.tupleof[0] == 'C');
}

/***************************************************/
// Bugzilla 4516

struct A204 { B204 b; }
enum B204 { Z }

/***************************************************/
// Bugzilla 4503

class Collection205(T) { }
ICollection c;

alias Collection205!int ICollection;

/***************************************************/

enum TaskStatus:int { Building=-1, }

TaskStatus test206(char[] s){
    char[] t="TaskStatus".dup;
    if (s.length>t.length && s[0..t.length]==t){
        long res=0;
        if (s[t.length]=='-') res= -res;	// <= OPnegass
        return cast(TaskStatus)cast(int)res;
    }
    assert(0);
}

/***************************************************/

struct UN {   double dd;    long ll; }
bool cmp( UN * pU ) {   return pU.dd >= pU.ll ? true : false; }

struct UN2 {  real dd; long ll; }
bool cmp2( UN2 * pU ) {  return pU.dd >= pU.ll ? true : false; }

struct UN3 {  double dd; int ll; }
bool cmp3( UN3 * pU ) {  return pU.dd >= pU.ll ? true : false; }

void test207()
{
   static UN u = { 10.50, 10 };
   auto i = cmp(&u);
   printf( "%d\n", cmp( &u ) );
   assert(i);

   static UN2 u2 = { 10.50, 10 };
   i = cmp2(&u2);
   assert(i);

   static UN3 u3 = { 10.50, 10 };
   i = cmp3(&u3);
   assert(i);

   static UN3 u3_1 = { 9.50, 10 };
   i = cmp3(&u3_1);
   assert(!i);
}

/***************************************************/

template fail4302() {
    static assert(0);
}
template bug4302() {
   alias fail4302!() bad;
}
static if (is(bug4302!())) {}

/***************************************************/

template tough4302()
{
  template bar()
  { 
     template far()
     {
         static assert(0);
     }
     alias far!() par;
  }
  static if (is(bar!())) {}
}

alias tough4302!() tougher;

/***************************************************/

// Bugzilla 190

//typedef int avocado;
//void test208(avocado x208 = .x208) { }
//avocado x208;

/***************************************************/
// Bugzilla 3493

const bar209 = foo209;
const int * foo209 = null;

/***************************************************/
// 3418

void test210()
{
    ulong a = 1; 
    a = cast(ulong)(a * 2.0L);
}

/***************************************************/

static assert(!is(typeof(Object.tupleof[2000]=0)));

/***************************************************/

struct Ghost {}

void bug4430(T)(int x)   {}
void bug4430(T)(Ghost x) {}

void test212()
{
    bug4430!(char)( 777 );
}

/***************************************************/
// 4768

struct A213 { B213 b; }
enum B213 { Z213 = 2 }

void test213()
{
   A213 x;
   assert(x.b == 2);
}

/***************************************************/

void g214(int j) { }

void test214()
{
    struct S
    {
        int i;
        void f() { g214(i); }
    }
    auto s = S();
}

/***************************************************/

template Q(s...) { alias s q; }

void test215()
{
    class C {}
    enum assocarrayliteral = Q!( [1:2] ).q.stringof;
    enum complex80 = Q!( 1+1.0i ).q.stringof;
    //enum dottype = Q!( C.Object.toString ).q.stringof;
    enum halt = (assert(0), 0).stringof;    // ICE w/ -release
    //enum remove = Q!( [1:2].remove(1) ).q.stringof;
    enum templat = Q!( Q ).q.stringof;
}

/***************************************************/
// 4941

template T216(_...) { alias _ T216; }
size_t mid216(size_t n) { return n/2; }

alias T216!(int, int)[0 .. mid216($)] A216;
alias T216!(1, 2, 3)[0 .. mid216($)] B216;

void test216()
{
    T216!(int, int, int) values;
    auto slice = values[0 .. mid216($)];   // C
}

/***************************************************/

int bug4529a() { return 0; }
int function() bug4529b;
auto ivorBomb1 = typeid(typeof(bug4529a));
auto ivorBomb2 = typeid(typeof(bug4529b));

/***************************************************/

void bug5218c(char [3] s) {}
void bug5218w(wchar [3] s) {}
void bug5218d(dchar [3] s) {}

void test217()
{    
    bug5218c("abc");
    bug5218w("abc"w);
    bug5218d("abc"d);
}

/***************************************************/
// 2954

void test218()
{
    char[char[3]] ac;
    char[3] c = "abc";
    ac["abc"]='a';
    assert(ac[c]=='a');    

    char[dchar[3]] ad;
    dchar[3] d = "abc"d;
    ad["abc"d]='a';
    assert(ad[d]=='a');
}

/***************************************************/
// 2206

template T219(U) {
  class C {}
}

void test219()
{
  mixin T219!(int); // using a named mixin here fixes it

  pragma(msg, T219!(int).C.mangleof);
  pragma(msg, C.mangleof); // incorrectly outputs the same as above

  assert(T219!(int).C.classinfo !is C.classinfo); // fails
  assert(T219!(int).C.mangleof != C.mangleof); // fails
}


/***************************************************/
// 2206

class D220 {}

template T220(U) {
  class C { this() { } }
}

void test220()
{
  mixin T220!(int);

  // all print 8
  writeln(T220!(int).C.classinfo.init.length);
  writeln(C.classinfo.init.length);
  writeln(D220.classinfo.init.length);

  auto c = new C; // segfault in _d_newclass
}

/***************************************************/

const struct S5110
{
    static int value;
}

static assert(is(typeof(S5110.value) == int));

/***************************************************/

class C5110
{
 override:
    string toString() { return ""; }

    class Nested
    {
        void gun() {}
    }
}

/***************************************************/

immutable class Bug5504
{
    void foo(T)(T a) {}
    template xx(X) {
        void hoo(T)(T a) {}
    }
}

shared class Bug5504b
{
    void foo(T)(T a) {}
    template xx(X) {
        void hoo(T)(T a) {}
    }
}

void test5504()
{
    Bug5504 c;
    c.foo(10);
    c.xx!(int).hoo(10);
    Bug5504b d;
    d.foo(10);
    d.xx!(int).hoo(10);
}

/***************************************************/

void bug5105() // compilation test -- don't need to run
{
    auto c = new C5105;
    c.foo(10);
}

synchronized shared class C5105
{
    void foo(T)(T a) {}
}

/***************************************************/
// 5145

interface I221{
    void bla();
}

interface J221
{
    I221 sync ();
}

class A221 : B221
{
    final override I221 sync()
    in { assert( valid ); }
    body
    {
        return null;
    }
}

class B221 : J221
{
    override I221 sync()
    in { assert( valid ); }
    body
    {
        return null;
    }

    final bool valid()
    {
        return true;
    }
}

/***************************************************/

template Bug3276(bool B) {
   static if (B)
      alias Bug3276!(false) Bug3276;
   else
       alias double Bug3276;
}

template Bug3276_b(alias W) {
    alias W!(true) Bug3276_b;
}

alias Bug3276_b!(Bug3276) Bug3276_c;

/***************************************************/
// 5294

void foo222(int) {}

void test222()
{
    int count;
    for (int i = 0; i < 2; i++) {
        count++;
        foo222(i * 5 - 6); // comment this out and it makes 2 loops
    }
    printf("%d\n", count); // compile with -O and it prints 1
    assert(count == 2);
}

/***************************************************/

void foo223(long x,long a,long b,long c,long d,long e,long f)
{
    assert(x == 0x123456789ABCDEF0);
}

void test223()
{
    foo223(0x123456789ABCDEF0,2,3,4,5,6,7);
}

/***************************************************/
// 4379

template BigTuple(U...) {
    alias U BigTuple;
}

alias
BigTuple!(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
1,1,1,1,1,1) Tuple4379;

void test224()
{
    foreach(x; Tuple4379) {    }
}

/***************************************************/
// 3681

public final class A3681 {
    private this() {
	int i =0;
	int j = i + 1;
 i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59;
 i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59;
 i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59;
 i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59;
 i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59;
 i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59;
 i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59;
 i = j * 15; j = i * 59; i = j * 15; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15;
 j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; j = i * 59; i = j * 15; j = i * 59;
 i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59;
 i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59; i = j * 15; j = i * 59;
    }
}

/***************************************************/

int bug4389()
{    
    string s;
    dchar c = '\u2348';
    s ~= c;
    assert(s.length==3);
    dchar d = 'D';
    s ~= d;
    assert(s.length==4);
    s = "";
    s ~= c;
    assert(s.length==3);
    s ~= d;
    assert(s.length==4);
    string z;
    wchar w = '\u0300';
    z ~= w;
    assert(z.length==2);
    z = "";
    z ~= w;
    assert(z.length==2);
    return 1;
}

static assert(bug4389());

// ICE(constfold.c)
int ice4389()
{
    string s;
    dchar c = '\u2348';
    s ~= c;
    s = s ~ "xxx";
   return 1; 
}

static assert(ice4389());

// ICE(expression.c)
string ice4390()
{
    string s;
    dchar c = '`';
    s ~= c;
    s ~= c;
   return s; 
}

static assert(mixin(ice4390()) == ``);
static assert(mixin(ice4390()) == ``);

/***************************************************/
// 190

typedef int avocado;
void eat(avocado x225 = .x225);
avocado x225;

void test225()
{
}

/***************************************************/
// 5534

void doStuff(byte start, byte end, uint increment = 1U) {
   auto output = new byte[3];

    size_t count = 0;
    for(byte i = start; i < end; i += increment) {
        output[count++] = i;
    }
}

void test226()  {
    doStuff(0, 3);
}

/***************************************************/
// 5536

void test227()
{
  int[] as = [111, 666];
  as ~= as[$ - 2];
  assert(as.length == 3);
  assert(as[2] == 111);
}

/***************************************************/
// 4017

struct _A
{
   uint data;
}

const A_SIZE =   (A4017.sizeof);

alias _A A4017;

/***************************************************/
// 5455

void thrw(Data *s) {
    throw new Exception("xxx");
}

struct Data {
    Rapper *w;
    uint n, m;
}

struct Rapper {
    ubyte * dat;
    ubyte[] con() {
        return dat[0..1];
    }
}

uint jaz(ubyte[] data) {
    return cast(uint)data.length;
}

struct Resp {
    void set(Data *data, string[] soup) {
        switch(soup[0]) {
            default:
        }
        uint[] f = [jaz(data.w ? data.w.con[data.n ..data.m] : null), data.m - data.n];
        thrw(data);
    }
}

/**************************************/
// 5571

void test228() {
    auto b = new bool;
    printf("%p\n", b);
    *b = false;
}

/***************************************************/
// 5572

void doSynchronized() {
    printf("In doSynchronized() 1:  %p\n", cast(void*) global229);
    synchronized {
        printf("In doSynchronized() 2:  %p\n", cast(void*) global229);
    }
}

__gshared Object global229;

void test229() {
    auto local = new Object;
    global229 = local;

    printf("In main() 1:  %p\t%p\n",
        cast(void*) global229, cast(void*) local);
    doSynchronized();
    printf("In main() 1:  %p\t%p\n",
        cast(void*) global229, cast(void*) local);

    assert(cast(void*) global229 == cast(void*) local);
}

/***************************************************/

static immutable real negtab[14] =
    [ 1e-4096L,1e-2048L,1e-1024L,1e-512L,1e-256L,1e-128L,1e-64L,1e-32L,
	    1e-16L,1e-8L,1e-4L,1e-2L,1e-1L,1.0L ];
static immutable real postab[13] =
    [ 1e+4096L,1e+2048L,1e+1024L,1e+512L,1e+256L,1e+128L,1e+64L,1e+32L,
	    1e+16L,1e+8L,1e+4L,1e+2L,1e+1L ];

float parse(ref string p)
{
    printf("test1\n");

    real ldval = 0.0;
    int exp = 0;
    long msdec = 0;

    msdec = 123;
    exp = 2;

    ldval = msdec;
    printf("ldval = %Lg\n", ldval);
    if (ldval)
    {
        uint u = 0;
        int pow = 4096;

        while (exp > 0)
        {
            while (exp >= pow)
            {
                ldval *= postab[u];
                exp -= pow;
            }
            pow >>= 1;
            u++;
        }
        while (exp < 0)
        {
            while (exp <= -pow)
            {
                ldval *= negtab[u];
                exp += pow;
            }
            pow >>= 1;
            u++;
        }
    }
    return ldval;
}

void test230()
{
    float f;
    f = parse( "123e+2" );
    //printf("f = %g\n", f);
    assert( f == 123e+2f );
}

/***************************************************/

class Bug4033 {} 
 
class Template4033(T) { 
    static assert(is(T : Bug4033)); 
} 

alias Template4033!(Z4033) Bla; 
 
class Z4033 : Bug4033 { } 

/***************************************************/

struct Bug4322 { 
    int[1] a = void; 
} 

void bug4322() { 
    Bug4322 f = Bug4322(); 
    Bug4322 g = Bug4322.init; 
}

/***************************************************/

bool bug5672(long v)
{    
    return  (v & 1) == 1;
    return  (v & 1) == 1;
}

/***************************************************/

void bug5717()
{
    string s, s2; 
    s = "Привет";
    for (int i=0; i<s.length; i++)
        s2 ~= s[i];
    assert(s == s2);
}

/***************************************************/
// 3086

class X231 {
    void a() {}
    void b(int z, short c) {}
    void c(int z, short d) {}
}

void test231() {
    auto z = new X231();
    TypeInfo a = typeid(typeof(&z.a));
    TypeInfo b = typeid(typeof(&z.b));
    TypeInfo c = typeid(typeof(&z.c));

    assert(a !is b, "1");
    assert(a != b, "2");
    assert(b == c, "3");
}

/***************************************************/
// 4140

const A232 = [1,2,3];
const B232 = A232[1..A232.length]; 
const C232 = A232[1..$]; 

void test232()
{
    assert(A232[0] == 1);
    assert(A232[1] == 2);
    assert(A232[2] == 3);
    assert(B232[0] == 2);
    assert(B232[1] == 3);
    assert(C232[0] == 2);
    assert(C232[1] == 3);
}

/***************************************************/
// 1389

void test233()
{
    int a;
    mixin("a") = 666;
}

/***************************************************/
// 5735

struct A234 {}

void foo234(bool cond){}

void test234()
{
    A234 a;
    int i;

    static assert(!__traits(compiles, assert(a)));      // type A does not have a boolean value
    static assert(!__traits(compiles, assert(i || a))); // type A does not have a boolean value
    static assert(!__traits(compiles, assert(0 || a))); // OK

//    if(a) {}        // type A does not have a boolean value
//    if(i || a) {}   // type A does not have a boolean value
//    if(0 || a) {}   // type A does not have a boolean value

    static assert(!__traits(compiles, foo234(a)));         // cannot implicitly convert type A to bool
    static assert(!__traits(compiles, foo234(i || a)));    // OK
    static assert(!__traits(compiles, foo234(0 || a)));    // OK
}


/***************************************************/

int space() { return 4001; }

void oddity4001()
{
    const int bowie = space();    
    static assert(space() == 4001); // OK
    static assert(bowie == 4001);   // doesn't compile
}

/***************************************************/

int bug3809() { asm { nop; } return 0; }
struct BUG3809 { int xx; }
void bug3809b() {
}

/***************************************************/
//

version (X86_64)
{
    void bug6184()
    {
        bool cmp(ref int[3] a, ref int[3] b)
        {
            return a is b;
        }

        static struct Ary
        {
            int[3] ary;
        }

        auto a = new Ary;
        auto b = new Ary;
        assert(!cmp(a.ary, b.ary));
        b = a;
        assert(cmp(a.ary, b.ary));

        // change high bit of ary address
        *(cast(size_t*)&b) ^= (1UL << 32);
        assert(!cmp(a.ary, b.ary));
    }
}
else
{
    void bug6184()
    {
    }
}

/***************************************************/
// 6229

int test6229()
{
  {
    ubyte a = 2;
    ubyte b = 4;
    b += a;
  }

    char a = 2;
    char b = 4;
    b += a;

    wchar c = 2;
    wchar d = 4;
    c /= d;

    return b;
}

/***************************************************/
// XMMBug

class XMMPainter
{
  float call()
  {
    return sumFloats(0.0f, 0.0f);
  }

  static float sumFloats(float a, float b)
  {
    return a + b;
  }
}

void test6270()
{
  auto painter = new XMMPainter;
  assert(XMMPainter.sumFloats(20, painter.call()) == 20.0f);
  auto dg = () { return XMMPainter.sumFloats(0.0f, 0.0f); };
  assert(XMMPainter.sumFloats(20, dg()) == 20.0f);
}

/***************************************************/

void test236()
{
    uint a;
    int shift;
    a = 7;
    shift = 1;
    int r;
    r = (a >> shift) | (a << (int.sizeof * 8 - shift));
    assert(r == 0x8000_0003);
    r = (a << shift) | (a >> (int.sizeof * 8 - shift));
    assert(a == 7);
}

/***************************************************/
// 4460

void test237()
{
    foreach (s, i; [ "a":1, "b":2 ])
    {
        writeln(s, i);
    }
}


/***************************************************/

void foo238(long a, long b)
{
  while (1)		// prevent inlining
  {
    long x = a / b;
    long y = a % b;
    assert(x == 3);
    assert(y == 1);
    break;
  }
}

void test238()
{
    long a, b;
    a = 10;
    b = 3;
    long x = a / b;
    long y = a % b;	// evaluate at compile time
    assert(x == 3);
    assert(y == 1);

    foo238(a, b);
}

/***************************************************/
// 5239

struct S239 { int x; }

int test239()
{
   S239[4] w = void;
   w[$-2].x = 217;
   return w[2].x;
}


/***************************************************/

void enforce6506b(bool condition, void delegate() m) {
    assert(!condition);
}
void toImpl6506b(int value) {
    void f(){}
    enforce6506b(value >= 0, &f);
}
void test6506() {
    toImpl6506b(-112345);
}

/***************************************************/

int main()
{
    test1();
    test2();
    test3();
    test4();
    test5();
    test6();
    test7();
    test8();
    test9();
    test10();
    test11();
    test12();
    test13();
    test14();
    test15();
    test16();
    test17();
    test18();
    test19();
    test20();
    test21();
    test22();
    test23();
    test24();
    test25();
    test26();
    test27();
    test28();
    test29();
    test30();
    test31();
    test32();
    test33();
    test34();
    test35();
    test36();
    test37();
    test38();
    test39();
    test40();
    test41();
    test42();
    test43();
    test44();
    test45();
    test46();
    test47();
    test48();
    test49();
    test50();
    test51();
    test52();
    test53();
    test54();
    test55();
    test56();
    test57();
    test58();
    test59();
    test60();
    test61();
    test62();
    test63();
    test64();
    test65();
    test66();
    test67();
    test68();
    test69();
    test70();
    test71();
    test72();
    test73();
    test74();
    test75();
    test76();
    test77();
    test78();
    test79();
    test80();
    test81();
    test82();
    test83();
    test84();
    test85();
    test86();
    test87();
    test88();
    test89();
    test90();
    test91();
    test92();
    test93();
    test94();
    test95();
    test96();
    test97();
    test98();
    test99();
    test100();
    test101();
    test102();
    test103();
    test104();
    test105();
    test107();
    test108();
    test109();
    test110();
    test111();
    test112();
    test113();
    test114();
    test115();
    test116();
    test117();
    test118();
    test119();
    test120();
    test121();
    //test122();
    test123();
    test124();
    test125();
    test126();
    test127();
    test128();
    test129();
    test130();
    test131();
    test132();
    test133();

//    test135();
    test136();
    test137();

    test139();
    test140();

    test142();
    test143();
    test144();
    test145();
    test146();
    test147();
    test148();
    test149();

    test151();
    test152();
    test153();
    test154();

    test156();
    test157();

    test160();

    test163();

    test167();

    test169();

    test171();

    test173();
    test174();

    test176();
    test177();

    test179();

    test181();
    test182();

    test188();
    test189();
    test190();
    test191();

    test193();
    test194();

    test198();

    test200();
    test201();
    test202();
    test203();

//    test208();

    test210();

    test212();
    test213();
    test214();
    test215();
    test216();
    test217();
    test218();
    test219();
    test220();

    test222();
    test223();
    test224();
    test225();
    test226();
    test227();
    test228();
    test229();
    test230();
    test230();
    bug5717();
    test231();
    test232();
    test233();
    bug6184();
    test236();
    test237();
    test238();
    test239();
    test6229();
    test6270();
    test6506();

    writefln("Success");
    return 0;
}

