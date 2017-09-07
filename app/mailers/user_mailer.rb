class UserMailer < ApplicationMailer
  default from: 'tibrewaldeepak00@gmail.com'

  def welcome_email(user,wishlist)
    @user = user
    @items=wishlist
    @url  = 'http://gmail.com/login'
    mail(to: @user.email, subject: 'Confirmation On your shopping Wishlist')
  end
end
