//  CustomSegmentTwo.swift
//  custom-segment
//
//  Created by Nijat Hamid on 11/13/24.


import UIKit

class CustomSegmentTwo: UIView {

    
    @IBOutlet var tabLabels: [UILabel]! {
        didSet{
            tabLabels.enumerated().forEach { index, label in
                label.textColor = index == 0 ? .white : .lightGray
                let gesture = UITapGestureRecognizer(target: self, action: #selector(tabTapped))
                label.isUserInteractionEnabled = true
                label.addGestureRecognizer(gesture)
               }
        }
    }
    @IBOutlet weak var tabBackgroundWidth: NSLayoutConstraint!
    @IBOutlet weak var tabBackground: UIView!
    @IBOutlet weak var tabBackgroundCenter: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    @objc private func tabTapped(_ sender: UITapGestureRecognizer) {
        guard let view = sender.view else {return}
        align(to: view)
    }
    
    private func align (to view:UIView) {
        tabBackgroundCenter.isActive = false
        tabBackgroundCenter = tabBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        tabBackgroundCenter.isActive = true
        tabBackgroundWidth.isActive = false
        tabBackgroundWidth = tabBackground.widthAnchor.constraint(equalTo: view.widthAnchor)
        tabBackgroundWidth.isActive = true
        
        guard let selectedLabel = view as? UILabel else { return }
        tabLabels.forEach { label in
            label.textColor = label == selectedLabel ? .white : .lightGray
            }
        
        UIView.transition(with: tabBackground, duration: 0.3, options: .curveEaseInOut, animations: {
            self.layoutIfNeeded()
        })

    }
    private func setupViews() {
        guard let view = Bundle.main.loadNibNamed("CustomSegmentTwo", owner: self, options: nil)?.first as? UIView else {return}
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
