class SeatBookingMailer < ApplicationMailer
  def acceptance_email(seat)
    @seat = seat
    mail(to: "yashraj@gmail.com", subject: 'Seat Booking Accepted')
  end

  def pending_email(user, seat)
    @user = user
    @seat = seat
    mail(to: user.email, subject: 'Seat Booking Pending')
  end

  def rejection_email(user, seat)
    @user = user
    @seat = seat
    mail(to: user.email, subject: 'Seat Booking Rejected')
  end
end
