class Book < ApplicationRecord
  #has_one_attached :title #Listモデルにtitleとbodyに加えて画像を扱うためのimageカラムが追記された
  #has_one_attached :body

  validates :title, presence: true #「必須入力」の設定
  validates :body, presence: true #「必須入力」の設定
end