class User < ApplicationRecord
  validates :first_name, length: { minimum: 1, maximum: 50 }, allow_blank: false, presence: true

  validates :last_name, length: { minimum: 1, maximum: 50 }, allow_blank: false, presence: true

  validates :phone, format: { with: /\A\d+\z/, message: 'разрешен ввод только цифр' }

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'введите корректный email-адрес' }

  validate :email_uniqueness

  private

  def email_uniqueness
    errors.add(:base, 'Абитуриент уже существует') if User.where('LOWER(email) = ?', email.downcase).exists?
  end

  validates :first_name, uniqueness: { scope: %i[last_name email] }
 
  has_many :requests, dependent: :destroy

  has_one :request, inverse_of: :user
end
