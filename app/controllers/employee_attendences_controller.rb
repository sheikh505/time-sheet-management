class EmployeeAttendencesController < ApplicationController

  def show_attendence
    @user=User.find(params[:id])
    @user_attendence= @user.attendences.where("attendences.created_at > ? AND attendences.created_at < ?", Time.now.beginning_of_month, Time.now.end_of_month)

    @user_present_count=@user_attendence.where(status: true).count
    @user_absent_count= @user_attendence.where(status: false).count
    @user_total_attendence= @user_attendence.count

  end


   def find_attendence

     # @user=User.find(params[:id])
      # @atendenc_user = current_user.attendences.where('extract(month from datee) == params[:month]' )
     # @user_attendence = Attendence.where('extract(month from datee) == params[:month]')

     @user_attendence = current_user.attendences.where("cast(strftime('%m',datee) as int) = ? ", params[:month])
     @user_attendence =  @user_attendence.where("cast(strftime('%Y',datee) as int) = ? ", params[:year])
     @user_count= @user_attendence.count

     @user_absent_count= @user_attendence.where(status: false).count
     @user_present_count= @user_attendence.where(status: true).count
     # @user_total_attendence= current_user.attendences.count
     #  if current_user.present?
     #    #Create month wise groups of messages
     #    @month_wise_sorted_attendence  = current_user.attendences{ |t| (Date::MONTHNAMES[t.date.month] + " " + t.date.year.to_s) }
     #    end
     # # @user_atendence = Attendence.where('etract(month from datee)=params[:month], @user_id= current_user.id ',@user_id= current_user.id)

   end



  def employee_absent

    @user_atendence_absent = current_user.attendences.where("attendences.datee > ? AND attendences.datee < ?", Time.now.beginning_of_month, Time.now.end_of_month)
    @user_absentt= @user_atendence_absent.where(status: false)
    @user_present_count = @user_atendence_absent.where(status: true).count
    @user_absent_count= @user_atendence_absent.where(status: false).count
    @user_total_attendence= @user_atendence_absent.count

  end


  def find_absent

    # @user=User.find(params[:id])
    # @atendenc_user = current_user.attendences.where('extract(month from datee) == params[:month]' )
    # @user_attendence = Attendence.where('extract(month from datee) == params[:month]')

    @user_attendence_absent = current_user.attendences.where("cast(strftime('%m', datee) as int) = ?", params[:month] )
    @user_attendence_absent= @user_attendence_absent.where("cast(strftime('%Y',datee) as int) = ? ", params[:year])

    @user_absent_countt = @user_attendence_absent.where(status:false).count
    @user_present_countt= @user_attendence_absent.where(status: true).count
    @user_total_attendence= @user_attendence_absent.count




    #  if current_user.present?
    #    #Create month wise groups of messages
    #    @month_wise_sorted_attendence  = current_user.attendences{ |t| (Date::MONTHNAMES[t.date.month] + " " + t.date.year.to_s) }
    #    end
    # # @user_atendence = Attendence.where('etract(month from datee)=params[:month], @user_id= current_user.id ',@user_id= current_user.id)

  end

  private

  def user_params

     params.require(:user).permit(:name,:age,:gender,:city,:phone,:email, :role_id,:password,:password_confirmation)

  end

  def atendence_params

    params.require(:user).permit(:date, :check_in,:check_out,:status,:user_id)

  end

end
