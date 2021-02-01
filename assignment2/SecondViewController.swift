//
//  SecondViewController.swift
//  assignment2
//
//  Created by Tomiris Sayat on 31.01.2021.
//

import UIKit

protocol VarDelegate {
    func passData()->Int
}

class SecondViewController: UIViewController, VarDelegate {
   
    

    var score = 0
    var questionNum = 1
    @IBOutlet weak var questionNumLabel: UILabel!
    
    @IBOutlet weak var option1Text: UIButton!
    @IBOutlet weak var option2Text: UIButton!
    @IBOutlet weak var option3Text: UIButton!
    @IBOutlet weak var option4Text: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var finishB: UIButton!
    @IBOutlet weak var nextButton1: UIButton!
    var questions = [Question]()
    var index = 0
    
    func passData()->Int {
        return score
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finishB.isHidden = true
        
        questionNumLabel.text = "\(questionNum)"
        createQuestions()
        printText(question: questions.first!)
    }
    
    struct Answer {
        let text: String
        let isCorrect: Bool
    }
    
    struct Question {
        let text: String
        let answer: [Answer]
    }
    
    private func printText(question: Question) {
        questionLabel.text = question.text
        let ansIndex = 0
        option1Text.setTitle(question.answer[ansIndex].text, for: .normal)
        option2Text.setTitle(question.answer[ansIndex+1].text, for: .normal)
        option3Text.setTitle(question.answer[ansIndex+2].text, for: .normal)
        option4Text.setTitle(question.answer[ansIndex+3].text, for: .normal)
    }
    
    private func createQuestions(){
        //1
        questions.append(Question(text: "23% of the photocopier faults worldwide are caused by what?", answer: [
            Answer(text: "people photocopying their faces", isCorrect: false),
            Answer(text: "people photocopying their hands", isCorrect: true),
            Answer(text: "people photocopying their food", isCorrect: false),
            Answer(text: "people photocopying their pets", isCorrect: false)
        ]))
        //2
        questions.append(Question(text: "Which of the following doesn't echo?", answer: [
            Answer(text: "a falling pebble", isCorrect: false),
            Answer(text: "a duck's quack", isCorrect: true),
            Answer(text: "a book that was slammed shut", isCorrect: false),
            Answer(text: "a frog's croak", isCorrect: false)
        ]))
        //3
        questions.append(Question(text: "If you yelled for 8 years, 7 months, and 6 days you have produced enough sound energy to what?", answer: [
            Answer(text: "shatter glass", isCorrect: false),
            Answer(text: "produce a small earthquake", isCorrect: false),
            Answer(text: "make someone deaf", isCorrect: false),
            Answer(text: "heat up 1 cup of coffee", isCorrect: true)
        ]))
        //4
        questions.append(Question(text: "The Barbie doll has ______ careers.", answer: [
            Answer(text: "exactly 201", isCorrect: false),
            Answer(text: "less than 50", isCorrect: false),
            Answer(text: "more than 80", isCorrect: true),
            Answer(text: "exactly 72", isCorrect: false)
        ]))
        //5
        questions.append(Question(text: "How many children did president John Tyler have?", answer: [
            Answer(text: "15", isCorrect: true),
            Answer(text: "4", isCorrect: false),
            Answer(text: "12", isCorrect: false),
            Answer(text: "8", isCorrect: false)
        ]))
        //6
        questions.append(Question(text: "In 1952, the first T.V. commercial aired. What was it for?", answer: [
            Answer(text: "Magna-Doodle", isCorrect: false),
            Answer(text: "Slinky", isCorrect: false),
            Answer(text: "Barbie", isCorrect: false),
            Answer(text: "Mr. Potato Head", isCorrect: true)
        ]))
        //7
        questions.append(Question(text: "How many children did president John Tyler have?", answer: [
            Answer(text: "15", isCorrect: true),
            Answer(text: "4", isCorrect: false),
            Answer(text: "12", isCorrect: false),
            Answer(text: "8", isCorrect: false)
        ]))
        //8
        questions.append(Question(text: "How many gallons of paint is needed to cover the outside of the Whitehouse?", answer: [
            Answer(text: "150", isCorrect: false),
            Answer(text: "425", isCorrect: false),
            Answer(text: "570", isCorrect: true),
            Answer(text: "135", isCorrect: false)
        ]))
        //9
        questions.append(Question(text: "No word in the English language rhymes with ____.", answer: [
            Answer(text: "caterpillar", isCorrect: false),
            Answer(text: "buttocks", isCorrect: false),
            Answer(text: "cube", isCorrect: false),
            Answer(text: "month", isCorrect: true)
        ]))
        //10
        questions.append(Question(text: "Americans spend approximately how much on Valentine's Day candy in a year?", answer: [
            Answer(text: "$98,100", isCorrect: false),
            Answer(text: "$1,105,000", isCorrect: true),
            Answer(text: "$3,156,00", isCorrect: false),
            Answer(text: "$10,325,000", isCorrect: false)
        ]))
    }
    
