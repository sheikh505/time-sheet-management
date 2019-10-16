class AttendencesController < ApplicationController
  before_action :set_attendence, only: [:show, :edit, :update, :destroy]

  # layout "custom_layouts/admin"
  # layout "custom_layouts/admin"

  layout "application"


  # GET /attendences
  # GET /attendences.json

  def index

    @attendences = Attendence.where(datee: Date.today)
    @attendence = Attendence.new

  end

  # GET /attendences/1
  # GET /attendences/1.json


  def find_employee_attendence
    @attendences = Attendence.where("cast(strftime('%m',datee) as int) = ? ", params[:month]).order('datee ').all
    @attendences = @attendences.where("cast(strftime('%Y',datee) as int) = ? ", params[:year]).order('datee ASC').all

  end

  def find_monthly_attendence

    # @user=User.find(params[:id])
    @attendences = Attendence.where(user_id: params[:id])
    @user= @attendences.where("cast(strftime('%m',datee) as int) = ? ", params[:month])

    # @attendences = Attendence.where("cast(strftime('%m',datee) as int) = ? ", params[:month])

  end


  # def users_list
  #   @users=User.all
  # end

  ###---------------------------- singel user attendences  ----------------------###
  def user_attendences

    @user=User.find(params[:id])
    @user_attendences= @user.attendences.where("attendences.created_at > ? AND attendences.created_at < ?", Time.now.beginning_of_month, Time.now.end_of_month)
    @user_present = @user_attendences.where(status: true).count
    @user_absent = @user_attendences.where(status: false).count
    @user_total_attendence= @user_attendences.count

  end

  def user_monthly_attendence

    @user = User.find(params[:user_id])

    @user_attendences = @user.attendences.where("cast(strftime('%m', datee) as int) = ?", params[:month] )
    @user_attendences =  @user_attendences.where("cast(strftime('%Y', datee) as int) = ?", params[:year] )
    @user_present = @user_attendences.where(status: true).count
    @user_absent = @user_attendences.where(status: false).count
    @user_totle_attendences = @user_attendences.count

  end



  def show
  end

  # GET /attendences/new
  def new

    # session[:user_id] = params[:]
    # @attendance_exist = Attendance.where(['=? and date(created_at)=?', session[:tgc_id], Date.today])
    @attendence = Attendence.new

  end

  # GET /attendences/1/edit

  def edit
  end

  # POST /attendences
  # POST /attendences.json
  def create


    @attendence = Attendence.where(datee:Date.today ,user_id:params[:attendence][:user_id])



    if @attendence.count == 0

      @attendence = Attendence.new(attendence_params)

      respond_to do |format|
        if @attendence.save
          format.html { redirect_to @attendence, notice: 'Attendence was successfully created.' }
          format.json { render :show, status: :created, location: @attendence }
        else

          format.html { render :new }
          format.json { render json: @attendence.errors, status: :unprocessable_entity }
        end
      end

    elsif @attendence.count > 0
      redirect_to users_path
      flash[:error] = {error:"your Attendence has already been created."}

      # format.json { render json: "your attendences has alredy been updated", status: :unprocessable_entity }
    end

  end
  # PATCH/PUT /attendences/1
  # PATCH/PUT /attendences/1.json
  def update
    respond_to do |format|
      if @attendence.update(attendence_params)
        format.html { redirect_to @attendence, notice: 'Attendence was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendence }
      else
        format.html { render :edit }
        format.json { render json: @attendence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendences/1
  # DELETE /attendences/1.json
  def destroy
    @attendence.destroy
    respond_to do |format|
      format.html { redirect_to attendences_url, notice: 'Attendence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_attendence
    @attendence = Attendence.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.

  def user_params
    params.require(:user).permit(:image,:name,:age,:gender,:city,:phone,:address,:email,:password,:password_confirmation,:role_id)
  end

  def attendence_params
    params.require(:attendence).permit(:datee, :check_in, :check_out, :status, :user_id)
  end

end
