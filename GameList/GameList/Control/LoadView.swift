//
//  LoadView.swift
//  GameList
//
//  Created by Egor Lass on 25.07.2021.
//

import UIKit

class LoadView: UIView {

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8)
        view.layer.cornerRadius = 8.0
        return view
    }()
    let activity = UIActivityIndicatorView()

    override func layoutSubviews() {
        super.layoutSubviews()
        activity.center = center
        containerView.center = center
        containerView.frame.size = CGSize(width: 32, height: 32)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3)
        addSubview(containerView)
        containerView.addSubview(activity)
        activity.hidesWhenStopped = true
        isHidden = true

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoadView {
    func setLoading(_ isLoading: Bool) {

        if isLoading {
            self.isHidden = !isLoading
        }
        isLoading ? activity.startAnimating() : activity.stopAnimating()
        let alpha: CGFloat = isLoading ? 0.3 : 0.0
        UIView.animate(withDuration: 0.25,
                       animations: { [weak self] in
                        if let self = self {
                            self.alpha = alpha
                        }

                       }, completion: { [weak self] _ in
                        if let self = self {
                            self.isHidden = !isLoading
                        }
                       })
    }
}
