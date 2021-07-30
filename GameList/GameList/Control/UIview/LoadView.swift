//
//  LoadView.swift
//  GameList
//
//  Created by Egor Lass on 25.07.2021.
//

import UIKit

class LoadView: UIView {
    private lazy var activity = UIActivityIndicatorView(style: .medium)
    private lazy var containerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.backgroundColor = AppColor.darkBlue
        view.layer.cornerRadius = 8.0
        return view
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.center = center
        activity.center = center
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = AppColor.blue
        addSubview(containerView)
        activity.color = .white
        addSubview(activity)
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
        let alpha: CGFloat = isLoading ? 0.75 : 0.0
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
