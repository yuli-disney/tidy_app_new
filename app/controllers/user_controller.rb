class UserController < ApplicationController
    def login_form
    end
    

    def create
        @user=User.new(username: params[:username], password: params[:password])
        @user.save
        session[:user_id] = @user.id
        session[:user_name] = @user.username
        redirect_to("/users/new")
    end

    def login
        @user = User.find_by(username: params[:username], password: params[:password])
        if @user
          session[:user_id] = @user.id
          session[:user_name] = @user.username
          redirect_to("/")
        else
          @error_message = "名前とパスワードが一致しません"
          redirect_to("/posts/login")
        end
      end

    def logout
      session[:user_id] = nil
      redirect_to("/posts/login")
    end

    def new

    end

end
