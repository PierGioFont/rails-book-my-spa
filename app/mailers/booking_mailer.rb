class BookingMailer < ApplicationMailer

  def booking_confirmation(booking)
    @booking = booking
    @user = @booking.user
    @massage = @booking.massage
    mail(to: @user.email, subject: 'You have booked a massage!')
  end
end

