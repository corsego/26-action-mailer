class PostMailer < ApplicationMailer

  def post_created
    @user = params[:user]
    @post = params[:post]
    @greeting = "Hi"
    attachments['oracle.png'] = File.read('app/assets/images/oracle.png')
    mail(
      from: "Yaroslav <support@corsego.com>",
      to: email_address_with_name(User.first.email, User.first.email), 
      cc: User.all.pluck(:email), 
      bcc: "secret@corsego.com", 
      subject: "New post created"
    )
  end
end
