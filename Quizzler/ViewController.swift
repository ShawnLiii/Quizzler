import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    var questionsLibrary = [
    Question(text: "Lightning never strikes in the same place twice.", correctAnswer: false),
    Question(text: "If you cry in space the tears just stick to your face.", correctAnswer: true),
    Question(text: "If you cut an earthworm in half, both halves can regrow their body.", correctAnswer: false),
    Question(text: "Humans can distinguish between over a trillion different smells.", correctAnswer: true),
    Question(text: "Adults have fewer bones than babies do.", correctAnswer: true),
    Question(text: "Napoleon Bonaparte was extremely short.", correctAnswer: false),
    Question(text: "Goldfish only have a memory of three seconds.", correctAnswer: false),
    Question(text: "There are more cells of bacteria in your body than there are human cells.", correctAnswer: true),
    Question(text: "Your fingernails and hair keep growing after you die.", correctAnswer: false),
    Question(text: "Birds are dinosaurs.", correctAnswer: true),
    Question(text: "It costs the U.S. Mint more to make pennies and nickels than the coins are actually worth.", correctAnswer: true),
    Question(text: "Water spirals down the plughole in opposite directions in the northern and southern hemispheres.", correctAnswer: false),
    Question(text: "Buzz Aldrin was the first man to urinate on the moon.", correctAnswer: true),
    Question(text: "Twinkies have an infinite shelf life.", correctAnswer: false),
    Question(text: "Humans can’t breathe and swallow at the same time.", correctAnswer: true),
    Question(text: "The popular image of Santa Claus – chubby, bearded, in red and white clothes – was invented by Coca-Cola for an ad campaign.", correctAnswer: false),
    Question(text: "The top of the Eiffel Tower leans away from the sun.", correctAnswer: true),
    Question(text: "Drinking alcohol kills brain cells.", correctAnswer: false),
    Question(text: "The owner of the company that makes Segways died after accidentally driving his Segway off a cliff.", correctAnswer: true),
    Question(text: "Donald Trump is a Monkey", correctAnswer: true)
    ]
    var questions = Array<Question>()
    var questionNumber = 0
    var score = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        getQuestions()
        questionLabel.text = questions[0].questionText
    }


    @IBAction func answerPressed(_ sender: UIButton)
    {
        checkAnswer(tag: sender.tag)
        questionNumber += 1
        nextQuestion()
        updateUI()
    }
    
    func getQuestions()
    {
        // remove all elements from questions Array
        questions.removeAll()
        // pick random 13 questions from questions Library array
        var questionIndex: Set<Int> = []
        while(questionIndex.count < 13)
        {
            let randomNum = Int.random(in: 0...questionsLibrary.count - 1)
            if (questionIndex.contains(randomNum) == false)
            {
                 questionIndex.insert(randomNum)
            }
            else
            {
                continue
            }
        }
        
        for Index in questionIndex
        {
            // Append questions to the questions Array
            questions.append(questionsLibrary[Index])
        }
    }
    
    func updateUI()
    {
      progressLabel.text = "\(questionNumber + 1 )/13"
      progressBar.frame.size.width = (view.frame.width/13) * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion()
    {
        // check if the questions number is greater than 13
        if questionNumber < 13
        {
            //controller get data from model, and then pass it to view (MVC)
            questionLabel.text = questions[questionNumber].questionText
            
        }
        else
        {
            startOver()
        }
    }
    
    
    func checkAnswer(tag: Int) {

        if tag == 1
        {
            if questions[questionNumber].answer == true
            {
                ProgressHUD.showSuccess("Correct!")
                score += 50
                scoreLabel.text = "Total Score: \(score)"
            }
            else
            {
                ProgressHUD.showError("InCorrect!")
                score -= 30
                scoreLabel.text = "Total Score: \(score)"
            }
        }
        else
        {
            if questions[questionNumber].answer == false
            {
                ProgressHUD.showSuccess("Correct!")
                score += 50
                scoreLabel.text = "Total Score: \(score)"
            }
            else
            {
                ProgressHUD.showError("InCorrect!")
                score -= 30
                scoreLabel.text = "Total Score: \(score)"
            }
        }
    }
    
    
    func startOver()
    {
       questionNumber = 0
       score = 0
       let alert = UIAlertController(title: "Perfect!", message: "You have done all the questions, try it again？", preferredStyle: .alert)
       alert.addAction(UIAlertAction(title: "Try It Again", style: .default, handler: { (_) in
           self.getQuestions()
           self.questionLabel.text = self.questions[0].questionText
           self.scoreLabel.text = "Total Score: 0"
           self.updateUI()
       }))
       present(alert, animated: true, completion: nil)
    }
    

    
}
