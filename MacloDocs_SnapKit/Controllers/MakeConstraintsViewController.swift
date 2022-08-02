//
//  MakeConstraintsViewController.swift
//  MacloDocs_SnapKit
//
//  Created by Gerardo Valencia on 1/08/22.
//

import SnapKit
import UIKit

class MakeConstraintsViewController: UIViewController {
    /*---------------------------------*/
    /* MARK: UI Elements */
    /*---------------------------------*/
    private var greenView: UIView = .init()
    private var pinkView: UIView = .init()

    /*---------------------------------*/
    /* MARK: Lifecycle */
    /*---------------------------------*/
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 41/255, green: 42/255, blue: 46/255, alpha: 0.75)
        self.greenView.backgroundColor = .green
        self.pinkView.backgroundColor = .systemPink

        self.setupUISnapKit()

        // Uncomment for layout anchors case
        // self.setupUILayoutAnchors()

        // Uncomment for frame use case
        // self.setupUIFrame()
    }

    /*---------------------------------*/
    /* MARK: UI Init */
    /*---------------------------------*/
    func setupUILayoutAnchors() {
        self.view.addSubview(self.greenView)
        self.greenView.translatesAutoresizingMaskIntoConstraints = false
        self.greenView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150).isActive = true
        self.greenView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 90).isActive = true
        self.greenView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        self.greenView.heightAnchor.constraint(equalToConstant: 80).isActive = true

        self.view.addSubview(self.pinkView)
        self.pinkView.translatesAutoresizingMaskIntoConstraints = false
        self.pinkView.topAnchor.constraint(equalTo: self.greenView.bottomAnchor, constant: 100).isActive = true
        self.pinkView.leftAnchor.constraint(equalTo: self.greenView.rightAnchor, constant: -20).isActive = true
        self.pinkView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        self.pinkView.heightAnchor.constraint(equalToConstant: 75).isActive = true
    }

    func setupUIFrame() {
        self.view.addSubview(self.greenView)
        self.greenView.frame = CGRect(x: 90, y: 150, width: 80, height: 80)

        self.view.addSubview(self.pinkView)
        self.pinkView.frame = CGRect(x: 90 + (80 - 20), y: 150 + 80 + 100, width: 75, height: 75)
    }

    func setupUISnapKit() {
        self.view.addSubview(self.greenView)
        self.greenView.snp.makeConstraints { make in
            make.top.equalTo(self.view).offset(150)
            make.left.equalTo(self.view).offset(90)
            make.size.equalTo(CGSize(width: 80, height: 80))
        }

        self.view.addSubview(self.pinkView)
        self.pinkView.snp.makeConstraints { make in
            make.top.equalTo(self.greenView.snp.bottom).offset(100)
            make.left.equalTo(self.greenView.snp.right).offset(-20)
            make.size.equalTo(CGSize(width: 75, height: 75))
        }
    }
}
