class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  def as_json(options={})
    {
      id: id,
      title: title,
      description: description,
      user_id: user_id
    }
  end
end