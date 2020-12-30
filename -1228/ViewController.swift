//
//  ViewController.swift
//  -1228
//
//  Created by PaulFang on 2020/12/28.
//

import UIKit
import AVFoundation

 class ViewController: UIViewController {
    //拉 Outlet
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var answerLable: UILabel!
    @IBOutlet weak var countLable: UILabel!
    //設定questions另一個swift頁面的Question(為了方便整理題庫,所以新增一個swift)
    var questions = [Question]()
    //index指的是[]：arry裡的數字
    var index = 0
    //count指的是題庫的數量
    var count = 1
    //新增一個講話功能（為了更多的練習,我設了一個speak的func)
    var speechUtterance = AVSpeechUtterance()
    func Speak() {
        speechUtterance = AVSpeechUtterance (string: "\(questionLable.text!)")
    speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
    speechUtterance.rate = 0.6
    speechUtterance.postUtteranceDelay = 40
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtterance)
        
}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //製作題目...
    let question1 = Question(description: "『鋼鐵人』有幾套盔甲？", answer: "85套")
        //利用append把題目加入題庫中
        questions.append(question1)
    let question2 = Question(description: "Marvel教父是誰呢？", answer: "史丹。李")
        questions.append(question2)
    let question3 = Question(description: "『鋼鐵人』會愛你幾次呢？", answer: "3000次")
        questions.append(question3)
    let question4 = Question(description: "『鋼鐵人』第一套盔甲在哪製作的？", answer: "山洞")
        questions.append(question4)
    let question5 = Question(description: "電影『黑豹』中最流行的台詞是什麼？", answer: "Wakanda Forever")
        questions.append(question5)
    let question6 = Question(description: "『美國隊長』的盾牌是使用什麼金屬製造而成的？", answer: "汎金屬")
        questions.append(question6)
    let question7 = Question(description: "沒穿『鋼鐵人』盔甲的發明家叫什麼？", answer: "東尼史塔克")
        questions.append(question7)
    let question8 = Question(description: "『美國隊長』最著名的台詞是？", answer: "I can do this all day")
        questions.append(question8)
    let question9 = Question(description: "『浩克』是因為什麼輻射而產生的？", answer: "伽馬輻射")
        questions.append(question9)
    let question10 = Question(description: "電影『終局之戰』裡，奇異博士跟鋼鐵人比的數字是幾呢", answer: "1")
        questions.append(question10)
    let question11 = Question(
        //設定lable，讓在一開始就顯現出題目
        questionLable.text = questions[index].description
        //為了不讓答案出現，所以在這裡建立一個空字串
        answerLable.text = ""
        //設定隨機出題
        questions.shuffle()
 }
    //設定顯示答案
    @IBAction func showAnswerButton(_ sender: Any) {
        answerLable.text = questions [index].answer
    }
    //設定下一題及顯示的答題數
    @IBAction func nextQuestionButton(_ sender: Any) {
        index = index + 1
        count = count + 1
        if count == questions.count + 1{
            count = 1
            index = 0
        }
        questionLable.text =
        questions[index].description
        answerLable.text = ""
        countLable.text = "\(count)"
    }
    //設定重新開始
    @IBAction func restartButton(_ sender: Any) {
        index = 0
        count = 1
        questionLable.text = questions[0].description
        answerLable.text = ""
        countLable.text = "\(count)"

    }
    //設定講話功能鍵
    @IBAction func speakButton(_ sender: UIButton) {
        Speak()
            }
        }
