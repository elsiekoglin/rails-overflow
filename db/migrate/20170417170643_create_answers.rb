class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :answer_body, null: false
      t.boolean :star, default: false
      t.integer :user_id, null: false
      t.integer :question_id, null: false

      t.timestamps null: false
    end
  end
end
