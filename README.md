# FitScrollView
<p align="center">
    <a href="https://swift.org/">
        <img src="https://img.shields.io/badge/Swift-5.1+-F05138?labelColor=303840" alt="Swift: 5.1+">
    </a>
    <a href="https://www.apple.com/ios/">
        <img src="https://img.shields.io/badge/iOS-13.0+-007AFF?labelColor=303840" alt="iOS: 13.0+">
    </a>
</p>

| ![githubFit](https://user-images.githubusercontent.com/73557895/130432655-3e9ebde7-464c-40e5-8b2c-e20fb5d7ab75.gif) 	| ![scrollview](https://user-images.githubusercontent.com/73557895/130433322-81f3ee75-a831-4c91-b8b8-bdb8af1bf5e7.gif) 	|
|---------------------------------------------------------------------------------------------------------------------	|----------------------------------------------------------------------------------------------------------------------	|
| FitScrollView                                                                                                       	| ScrollView(SwiftUI)                                                                                                  	|


It is the same as SwiftUI's ScrollView, but for ScrollView, the height (vertical) or width (horizontal) is maximized.   
Prevent it and create a ScrollView that fits the size of the internal view.   
However, if the size of the internal view is large enough to require scrolling, it will be the same as the normal Scroll View.


## Code

```swift
import SwiftUI
import FitScrollView

struct FitScrollView_Test: View {
    @State var  html = ""
    
    var body: some View {
       FitScrollView{
            Text("")
        }
    }
}

```

```swift
import SwiftUI
import FitScrollView

struct FitScrollView_Test: View {
    @State var  html = ""
    
    var body: some View {
        FitScrollView(.vertical, showsIndicators: false, content: {
            Text("")
        }
    }
}

```

## SampleCode
    
```swift
import SwiftUI
import FitScrollView

struct FitScrollViewTest: View {
    @State var randomText : [String] = ["Cat","Apple", "pepper", "zero"]
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            ZStack(alignment: .bottom){
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                
                FitScrollView(.vertical, showsIndicators: false, content: {
                    VStack(alignment: .leading,spacing: 12){
                        ForEach(0 ..< randomText.count , id:\.self) { index in
                            HStack{
                                Text(randomText[index])
                                    .font(.body)
                                    .padding(.horizontal, 12)
                                
                                Spacer()
                            }
                        }
                    }
                })
                .padding(.all, 12)
                .background(
                    Color.white
                        .cornerRadius(16)
                        .ignoresSafeArea()
                )
            }
            
            Button(action: {
                self.randomText.append(contentsOf: ["Cat","Apple", "pepper", "zero"])
            }, label: {
                Text("Add")
            })
            .padding(.horizontal, 12)
            .padding(.vertical, 4)
            .background(
                Capsule()
                    .foregroundColor(.white)
                    .opacity(0.7)
            )
            .padding(.trailing, 16)
        }
        .animation(.spring())
    }
}

struct FitScrollViewTest_Previews: PreviewProvider {
    static var previews: some View {
        FitScrollViewTest()
    }
}

```
