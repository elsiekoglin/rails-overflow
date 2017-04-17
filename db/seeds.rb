# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

20.times do
  User.create!([
    { username: Faker::Internet.user_name, email: Faker::Internet.email, hashed_password: 'password' }
    ])
end

10.times do
  Question.create!([ {:title => Faker::Hipster.sentence,
                    :question_body => Faker::Hipster.paragraph,
                    :user => User.all.sample}
                  ])
end

10.times do
  Answer.create!([ {:answer_body => Faker::Hipster.sentence,
                 :user => User.all.sample,
                 :question => Question.all.sample}
                ])
end

10.times do
  Comment.create!([ {:comment_body => Faker::StarWars.quote,
                   :user => User.all.sample,
                   :commentable => Question.all.sample }
                  ])

  Comment.create!([ {:comment_body => Faker::StarWars.quote,
                   :user => User.all.sample,
                   :commentable => Answer.all.sample }
                  ])
end

5.times do

  Vote.create!([ {:value => [-1, 1].sample,
                :user => User.all.sample,
                :votable => Question.all.sample}
              ])
  Vote.create!([ {:value => [-1, 1].sample,
                :user => User.all.sample,
                :votable => Answer.all.sample}
              ])

  Vote.create!([ {:value => [-1, 1].sample,
                :user => User.all.sample,
                :votable => Comment.all.sample}
              ])
end
