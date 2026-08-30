import SwiftUI

struct ListMenuPicker: View {
    enum WatchStatus: String, CaseIterable {
        case watching = "Смотрю"
        case watched = "Просмотрено"
        case onHold = "Отложено"
        case dropped = "Брошено"
        case planning = "Планирую"
    }

    @State private var selectedStatus: WatchStatus? = nil

    var body: some View {
        // 1. Оборачиваем в HStack, чтобы управлять выравниванием
        HStack {
            Menu {
                ForEach(WatchStatus.allCases, id: \.self) { status in
                    Button(status.rawValue) {
                        selectedStatus = status
                    }
                }
                
                if selectedStatus != nil {
                    Button(role: .destructive) {
                        selectedStatus = nil
                    } label: {
                        Text("Удалить из списка")
                    }
                }
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: "bookmark")
                        .font(.system(size: 16))
                    
                    // Обычный текст, ширина которого динамически меняется
                    Text(selectedStatus?.rawValue ?? "Добавить в список")
                        .font(.system(size: 16, weight: .regular))
                }
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(Color(red: 0.25, green: 0.25, blue: 0.27))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(red: 0.2, green: 0.4, blue: 0.8), lineWidth: 2)
                )
            }
            // 2. Добавляем плавную анимацию при изменении статуса,
            // чтобы ширина фона и рамки менялась мягко, а не скачком
            .animation(.easeInOut(duration: 0.2), value: selectedStatus)
            
            // 3. Spacer выталкивает кнопку влево.
            // Теперь левый край стоит намертво, кнопка сужается/расширяется только вправо.
            Spacer()
        }
        .padding(.horizontal) // Отступы от краев экрана
        .preferredColorScheme(.dark)
    }
}


#Preview {
    ListMenuPicker()
}
