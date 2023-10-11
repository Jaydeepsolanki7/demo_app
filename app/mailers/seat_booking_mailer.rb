class SeatBookingMailer < ApplicationMailer
  def acceptance_email(reservation)
    @reservation = reservation
    mail to: @reservation.user.email, subject: 'Seat Booking Accepted'
  end

  def pending_email(reservation)
    @reservation = reservation
    mail to: @reservation.user.email, subject: 'Seat Booking Pending'
  end

  def rejection_email(user, seat)
    @reservation = reservation
    mail to: @reservation.user.email, subject: 'Seat Booking Rejected'
  end

  def booking_status_email(status)
    @status = status
    mail(to: @reservation.user.email, subject: "Your booking status #{@status}")
  end
end
