class UserMailer < ApplicationMailer
	default from: 'notifications@qa.com'
   
   def new_survey_email(user)
      @user = user
      mail(to: "dasudaykumar017@gmail.com", subject: 'Welcome to My Awesome Site')
   end
end
