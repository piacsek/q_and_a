class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.references :question,
                   null: false,
                   foreign_key: { to_table: :questions, name: 'fk_answer_to_question' }
      t.references :provider,
                   null: false,
                   foreign_key: { to_table: :users, name: 'fk_answer_to_user' }

      t.timestamps
    end
  end
end
