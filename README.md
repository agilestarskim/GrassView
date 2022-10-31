# GrassView

Swift package for displaying view like github contribution 

![스크린샷 2022-10-28 오후 9 58 00](https://user-images.githubusercontent.com/79740398/198595888-23233a71-fde3-4c00-b334-09b7d9858cdb.jpg)

# Installing

It requires iOS 14
  
In Xcode go to File -> Swift Packages -> Add Package Dependency and paste in the repo's url: https://github.com/agilestarskim/GrassView.git

# Usage

import the package in the file you would like to use it

```swift
import GrassView
```
place GrassView in the parent view
 
```swift
VStack {
    GrassView()
}
```

# Definition

```swift
GrassView(
    data: [String: Int] = [:], 
    blockColor: Color = .green, 
    row: Int = 5,
    col: Int = 10,
    formatString: String = "yyyy-MM-dd",
    locale: Locale? = nil,
    timeZone: TimeZone? = nil
)
```

## parameter

<details>
<summary>data</summary>

## data
`data: [String: Int] = [:]`

This is Dictionary Type

Default value is \[:]

Key is String Type, value is Int Type

Key means Date that store in your database

*example) "2022-03-01"*

Invalid date is available but it won't be shown on the view

*example) "2022-14-52"*

Keep date form constant!! not various

*example) "2022-03-01", "2022/03/01" -> not good*
 
The order of date doesn't matter. view will sort them automatically 

Value means how much work at that time 

Value's range is 0 ~ 10 

OutOfRange doesn't occur error but the cell would be invisible

*example)*
```swift
    let testCase = [
        "2022-10-26": 10,
        "2022-10-25": 10,
        "2022-10-23": 4,
        "2022-10-21": 5,
        "2022-10-20": 10,
        "2022-10-19": 8,
        "2022-10-18": 6,
        "2022-10-17": 4,
        "2022-10-16": 2,
        "2022-10-15": 10,
        "2022-10-14": 2,
        "2022-10-13": 1,
        "2022-10-12": 7
    ]
```
</details>
 

<details>
<summary>blockColor</summary>

## blockColor
`blockColor: Color = Color.green`

This is Color Type

you can customize cell color using Color in SwiftUI


*example)*
```swift
VStack{
    GrassView(data: testCase1, row: 2, col: 11) // default value is .green
    GrassView(data: testCase1, blockColor: .orange, row: 3, col: 11)
    GrassView(data: testCase1, blockColor: .red, row: 3, col: 11)
    GrassView(data: testCase1, blockColor: .blue, row: 3, col: 11)
    GrassView(data: testCase1, blockColor: .cyan, row: 3, col: 11)
    GrassView(data: testCase1, blockColor: .indigo, row: 3, col: 11)
}    
```

![스크린샷 2022-10-31 오후 4 03 48](https://user-images.githubusercontent.com/79740398/198950564-a7847f36-f899-4f03-b50f-ace03324476f.jpg)

</details>

<details>
<summary>row & col</summary>

## row & col 

`row: Int = 5`
`col: Int = 10`

row means table row count and col means table column count

you can set the total cell count by adjusting row and col

</details>

<details>
<summary>formatString</summary>

## formatString

`formatString: Sting = "yyyy-MM-dd`

formatString is used when display text and find value as key in dictionary data 

if formatString and data key format that you put are different, view can't read the data

```swift
GrassView(data: ["2022-03-01": 10], formatString: "yyyy-MM-dd") //-> good
GrassView(data: ["20220301": 10], formatString: "yyyy-MM-dd") //-> bad 
```  
</details>

<details>
<summary>locale</summary>

## locale

locale is for formatting date string to specific country

if you don't pass paramter, locale would be localized automatically by finding out the current place of device

*example)*
```swift
GrassView(locale: Locale(identifier: "en-US"))
``` 
you can check various country code here

https://gist.github.com/jacobbubu/1836273
</details>

<details>
<summary>timeZone</summary>

## timeZone

timezone is for calculating current time based on a specific timezone

you can check various time zone code here

https://apphelp.readdle.com/?pg=kb.page&id=588

</details>








