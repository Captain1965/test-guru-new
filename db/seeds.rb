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

tests = Test.create!([{ title: 'Ruby', level: 2, category_id: category[0].id, author_id: user[0].id },
                      { title: 'Ruby', level: 3, category_id: category[0].id, author_id: user[0].id },
                      { title: 'Rails', level: 2, category_id: category[1].id, author_id: user[1].id }])
question = Question.create!([{ body: 'List the names of the printing methods?', test_id: test[1].id },
                             { body: 'What is mean method to_s?', test_id: test[0].id },
                             { body: 'How to launch the rails console', test_id: test[2].id }])
Answer.create!([{ body: 'I known methods : puts, print, p, pp, ap', correct: true, question_id: question[0].id },
                { body: 'I known methods : puts, print, chomp', correct: false, question_id: question[0].id },
                { body: 'The method converts the argument to the string type', correct: true, question_id: question[1].id }, { body: 'The method converts the argument to the integer type', correct: false, question_id: question[1].id },
                { body: 'The commad is rails c', correct: true, question_id: question[2].id },
                { body: 'The commad is rails s', correct: false, question_id: question[2].id }])
