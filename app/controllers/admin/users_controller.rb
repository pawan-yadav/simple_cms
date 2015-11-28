module Admin
  # All admin controllers inherit from Admin class
  class UsersController < AdminController
    before_action :authenticate_user!
    before_action :set_user, only: [:show, :edit, :update]
    before_action :validate_user

    def index
      @users = User.all.order('email ASC')
    end

    def new
      @user = User.new
    end

    def edit
    end

    def create
      @user = User.new(
        email: params[:user][:email],
        passwor: params[:user][:password],
        password_confirmation: params[:user][:password_confirmation]
      )

      if @user.save
        flash[:notice] = 'User successfully created.'
        redirect_to controller: 'admin/users'
      else
        render action: 'new'
      end
    end

    def update
      if user_params[:password].blank?
        user_params.delete('password')
        user_params.delete('password_confirmation')
      end

      if @user.update(user_params)
        flash[:notice] = 'User successfully updated.'
        redirect_to action: 'edit'
      else
        render action: 'edit'
      end
    end

    def destroy
      @user = User.find(params[:user_id])

      @user.destroy unless @user.id == 1

      respond_to do |format|
        format.js { list_refresh }
      end
    end

    private

    def list_refresh
      @users = User.all.order('email ASC')
      render(file: 'admin/users/list_refresh.js.erb')
    end

    def set_user
      @user = User.find(params[:id])
    end

    def validate_user
      return true if User::CAN_ACCESS_USERS == 'true' || current_user.id == 1
      flash[:alert] = 'You do not have access.'
      redirect_to '/admin'
    end

    def user_params
      params.require(:user).permit(
        :is_admin,
        :email,
        :password,
        :password_confirmation,
        :remember_me
      )
    end
  end
end
