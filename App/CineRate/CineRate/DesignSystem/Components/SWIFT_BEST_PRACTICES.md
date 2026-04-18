# Swift Best Practices - Quick Reference

A quick reference guide for common patterns and best practices used in this project.

---

## Optional Handling

### ✅ DO: Check property type before using optional binding

```swift
// If property is non-optional String
if !movie.releaseDate.isEmpty {
    Text(movie.releaseDate)
}

// If property is optional String?
if let releaseDate = movie.releaseDate {
    Text(releaseDate)
}
```

### ✅ DO: Use isEmpty for non-optional collections

```swift
// genres is [String], not [String]?
if !media.genres.isEmpty {
    Text(media.genres.joined(separator: ", "))
}
```

### ❌ DON'T: Use optional chaining on non-optional types

```swift
// ❌ Wrong - genres is not optional
if let genres = media.genres?.joined() { }

// ✅ Right
if !media.genres.isEmpty {
    let genres = media.genres.joined()
}
```

---

## Type Conversions

### ✅ DO: Use provided conversion utilities

```swift
// ✅ Use the built-in initializer
let dbType = DBMediaType(from: mediaType)

// ✅ Use the computed property
let appType = dbType.toAppMediaType
```

### ❌ DON'T: Create manual mappings

```swift
// ❌ Manual mapping is error-prone
let dbType: DBMediaType = (mediaType == .movie) ? .movie : .tv
```

---

## String vs Objects

### ✅ DO: Remember array element types

```swift
// genres is [String] - strings don't have .name property
let genreList = media.genres.joined(separator: ", ")

// cast is [CastMember] - objects DO have properties
let castNames = media.cast.map { $0.name }
```

### ❌ DON'T: Assume structure without checking

```swift
// ❌ Wrong - String doesn't have .name
media.genres.map { $0.name }

// ✅ Right - String IS the value
media.genres.joined()
```

---

## iOS Version Compatibility

### ✅ DO: Use compatible syntax for target iOS version

```swift
// ✅ iOS 15+ compatible
.onChange(of: searchText) {
    performAction()
}

// iOS 17+ only (avoid unless target is iOS 17+)
.onChange(of: searchText) { oldValue, newValue in
    performAction()
}
```

### ✅ DO: Use availability checks when needed

```swift
if #available(iOS 17.0, *) {
    // Use iOS 17 features
} else {
    // Fallback for older versions
}
```

---

## Import Management

### ✅ DO: Import all needed modules

```swift
// For Supabase authentication
import Foundation
import Supabase
import Auth        // Required for User type
import Combine

// For database operations
import Foundation
import Supabase
import PostgREST   // If using directly
```

### Common Import Combinations:

| Use Case | Required Imports |
|----------|-----------------|
| Auth Service | `Supabase`, `Auth`, `Combine` |
| Database Service | `Supabase`, `Foundation` |
| SwiftUI View | `SwiftUI` |
| Async Operations | `Foundation` (for Task) |

---

## Error Handling

### ✅ DO: Handle all error cases

```swift
do {
    let result = try await asyncOperation()
    
    #if DEBUG
    print("✅ Success")
    #endif
    
} catch {
    print("❌ Error: \(error.localizedDescription)")
    
    // Always set safe defaults
    data = []
    isLoading = false
}
```

### ✅ DO: Use DEBUG flags for logging

```swift
#if DEBUG
print("Debug info")
#endif
```

---

## Async/Await Patterns

### ✅ DO: Use parallel loading for independent operations

```swift
async let movies = getMovies()
async let shows = getShows()

let (movieResults, showResults) = try await (movies, shows)
```

### ✅ DO: Mark UI updates with @MainActor

```swift
@MainActor
private func updateUI() async {
    isLoading = true
    // ... UI updates
}
```

### ✅ DO: Cancel tasks properly

```swift
@State private var searchTask: Task<Void, Never>?

func performSearch() {
    searchTask?.cancel()
    
    searchTask = Task {
        try? await Task.sleep(nanoseconds: 500_000_000)
        guard !Task.isCancelled else { return }
        await executeSearch()
    }
}
```

---

## URL Validation

### ✅ DO: Validate all URL components

```swift
// Validate before creating URL
if let path = imagePath,
   !path.isEmpty,
   let url = URL(string: baseURL + path) {
    // Use URL safely
} else {
    // Show fallback
}
```

