//
//  AttributStringView.swift
//  SwiftUILearning
//
//  Created by Shohjahon Rakhmatov on 19/04/25.
//

import SwiftUI

struct AttributStringView: View {
    
    var text: AttributedString {
        let string = AttributedString("Hello world!")
        return string
    }
    
    var body: some View {
        VStack {
            Text(text)
            ConsentLabelView(
                        onOfferTap: {
                            print("SwiftUI: Offer tapped")
                            // Trigger SDK behavior
                        },
                        onPrivacyTap: {
                            print("SwiftUI: Privacy tapped")
                            // Trigger SDK behavior
                        }
                    )
                    .frame(height: 100)
        }
    }
}

#Preview {
    ConsentTextView()
}

import SwiftUI

struct ConsentTextView: View {
    @State private var offerTapped = false
    @State private var privacyTapped = false

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("Davom etish tugmasini bosish orqali siz")
                Button {
                    
                } label: {
                    Text("Ommaviy oferta ")
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.green)
                        .underline()
                }
                Text("va")
            }
            HStack(spacing: 0) {
                Button {
                    
                } label: {
                    Text("Maxfiylik siyosati ")
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.green)
                        .underline()
                }
                Text("shartlariga rozilik bildirasiz.")
            }
        }
        .font(.system(size: 12))
    }

    private var attributedString: AttributedString {
        var string = AttributedString("Davom etish tugmasini bosish orqali siz Ommaviy oferta va Maxfiylik siyosati shartlariga rozilik bildirasiz.")

        if let offerRange = string.range(of: "Ommaviy oferta") {
            string[offerRange].foregroundColor = .green
            string[offerRange].underlineStyle = .single
        }

        if let privacyRange = string.range(of: "Maxfiylik siyosati") {
            string[privacyRange].foregroundColor = .green
            string[privacyRange].underlineStyle = .single
        }

        return string
    }
}

struct OfferView: View {
    var body: some View {
        Text("Ommaviy Oferta")
            .font(.title)
            .padding()
    }
}

struct PrivacyView: View {
    var body: some View {
        Text("Maxfiylik Siyosati")
            .font(.title)
            .padding()
    }
}

protocol ConsentLabelDelegate: AnyObject {
    func didTapOffer()
    func didTapPrivacy()
}

class ConsentLabel: UILabel {
    weak var delegate: ConsentLabelDelegate?

    private let offerRange: NSRange
    private let privacyRange: NSRange

    override init(frame: CGRect) {
        let fullText = "Davom etish tugmasini bosish orqali siz Ommaviy oferta va Maxfiylik siyosati shartlariga rozilik bildirasiz."
        let attributed = NSMutableAttributedString(string: fullText)

        offerRange = (fullText as NSString).range(of: "Ommaviy oferta")
        privacyRange = (fullText as NSString).range(of: "Maxfiylik siyosati")

        super.init(frame: frame)

        attributed.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: offerRange)
        attributed.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: offerRange)

        attributed.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: privacyRange)
        attributed.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: privacyRange)

        self.attributedText = attributed
        self.numberOfLines = 0
        self.isUserInteractionEnabled = true

        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.addGestureRecognizer(tap)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
        guard let text = self.attributedText?.string else { return }

        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: bounds.size)
        let textStorage = NSTextStorage(attributedString: attributedText!)

        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        textContainer.lineFragmentPadding = 0
        textContainer.maximumNumberOfLines = numberOfLines
        textContainer.lineBreakMode = lineBreakMode

        let location = gesture.location(in: self)

        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let offset = CGPoint(
            x: (bounds.width - textBoundingBox.width) / 2 - textBoundingBox.minX,
            y: (bounds.height - textBoundingBox.height) / 2 - textBoundingBox.minY
        )

        let touchLocation = CGPoint(x: location.x - offset.x, y: location.y - offset.y)

        let index = layoutManager.characterIndex(for: touchLocation, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)

        if NSLocationInRange(index, offerRange) {
            delegate?.didTapOffer()
        } else if NSLocationInRange(index, privacyRange) {
            delegate?.didTapPrivacy()
        }
    }
}

class MyViewController: UIViewController {
    var delegate: ConsentLabelDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        let consentLabel = ConsentLabel()
        consentLabel.delegate = delegate
        consentLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(consentLabel)
        NSLayoutConstraint.activate([
            consentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            consentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            consentLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
    }
}

struct ConsentLabelView: UIViewControllerRepresentable {
    var onOfferTap: () -> Void
    var onPrivacyTap: () -> Void

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = MyViewController()
        viewController.delegate = context.coordinator
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Nothing to update dynamically
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(onOfferTap: onOfferTap, onPrivacyTap: onPrivacyTap)
    }

    class Coordinator: NSObject, ConsentLabelDelegate {
        let onOfferTap: () -> Void
        let onPrivacyTap: () -> Void

        init(onOfferTap: @escaping () -> Void, onPrivacyTap: @escaping () -> Void) {
            self.onOfferTap = onOfferTap
            self.onPrivacyTap = onPrivacyTap
        }

        func didTapOffer() {
            onOfferTap()
        }

        func didTapPrivacy() {
            onPrivacyTap()
        }
    }
}
