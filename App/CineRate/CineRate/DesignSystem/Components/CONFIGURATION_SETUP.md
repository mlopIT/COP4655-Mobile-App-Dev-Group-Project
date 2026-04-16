# Complete Setup Guide: Supabase Configuration with Secrets

This guide will help you complete the Supabase setup using your existing `Secrets.xcconfig` file.

## ✅ Already Done

- [x] Created `Secrets.xcconfig` with Supabase credentials
- [x] Updated `SupabaseConfig.swift` to read from configuration

## 📋 Remaining Setup Steps

### Step 1: Install Supabase Swift Package

The error `No such module 'Supabase'` means the package needs to be added to your Xcode project.

1. Open your project in Xcode
2. Select your project in the navigator (top item)
3. Select your app target
4. Go to the **General** tab
5. Scroll down to **Frameworks, Libraries, and Embedded Content**
6. Click the **+** button
7. Click **Add Package Dependency...**
8. In the search field, enter: `https://github.com/supabase/supabase-swift`
9. Click **Add Package**
10. Select these products (check the boxes):
    - ✅ **Supabase**
    - ✅ **Auth** 
    - ✅ **PostgREST**
    - ✅ **Storage** (optional)
    - ✅ **Realtime** (optional)
11. Click **Add Package**

**Alternative using Swift Package Manager:**
```swift
// If using Package.swift
dependencies: [
    .package(url: "https://github.com/supabase/supabase-swift", from: "2.0.0")
]
```

---

### Step 2: Configure Info.plist to Read from Secrets.xcconfig

You need to pass the xcconfig variables to your app through Info.plist.

**Option A: Using Xcode GUI**

1. In Xcode, open your `Info.plist` file
2. Right-click in the editor and select **"Add Row"**
3. Add first entry:
   - **Key**: `SUPABASE_URL`
   - **Type**: String
   - **Value**: `$(SUPABASE_URL)`
4. Add second entry:
   - **Key**: `SUPABASE_ANON_KEY`
   - **Type**: String
   - **Value**: `$(SUPABASE_ANON_KEY)`

**Option B: Manual XML Edit**

If you prefer editing the plist as XML:

1. Right-click `Info.plist` → **Open As** → **Source Code**
2. Add these lines inside the main `<dict>` tag:

```xml
<key>SUPABASE_URL</key>
<string>$(SUPABASE_URL)</string>
<key>SUPABASE_ANON_KEY</key>
<string>$(SUPABASE_ANON_KEY)</string>
```

**Your Info.plist should look like this:**
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <!-- Other existing keys... -->
    
    <!-- Supabase Configuration -->
    <key>SUPABASE_URL</key>
    <string>$(SUPABASE_URL)</string>
    <key>SUPABASE_ANON_KEY</key>
    <string>$(SUPABASE_ANON_KEY)</string>
    
    <!-- Other existing keys... -->
</dict>
</plist>
```

---

### Step 3: Assign Secrets.xcconfig to Your Target

Make sure Xcode knows to use your configuration file:

1. Select your **project** (not target) in the Project Navigator
2. Select the **project** (blue icon) in the left panel
3. Go to the **Info** tab
4. Look for the **Configurations** section
5. For **Debug** configuration:
   - Click the disclosure triangle next to Debug
   - Under your target name, select **Secrets** from the dropdown
6. For **Release** configuration:
   - Click the disclosure triangle next to Release
   - Under your target name, select **Secrets** from the dropdown

**It should look like:**
```
Configurations
  ├── Debug
  │   └── YourAppTarget: Secrets
  └── Release
      └── YourAppTarget: Secrets
```

---

### Step 4: Add Secrets.xcconfig to .gitignore

**IMPORTANT:** Make sure your secrets don't get committed to git!

1. Open or create `.gitignore` in your project root
2. Add this line:

```
# Secrets configuration
Secrets.xcconfig
*.xcconfig
```

3. If `Secrets.xcconfig` is already tracked by git, remove it:

```bash
git rm --cached Secrets.xcconfig
git commit -m "Remove secrets from git tracking"
```

---

### Step 5: Create Template File for Team Members

Create a `Secrets.xcconfig.template` file that team members can copy:

```
# Copy this file to Secrets.xcconfig and add your actual keys
# Get these from: https://supabase.com/dashboard/project/YOUR_PROJECT/settings/api

