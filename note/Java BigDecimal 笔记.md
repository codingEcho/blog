# Java BigDecimal 笔记

[TOC]

## 0 BigDecimal 最佳实践

> 如果需要精确的答案，请避免使用float和double 《Effective Java》

笔者和很多初学者一样，在 Java计算中踩了不少坑。正如《Effective Java》中所说的“如果需要精确的答案，请避免使用float和double”，请使用`java.math.BigDecimal。`那么是不是有了`BigDecimal`就万事大吉，下面就结合自己的经验来讲讲`BigDecimal`的最佳实践。

- **使用构造函数BigDecimal(String val)来构建实例**
- **使用compareTo()比较大小、signum()判断正负数**
- **`BigDecimal` 对象是不可变的 ,操作(加减乘除等)总是返回新对象，永远不会修改现有对象的状态。（也就说：你必须用一个变量接住现有对象上操作返回的结果，有点类似String）**
- the [ROUND_HALF_EVEN](https://docs.oracle.com/javase/10/docs/api/java/math/BigDecimal.html#ROUND_HALF_EVEN) style of [rounding](http://en.wikipedia.org/wiki/Rounding) introduces the least bias. It is also called *bankers' rounding*, or *round-to-even*.

## 1 使用 BigDecimal(String val) 构造函数来创建实例

**声明：代码结果为JDK8下运行结果**,print函数定义如下

```java
  private void print(Object... objects) {
    for (Object object : objects) {
      System.out.println(object);
    }
  }
```

构造函数

```java
  @Test
  public void constructorTest() {
    // good 
    BigDecimal good = new BigDecimal("9.111111111111111111");
    print(good); // 9.111111111111111111
    
    // 并非有效的double(哦~但有时候真不太清楚double的有效小数位数，且代码编译时居然不会报错)
    double d = 9.111111111111111111d;
    print(d);    // 9.11111111111111
      
    // bad: 构造函数 BigDecimal(double val)
    BigDecimal bad = new BigDecimal(9.111111111111111111);
    // 9.111111111111110716365146799944341182708740234375
    print(bad); 
      
    // bad: return new BigDecimal(Double.toString(val));
    BigDecimal bad2 = BigDecimal.valueOf(d);
    print(bad2); // 9.11111111111111
    
    // bad: 不要这样做，MathContext 是什么鬼
    BigDecimal bad3 = new BigDecimal(d, MathContext.DECIMAL64);
    print(bad3); // 9.111111111111111

    // bad: 如果你认为是上面变量d超出了double的有效小数位
    // 1.5900000000000000799360577730112709105014801025390625
    print(new BigDecimal(1.59));
    
    // bad: double+"" 转字符串
    print(new BigDecimal(d + "")); // 9.11111111111111

    // bad: String.format("%d",d)转字符串
    // java.util.IllegalFormatConversionException: d != java.lang.Double
    print(new BigDecimal(String.format("%d", d)));

  }
```

上述代码演示了尝试使用`BigDecimal(double val)`、`BigDecimal.valueOf(double val)`、以及将double转为字符串进而使用`BigDecimal(String val)`而得到的非预期结果。所以如果你像我一样如果有很多不确定的情况下，**请使用`BigDecimal(String val)` 来创建实例，且注意你的字符串参数不是由像示例中一样，来自一些无效的double变量。如果你使用了BigDecimal.valueOf(double val)及类似方法**

## 2 long、double 转 BigDecimal

类型`long、double` 转 `BigDecimal `,虽然`BigDecimal valueOf(double val)`存在问题，但如果double"有效"的前提下还是可以使用该方法

- `BigDecimal valueOf(double val)`

- `BigDecimal.valueOf(long val)`

- `BigDecimal valueOf(long unscaledVal, int scale)`

```java
  /**
   * BigDecimal via valueOf
   */
  @Test
  public void valueOf() {
    // BigDecimal.valueOf(double val)
    double d = 10.233323223099d;
    /* BigDecimal.valueOf() 源码为 return new BigDecimal(Double.toString(val)); */
    print(BigDecimal.valueOf(d)); // 10.233323223099
    print(new BigDecimal(d));     // 10.23332322309899922174736275337636470794677734375

    // value of long
    long l = 12344L;
    print(BigDecimal.valueOf(l));           // 12344
    print(BigDecimal.valueOf(l, 2)); 		// 123.44
  }
```

## 3 BigDecaimal 转为其它数据类型 

- toPlainString(),返回非科学计数法的字符串
- toBigInteger()
- 以Exact结尾的方法，在调用时会检查是否能够舍去，如果转为目标类型不能够舍去，将会抛出`ArithmeticException`异常

```java
/**
 * BigDecimal to other type
 */
@Test
public void convertTo() {
  BigDecimal decimal = new BigDecimal("0.00000000000009");
  print(decimal.toString());            // 9E-14
  print(decimal.toEngineeringString()); // 90E-15
  // 常用
  print(decimal.toPlainString());       // 0.00000000000009
  print(decimal.toBigInteger());        // 0
  // throw ArithmeticException
  // print(decimal.toBigIntegerExact());
  print(decimal.floatValue());          // 9.0E-14
  print(decimal.doubleValue());         // 9.0E-14
  print(decimal.intValue());            // 0
  print(decimal.shortValue());
  print(decimal.longValue());
  print(new BigDecimal("9.0").byteValueExact());
  /* Converts this BigDecimal to a int, checking for lost information. */
  // ArithmeticException
  // print(decimal.intValueExact());
  print(new BigDecimal("1.0").intValueExact()); // 1
}
```

## 4 精度和小数位 

- precision(),~~返回精度(除小数点之外的位数包含末尾的0)~~ The precision is the number of digits in the unscaled value.The precision of a zero value is 1.
- scale(),返回小数位数（小数点之后的位数）
- ulp()

```java
  /**
   * 精度和小数位
   */
  @Test
  public void precisionAndScale() {
    BigDecimal decimal = new BigDecimal("1210.5123450");
    // 精度=整数位数+小数位数(包含末尾的0) // 这是一个错误的理解！！！
    print(decimal.precision()); // 11
    
    BigDecimal decimal1 = new BigDecimal("0.00054321");
    print(decimal1.scale()); // 7
    print(decimal1.precision()); // 5
      
    // 小数位
    print(decimal.scale()); // 7
      

    print(decimal.setScale(1, RoundingMode.HALF_UP)); // 1210.5

    // ulp()
    print(new BigDecimal("123.0093").ulp()); // 0.0001
  }
```



## 5 判断正负数

- signum()
- 大于0，返回 1
- 等于0，返回 0
- 小于0，返回-1

```java
 /**
   * 判断正负数
   */
  @Test
  public void signumTest() {
    print(new BigDecimal("1210.012345").signum());       // 1
    print(BigDecimal.ZERO.signum());                     // 0
    print(new BigDecimal("-1.22").signum());             // -1
  }
```



## 6 stripTrailingZeros()、unscaledValue()、movePoint 

- stripTrailingZeros() ,去除末尾所有0
- unscaledValue()，就是拿掉小数点之后的数
- movePointLeft()、movePointRight()，向左（向右）移动小数点,也就是乘除（10的N次方）

```java
/**
   * strip(去除)-Trailing(后面的)-Zeros
   */
  @Test
  public void stripTrailingZerosTest() {
    BigDecimal decimal = new BigDecimal("0.9238008800000");
    print(decimal);                       // 0.9238008800000
    print(decimal.stripTrailingZeros());  // 0.92380088
  }

  /**
   * unscaledValue test
   */
  @Test
  public void unscaledValueTest() {
    BigDecimal decimal = new BigDecimal("0.9238008800000");
    print(decimal.unscaledValue()); // 9238008800000
  }


  @Test
  public void move() {
    // non-negative
    BigDecimal bigDecimal = new BigDecimal("1.2323232");
    print(bigDecimal);                   // 1.2323232
    print(bigDecimal.movePointLeft(1));  // 0.12323232
    print(bigDecimal.movePointRight(2)); // 123.23232
    print(new BigDecimal("0.00").setScale(2, BigDecimal.ROUND_UNNECESSARY).movePointRight(2)); // 0

    // negative
    BigDecimal negative = new BigDecimal("-1.2323232");
    print(negative);                   // -1.2323232
    print(negative.movePointLeft(1));  // -0.12323232
    print(negative.movePointRight(2)); // -123.23232
    
    BigDecimal decimal = new BigDecimal("1.2");
    print(decimal.movePointRight(5)); // 120000
  }
```



## 7 使用compareTo()比较大小

**BigDecimal必须使用 `compareTo` 而不是 `equals`, 更不是 `==（!=、>、<）`**

```java
  /**
   * THIS IS THE MOST COMMON MISTAKE MADE WITH BIGDECIMALS!
   */
  @Test
  public void equalsTest() {
    /* 反例，使用 compareTo 而不是 equals, 更不是 == */

    // 有时候比较幸运！
    BigDecimal a = new BigDecimal("1.3239");
    BigDecimal b = new BigDecimal("1.3239");
    if (a.equals(b)) {
      print(" a equals b"); // 执行
    }

    // 这个时候可不是那么幸运 ！！！
    BigDecimal c = new BigDecimal("2.00");
    BigDecimal d = new BigDecimal("2.0");
    print(c.equals(d)); // false

    if (a == b) {
      print("a==b");
    } else {
      print("bad!!!"); // 输出 bad!!!
    }

    /* Instead, we should use the .compareTo() and .signum() methods. */

    int e = a.compareTo(b);  // returns (-1 if a < b), (0 if a == b), (1 if a > b)

    int f = a.signum(); // returns (-1 if a < 0), (0 if a == 0), (1 if a > 0)

    print(e, f);
  }
```

## 8 min()和max()返回最小、最大值

```java
  /**
   * get max or min number
   */
  @Test
  public void maxAndMinTest() {
    BigDecimal a = new BigDecimal("1.3239");
    BigDecimal b = new BigDecimal("2.3239");

    print(b.max(a)); // 2.3239
    print(b.min(a)); // 1.3239

    print(b.max(b)); // 2.3239
  }
```

## 9 计算

### 9.1 plus()、negate()、abs()、pow() 

- plus()和negate()，`+、-`操作
- abs()，绝对值
- pow()，幂

```java
/**
   * 正正得正、负负得正、正负得负
   */
  @Test
  public void plusAndNegateTest() {
    BigDecimal decimal = new BigDecimal("1.5");
    BigDecimal decimal2 = new BigDecimal("-2.5");

    // 正正得正
    print(decimal.plus());   // 1.5

    // 正负得负
    print(decimal.negate()); // -1.5
    print(decimal2.plus());   // -2.5

    // 负负得正
    print(decimal2.negate()); // 2.5

  }

  /**
   * 绝对值
   */
  @Test
  public void absTest() {
    BigDecimal decimal = new BigDecimal("-2.5");
    print(decimal);        // -2.5
    print(decimal.abs()); // 2.5
  }

  /**
   * 幂
   */
  @Test
  public void powTest() {
    BigDecimal a = new BigDecimal("1.3");
    print(a.pow(0)); // 0
    print(a.pow(1)); // 1.3
    print(a.pow(2)); // 1.69
    print(a.pow(3)); // 2.197
  }
```

### 9.2 加、减、乘、除

注意Javdoc中开始的`Immutable`,事实也证明不能像`addTest()`中反例那样操作，a的值并没有改变，很多人如本人就曾经栽过类似的跟头。

``` java
 /**
   * 加法
   */
  @Test
  public void addTest() {
    // 反例,不要这样做！！！a 的值不会改变
    a.add(b);
    print(a); // 232323.333343
      
    BigDecimal a = new BigDecimal("232323.333343");
    BigDecimal b = new BigDecimal("12.333343");
    BigDecimal sum = a.add(b);
    print(sum); // 232335.666686
  }

  /**
   * 减法
   */
  @Test
  public void subtractTest() {
    BigDecimal a = new BigDecimal("232323.333343");
    BigDecimal b = new BigDecimal("12.333343");
    BigDecimal difference = a.subtract(b);
    print(difference); // 232311.000000
  }

  /**
   * 乘法
   */
  @Test
  public void multiplyTest() {
    BigDecimal a = new BigDecimal("232323.333343");
    BigDecimal b = new BigDecimal("12.333343");
    BigDecimal difference = a.multiply(b);
    print(difference); // 2865323.357022555649
  }

```

除法需要注意的是需要设置保留的小数位和指定舍入模式（[RoundingMode](https://docs.oracle.com/javase/10/docs/api/java/math/RoundingMode.html))

```java
  /**
   * 除法
   */
  @Test
  public void divideTest() {
    BigDecimal a = new BigDecimal("232323.333343");
    BigDecimal b = new BigDecimal("12.333343");

    BigDecimal c = a.divide(b, 2, RoundingMode.HALF_UP);
    print(c); // 18837.01

    // ArithmeticException: Non-terminating decimal expansion; no exact representable decimal result.
    BigDecimal divide = a.divide(b);
    print(divide);

  }
```

 Result of rounding input to one digit with the given rounding mode

| Input Number |        |           |         |           |             |             |               |                             |
| ------------ | ------ | --------- | ------- | --------- | ----------- | ----------- | ------------- | --------------------------- |
| `UP`         | `DOWN` | `CEILING` | `FLOOR` | `HALF_UP` | `HALF_DOWN` | `HALF_EVEN` | `UNNECESSARY` |                             |
| 5.5          | 6      | 5         | 6       | 5         | 6           | 5           | 6             | throw `ArithmeticException` |
| 2.5          | 3      | 2         | 3       | 2         | 3           | 2           | 2             | throw `ArithmeticException` |
| 1.6          | 2      | 1         | 2       | 1         | 2           | 2           | 2             | throw `ArithmeticException` |
| 1.1          | 2      | 1         | 2       | 1         | 1           | 1           | 1             | throw `ArithmeticException` |
| 1.0          | 1      | 1         | 1       | 1         | 1           | 1           | 1             | 1                           |
| -1.0         | -1     | -1        | -1      | -1        | -1          | -1          | -1            | -1                          |
| -1.1         | -2     | -1        | -1      | -2        | -1          | -1          | -1            | throw `ArithmeticException` |
| -1.6         | -2     | -1        | -1      | -2        | -2          | -2          | -2            | throw `ArithmeticException` |
| -2.5         | -3     | -2        | -2      | -3        | -3          | -2          | -2            | throw `ArithmeticException` |
| -5.5         | -6     | -5        | -5      | -6        | -6          | -5          | -6            | throw `ArithmeticException` |

```java
/**
   * 从零开始舍入。
   */
  @Test
  public void roundingModeUpTest() {
    BigDecimal a = new BigDecimal("5.5").setScale(0, RoundingMode.UP);  // 6
    BigDecimal b = new BigDecimal("2.5").setScale(0, RoundingMode.UP);  // 3
    BigDecimal c = new BigDecimal("1.6").setScale(0, RoundingMode.UP);  // 2
    BigDecimal d = new BigDecimal("1.1").setScale(0, RoundingMode.UP);  // 2
    BigDecimal e = new BigDecimal("1.0").setScale(0, RoundingMode.UP);  // 1
    BigDecimal f = new BigDecimal("-1.0").setScale(0, RoundingMode.UP); // -1
    BigDecimal g = new BigDecimal("-1.1").setScale(0, RoundingMode.UP); // -2
    BigDecimal h = new BigDecimal("-1.6").setScale(0, RoundingMode.UP); // -2
    BigDecimal i = new BigDecimal("-2.5").setScale(0, RoundingMode.UP); // -3
    BigDecimal j = new BigDecimal("-5.5").setScale(0, RoundingMode.UP); // -6

    BigDecimal e1 = new BigDecimal("1.23").setScale(0, RoundingMode.UP);  // 2
    BigDecimal e2 = new BigDecimal("1.03").setScale(0, RoundingMode.UP);  // 2
    print(a, b, c, d, e, f, g, h, i, j, e1, e2);
  }

  /**
   * 向零舍入。
   */
  @Test
  public void roundingModeDownTest() {
    BigDecimal a = new BigDecimal("5.5").setScale(0, RoundingMode.DOWN);  // 5
    BigDecimal b = new BigDecimal("2.5").setScale(0, RoundingMode.DOWN);  // 2
    BigDecimal c = new BigDecimal("1.6").setScale(0, RoundingMode.DOWN);  // 1
    BigDecimal d = new BigDecimal("1.1").setScale(0, RoundingMode.DOWN);  // 1
    BigDecimal e = new BigDecimal("1.0").setScale(0, RoundingMode.DOWN);  // 1
    BigDecimal f = new BigDecimal("-1.0").setScale(0, RoundingMode.DOWN); // -1
    BigDecimal g = new BigDecimal("-1.1").setScale(0, RoundingMode.DOWN); // -1
    BigDecimal h = new BigDecimal("-1.6").setScale(0, RoundingMode.DOWN); // -1
    BigDecimal i = new BigDecimal("-2.5").setScale(0, RoundingMode.DOWN); // -2
    BigDecimal j = new BigDecimal("-5.5").setScale(0, RoundingMode.DOWN); // -5

    BigDecimal e1 = new BigDecimal("1.23").setScale(0, RoundingMode.DOWN);  // 1
    print(a, b, c, d, e, f, g, h, i, j, e1);
  }

  /**
   * 向正无穷大舍入(ceiling:上限、天花板)
   */
  @Test
  public void roundingModeCeilingTest() {
    BigDecimal a = new BigDecimal("5.5").setScale(0, RoundingMode.CEILING);  // 6
    BigDecimal b = new BigDecimal("2.5").setScale(0, RoundingMode.CEILING);  // 3
    BigDecimal c = new BigDecimal("1.6").setScale(0, RoundingMode.CEILING);  // 2
    BigDecimal d = new BigDecimal("1.1").setScale(0, RoundingMode.CEILING);  // 2
    BigDecimal e = new BigDecimal("1.0").setScale(0, RoundingMode.CEILING);  // 1
    BigDecimal f = new BigDecimal("-1.0").setScale(0, RoundingMode.CEILING); // -1
    BigDecimal g = new BigDecimal("-1.1").setScale(0, RoundingMode.CEILING); // -1
    BigDecimal h = new BigDecimal("-1.6").setScale(0, RoundingMode.CEILING); // -1
    BigDecimal i = new BigDecimal("-2.5").setScale(0, RoundingMode.CEILING); // -2
    BigDecimal j = new BigDecimal("-5.5").setScale(0, RoundingMode.CEILING); // -5
    BigDecimal e1 = new BigDecimal("1.23").setScale(0, RoundingMode.CEILING);  // 2
    print(a, b, c, d, e, f, g, h, i, j, e1);
  }


  /**
   * 向负无穷大舍入(floor:地板)
   */
  @Test
  public void roundingModeFloorTest() {
    BigDecimal a = new BigDecimal("5.5").setScale(0, RoundingMode.FLOOR);  // 5
    BigDecimal b = new BigDecimal("2.5").setScale(0, RoundingMode.FLOOR);  // 2
    BigDecimal c = new BigDecimal("1.6").setScale(0, RoundingMode.FLOOR);  // 1
    BigDecimal d = new BigDecimal("1.1").setScale(0, RoundingMode.FLOOR);  // 1
    BigDecimal e = new BigDecimal("1.0").setScale(0, RoundingMode.FLOOR);  // 1
    BigDecimal f = new BigDecimal("-1.0").setScale(0, RoundingMode.FLOOR); // -1
    BigDecimal g = new BigDecimal("-1.1").setScale(0, RoundingMode.FLOOR); // -2
    BigDecimal h = new BigDecimal("-1.6").setScale(0, RoundingMode.FLOOR); // -2
    BigDecimal i = new BigDecimal("-2.5").setScale(0, RoundingMode.FLOOR); // -3
    BigDecimal j = new BigDecimal("-5.5").setScale(0, RoundingMode.FLOOR); // -6
    BigDecimal e1 = new BigDecimal("1.23").setScale(0, RoundingMode.FLOOR);  // 1
    print(a, b, c, d, e, f, g, h, i, j, e1);
  }

  /**
   * 向“最近邻居”舍入，除非两个邻居等距，在这种情况下向上舍入。
   */
  @Test
  public void roundingModeHalfUpTest() {
    BigDecimal a = new BigDecimal("5.5").setScale(0, RoundingMode.HALF_UP);  // 6
    BigDecimal b = new BigDecimal("2.5").setScale(0, RoundingMode.HALF_UP);  // 3
    BigDecimal c = new BigDecimal("1.6").setScale(0, RoundingMode.HALF_UP);  // 2
    BigDecimal d = new BigDecimal("1.1").setScale(0, RoundingMode.HALF_UP);  // 1
    BigDecimal e = new BigDecimal("1.0").setScale(0, RoundingMode.HALF_UP);  // 1
    BigDecimal f = new BigDecimal("-1.0").setScale(0, RoundingMode.HALF_UP); // -1
    BigDecimal g = new BigDecimal("-1.1").setScale(0, RoundingMode.HALF_UP); // -1
    BigDecimal h = new BigDecimal("-1.6").setScale(0, RoundingMode.HALF_UP); // -2
    BigDecimal i = new BigDecimal("-2.5").setScale(0, RoundingMode.HALF_UP); // -3
    BigDecimal j = new BigDecimal("-5.5").setScale(0, RoundingMode.HALF_UP); // -6
    BigDecimal e1 = new BigDecimal("1.23").setScale(0, RoundingMode.HALF_UP);  // 1
    print(a, b, c, d, e, f, g, h, i, j, e1);
  }

  /**
   * 向“最近邻居”舍入，除非两个邻居等距，在这种情况下向下舍入
   */
  @Test
  public void roundingModeHalfDownTest() {
    BigDecimal a = new BigDecimal("5.5").setScale(0, RoundingMode.HALF_DOWN);  // 5
    BigDecimal b = new BigDecimal("2.5").setScale(0, RoundingMode.HALF_DOWN);  // 2
    BigDecimal c = new BigDecimal("1.6").setScale(0, RoundingMode.HALF_DOWN);  // 2
    BigDecimal d = new BigDecimal("1.1").setScale(0, RoundingMode.HALF_DOWN);  // 1
    BigDecimal e = new BigDecimal("1.0").setScale(0, RoundingMode.HALF_DOWN);  // 1
    BigDecimal f = new BigDecimal("-1.0").setScale(0, RoundingMode.HALF_DOWN); // -1
    BigDecimal g = new BigDecimal("-1.1").setScale(0, RoundingMode.HALF_DOWN); // -1
    BigDecimal h = new BigDecimal("-1.6").setScale(0, RoundingMode.HALF_DOWN); // -2
    BigDecimal i = new BigDecimal("-2.5").setScale(0, RoundingMode.HALF_DOWN); // -2
    BigDecimal j = new BigDecimal("-5.5").setScale(0, RoundingMode.HALF_DOWN); // -5
    BigDecimal e1 = new BigDecimal("1.23").setScale(0, RoundingMode.HALF_DOWN);  // 1
    print(a, b, c, d, e, f, g, h, i, j, e1);
  }


  /**
   * 入模式向“最近邻居”舍入，除非两个邻居等距，在这种情况下，向着偶邻居舍入。
   */
  @Test
  public void roundingModeHalfEvenTest() {
    BigDecimal a = new BigDecimal("5.5").setScale(0, RoundingMode.HALF_EVEN);  // 6
    BigDecimal b = new BigDecimal("2.5").setScale(0, RoundingMode.HALF_EVEN);  // 2
    BigDecimal c = new BigDecimal("1.6").setScale(0, RoundingMode.HALF_EVEN);  // 2
    BigDecimal d = new BigDecimal("1.1").setScale(0, RoundingMode.HALF_EVEN);  // 1
    BigDecimal e = new BigDecimal("1.0").setScale(0, RoundingMode.HALF_EVEN);  // 1
    BigDecimal f = new BigDecimal("-1.0").setScale(0, RoundingMode.HALF_EVEN); // -1
    BigDecimal g = new BigDecimal("-1.1").setScale(0, RoundingMode.HALF_EVEN); // -1
    BigDecimal h = new BigDecimal("-1.6").setScale(0, RoundingMode.HALF_EVEN); // -2
    BigDecimal i = new BigDecimal("-2.5").setScale(0, RoundingMode.HALF_EVEN); // -2
    BigDecimal j = new BigDecimal("-5.5").setScale(0, RoundingMode.HALF_EVEN); // -6
    BigDecimal e1 = new BigDecimal("1.23").setScale(0, RoundingMode.HALF_EVEN);  // 1
    print(a, b, c, d, e, f, g, h, i, j, e1);
  }

  /**
   * 断言所请求的操作具有精确结果，因此不需要舍入
   */
  @Test
  public void roundingModeUnnecessaryTest() {
    RoundingMode unnecessary = RoundingMode.UNNECESSARY;
    // throw ArithmeticException
    BigDecimal a = new BigDecimal("5.5").setScale(0, unnecessary);
    // throw ArithmeticException
    BigDecimal b = new BigDecimal("2.5").setScale(0, unnecessary); 
    // throw ArithmeticException
    BigDecimal c = new BigDecimal("1.6").setScale(0, unnecessary); 
    // throw ArithmeticException
    BigDecimal d = new BigDecimal("1.1").setScale(0, unnecessary);  
    BigDecimal e = new BigDecimal("1.0").setScale(0, unnecessary);  // 1
    BigDecimal f = new BigDecimal("-1.0").setScale(0, unnecessary); // -1
    // throw ArithmeticException
    BigDecimal g = new BigDecimal("-1.1").setScale(0, unnecessary);
    // throw ArithmeticException  
    BigDecimal h = new BigDecimal("-1.6").setScale(0, unnecessary); 
    // throw ArithmeticException
    BigDecimal i = new BigDecimal("-2.5").setScale(0, unnecessary); 
    // throw ArithmeticException
    BigDecimal j = new BigDecimal("-5.5").setScale(0, unnecessary); 
    // throw ArithmeticException
    BigDecimal e1 = new BigDecimal("1.23").setScale(0, unnecessary); 
    print(a, b, c, d, e, f, g, h, i, j, e1);
  }
```

