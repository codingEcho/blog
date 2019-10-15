# [Top 16 Java Utility Classes](https://www.programcreek.com/2015/12/top-10-java-utility-classes/)

 

In Java, a utility class is a class that defines a set of methods that perform common functions. This post shows the most frequently used Java utility classes and their most commonly used methods. Both the class list and their method list are ordered by popularity. The data is based on randomly selected 50,000 open source Java projects from GitHub.

Hopefully, you can get some ideas of what are already provided and popular by browsing the list so that you know you don't need to program them by yourself. The names of the methods normally indicate what they do. If the method names are not intuitive enough, you may also check out [how other developers are using them in their open source projects](https://www.programcreek.com/java-api-examples/index.php).

## 1 org.apache.commons.io.IOUtils

- [closeQuietly ( ) - 无条件的关闭流](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.IOUtils&method=closeQuietly)
- [toString ( ) - 各种输入流转为String](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.IOUtils&method=toString)
- [copy ( ) - 从输入流复制字符到输出流,类似复制文件？](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.IOUtils&method=copy)
- [toByteArray ( ) - read toByteArray](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.IOUtils&method=toByteArray)
- [write ( ) - write byte[]、char[]、CharSequence to output](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.IOUtils&method=write)
- [toInputStream ( ) - to input stream](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.IOUtils&method=toInputStream)
- [readLines ( ) - read lines](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.IOUtils&method=readLines)
- [copyLarge ( ) - copy large(over 2GB)](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.IOUtils&method=copyLarge)
- [lineIterator ( ) - get line iterator](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.IOUtils&method=lineIterator)
- [readFully ( ) - 读取指定长度的内容,不足将报错](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.IOUtils&method=readFully)

## 2 org.apache.commons.io.FileUtils

- [deleteDirectory ( ) - 向下递归删除目录](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.FileUtils&method=deleteDirectory)
- [readFileToString ( ) - 将文件读到字符串中](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.FileUtils&method=readFileToString)
- [deleteQuietly ( ) - 删除文件（如果为目录将删除其子目录），不会抛出异常](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.FileUtils&method=deleteQuietly)
- [copyFile ( ) - 复制文件](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.FileUtils&method=copyFile)
- [writeStringToFile ( ) - 将字符串写到文件](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.FileUtils&method=writeStringToFile)
- [forceMkdir ( ) - 创建目录（包括不存在的父目录）](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.FileUtils&method=forceMkdir)
- [write ( ) - 写文件](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.FileUtils&method=write)
- [listFiles ( ) - 列出指定目录下的文件列表](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.FileUtils&method=listFiles)
- [copyDirectory ( ) - 复制目录](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.FileUtils&method=copyDirectory)
- [forceDelete ( ) - 强制删除](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.FileUtils&method=forceDelete)

## 3 org.apache.commons.lang.StringUtils

- [isBlank ( ) - 空格、empty("")或null](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.StringUtils&method=isBlank)
- [isNotBlank ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.StringUtils&method=isNotBlank)
- [isEmpty ( ) -  empty("")或null](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.StringUtils&method=isEmpty)
- [isNotEmpty ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.StringUtils&method=isNotEmpty)
- [equals ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.StringUtils&method=equals)
- [join ( ) - 连接XX](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.StringUtils&method=join)
- [split ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.StringUtils&method=split)
- [EMPTY- `""`](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.StringUtils&method=EMPTY)
- [trimToNull ( ) - trim()->isEmpty()->to `null`](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.StringUtils&method=trimToNull)
- [replace ( ) - 查找替换](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.StringUtils&method=replace)

## 4 org.apache.http.util.EntityUtils

- [toString ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.http.util.EntityUtils&method=toString)
- [consume ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.http.util.EntityUtils&method=consume)
- [toByteArray ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.http.util.EntityUtils&method=toByteArray)
- [consumeQuietly ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.http.util.EntityUtils&method=consumeQuietly)
- [getContentCharSet ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.http.util.EntityUtils&method=getContentCharSet)

## 5 org.apache.commons.lang3.StringUtils

- [isBlank ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.StringUtils&method=isBlank)
- [isNotBlank ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.StringUtils&method=isNotBlank)
- [isEmpty ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.StringUtils&method=isEmpty)
- [isNotEmpty ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.StringUtils&method=isNotEmpty)
- [join ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.StringUtils&method=join)
- [equals ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.StringUtils&method=equals)
- [split ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.StringUtils&method=split)
- [EMPTY](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.StringUtils&method=EMPTY)
- [replace ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.StringUtils&method=replace)
- [capitalize ( ) - 将首字母大写（有单引号的单词不会被大写）](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.StringUtils&method=capitalize)

## 6 org.apache.commons.io.FilenameUtils

