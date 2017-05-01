class NotifyMailer < ActionMailer::Base
  default from: "info@opensky.com.co"

  def welcome_email(user, password)
    @user = user
    @password  = password
    if Rails.env.production?
      # mail(to: "ingeniero@opensky.com.co", subject: 'Products Redeemed')
      mail(to: @user.email, subject: 'Bienvenido a Opensky')
    else
      mail(to: "ingeniero@opensky.com.co", subject: 'Bienvenido a Opensky')
    end
  end

  def users_accounts(users)
    @users = users
    if Rails.env.production?
      # mail(to: "ingeniero@opensky.com.co", subject: 'Products Redeemed')
      mail(to: "eduardo.mendoza@opensky.com.co", subject: 'Cuentas Opensky')
    else
      mail(to: "ingeniero@opensky.com.co", subject: 'Cuentas Opensky')
    end
  end

  def notify_redeem(products,user)
    @cartItems = products
    @name=user.name
    @email=user.email
    if Rails.env.production?
      # mail(to: "ingeniero@opensky.com.co", subject: 'Products Redeemed')
      mail(to: "eduardo.mendoza@opensky.com.co", subject: 'Solicitud Canje')
    else
      mail(to: "ingeniero@opensky.com.co", subject: 'Solicitud Canje')
    end
  end

  def notify_redeem_user(products,user)
      @cartItems = products
      @name=user.name
      @email=user.email
      mail(to: @email, subject: 'Canje Exitoso en Opensky')
  end

  def notify_assign_points(user,points,tipo)
      @name=user.name
      @email=user.email
      @points=points
      @type=tipo.name
      if Rails.env.production?
        mail(to: @email, subject: 'Asignacion de Puntos')
      else
        mail(to: "ingeniero@opensky.com.co", subject: 'Asignacion de Puntos')
      end
  end

  def notify_user_cedula(users)
    @users=users
     if Rails.env.production?
      # mail(to: "ingeniero@opensky.com.co", subject: 'Users do not exist')
      mail(to: "eduardo.mendoza@opensky.com.co", subject: 'Users do not exist')
    else
      mail(to: "ingeniero@opensky.com.co", subject: 'Users do not exist')
    end
  end

  def notify_user_badge(user,badge)
    @user= user.name
    @name=badge.name
    @img=badge.image
    @points=badge.points
    mail(to: user.email, subject: 'Felicitaciones has Ganado un Nuevo Bagde')
  end
  def new_user_account(user,pass)
    @name = user.name
    @email = user.email
    @pass = pass
    if Rails.env.production?
      mail(to: @email, subject: 'Nueva cuenta en Opensky')
    else
      mail(to: 'ingeniero@opensky.com.co', subject: 'Nueva cuenta en Opensky')
    end
  end

end
