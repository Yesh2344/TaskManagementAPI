class User < ApplicationRecord
  has_secure_password
  has_many :tasks

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def as_json(options={})
    {
      id: id,
      name: name,
      email: email,
      tasks: tasks
    }
  end
end