SUPABASE_URL = https://YOUR-PROJECT-REF.supabase.co
SUPABASE_ANON_KEY = YOUR_ANON_KEY_HERE
```

Add to git:
```bash
git add Secrets.xcconfig.template
git commit -m "Add secrets template"
```

---

### Step 6: Verify Setup

Build and run your app. You should see in the console:

```
✅ Supabase configured with URL: https://udwfrwzkwbdxqpqlvqfd.supabase.co
```

If you see an error like:
```
⚠️ Supabase configuration missing!
```

Then the values aren't being passed correctly. Double-check Steps 2 and 3.

---

## 🧪 Test Your Configuration

Add this test code somewhere in your app (like in a test view or on app launch):

```swift
import SwiftUI

struct ConfigTestView: View {
    @State private var status = "Testing..."
    @State private var statusColor: Color = .gray
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Supabase Configuration Test")
                .font(.headline)
            
            Text(status)
                .foregroundColor(statusColor)
                .multilineTextAlignment(.center)
                .padding()
            
            Button("Test Connection") {
                testConfiguration()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .onAppear {
            testConfiguration()
        }
    }
    
    func testConfiguration() {
        status = "Testing connection..."
        statusColor = .gray
        
        Task {
            do {
                // Test basic connection
                let client = SupabaseConfig.shared.client
                
                // Try to fetch from a table (will work even if empty)
                let _: [Profile] = try await client.database
                    .from("profiles")
                    .select()
                    .limit(1)
                    .execute()
                    .value
                
                status = "✅ Supabase connected successfully!\n\nConfiguration is working correctly."
                statusColor = .green
                
            } catch {
                status = "❌ Connection failed:\n\(error.localizedDescription)"
                statusColor = .red
            }
        }
    }
}

// Add to your ContentView or wherever you want to test
#Preview {
    ConfigTestView()
}
```

---

## 🐛 Troubleshooting

### Issue: "No such module 'Supabase'"

**Solution:**
- Make sure you completed Step 1 (Install Supabase package)
- Clean build folder: **Product → Clean Build Folder** (Cmd+Shift+K)
- Restart Xcode
- Check that package is listed in **Project → Package Dependencies**

### Issue: "Supabase configuration missing!"

**Solution:**
- Verify Info.plist has the keys (Step 2)
- Verify Secrets.xcconfig is assigned to target (Step 3)
- Check that values in Info.plist use `$(VARIABLE_NAME)` format
- Try cleaning and rebuilding

### Issue: Values show as "$(SUPABASE_URL)" instead of actual URL

**Solution:**
- This means xcconfig isn't being applied
- Go back to Step 3 and assign configuration to target
- Make sure you assigned to the **target**, not just the project

### Issue: Build succeeds but app crashes on launch

**Solution:**
- Check the error message in Xcode console
- Verify your Supabase URL is valid (starts with https://)
- Verify anon key is complete (very long string)
- Check that Secrets.xcconfig has no typos

---

## 📝 Current Configuration Summary

**Your Secrets.xcconfig:**
```
SUPABASE_URL = https://udwfrwzkwbdxqpqlvqfd.supabase.co
SUPABASE_ANON_KEY = sb_secret_YYvzb042xc55IOx_xKwbuA_1XsLPnhb
```

**How it works:**

1. Xcode reads `Secrets.xcconfig` during build
2. Variables are substituted into `Info.plist` 
3. At runtime, `SupabaseConfig.swift` reads from `Bundle.main.infoDictionary`
4. Supabase client is initialized with these values

**Security:**
- ✅ Secrets not hardcoded in Swift files
- ✅ Secrets file can be gitignored
- ✅ Each team member has their own secrets file
- ✅ Anon key is safe to use in client apps

---

## ✅ Verification Checklist

Complete these checks to ensure everything is set up:

- [ ] Supabase Swift package is installed and appears in Package Dependencies
- [ ] Build succeeds with no "No such module" errors
- [ ] Info.plist contains SUPABASE_URL and SUPABASE_ANON_KEY keys
- [ ] Secrets.xcconfig is assigned to Debug configuration for target
- [ ] Secrets.xcconfig is assigned to Release configuration for target
- [ ] Secrets.xcconfig is added to .gitignore
- [ ] App builds and runs without crashing
- [ ] Console shows "✅ Supabase configured with URL: ..."
- [ ] Test connection succeeds

---

## 🚀 Next Steps

Once configuration is working:

1. ✅ Test authentication: Try signing up a user
2. ✅ Test database: Try fetching reviews
3. ✅ Integrate with your UI screens
4. ✅ Deploy to TestFlight (secrets will work automatically)

---

## 📚 Additional Resources

- [Xconfig Files Guide](https://nshipster.com/xcconfig/)
- [Supabase Swift Client](https://github.com/supabase/supabase-swift)
- [Info.plist Configuration](https://developer.apple.com/documentation/bundleresources/information_property_list)

---

**Last Updated:** April 16, 2026  
**Status:** Configuration files ready, package installation required
