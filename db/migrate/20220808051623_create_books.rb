class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t| #booksテーブルに以下の行を追加する宣言
      t.string :title #タイトル用のカラム（縦の行）を作成
      t.string :body  #本文用のカラム（縦の行）を作成

      t.timestamps
    end
  end
end
