//
//  CategoryDataSave.swift
//  QuizGameMidApp
//
//  Created by Elsever on 31.12.24.
//

import Foundation
import CoreData
class DataSaver {
    let categories = CategoryData(context: AppDelegate().persistentContainer.viewContext)
    let questions = QuestionDataClass(context: AppDelegate().persistentContainer.viewContext)
    let options = OptionsDataClass(context: AppDelegate().persistentContainer.viewContext)
    var helper = FileManagerHelper()
    var userArray = [UserModel]()
    var categoryArray = [QuizCategory]()
    
    func dataSave(name: String) {
        helper.readData { data in
            userArray = data
        }
        let category = CategoryModel(category: "Sport Quiz", categoryColor: "Sport Purple", categoryimage: "sportQuiz", percent: 0, user: name, countNum: 0, miniImage: "sportMini")
        let category2 = CategoryModel(category: "Music Quiz", categoryColor: "Music Yellow", categoryimage: "musicQuiz", percent: 0, user: name, countNum: 0, miniImage: "musicMini")
        let category3 = CategoryModel(category: "Science Quiz", categoryColor: "Scince Blue", categoryimage: "scienceQuiz", percent: 0, user: name, countNum: 0, miniImage: "scienceMini")
        let category4 = CategoryModel(category: "Game Quiz", categoryColor: "Game Green", categoryimage: "gameQuiz", percent: 0, user: name, countNum: 0, miniImage: "gameMini")
        let category5 = CategoryModel(category: "Countries Quiz", categoryColor: "Country Red", categoryimage: "countriesQuiz", percent: 0, user: name, countNum: 0, miniImage: "countryMini")
        
        categories.saving(category: category)
        categories.saving(category: category2)
        categories.saving(category: category3)
        categories.saving(category: category4)
        categories.saving(category: category5)
        
        categories.fetch(completion: { data in
            categoryArray = data
        })
    
    
    }
    
