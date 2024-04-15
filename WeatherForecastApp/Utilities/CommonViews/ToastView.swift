//
//  ToastView.swift
//  WeatherForecastApp
//
//  Created by Naveen Guruvu on 15/04/24.
//

import SwiftUI

struct ToastMessageModel: Equatable, Hashable {
    var id = UUID()
    var title: String?

    static func == (lhs: ToastMessageModel, rhs: ToastMessageModel) -> Bool {
        return lhs.id == rhs.id && lhs.title == rhs.title
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
    }
}

struct ToastView: ViewModifier {
    @Binding var showToast: Bool
    var message: ToastMessageModel?

    func body(content: Content) -> some View {
        ZStack {
            content
            toastView
        }
    }

    private var toastView: some View {
        VStack {
            Spacer()
            if showToast {
                Button {
                    showToast = false
                } label: {
                    MessageView(message: message?.title ?? "")
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 40, trailing: 16))
                }
            }
        }
        .animation(.linear(duration: 0.3), value: showToast)
        .transition(.opacity)
    }
}
