class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :question_body, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
