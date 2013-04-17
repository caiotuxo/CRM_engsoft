class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.string :pergunta
      t.text :resposta
      t.references :assunto

      t.timestamps
    end
    add_index :faqs, :assunto_id
  end
end
