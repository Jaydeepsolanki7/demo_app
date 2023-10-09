class SeatBookingMailer < ApplicationMailer
  def acceptance_email(current_user, seat)
    @seat = seat
    mail(to: current_user.email, subject: 'Seat Booking Accepted')
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
