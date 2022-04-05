# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!([{ login: 'Peter', password: 'Road' },
                     { login: 'Vlad', password: '621' }])

category = Category.create!([{ title: 'Frontend' },
                             { title: 'Backend' },
                             { title: 'Other' }])

test = Test.create!([{ title: 'Ruby', level: 2, category: category[0], author: user[0] },
                      { title: 'Ruby', level: 3, category: category[0], author: user[0] },
                      { title: 'Rails', level: 2, category: category[1], author: user[1] }])

question = Question.create!([{ body: 'List the names of the printing methods?', test: test[1] },
                             { body: 'What is mean method to_s?', test: test[0] },
                             { body: 'How to launch the rails console', test: test[2] }])

Answer.create!([{ body: 'I known methods : puts, print, p, pp, ap', correct: true, question: question[0] },
                { body: 'I known methods : puts, print, chomp', correct: false, question: question[0] },
                { body: 'The method converts the argument to the string type', correct: true, question: question[1] },
                { body: 'The method converts the argument to the integer type', correct: false, question: question[1] },
                { body: 'The commad is rails c', correct: true, question: question[2] },
                { body: 'The commad is rails s', correct: false, question: question[2] }])
