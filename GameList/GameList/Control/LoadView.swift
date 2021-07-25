//
//  LoadView.swift
//  GameList
//
//  Created by Egor Lass on 25.07.2021.
//

import UIKit

class LoadView: UIView {

    let activity = UIActivityIndicatorView(style: .large)

    override func layoutSubviews() {
        super.layoutSubviews()
        activity.center = center
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3)
        addSubview(activity)
        activity.hidesWhenStopped = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
