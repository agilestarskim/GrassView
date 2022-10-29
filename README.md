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
this is Dictionary Type
default value is \[:]
key is String Type, value is Int Type
key means Date that store in your database
*example) "2022-03-01"*

invalid date is available but it won't be shown on the view
*example) "2022-14-52"*

keep date form constant!! not various
*example) "2022-03-01" "2022/03/01" -> not good*
 
the order of date doesn't matter. view will sort them automatically 
duplicated date will be shown a random one

value means how much work at that time 
value's range is 1 ~ 10 
outOfRange doesn't occur error but the cell would be invisible

*example*
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
 

### blockColor
need description later

### row
need description later

### col
need description later

### formatString
need description later

### locale
need description later

### timeZone
need description later






