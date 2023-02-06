class User < ApplicationRecord
  after_initialize :standardize_email

  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  validates_presence_of :password

  has_many :favorites, dependent: :destroy

  private

  def standardize_email
    self.email = email.downcase if email
  end
end
