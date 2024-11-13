//  CustomSegment.swift
//  custom-segment
//
//  Created by Nijat Hamid on 11/13/24.



import UIKit

class CustomSegment: UIView {
    
    @IBOutlet weak var tabBottomLine: NSLayoutConstraint!
    @IBOutlet weak var tabBackground: UIView!
    @IBOutlet weak var tabBottomLineWidth: NSLayoutConstraint!
    @IBOutlet var tabLabels: [UILabel]! {
        didSet {
            tabLabels.enumerated().forEach { index, label in
                label.textColor = index == 0 ? .black : .lightGray
                let gesture = UITapGestureRecognizer(target: self, action: #selector(tabTapped))
                label.isUserInteractionEnabled = true
                label.addGestureRecognizer(gesture)
               }
        }
    }
    
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
        
        tabBottomLine.isActive = false
        tabBottomLine = tabBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        tabBottomLine.isActive = true
        tabBottomLineWidth.isActive = false
        tabBottomLineWidth = tabBackground.widthAnchor.constraint(equalTo: view.widthAnchor)
        tabBottomLineWidth.isActive = true
        
        
        UIView.transition(with: tabBackground, duration: 0.5, options: .curveEaseInOut, animations: {
            self.layoutIfNeeded()
        },completion: {_ in
            guard let selectedLabel = view as? UILabel else { return }
            self.tabLabels.forEach { label in
                label.textColor = label == selectedLabel ? .black : .lightGray
                }})
    }
    
    private func setupViews() {
        guard let view = Bundle.main.loadNibNamed("CustomSegment", owner: self, options: nil)?.first as? UIView else {return}
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