### ❌ DON'T: Trust URL creation without validation

```swift
// ❌ Could crash if path is invalid
let url = URL(string: baseURL + path)!
```

---

## State Management

### ✅ DO: Follow clear state patterns

```swift
@State private var isLoading = false
@State private var data: [Item] = []
@State private var errorMessage: String?

func loadData() async {
    // 1. Set loading state
    isLoading = true
    errorMessage = nil
    
    // 2. Perform operation
    do {
        data = try await fetchData()
    } catch {
        errorMessage = error.localizedDescription
        data = []  // Safe default
    }
    
    // 3. Clear loading state
    isLoading = false
}
```

---

## UI Loading States

### ✅ DO: Handle all UI states

```swift
if isLoading {
    LoadingSkeleton()
} else if data.isEmpty {
    EmptyStateView()
} else {
    DataView(data: data)
}
```

### ✅ DO: Show loading indicators

```swift
if isLoading {
    ProgressView()
} else {
    Button("Load") { loadData() }
}
```

---

## Array Operations

### ✅ DO: Use prefix for limiting results

```swift
// ✅ Efficient
media.genres.prefix(2).joined()

// ❌ Less efficient
Array(media.genres[0..<min(2, media.genres.count)])
```

### ✅ DO: Check bounds before accessing

```swift
// ✅ Safe
if let first = array.first { }

// ✅ Safe with prefix
array.prefix(5).forEach { }

// ❌ Unsafe
let item = array[0]  // Could crash if empty
```

---

## Common Pitfalls

### 1. Optional Binding on Non-Optional

```swift
// ❌ Error: String is not optional
if let date = movie.releaseDate { }

// ✅ Fix: Check emptiness
if !movie.releaseDate.isEmpty { }
```

### 2. Wrong Type Reference

```swift
// ❌ Error: Type doesn't exist
let type: SupabaseConfig.MediaType

// ✅ Fix: Use correct type
let type = DBMediaType(from: mediaType)
```

### 3. Missing Import

```swift
// ❌ Error: Property 'id' not available
let userId = user.id

// ✅ Fix: Import Auth module
import Auth
```

### 4. iOS Version Incompatibility

```swift
// ❌ iOS 17+ only
.onChange(of: value) { old, new in }

// ✅ iOS 15+ compatible
.onChange(of: value) { }
```

### 5. Accessing Non-existent Properties

```swift
// ❌ String doesn't have .name
genres.map { $0.name }

// ✅ String IS the value
genres.joined()
```

---

## Quick Debugging Checklist

When you encounter an error:

1. **Check the model definition**
   - Is the property optional?
   - What is the type?
   
2. **Check imports**
   - Are all modules imported?
   - Is Auth imported for User types?
   
3. **Check iOS version**
   - Is the API available in your deployment target?
   - Do you need an availability check?
   
4. **Check type conversions**
   - Are you using the right type?
   - Is there a conversion utility?
   
5. **Check optional handling**
   - Should you use `if let` or `.isEmpty`?
   - Is optional chaining valid here?

---

## Model Types Reference

### Media Model
```swift
struct Media {
    let id: String                // Non-optional
    let title: String             // Non-optional
    let releaseDate: String       // Non-optional ⚠️
    let genres: [String]          // Non-optional array ⚠️
    var voteAverage: Double?      // Optional
    var posterPath: String?       // Optional
    var backdropPath: String?     // Optional
}
```

### MediaType vs DBMediaType
```swift
// UI layer
enum MediaType: String {
    case movie = "Movie"
    case tvShow = "TV Show"
}

// Database layer
enum DBMediaType: String {
    case movie = "movie"
    case tv = "tv"
}

// Conversion
let dbType = DBMediaType(from: mediaType)
let uiType = dbType.toAppMediaType
```

---

## Code Review Checklist

Before committing code:

- [ ] All errors resolved
- [ ] All warnings addressed
- [ ] Proper error handling
- [ ] Loading states implemented
- [ ] Empty states handled
- [ ] Optionals handled correctly
- [ ] Correct type conversions
- [ ] iOS compatibility checked
- [ ] Debug logs wrapped in `#if DEBUG`
- [ ] Safe defaults on errors
- [ ] Documentation updated

---

**Remember:** When in doubt, check the model definition and Swift documentation!
