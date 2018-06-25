# 在kotlin中使用Jackson反序列化类型为布尔且开头为‘is’的字段

## 实体类

```kotlin
package io.xstar.management.po

import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonProperty
import io.swagger.annotations.ApiModelProperty
import javax.persistence.*

@Entity
@Table(name = "members")
data class Member(

    @Id
    @ApiModelProperty("会员ID")
    val id: Long = 0,

    @ApiModelProperty("真实姓名")
    val realName: String? = null,

    @ApiModelProperty("是否是会员")
    @JsonProperty("vip")
    val isVip: Boolean? = false,

) 
```



## 正确的反序列化方法

注意单元测试代码中`val mapper = jacksonObjectMapper()`而不是使用`ObjectMapper()`来获取实例

```kotlin
  @Test
  fun jsonTest() {
    // val mapper = ObjectMapper() // 无法反序列化为对象
    val mapper = jacksonObjectMapper() // 注意这里！！！
    val member = Member(isVip = true, realName = "张三")
    val jsonString = mapper.writeValueAsString(member)
    System.out.println(jsonString)
    // {"id":0,"realName":"张三","vip":true}
    val memberFromString = mapper.readValue(jsonString, Member::class.java)
    System.out.println(memberFromString)
    // Member(id=0, realName=张三, idType=null, isVip=true)
  }
```

方法`jacksonObjectMapper()`位于`com.fasterxml.jackson.module.kotlin`

```kotlin
package com.fasterxml.jackson.module.kotlin

import com.fasterxml.jackson.core.JsonParser
import com.fasterxml.jackson.core.TreeNode
import com.fasterxml.jackson.core.type.TypeReference
import com.fasterxml.jackson.databind.JsonMappingException
import com.fasterxml.jackson.databind.MappingIterator
import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.databind.ObjectReader
import java.io.File
import java.io.InputStream
import java.io.Reader
import java.net.URL

fun jacksonObjectMapper(): ObjectMapper = ObjectMapper().registerKotlinModule()
fun ObjectMapper.registerKotlinModule(): ObjectMapper = this.registerModule(KotlinModule())

```

