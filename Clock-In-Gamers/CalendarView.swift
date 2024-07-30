import SwiftUI

struct CalendarView: View {
    private let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    private let numberOfDaysInMonth = 30
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 7)
    
    var body: some View {
        VStack {
            HStack {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                }
            }
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(1...numberOfDaysInMonth, id: \.self) { day in
                    Text("\(day)")
                        .font(.body) // Adjust font size here
                        .frame(maxWidth: .infinity, minHeight: 40) // Ensure minHeight is sufficient
                        .padding(8)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
            .padding()
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .foregroundColor(.white)
    }
}
