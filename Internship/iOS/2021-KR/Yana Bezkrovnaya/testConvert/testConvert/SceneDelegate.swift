//
//  SceneDelegate.swift
//  testConvert
//
//  Created by mac on 28.09.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let form = FormVC.loadFromNib()
        let navigationController = UINavigationController(rootViewController: form)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

