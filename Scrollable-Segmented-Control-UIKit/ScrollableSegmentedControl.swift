//
//  ScrollableSegmentedControl.swift
//  Scrollable-Segmented-Control-UIKit
//
//  Created by Caner Ates on 10.05.2024.
//

import UIKit

protocol ScrollableSegmentedControlDelegate: AnyObject {
    func didButtonTapped(at index: Int)
}

class ScrollableSegmentedControl: UIControl {
    
    weak var delegate: ScrollableSegmentedControlDelegate?
    
    var selectedIndex: Int = -1 {
        didSet {
            updateSelectedIndex()
            scrollButtonCentered()
        }
    }
    
    var buttons: [String] = [] {
        didSet {
            setupScrollableStack()
            setupButtons()
            selectedIndex = 0
        }
    }
    
    var buttonTitleColor: UIColor = .white
    var buttonBackgroundColor: UIColor = .black
    var buttonHighlightedTitleColor: UIColor = .black
    var buttonHighlightedBackgroundColor: UIColor = .white
    var buttonCornerRadius: CGFloat = 17
    var buttonBorderWidth: CGFloat = 2.5
    var buttonBorderColor: UIColor = .white.withAlphaComponent(0.2)
    var buttonHorizontalInsetPadding: CGFloat = 15
    var buttonHeight: CGFloat = 35
    var scrollBackgroundColor: UIColor = .clear
    var scrollHeight: CGFloat = 35
    var stackSpacing: CGFloat = 8
    var stackHorizontalPadding: CGFloat = 10
    
    private var segmentedButtons: [UIButton] = []
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScrollableStack()
        scrollView.addSubview(stackView)
        addSubview(scrollView)
        print("ScrollableSegmentedControl init")
    }
    
    deinit {
        print("ScrollableSegmentedControl deinit")
    }
    
    override func layoutSubviews() {
        applyConstraints()
    }
    
    private func setupScrollableStack() {
        
        stackView.spacing = stackSpacing
        scrollView.backgroundColor = scrollBackgroundColor
    }
    
    private func setupButtons() {
        
        for (index, title) in buttons.enumerated() {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tag = index
            
            var configuration = UIButton.Configuration.filled()
            configuration.baseBackgroundColor = buttonBackgroundColor
            configuration.baseForegroundColor = buttonTitleColor
            configuration.background.cornerRadius = buttonCornerRadius
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                  leading: buttonHorizontalInsetPadding,
                                                                  bottom: 0,
                                                                  trailing: buttonHorizontalInsetPadding)
            
            var container = AttributeContainer()
            container.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            configuration.attributedTitle = AttributedString(title, attributes: container)
            
            button.configuration = configuration
            button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
            button.layer.cornerRadius = buttonCornerRadius
            button.layer.borderWidth = buttonBorderWidth
            button.layer.borderColor = buttonBorderColor.cgColor
            button.addTarget(self, action: #selector(didButtonTapped(sender: )), for: .touchUpInside)
            
            segmentedButtons.append(button)
            stackView.addArrangedSubview(button)
        }
    }
    
    private func applyConstraints() {
        
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: scrollHeight)
        ]
        
        let stackViewConstraints = [
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: stackHorizontalPadding),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -stackHorizontalPadding),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(scrollViewConstraints)
        NSLayoutConstraint.activate(stackViewConstraints)
    }
    
    private func updateSelectedIndex() {
        for (index, button) in segmentedButtons.enumerated() {
            if index == selectedIndex {
                button.configuration?.baseBackgroundColor = buttonHighlightedBackgroundColor
                button.configuration?.baseForegroundColor = buttonHighlightedTitleColor
                button.layer.borderColor = UIColor.clear.cgColor
            } else {
                button.configuration?.baseBackgroundColor = buttonBackgroundColor
                button.configuration?.baseForegroundColor = buttonTitleColor
                button.layer.borderColor = buttonBorderColor.cgColor
            }
        }
    }
    
    private func scrollButtonCentered() {
        guard let button = segmentedButtons.first(where: { $0.tag == selectedIndex }) else { return }
        let selectedButtonFrame = button.frame
        let centeredOffsetX = selectedButtonFrame.midX - scrollView.bounds.width / 2
        let centeredOffsetY = selectedButtonFrame.midY - scrollView.bounds.height / 2
        let centeredOffset = CGPoint(x: max(0, min(centeredOffsetX, scrollView.contentSize.width - scrollView.bounds.width)), y: max(0, min(centeredOffsetY, scrollView.contentSize.height - scrollView.bounds.height)))
        
        UIView.animate(withDuration: 0.5) {
            self.scrollView.setContentOffset(centeredOffset, animated: false)
        }
        
    }
    
    @objc func didButtonTapped(sender: UIButton) {
        guard selectedIndex != sender.tag else { return }
        selectedIndex = sender.tag
        
        if let delegate = delegate {
            delegate.didButtonTapped(at: sender.tag)
        } else {
            print("Error: Set the delegate for ScrollableSegmentedControl in order to use delegate methods")
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
