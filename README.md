# GrassView

Swift package for displaying view like github contribution 

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
    GrassView(data: [:])
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

### data 
need description later

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






