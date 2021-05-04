//
//  LoginFormViewController.swift
//  clientVK
//
//  Created by S D on 25.04.2021.
//

import UIKit

class LoginFormViewController: UIViewController {
    
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)

        let tap  =  UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        guard identifier == "LoginSegue" else {
            return false
        }
        
        let isLoginPasswordCorrect = loginTextField.text == "admin" && passwordTextField.text == "123"
           
        if isLoginPasswordCorrect {
            return true
        } else {
            showErrorAlert()
            
        }
                
        return false
    }
    
    private func showErrorAlert() {
       
        // Создаем контроллер
        let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
        // Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel)  {  [weak self]  _  in
            self?.passwordTextField.text = ""
            self?.loginTextField.text = ""
        }
        // Добавляем кнопку на UIAlertController
        alert.addAction(action)
        // Показываем UIAlertController
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    @objc func hideKeyboard() {
        scrollView?.endEditing(true)
        }

    
    
    
    
    // Когда клавиатура появляется
        @objc func keyboardWasShown(notification: Notification) {
            
            // Получаем размер клавиатуры
            let info = notification.userInfo! as NSDictionary
            let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
            
            // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
            self.scrollView?.contentInset = contentInsets
            scrollView?.scrollIndicatorInsets = contentInsets
        }
        
        //Когда клавиатура исчезает
        @objc func keyboardWillBeHidden(notification: Notification) {
            // Устанавливаем отступ внизу UIScrollView, равный 0
            let contentInsets = UIEdgeInsets.zero
            scrollView?.contentInset = contentInsets
        }
    
    
    
    @IBAction func login(_ sender: Any) {
        
        print("Button pressed")
        
        if loginTextField.text == "admin" && passwordTextField.text == "123" {
            print("Login success")
                    }  else  {
            print("Login error")
            
        }
        
    }
    
    
    
}
