# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  has_secure_password
  validates :username, uniqueness: true
end
