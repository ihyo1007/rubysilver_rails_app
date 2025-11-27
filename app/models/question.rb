class Question < ApplicationRecord
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices, allow_destroy: true

  # 重複なしのカテゴリ一覧を返す
  def self.split_categories
    pluck(:category)
      .map { |c| c.split(' / ') }
  end
  # カテゴリー一覧を取得
  def self.all_categories
    split_categories.flatten.uniq
  end
  
  # 検索：どちらかに含まれればヒット
  scope :by_category, ->(cat) {
    return all if cat.blank?
    where("category LIKE ? OR category LIKE ?", "#{cat} /%", "%/ #{cat}")
  }
end