    private func checkAnswer(indexTapped: Int, button: UIButton) {
        if questions[index].answer[indexTapped].isCorrect == true {
            score += 1
            button.backgroundColor = .green
        } else {
            button.backgroundColor = .red
        }
    }
    
    private func nextQuestion() {
        if index == 8 {
            nextButton1.setTitle("Finish", for: .normal)
        }
            questionNum += 1
            questionNumLabel.text = "\(questionNum)"
            index += 1
            printText(question: questions[index])
        
    }
    @IBAction func nextButton(_ sender: UIButton) {
            option1Text.backgroundColor = .white
            option2Text.backgroundColor = .white
            option3Text.backgroundColor = .white
            option4Text.backgroundColor = .white
            
            option1Text.isEnabled = true
            option2Text.isEnabled = true
            option3Text.isEnabled = true
            option4Text.isEnabled = true
        if index == 8 {
            nextButton1.isHidden = true
            finishB.isHidden = false
        }
        
        nextQuestion()
    }

    @IBAction func finishButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "LastViewController") as! LastViewController
        vc.delegate = self
        vc.total = score
        present(vc, animated: true, completion: nil)
//        performSegue(withIdentifier: "mySegue2", sender: vc)
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    private func prevQuestion() {
        questionNum -= 1
        questionNumLabel.text = "\(questionNum)"
        index -= 1
        printText(question: questions[index])
    }
    
    @IBAction func prevButton(_ sender: UIButton) {
        if index == 0 {
            let alert = UIAlertController(title: "No previous question", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(alert, animated: true)
        } else {
            option1Text.backgroundColor = .white
            option2Text.backgroundColor = .white
            option3Text.backgroundColor = .white
            option4Text.backgroundColor = .white
            
            option1Text.isEnabled = false
            option2Text.isEnabled = false
            option3Text.isEnabled = false
            option4Text.isEnabled = false
            prevQuestion()
        }
    }
    
    @IBAction func option1Tapped(_ sender: Any) {
        checkAnswer(indexTapped: 0, button: sender as! UIButton)
        option2Text.isEnabled = false
        option3Text.isEnabled = false
        option4Text.isEnabled = false
    }
    
    @IBAction func option2Tapped(_ sender: Any) {
        checkAnswer(indexTapped: 1, button: sender as! UIButton)
        option1Text.isEnabled = false
        option3Text.isEnabled = false
        option4Text.isEnabled = false
    }
    
    @IBAction func option3Tapped(_ sender: Any) {
        checkAnswer(indexTapped: 2, button: sender as! UIButton)
        option2Text.isEnabled = false
        option1Text.isEnabled = false
        option4Text.isEnabled = false
    }
    @IBAction func option4Tapped(_ sender: Any) {
        checkAnswer(indexTapped: 3, button: sender as! UIButton)
        option2Text.isEnabled = false
        option3Text.isEnabled = false
        option1Text.isEnabled = false
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