    func questionsSave() {
        UserDefaults.standard.set(true, forKey: "isSaved")
        let option1 = OptionsModel(option: "A. England", option2: "B. France", option3: "C. Russia", category: "Countries Quiz")
        options.saving(options: option1)
        let question1 = QuestionsModel(answer: "A. England", points: 5, question: "Which country is the largest country in the world?",  category: "Countries Quiz", id: 1)
        questions.saving(question: question1)

        let option2 = OptionsModel(option: "A. USA", option2: "B. China", option3: "C. Brazil", category: "Countries Quiz")
        options.saving(options: option2)
        let question2 = QuestionsModel(answer: "B. China",points: 5, question: "Which country has the highest population?", category: "Countries Quiz", id: 2)
        questions.saving(question: question2)


        let option3 = OptionsModel(option: "A. Africa", option2: "B. Asia", option3: "C. Europe", category: "Countries Quiz")
        options.saving(options: option3)
        let question3 = QuestionsModel(answer: "B. Asia", points: 5, question: "Which continent is the largest by land area?", category: "Countries Quiz", id: 3)
        questions.saving(question: question3)


        let option4 = OptionsModel(option: "A. Amazon", option2: "B. Nile", option3: "C. Yangtze", category: "Countries Quiz")
        options.saving(options: option4)
        let question4 = QuestionsModel(answer: "B. Nile", points: 5, question: "What is the longest river in the world?", category: "Countries Quiz", id: 4)
        questions.saving(question: question4)

        let option5 = OptionsModel(option: "A. Indian", option2: "B. Atlantic", option3: "C. Pacific", category: "Countries Quiz")
        options.saving(options: option5)
        let question5 = QuestionsModel(answer: "C. Pacific", points: 5, question: "Which ocean is the largest?", category: "Countries Quiz", id: 5)
        questions.saving(question: question5)

        let option6 = OptionsModel(option: "A. Mount Everest", option2: "B. Kangchenjunga", option3: "C.  Mount Everest", category: "Countries Quiz")
        options.saving(options: option6)
        let question6 = QuestionsModel(answer: "C. Mount Everest", points: 10, question: "What is the highest mountain in the world?", category: "Countries Quiz", id: 6)
        questions.saving(question: question6)

        let option7 = OptionsModel(option: "A. Mercury", option2: "B. Venus", option3: "C. Mars", category: "Countries Quiz")
        options.saving(options: option7)
        let question7 = QuestionsModel(answer: "A. Mercury", points: 10, question: "Which planet is closest to the Sun?", category: "Countries Quiz", id: 7)
        questions.saving(question: question7)

        let option8 = OptionsModel(option: "A. Oxygen", option2: "B. Hydrogen", option3: "C. Carbon", category: "Countries Quiz")
        options.saving(options: option8)
        let question8 = QuestionsModel(answer: "B. Hydrogen", points: 10, question: "What is the most abundant element in the universe?", category: "Countries Quiz", id: 8)
        questions.saving(question: question8)

        let option9 = OptionsModel(option: "A. Saturn", option2: "B. Jupiter", option3: "C. Neptune", category: "Countries Quiz")
        options.saving(options: option9)
        let question9 = QuestionsModel(answer: "B. Jupiter", points: 10, question: "Which planet is the largest in our solar system?", category: "Countries Quiz", id: 9)
        questions.saving(question: question9)

        let option10 = OptionsModel(option: "A. Cheetah", option2: "B. Falcon", option3: "C. Sailfish", category: "Countries Quiz")
        options.saving(options: option10)
        let question10 = QuestionsModel(answer: "A. Cheetah", points: 10, question: "What is the fastest land animal?", category: "Countries Quiz", id: 10)
        questions.saving(question: question10)

        let option11 = OptionsModel(option: "A. Australia", option2: "B. Antarctica", option3: "C. Asia", category: "Countries Quiz")
        options.saving(options: option11)
        let question11 = QuestionsModel(answer: "B. Antarctica", points: 10, question: "Which continent is the coldest?", category: "Countries Quiz", id: 11)
        questions.saving(question: question11)

        let option12 = OptionsModel(option: "A. Leonardo da Vinci", option2: "B. Pablo Picasso", option3: "C. Vincent van Gogh", category: "Countries Quiz")
        options.saving(options: option12)
        let question12 = QuestionsModel(answer: "A. Leonardo da Vinci", points: 10, question: "Who painted the Mona Lisa?", category: "Countries Quiz", id: 12)
        questions.saving(question: question12)

        let option13 = OptionsModel(option: "A. Rome", option2: "B. London", option3: "C. Paris", category: "Countries Quiz")
        options.saving(options: option13)
        let question13 = QuestionsModel(answer: "C. Paris", points: 10, question: "What is the capital of France?", category: "Countries Quiz", id: 13)
        questions.saving(question: question13)

        let option14 = OptionsModel(option: "A. 5", option2: "B. 7", option3: "C. 9", category: "Countries Quiz")
        options.saving(options: option14)
        let question14 = QuestionsModel(answer: "B. 7", points: 10, question: "How many continents are there in the world?", category: "Countries Quiz", id: 14)
        questions.saving(question: question14)

        let option15 = OptionsModel(option: "A. Australia", option2: "B. New Zealand", option3: "C. Canada", category: "Countries Quiz")
        options.saving(options: option15)
        let question15 = QuestionsModel(answer: "A. Australia", points: 10, question: "Which country is known as the Land Down Under?", category: "Countries Quiz", id: 15)
        questions.saving(question: question15)

        let option16 = OptionsModel(option: "A. Oxygen", option2: "B. Water", option3: "C. Carbon Dioxide", category: "Countries Quiz")
        options.saving(options: option16)
        let question16 = QuestionsModel(answer: "B. Water", points: 15, question: "What is H2O commonly known as?", category: "Countries Quiz", id: 16)
        questions.saving(question: question16)

        let option17 = OptionsModel(option: "A. Africa", option2: "B. South America", option3: "C. Europe", category: "Countries Quiz")
        options.saving(options: option17)
        let question17 = QuestionsModel(answer: "A. Africa", points: 15, question: "Which continent is known as the birthplace of humanity?", category: "Countries Quiz", id: 17)
        questions.saving(question: question17)

        let option18 = OptionsModel(option: "A. Australia", option2: "B. Japan", option3: "C. Brazil", category: "Countries Quiz")
        options.saving(options: option18)
        let question18 = QuestionsModel(answer: "A. Australia", points: 15, question: "In which country does bird kiwi lives", category: "Countries Quiz", id: 18)
        questions.saving(question: question18)

        let option19 = OptionsModel(option: "A. 196", option2: "B. 195", option3: "C. 203", category: "Countries Quiz")
        options.saving(options: option19)
        let question19 = QuestionsModel(answer: "A. 196", points: 15, question: "How many countries in the world", category: "Countries Quiz", id: 19)
        questions.saving(question: question19)

        let option20 = OptionsModel(option: "A. Atlantic", option2: "B. Pacific", option3: "C. Indian", category: "Countries Quiz")
        options.saving(options: option20)
        let question20 = QuestionsModel(answer: "B. Pacific", points: 15, question: "Which ocean is the deepest?", category: "Countries Quiz", id: 20)
        questions.saving(question: question20)

        // Question 1
        let option21 = OptionsModel(option: "A. Lionel Messi", option2: "B. Cristiano Ronaldo", option3: "C. Pele", category: "Sport Quiz")
        options.saving(options: option21)
        let question21 = QuestionsModel(answer: "A. Lionel Messi", points: 5, question: "Who won the Ballon d'Or in 2021?", category: "Sport Quiz", id: 1)
        questions.saving(question: question21)

        // Question 2
        let option22 = OptionsModel(option: "A. Sachin Tendulkar", option2: "B. Muttiah Muralitharan", option3: "C. Shane Warne", category: "Sport Quiz")
        options.saving(options: option22)
        let question22 = QuestionsModel(answer: "B. Muttiah Muralitharan", points: 5, question: "Who has taken the most wickets in Test cricket?", category: "Sport Quiz", id: 2)
        questions.saving(question: question22)

        // Question 3
        let option23 = OptionsModel(option: "A. Michael Jordan", option2: "B. Kobe Bryant", option3: "C. LeBron James", category: "Sport Quiz")
        options.saving(options: option23)
        let question23 = QuestionsModel(answer: "A. Michael Jordan", points: 5, question: "Who is widely considered the greatest basketball player of all time?", category: "Sport Quiz", id: 3)
        questions.saving(question: question23)

        // Question 4
        let option24 = OptionsModel(option: "A. Serena Williams", option2: "B. Martina Navratilova", option3: "C. Steffi Graf", category: "Sport Quiz")
        options.saving(options: option24)
        let question24 = QuestionsModel(answer: "A. Serena Williams", points: 5, question: "Who has won the most Grand Slam singles titles in the Open Era?", category: "Sport Quiz", id: 4)
        questions.saving(question: question24)

        // Question 5
        let option25 = OptionsModel(option: "A. Brazil", option2: "B. Germany", option3: "C. Italy", category: "Sport Quiz")
        options.saving(options: option25)
        let question25 = QuestionsModel(answer: "A. Brazil", points: 5, question: "Which country has won the most FIFA World Cups?", category: "Sport Quiz", id: 5)
        questions.saving(question: question25)

        // Question 6
        let option26 = OptionsModel(option: "A. Usain Bolt", option2: "B. Carl Lewis", option3: "C. Michael Johnson", category: "Sport Quiz")
        options.saving(options: option26)
        let question26 = QuestionsModel(answer: "A. Usain Bolt", points: 10, question: "Who holds the world record for the 100m sprint?", category: "Sport Quiz", id: 6)
        questions.saving(question: question26)

        // Question 7
        let option27 = OptionsModel(option: "A. Novak Djokovic", option2: "B. Roger Federer", option3: "C. Rafael Nadal", category: "Sport Quiz")
        options.saving(options: option27)
        let question27 = QuestionsModel(answer: "C. Rafael Nadal", points: 10, question: "Who has won the most French Open titles?", category: "Sport Quiz", id: 7)
        questions.saving(question: question27)

        // Question 8
        let option28 = OptionsModel(option: "A. Boston Celtics", option2: "B. Los Angeles Lakers", option3: "C. Golden State Warriors", category: "Sport Quiz")
        options.saving(options: option28)
        let question28 = QuestionsModel(answer: "A. Boston Celtics", points: 10, question: "Which NBA team has the most championships?", category: "Sport Quiz", id: 8)
        questions.saving(question: question28)

        // Question 9
        let option29 = OptionsModel(option: "A. Tom Brady", option2: "B. Joe Montana", option3: "C. Peyton Manning", category: "Sport Quiz")
        options.saving(options: option29)
        let question29 = QuestionsModel(answer: "A. Tom Brady", points: 10, question: "Who has won the most Super Bowl MVP awards?", category: "Sport Quiz", id: 9)
        questions.saving(question: question29)

        // Question 10
        let option30 = OptionsModel(option: "A. Tiger Woods", option2: "B. Jack Nicklaus", option3: "C. Arnold Palmer", category: "Sport Quiz")
        options.saving(options: option30)
        let question30 = QuestionsModel(answer: "B. Jack Nicklaus", points: 10, question: "Who has won the most major golf championships?", category: "Sport Quiz", id: 10)
        questions.saving(question: question30)

        // Question 11
        let option31 = OptionsModel(option: "A. Wayne Gretzky", option2: "B. Mario Lemieux", option3: "C. Sidney Crosby", category: "Sport Quiz")
        options.saving(options: option31)
        let question31 = QuestionsModel(answer: "A. Wayne Gretzky", points: 10, question: "Who is known as 'The Great One' in ice hockey?", category: "Sport Quiz", id: 11)
        questions.saving(question: question31)

        // Question 12
        let option32 = OptionsModel(option: "A. Formula 1", option2: "B. NASCAR", option3: "C. Le Mans", category: "Sport Quiz")
        options.saving(options: option32)
        let question32 = QuestionsModel(answer: "A. Formula 1", points: 10, question: "In which racing series did Lewis Hamilton become a champion?", category: "Sport Quiz", id: 12)
        questions.saving(question: question32)

        // Question 13
        let option33 = OptionsModel(option: "A. Diego Maradona", option2: "B. Lionel Messi", option3: "C. Zinedine Zidane", category: "Sport Quiz")
        options.saving(options: option33)
        let question33 = QuestionsModel(answer: "A. Diego Maradona", points: 10, question: "Who scored the 'Hand of God' goal?", category: "Sport Quiz", id: 13)
        questions.saving(question: question33)

        // Question 14
        let option34 = OptionsModel(option: "A. Chicago Bulls", option2: "B. Golden State Warriors", option3: "C. Miami Heat", category: "Sport Quiz")
        options.saving(options: option34)
        let question34 = QuestionsModel(answer: "A. Chicago Bulls", points: 10, question: "Which team did Michael Jordan lead to six NBA titles?", category: "Sport Quiz", id: 14)
        questions.saving(question: question34)

        // Question 15
        let option35 = OptionsModel(option: "A. Wimbledon", option2: "B. US Open", option3: "C. Australian Open", category: "Sport Quiz")
        options.saving(options: option35)
        let question35 = QuestionsModel(answer: "A. Wimbledon", points: 10, question: "Which tennis Grand Slam is played on grass courts?", category: "Sport Quiz", id: 15)
        questions.saving(question: question35)

        // Question 16
        let option36 = OptionsModel(option: "A. Thierry Henry", option2: "B. Kylian Mbappé", option3: "C. Zinedine Zidane", category: "Sport Quiz")
        options.saving(options: option36)
        let question36 = QuestionsModel(answer: "B. Kylian Mbappé", points: 15, question: "Who scored the most goals for France in the 2018 World Cup?", category: "Sport Quiz", id: 16)
        questions.saving(question: question36)

        // Question 17
        let option37 = OptionsModel(option: "A. Dallas Cowboys", option2: "B. New England Patriots", option3: "C. Pittsburgh Steelers", category: "Sport Quiz")
        options.saving(options: option37)
        let question37 = QuestionsModel(answer: "B. New England Patriots", points: 15, question: "Which NFL team has won the most Super Bowls in the 21st century?", category: "Sport Quiz", id: 17)
        questions.saving(question: question37)

        // Question 18
        let option38 = OptionsModel(option: "A. Roger Federer", option2: "B. Novak Djokovic", option3: "C. Andy Murray", category: "Sport Quiz")
        options.saving(options: option38)
        let question38 = QuestionsModel(answer: "B. Novak Djokovic", points: 15, question: "Who holds the record for most Grand Slam titles in men's tennis?", category: "Sport Quiz", id: 18)
        questions.saving(question: question38)

        // Question 19
        let option39 = OptionsModel(option: "A. Venus Williams", option2: "B. Serena Williams", option3: "C. Maria Sharapova", category: "Sport Quiz")
        options.saving(options: option39)
        let question39 = QuestionsModel(answer: "B. Serena Williams", points: 15, question: "Which tennis player holds the most Grand Slam singles titles in the Open Era?", category: "Sport Quiz", id: 19)
        questions.saving(question: question39)

        // Question 20
        let option40 = OptionsModel(option: "A. Brazil", option2: "B. Argentina", option3: "C. Germany", category: "Sport Quiz")
        options.saving(options: option40)
        let question40 = QuestionsModel(answer: "A. Brazil", points: 15, question: "Which country has won the most Copa América titles?", category: "Sport Quiz", id: 20)
        questions.saving(question: question40)
        
        
        // Question 1 - Singers
        let option41 = OptionsModel(option: "A. Adele", option2: "B. Beyoncé", option3: "C. Rihanna", category: "Music Quiz")
        options.saving(options: option41)
        let question41 = QuestionsModel(answer: "B. Beyoncé", points: 5, question: "Who is known as 'Queen B' in the music industry?", category: "Music Quiz", id: 1)
        questions.saving(question: question41)

        // Question 2 - Singers
        let option42 = OptionsModel(option: "A. Elvis Presley", option2: "B. Frank Sinatra", option3: "C. Michael Jackson", category: "Music Quiz")
        options.saving(options: option42)
        let question42 = QuestionsModel(answer: "C. Michael Jackson", points: 5, question: "Who is known as the 'King of Pop'?", category: "Music Quiz", id: 2)
        questions.saving(question: question42)

        // Question 3 - Genres
        let option43 = OptionsModel(option: "A. Jazz", option2: "B. Hip-Hop", option3: "C. Rock", category: "Music Quiz")
        options.saving(options: option43)
        let question43 = QuestionsModel(answer: "C. Rock", points: 5, question: "Which genre did The Beatles help popularize?", category: "Music Quiz", id: 3)
        questions.saving(question: question43)

        // Question 4 - Vocal Techniques
        let option44 = OptionsModel(option: "A. Falsetto", option2: "B. Head voice", option3: "C. Belting", category: "Music Quiz")
        options.saving(options: option44)
        let question44 = QuestionsModel(answer: "C. Belting", points: 5, question: "Which vocal technique involves singing with a powerful, strong tone?", category: "Music Quiz", id: 4)
        questions.saving(question: question44)

        // Question 5 - Singers
        let option45 = OptionsModel(option: "A. Whitney Houston", option2: "B. Mariah Carey", option3: "C. Celine Dion", category: "Music Quiz")
        options.saving(options: option45)
        let question45 = QuestionsModel(answer: "B. Mariah Carey", points: 5, question: "Who is known for her impressive 5-octave vocal range?", category: "Music Quiz", id: 5)
        questions.saving(question: question45)

        // Question 6 - Instruments
        let option46 = OptionsModel(option: "A. Trumpet", option2: "B. Trombone", option3: "C. Timpani", category: "Music Quiz")
        options.saving(options: option46)
        let question46 = QuestionsModel(answer: "A. Trumpet", points: 10, question: "Which brass instrument is known for its high-pitched sound?", category: "Music Quiz", id: 6)
        questions.saving(question: question46)

        // Question 7 - Vocal Techniques
        let option47 = OptionsModel(option: "A. Soprano", option2: "B. Tenor", option3: "C. Bass", category: "Music Quiz")
        options.saving(options: option47)
        let question47 = QuestionsModel(answer: "A. Soprano", points: 10, question: "Which vocal range is typically the highest in a choir?", category: "Music Quiz", id: 7)
        questions.saving(question: question47)

        // Question 8 - Genres
        let option48 = OptionsModel(option: "A. Blues", option2: "B. Reggae", option3: "C. Country", category: "Music Quiz")
        options.saving(options: option48)
        let question48 = QuestionsModel(answer: "B. Reggae", points: 10, question: "Which genre originated in Jamaica and was popularized by Bob Marley?", category: "Music Quiz", id: 8)
        questions.saving(question: question48)

        // Question 9 - Singers
        let option49 = OptionsModel(option: "A. Billie Eilish", option2: "B. Taylor Swift", option3: "C. Ariana Grande", category: "Music Quiz")
        options.saving(options: option49)
        let question49 = QuestionsModel(answer: "A. Billie Eilish", points: 10, question: "Which singer is known for her 2019 hit 'Bad Guy'?", category: "Music Quiz", id: 9)
        questions.saving(question: question49)

        // Question 10 - Instruments
        let option50 = OptionsModel(option: "A. Violin", option2: "B. Cello", option3: "C. Viola", category: "Music Quiz")
        options.saving(options: option50)
        let question50 = QuestionsModel(answer: "A. Violin", points: 10, question: "Which string instrument is known for its highest pitch in an orchestra?", category: "Music Quiz", id: 10)
        questions.saving(question: question50)

        // Question 11 - Genres
        let option51 = OptionsModel(option: "A. Hip-Hop", option2: "B. Techno", option3: "C. Punk", category: "Music Quiz")
        options.saving(options: option51)
        let question51 = QuestionsModel(answer: "B. Techno", points: 10, question: "Which genre of electronic dance music originated in Detroit in the 1980s?", category: "Music Quiz", id: 11)
        questions.saving(question: question51)

        // Question 12 - Singers
        let option52 = OptionsModel(option: "A. Bob Dylan", option2: "B. Neil Young", option3: "C. Paul McCartney", category: "Music Quiz")
        options.saving(options: option52)
        let question52 = QuestionsModel(answer: "A. Bob Dylan", points: 10, question: "Who is considered the father of modern folk music?", category: "Music Quiz", id: 12)
        questions.saving(question: question52)

        // Question 13 - Vocal Techniques
        let option53 = OptionsModel(option: "A. Chest voice", option2: "B. Mixed voice", option3: "C. Head voice", category: "Music Quiz")
        options.saving(options: option53)
        let question53 = QuestionsModel(answer: "B. Mixed voice", points: 10, question: "Which vocal technique combines both chest and head voice for a smoother transition?", category: "Music Quiz", id: 13)
        questions.saving(question: question53)

        // Question 14 - Instruments
        let option54 = OptionsModel(option: "A. Guitar", option2: "B. Bass", option3: "C. Keyboard", category: "Music Quiz")
        options.saving(options: option54)
        let question54 = QuestionsModel(answer: "B. Bass", points: 10, question: "Which instrument provides the rhythmic foundation in most rock bands?", category: "Music Quiz", id: 14)
        questions.saving(question: question54)

        // Question 15 - Singers
        let option55 = OptionsModel(option: "A. Aretha Franklin", option2: "B. Tina Turner", option3: "C. Etta James", category: "Music Quiz")
        options.saving(options: option55)
        let question55 = QuestionsModel(answer: "A. Aretha Franklin", points: 10, question: "Who is often referred to as the 'Queen of Soul'?", category: "Music Quiz", id: 15)
        questions.saving(question: question55)

        // Question 16 - Genres
        let option56 = OptionsModel(option: "A. Metal", option2: "B. Punk", option3: "C. Indie", category: "Music Quiz")
        options.saving(options: option56)
        let question56 = QuestionsModel(answer: "A. Metal", points: 15, question: "Which genre is associated with loud guitars, fast tempos, and heavy distortion?", category: "Music Quiz", id: 16)
        questions.saving(question: question56)

        // Question 17 - Singers
        let option57 = OptionsModel(option: "A. John Legend", option2: "B. Sam Smith", option3: "C. Ed Sheeran", category: "Music Quiz")
        options.saving(options: option57)
        let question57 = QuestionsModel(answer: "A. John Legend", points: 15, question: "Which singer's hit song 'All of Me' is a tribute to his wife Chrissy Teigen?", category: "Music Quiz", id: 17)
        questions.saving(question: question57)

        // Question 18 - Instruments
        let option58 = OptionsModel(option: "A. Flute", option2: "B. Oboe", option3: "C. Clarinet", category: "Music Quiz")
        options.saving(options: option58)
        let question58 = QuestionsModel(answer: "C. Clarinet", points: 15, question: "Which woodwind instrument is known for its unique reed sound and is commonly used in jazz?", category: "Music Quiz", id: 18)
        questions.saving(question: question58)

        // Question 19 - Vocal Techniques
        let option59 = OptionsModel(option: "A. Vibrato", option2: "B. Falsetto", option3: "C. Yodeling", category: "Music Quiz")
        options.saving(options: option59)
        let question59 = QuestionsModel(answer: "A. Vibrato", points: 15, question: "Which vocal technique involves a slight variation in pitch to create a richer sound?", category: "Music Quiz", id: 19)
        questions.saving(question: question59)

        // Question 20 - Genres
        let option60 = OptionsModel(option: "A. Soul", option2: "B. Blues", option3: "C. R&B", category: "Music Quiz")
        options.saving(options: option60)
        let question60 = QuestionsModel(answer: "C. R&B", points: 15, question: "Which genre is known for its emotional lyrics and was popularized by artists like Usher and Alicia Keys?", category: "Music Quiz", id: 20)
        questions.saving(question: question60)

        // Question 61
        let option61 = OptionsModel(option: "A. Mario", option2: "B. Sonic", option3: "C. Link", category: "Game Quiz")
        options.saving(options: option61)
        let question61 = QuestionsModel(answer: "A. Mario", points: 5, question: "Who is the iconic plumber in the 'Super Mario' franchise?", category: "Game Quiz", id: 61)
        questions.saving(question: question61)

        // Question 62
        let option62 = OptionsModel(option: "A. Pikachu", option2: "B. Charizard", option3: "C. Bulbasaur", category: "Game Quiz")
        options.saving(options: option62)
        let question62 = QuestionsModel(answer: "A. Pikachu", points: 5, question: "Which Pokémon is the mascot of the Pokémon franchise?", category: "Game Quiz", id: 62)
        questions.saving(question: question62)

        // Question 63
        let option63 = OptionsModel(option: "A. Master Chief", option2: "B. Kratos", option3: "C. Samus", category: "Game Quiz")
        options.saving(options: option63)
        let question63 = QuestionsModel(answer: "A. Master Chief", points: 5, question: "Who is the protagonist of the 'Halo' video game series?", category: "Game Quiz", id: 63)
        questions.saving(question: question63)

        // Question 64
        let option64 = OptionsModel(option: "A. Link", option2: "B. Zelda", option3: "C. Ganondorf", category: "Game Quiz")
        options.saving(options: option64)
        let question64 = QuestionsModel(answer: "A. Link", points: 5, question: "In 'The Legend of Zelda,' who is the main playable character?", category: "Game Quiz", id: 64)
        questions.saving(question: question64)

        // Question 65
        let option65 = OptionsModel(option: "A. Cloud Strife", option2: "B. Squall Leonhart", option3: "C. Tidus", category: "Game Quiz")
        options.saving(options: option65)
        let question65 = QuestionsModel(answer: "A. Cloud Strife", points: 5, question: "Which character is the protagonist in 'Final Fantasy VII'?", category: "Game Quiz", id: 65)
        questions.saving(question: question65)

        // Question 66
        let option66 = OptionsModel(option: "A. The Witcher", option2: "B. Skyrim", option3: "C. Fallout", category: "Game Quiz")
        options.saving(options: option66)
        let question66 = QuestionsModel(answer: "A. The Witcher", points: 10, question: "Which video game series features Geralt of Rivia?", category: "Game Quiz", id: 66)
        questions.saving(question: question66)

        // Question 67
        let option67 = OptionsModel(option: "A. Fortnite", option2: "B. PUBG", option3: "C. Apex Legends", category: "Game Quiz")
        options.saving(options: option67)
        let question67 = QuestionsModel(answer: "B. PUBG", points: 10, question: "Which battle royale game was developed by PUBG Corporation?", category: "Game Quiz", id: 67)
        questions.saving(question: question67)

        // Question 68
        let option68 = OptionsModel(option: "A. Lara Croft", option2: "B. Aloy", option3: "C. Samus Aran", category: "Game Quiz")
        options.saving(options: option68)
        let question68 = QuestionsModel(answer: "A. Lara Croft", points: 10, question: "Which character is known as the Tomb Raider?", category: "Game Quiz", id: 68)
        questions.saving(question: question68)

        // Question 69
        let option69 = OptionsModel(option: "A. Doom", option2: "B. Wolfenstein", option3: "C. Quake", category: "Game Quiz")
        options.saving(options: option69)
        let question69 = QuestionsModel(answer: "A. Doom", points: 10, question: "Which game is credited with popularizing the first-person shooter genre?", category: "Game Quiz", id: 69)
        questions.saving(question: question69)

        // Question 70
        let option70 = OptionsModel(option: "A. Overwatch", option2: "B. Team Fortress 2", option3: "C. Paladins", category: "Game Quiz")
        options.saving(options: option70)
        let question70 = QuestionsModel(answer: "A. Overwatch", points: 10, question: "Which team-based shooter features characters like Tracer and Reaper?", category: "Game Quiz", id: 70)
        questions.saving(question: question70)

        // Question 71
        let option71 = OptionsModel(option: "A. Red Dead Redemption 2", option2: "B. Grand Theft Auto V", option3: "C. Max Payne 3", category: "Game Quiz")
        options.saving(options: option71)
        let question71 = QuestionsModel(answer: "B. Grand Theft Auto V", points: 10, question: "Which game has the fictional city of Los Santos?", category: "Game Quiz", id: 71)
        questions.saving(question: question71)

        // Question 72
        let option72 = OptionsModel(option: "A. Street Fighter", option2: "B. Mortal Kombat", option3: "C. Tekken", category: "Game Quiz")
        options.saving(options: option72)
        let question72 = QuestionsModel(answer: "B. Mortal Kombat", points: 10, question: "Which fighting game series is known for its brutal fatalities?", category: "Game Quiz", id: 72)
        questions.saving(question: question72)

        // Question 73
        let option73 = OptionsModel(option: "A. Super Mario 64", option2: "B. The Legend of Zelda: Ocarina of Time", option3: "C. Metal Gear Solid", category: "Game Quiz")
        options.saving(options: option73)
        let question73 = QuestionsModel(answer: "B. The Legend of Zelda: Ocarina of Time", points: 10, question: "Which game is often considered one of the greatest of all time and features time travel?", category: "Game Quiz", id: 73)
        questions.saving(question: question73)

        // Question 74
        let option74 = OptionsModel(option: "A. Call of Duty", option2: "B. Halo", option3: "C. Battlefield", category: "Game Quiz")
        options.saving(options: option74)
        let question74 = QuestionsModel(answer: "B. Halo", points: 10, question: "Which game introduced the character Master Chief?", category: "Game Quiz", id: 74)
        questions.saving(question: question74)

        // Question 75
        let option75 = OptionsModel(option: "A. Hideo Kojima", option2: "B. Shigeru Miyamoto", option3: "C. Cliff Bleszinski", category: "Game Quiz")
        options.saving(options: option75)
        let question75 = QuestionsModel(answer: "A. Hideo Kojima", points: 10, question: "Who is the creator of the 'Metal Gear' and 'Death Stranding' series?", category: "Game Quiz", id: 75)
        questions.saving(question: question75)

        // Question 76
        let option76 = OptionsModel(option: "A. Sonic the Hedgehog", option2: "B. Super Mario Bros.", option3: "C. Donkey Kong", category: "Game Quiz")
        options.saving(options: option76)
        let question76 = QuestionsModel(answer: "B. Super Mario Bros.", points: 15, question: "Which game is considered one of the greatest platformers of all time and stars a plumber?", category: "Game Quiz", id: 76)
        questions.saving(question: question76)

        // Question 77
        let option77 = OptionsModel(option: "A. Crash Bandicoot", option2: "B. Spyro the Dragon", option3: "C. Rayman", category: "Game Quiz")
        options.saving(options: option77)
        let question77 = QuestionsModel(answer: "A. Crash Bandicoot", points: 15, question: "Which character is a marsupial who embarks on platforming adventures in the 'Crash Bandicoot' series?", category: "Game Quiz", id: 77)
        questions.saving(question: question77)

        // Question 78
        let option78 = OptionsModel(option: "A. Uncharted", option2: "B. Tomb Raider", option3: "C. God of War", category: "Game Quiz")
        options.saving(options: option78)
        let question78 = QuestionsModel(answer: "A. Uncharted", points: 15, question: "Which game series follows the adventures of treasure hunter Nathan Drake?", category: "Game Quiz", id: 78)
        questions.saving(question: question78)

        // Question 79
        let option79 = OptionsModel(option: "A. Tekken", option2: "B. Street Fighter", option3: "C. Mortal Kombat", category: "Game Quiz")
        options.saving(options: option79)
        let question79 = QuestionsModel(answer: "C. Mortal Kombat", points: 15, question: "Which fighting game franchise is known for its 'fatalities'?", category: "Game Quiz", id: 79)
        questions.saving(question: question79)

        // Question 80
        let option80 = OptionsModel(option: "A. Final Fantasy X", option2: "B. Chrono Trigger", option3: "C. Kingdom Hearts", category: "Game Quiz")
        options.saving(options: option80)
        let question80 = QuestionsModel(answer: "A. Final Fantasy X", points: 15, question: "Which game is known for the 'Blitzball' mini-game and the iconic character Yuna?", category: "Game Quiz", id: 80)
        questions.saving(question: question80)

        // Question 81
        let option81 = OptionsModel(option: "A. Water", option2: "B. Oxygen", option3: "C. Nitrogen", category: "Science Quiz")
        options.saving(options: option81)
        let question81 = QuestionsModel(answer: "A. Water", points: 5, question: "What is the most abundant compound on Earth's surface?", category: "Science Quiz", id: 81)
        questions.saving(question: question81)

        // Question 82
        let option82 = OptionsModel(option: "A. Hydrogen", option2: "B. Carbon", option3: "C. Oxygen", category: "Science Quiz")
        options.saving(options: option82)
        let question82 = QuestionsModel(answer: "A. Hydrogen", points: 5, question: "Which element is the most abundant in the universe?", category: "Science Quiz", id: 82)
        questions.saving(question: question82)

        // Question 83
        let option83 = OptionsModel(option: "A. Sun", option2: "B. Moon", option3: "C. Earth", category: "Science Quiz")
        options.saving(options: option83)
        let question83 = QuestionsModel(answer: "A. Sun", points: 5, question: "Which celestial body is the closest to the Earth in terms of size?", category: "Science Quiz", id: 83)
        questions.saving(question: question83)

        // Question 84
        let option84 = OptionsModel(option: "A. Mars", option2: "B. Venus", option3: "C. Jupiter", category: "Science Quiz")
        options.saving(options: option84)
        let question84 = QuestionsModel(answer: "A. Mars", points: 5, question: "Which planet is known as the Red Planet?", category: "Science Quiz", id: 84)
        questions.saving(question: question84)

        // Question 85
        let option85 = OptionsModel(option: "A. Neptune", option2: "B. Uranus", option3: "C. Saturn", category: "Science Quiz")
        options.saving(options: option85)
        let question85 = QuestionsModel(answer: "B. Uranus", points: 5, question: "Which planet was first discovered by telescope in 1781?", category: "Science Quiz", id: 85)
        questions.saving(question: question85)

        // Question 86
        let option86 = OptionsModel(option: "A. Atom", option2: "B. Molecule", option3: "C. Cell", category: "Science Quiz")
        options.saving(options: option86)
        let question86 = QuestionsModel(answer: "A. Atom", points: 10, question: "What is the smallest unit of matter?", category: "Science Quiz", id: 86)
        questions.saving(question: question86)

        // Question 87
        let option87 = OptionsModel(option: "A. H2O", option2: "B. CO2", option3: "C. O2", category: "Science Quiz")
        options.saving(options: option87)
        let question87 = QuestionsModel(answer: "A. H2O", points: 10, question: "What is the chemical formula for water?", category: "Science Quiz", id: 87)
        questions.saving(question: question87)

        // Question 88
        let option88 = OptionsModel(option: "A. Photosynthesis", option2: "B. Respiration", option3: "C. Fermentation", category: "Science Quiz")
        options.saving(options: option88)
        let question88 = QuestionsModel(answer: "A. Photosynthesis", points: 10, question: "Which process do plants use to make food using sunlight?", category: "Science Quiz", id: 88)
        questions.saving(question: question88)

        // Question 89
        let option89 = OptionsModel(option: "A. Gravity", option2: "B. Magnetism", option3: "C. Electricity", category: "Science Quiz")
        options.saving(options: option89)
        let question89 = QuestionsModel(answer: "A. Gravity", points: 10, question: "Which force pulls objects towards the center of the Earth?", category: "Science Quiz", id: 89)
        questions.saving(question: question89)

        // Question 90
        let option90 = OptionsModel(option: "A. Speed", option2: "B. Velocity", option3: "C. Acceleration", category: "Science Quiz")
        options.saving(options: option90)
        let question90 = QuestionsModel(answer: "B. Velocity", points: 10, question: "What is the term for speed with direction?", category: "Science Quiz", id: 90)
        questions.saving(question: question90)

        // Question 91
        let option91 = OptionsModel(option: "A. Acid", option2: "B. Base", option3: "C. Salt", category: "Science Quiz")
        options.saving(options: option91)
        let question91 = QuestionsModel(answer: "B. Base", points: 10, question: "Which substance has a pH greater than 7?", category: "Science Quiz", id: 91)
        questions.saving(question: question91)

        // Question 92
        let option92 = OptionsModel(option: "A. Cell Membrane", option2: "B. Nucleus", option3: "C. Cytoplasm", category: "Science Quiz")
        options.saving(options: option92)
        let question92 = QuestionsModel(answer: "A. Cell Membrane", points: 10, question: "Which part of the cell regulates the entry and exit of substances?", category: "Science Quiz", id: 92)
        questions.saving(question: question92)

        // Question 93
        let option93 = OptionsModel(option: "A. Charles Darwin", option2: "B. Albert Einstein", option3: "C. Isaac Newton", category: "Science Quiz")
        options.saving(options: option93)
        let question93 = QuestionsModel(answer: "A. Charles Darwin", points: 10, question: "Who is known for the theory of evolution by natural selection?", category: "Science Quiz", id: 93)
        questions.saving(question: question93)

        // Question 94
        let option94 = OptionsModel(option: "A. Big Bang", option2: "B. Solar System", option3: "C. Black Hole", category: "Science Quiz")
        options.saving(options: option94)
        let question94 = QuestionsModel(answer: "A. Big Bang", points: 10, question: "What theory explains the origin of the universe?", category: "Science Quiz", id: 94)
        questions.saving(question: question94)

        // Question 95
        let option95 = OptionsModel(option: "A. Carbon", option2: "B. Oxygen", option3: "C. Nitrogen", category: "Science Quiz")
        options.saving(options: option95)
        let question95 = QuestionsModel(answer: "A. Carbon", points: 10, question: "Which element is the foundation of organic life?", category: "Science Quiz", id: 95)
        questions.saving(question: question95)
        
        // Question 96
        let option96 = OptionsModel(option: "A. Newton's Third Law", option2: "B. Newton's Second Law", option3: "C. Newton's First Law", category: "Science Quiz")
        options.saving(options: option96)
        let question96 = QuestionsModel(answer: "B. Newton's Second Law", points: 15, question: "Which of Newton's laws states that force equals mass times acceleration?", category: "Science Quiz", id: 96)
        questions.saving(question: question96)

        // Question 97
        let option97 = OptionsModel(option: "A. Light", option2: "B. Sound", option3: "C. Heat", category: "Science Quiz")
        options.saving(options: option97)
        let question97 = QuestionsModel(answer: "A. Light", points: 15, question: "Which form of energy travels as electromagnetic waves?", category: "Science Quiz", id: 97)
        questions.saving(question: question97)

        // Question 98
        let option98 = OptionsModel(option: "A. Electrons", option2: "B. Protons", option3: "C. Neutrons", category: "Science Quiz")
        options.saving(options: option98)
        let question98 = QuestionsModel(answer: "A. Electrons", points: 15, question: "Which particles in an atom are negatively charged?", category: "Science Quiz", id: 98)
        questions.saving(question: question98)

        // Question 99
        let option99 = OptionsModel(option: "A. Amplitude", option2: "B. Frequency", option3: "C. Wavelength", category: "Science Quiz")
        options.saving(options: option99)
        let question99 = QuestionsModel(answer: "B. Frequency", points: 15, question: "Which property of a wave determines its pitch in sound waves?", category: "Science Quiz", id: 99)
        questions.saving(question: question99)

        // Question 100
        let option100 = OptionsModel(option: "A. Quantum Mechanics", option2: "B. Relativity", option3: "C. Thermodynamics", category: "Science Quiz")
        options.saving(options: option100)
        let question100 = QuestionsModel(answer: "A. Quantum Mechanics", points: 15, question: "Which branch of physics studies the behavior of particles at the atomic and subatomic level?", category: "Science Quiz", id: 100)
        questions.saving(question: question100)



    }
}
