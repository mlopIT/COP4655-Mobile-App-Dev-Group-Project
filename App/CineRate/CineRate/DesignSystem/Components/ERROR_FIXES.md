# Error Fixes Guide

Based on the error messages, here are the likely issues and fixes:

## Error 1: "Initializer for conditional binding must have Optional type, not 'String'"

**Problem:** Using `if let` or `guard let` on a non-optional property

**Look for code like:**
```swift
if let genres = media.genres { ... }  // ❌ Wrong - genres is [String], not [String]?
```

**Fix:**
```swift
let genres = media.genres  // ✅ Correct - no optional unwrapping needed
```

## Error 2: "Cannot use optional chaining on non-optional value of type '[String]'"

**Problem:** Using optional chaining (`?.`) on a non-optional array

**Look for code like:**
```swift
media.genres?.map { ... }  // ❌ Wrong - genres is [String], not [String]?
```

**Fix:**
```swift
media.genres.map { ... }  // ✅ Correct - no optional chaining needed
```

## Error 3: "Value of type 'String' has no member 'name'"

**Problem:** Trying to access `.name` on a String (likely in a map operation on genres)

**Look for code like:**
```swift
media.genres.map { $0.name }  // ❌ Wrong - $0 is already a String
```

**Fix:**
```swift
media.genres  // ✅ Correct - genres is already [String], no mapping needed
// OR if you need to transform them:
media.genres.map { $0 }  // Just return the string itself
```

## How to Find These Errors

1. Build your project in Xcode (Cmd+B)
2. Click on the error messages to see the exact line
3. Apply the fixes above based on the error type

## Common Locations to Check

- Any view that displays genre tags/chips
- Detail screens showing media information
- Search results
- List/grid items

