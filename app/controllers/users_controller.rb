class UsersController < ApplicationController


  def index


    # if current_user.role.name == "Admin"
    #
    #  @role= Role.where(name: params[:employee])
    #
    #  @users = User.where(role_id: @role.id)
    #
    # else
    #
    #   @role= Role.where(name: params[:manager])
    #
    #   @users = User.where(role_id: @role.id)
    #
    # end
    # debugger

    if current_user.role.name == "Admin"

        if params[:employee].present?


          @role= Role.where(name: params[:employee]).first
          @users = User.where(role_id: @role.id)
          @attendence= Attendence.new

          # render :layout => "custom_layouts/admin"


        elsif params[:manager].present?

            @role= Role.where(name: params[:manager]).first
            @users = User.where(role_id: @role.id)

            @attendence= Attendence.new

            # render :layout => "custom_layouts/admin"

        else

          @users = User.all
          @attendence= Attendence.new
           # render :layout => "custom_layouts/admin"

        end


    elsif current_user.role.name == "Manager"

           # render :layout => "/custom_layouts/manager"
          @attendence= Attendence.new


    elsif current_user.role.name == "Employee"

      # @users=User.all

       # render :layout => "/custom_layouts/employee"
      @attendence= Attendence.new

      # render  :layout => "application"
    else

      render :layout => "application"

    end

  end


  def users_data_list

    
  end



    def users_list

      @users= User.all

    end


  def show
    @user=User.find(params[:id])

  end


  def edit

    @user = User.find(params[:id])

  end


  def update

    @user=User.find(params[:id])

    if @user.update(user_params)

      redirect_to users_path(@user),notice:  'User was successfully updated.'

    else

      render 'edit',notice:  'User was successfully updated.'

    end

  end


  def destroy
    
    @user= User.find(params[:id])
    @user.destroy
    redirect_to users_path(@user), notice:  'User was successfully destroyed.'

  end


  private

  def user_params

    params.require(:user).permit(:name,:image,:age,:gender,:city,:phone,:address,:email,:password,:password_confirmation,:role_id)

  end



end