- [getExtension ( ) - 获取扩展名(可能是`""`)](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.FilenameUtils&method=getExtension)
- [getBaseName ( ) - 获取文件名（不包括扩展名和路径）](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.FilenameUtils&method=getBaseName)
- [getName ( ) - 获取文件名(包括扩展名)](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.FilenameUtils&method=getName)
- [concat ( ) - 文件、路径拼接](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.FilenameUtils&method=concat)
- [removeExtension ( ) - 去掉文件扩展名](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.FilenameUtils&method=removeExtension)
- [ormalize ( ) - Normalizes a path, removing double and single dot path steps.](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.FilenameUtils&method=normalize)
- [wildcardMatch ( ) - Checks a filename to see if it matches the specified wildcard matcher,
 always testing case-sensitive.](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.FilenameUtils&method=wildcardMatch)
- [separatorsToUnix ( ) - Converts all separators to the Unix separator of forward slash.](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.FilenameUtils&method=separatorsToUnix)
- [getFullPath ( ) - Gets the path from a full filename, which excludes the prefix.](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.FilenameUtils&method=getFullPath)
- [isExtension ( ) - 是否是指定的扩展名](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.io.FilenameUtils&method=isExtension)

## 7 org.springframework.util.StringUtils

- [hasText ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.springframework.util.StringUtils&method=hasText)
- [hasLength ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.springframework.util.StringUtils&method=hasLength)
- [isEmpty ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.springframework.util.StringUtils&method=isEmpty)
- [commaDelimitedListToStringArray ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.springframework.util.StringUtils&method=commaDelimitedListToStringArray)
- [collectionToDelimitedString ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.springframework.util.StringUtils&method=collectionToDelimitedString)
- [replace ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.springframework.util.StringUtils&method=replace)
- [delimitedListToStringArray ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.springframework.util.StringUtils&method=delimitedListToStringArray)
- [uncapitalize ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.springframework.util.StringUtils&method=uncapitalize)
- [collectionToCommaDelimitedString ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.springframework.util.StringUtils&method=collectionToCommaDelimitedString)
- [tokenizeToStringArray ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.springframework.util.StringUtils&method=tokenizeToStringArray)

## 8 org.apache.commons.lang.ArrayUtils

- [contains ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.ArrayUtils&method=contains)
- [addAll ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.ArrayUtils&method=addAll)
- [clone ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.ArrayUtils&method=clone)
- [isEmpty ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.ArrayUtils&method=isEmpty)
- [add ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.ArrayUtils&method=add)
- [EMPTY_BYTE_ARRAY](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.ArrayUtils&method=EMPTY_BYTE_ARRAY)
- [subarray ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.ArrayUtils&method=subarray)
- [indexOf ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.ArrayUtils&method=indexOf)
- [isEquals ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.ArrayUtils&method=isEquals)
- [toObject ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.ArrayUtils&method=toObject)

## 9 org.apache.commons.lang.StringEscapeUtils

- [escapeHtml ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.StringEscapeUtils&method=escapeHtml)
- [unescapeHtml ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.StringEscapeUtils&method=unescapeHtml)
- [escapeXml ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.StringEscapeUtils&method=escapeXml)
- [escapeSql ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.StringEscapeUtils&method=escapeSql)
- [unescapeJava ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.StringEscapeUtils&method=unescapeJava)
- [escapeJava ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.StringEscapeUtils&method=escapeJava)
- [escapeJavaScript ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.StringEscapeUtils&method=escapeJavaScript)
- [unescapeXml ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.StringEscapeUtils&method=unescapeXml)
- [unescapeJavaScript ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang.StringEscapeUtils&method=unescapeJavaScript)

## 10 org.apache.http.client.utils.URLEncodedUtils

- [format ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.http.client.utils.URLEncodedUtils&method=format)
- [parse ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.http.client.utils.URLEncodedUtils&method=parse)

## 11 org.apache.commons.codec.digest.DigestUtils

- [md5Hex ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.codec.digest.DigestUtils&method=md5Hex)
- [shaHex ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.codec.digest.DigestUtils&method=shaHex)
- [sha256Hex ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.codec.digest.DigestUtils&method=sha256Hex)
- [sha1Hex ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.codec.digest.DigestUtils&method=sha1Hex)
- [sha ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.codec.digest.DigestUtils&method=sha)
- [md5 ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.codec.digest.DigestUtils&method=md5)
- [sha512Hex ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.codec.digest.DigestUtils&method=sha512Hex)
- [sha1 ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.codec.digest.DigestUtils&method=sha1)

## 12 org.apache.commons.collections.CollectionUtils

- [isEmpty ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.collections.CollectionUtils&method=isEmpty)
- [isNotEmpty ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.collections.CollectionUtils&method=isNotEmpty)
- [select ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.collections.CollectionUtils&method=select)
- [transform ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.collections.CollectionUtils&method=transform)
- [filter ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.collections.CollectionUtils&method=filter)
- [find ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.collections.CollectionUtils&method=find)
- [collect ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.collections.CollectionUtils&method=collect)
- [forAllDo ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.collections.CollectionUtils&method=forAllDo)
- [addAll ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.collections.CollectionUtils&method=addAll)
- [isEqualCollection ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.collections.CollectionUtils&method=isEqualCollection)

## 13 org.apache.commons.lang3.ArrayUtils

