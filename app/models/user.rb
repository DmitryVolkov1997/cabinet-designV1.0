class User < ApplicationRecord

    validates :first_name, length: {minimum: 1, maximum: 50}, allow_blank: false, presence: true

    validates :last_name, length: {minimum: 1, maximum: 50}, allow_blank: false, presence: true

    validates :phone, format: { with: /\A\d+\z/, message: "разрешен ввод только цифр" }

    validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "введите корректный email-адрес" }

    validates :first_name, uniqueness: { scope: [ :last_name, :email ] }

    has_one :request, dependent: :destroy, :inverse_of => :user

end



