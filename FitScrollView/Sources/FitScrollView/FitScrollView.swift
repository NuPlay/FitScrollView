import SwiftUI

public struct FitScrollView : View{
    @State private var scrollViewSize : CGFloat = .zero
    
    let axis : Axis.Set// = .vertical
    let showsIndicators : Bool// = true
    let content : AnyView
    
    public var body: some View{
        ScrollView(self.axis, showsIndicators: self.showsIndicators){
            content
                .background(
                    GeometryReader { geo -> Color in
                        DispatchQueue.main.async {
                            if self.scrollViewSize != geo.size.height{
                                self.scrollViewSize = geo.size.height
                            }
                        }
                        return Color.clear
                    }
                )
        }
        .frame(maxHeight: self.scrollViewSize)
    }
}



extension FitScrollView {
    public init<A: View>(_ axis: Axis.Set = .vertical,
                         showsIndicators: Bool = true,
                         content: () -> A) {
        
        self.init(axis: axis,
                  showsIndicators: showsIndicators,
                  content: AnyView(content()))
    }
}
