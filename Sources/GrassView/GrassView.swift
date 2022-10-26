import SwiftUI

public struct GrassView: View {
    
    @State private var data: [String: Int]
    @State private var text: String = ""
    private let now = Date()
    private var calendar = Calendar.current
    
    public init(data:[String: Int] ) {
        self._data = State<[String: Int]>(initialValue: data)
    }
    
    public var body: some View {
        VStack(alignment: .leading){
            Text("time:" + text )
            
            ForEach(0..<5){ row in
                HStack{
                    ForEach(0..<10){ col in
                        GrassViewCell(
                            date: calendar.date(
                                byAdding: .day,
                                value: -1 * (row * 10 + col),
                                to: now
                            )
                        ){ date in
                            text = DateFormatter().string(from: date)
                        }
                    }
                }
            }
        }
        .padding()
        
    }
}

struct GrassView_Previews: PreviewProvider {
    static var previews: some View {
        GrassView(data: [:])
          
  }
}