- [contains ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.ArrayUtils&method=contains)
- [isEmpty ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.ArrayUtils&method=isEmpty)
- [isNotEmpty ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.ArrayUtils&method=isNotEmpty)
- [add ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.ArrayUtils&method=add)
- [clone ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.ArrayUtils&method=clone)
- [addAll ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.ArrayUtils&method=addAll)
- [subarray ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.ArrayUtils&method=subarray)
- [indexOf ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.ArrayUtils&method=indexOf)
- [EMPTY_OBJECT_ARRAY](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.ArrayUtils&method=EMPTY_OBJECT_ARRAY)
- [EMPTY_STRING_ARRAY](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.ArrayUtils&method=EMPTY_STRING_ARRAY)

## 14 org.apache.commons.beanutils.PropertyUtils

- [getProperty ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.beanutils.PropertyUtils&method=getProperty)
- [setProperty ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.beanutils.PropertyUtils&method=setProperty)
- [getPropertyDescriptors ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.beanutils.PropertyUtils&method=getPropertyDescriptors)
- [isReadable ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.beanutils.PropertyUtils&method=isReadable)
- [copyProperties ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.beanutils.PropertyUtils&method=copyProperties)
- [getPropertyDescriptor ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.beanutils.PropertyUtils&method=getPropertyDescriptor)
- [getSimpleProperty ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.beanutils.PropertyUtils&method=getSimpleProperty)
- [isWriteable ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.beanutils.PropertyUtils&method=isWriteable)
- [setSimpleProperty ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.beanutils.PropertyUtils&method=setSimpleProperty)
- [getPropertyType ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.beanutils.PropertyUtils&method=getPropertyType)

## 15 org.apache.commons.lang3.StringEscapeUtils

- [unescapeHtml4 ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.StringEscapeUtils&method=unescapeHtml4)
- [escapeHtml4 ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.StringEscapeUtils&method=escapeHtml4)
- [escapeXml ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.StringEscapeUtils&method=escapeXml)
- [unescapeXml ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.StringEscapeUtils&method=unescapeXml)
- [escapeJava ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.StringEscapeUtils&method=escapeJava)
- [escapeEcmaScript ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.StringEscapeUtils&method=escapeEcmaScript)
- [unescapeJava ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.StringEscapeUtils&method=unescapeJava)
- [escapeJson ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.StringEscapeUtils&method=escapeJson)
- [escapeXml10 ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.lang3.StringEscapeUtils&method=escapeXml10)

## 16 org.apache.commons.beanutils.BeanUtils

- [copyProperties ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.beanutils.BeanUtils&method=copyProperties)
- [getProperty ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.beanutils.BeanUtils&method=getProperty)
- [setProperty ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.beanutils.BeanUtils&method=setProperty)
- [describe ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.beanutils.BeanUtils&method=describe)
- [populate ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.beanutils.BeanUtils&method=populate)
- [copyProperty ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.beanutils.BeanUtils&method=copyProperty)
- [cloneBean ( )](https://www.programcreek.com/java-api-examples/index.php?class=org.apache.commons.beanutils.BeanUtils&method=cloneBean)

\* The utility classes from android are excluded since they are designed for Android apps. If you want to see more details, you can search "utils" in the search portal: [http://www.programcreek.com/java-api-examples/index.php](https://www.programcreek.com/java-api-examples/index.php). If the name of a utility class does not contain "utils", the class is not selected.

Also org.apache.commons.lang is the old version of import org.apache.commons.lang3.

### Related Posts:

1. [Compile and Run Java in Command Line with External Jars](https://www.programcreek.com/2014/01/compile-and-run-java-in-command-line-with-external-jars/)
2. [Why do we need software testing?](https://www.programcreek.com/2012/02/why-do-we-need-to-do-software-testing-a-java-example/)
3. [Loop Through a Given Directory With Indentation in Java](https://www.programcreek.com/2012/09/loop-through-a-given-directory-with-indentation-in-java/)
4. [Top 10 questions of Java Strings](https://www.programcreek.com/2013/09/top-10-faqs-of-java-strings/)



- Angela Petri

  Thanks, everyone for coming. It’s my life to go to great cities of the world and share my experience with all of you. My last visit was to Romania and I really loved it all the way. The best thing about my whole trip was the music in Romania. The Romanians love music and there are a lot of great music festivals in Romania that you would surely enjoy with your friends. Come and have a great experience partying in Romania.
  Check more at here: <https://tourinromania.com/>

- Angela Petri

  Hi all. I want to say thanks to everyone who shared my post. This was my journey to Romania and it has been one of the greatest adventures of my life. I enjoyed the whole trip especially the part where I tried a lot of fun things to do in Bucharest. From skiing to visiting castles and eating the traditional food, everything was tops. If you too are looking for a fun trip, travel to Romania and I’m sure you’ll find the adventure you wanted.
  Check more at here: <https://tourinromania.com/>

- [Sicchi](https://ebrain2203.wordpress.com/)

  nice info learn java more in here [UG Library](http://library.gunadarma.ac.id/)

- Codeer

  good tutorials, thanks

- [Alexey Grigorev](http://alexeygrigorev.com/)

  No Guava stats?