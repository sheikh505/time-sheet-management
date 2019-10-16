class TasksController < ApplicationController


  before_action :set_task, only: [:show, :edit, :update, :destroy ,:assign]

  layout "application"


  # GET /tasks
  # GET /tasks.json

  #===================== Assign Task TO user on admin site ======================== #

  def assign_task

    @task= Task.find(params[:id])
    @project= @task.project
    @project_user = @project.users

  end


  def assign

      @task = Task.find_by(id: params[:task][:task_id])
      @user=User.where(id: params[:tasks_users][:user_ids])
      @task.users << @user

      redirect_to task_path
  end
  #=============================    End of  Assign Task  ===================================== #




  #======================== User Associated  Project Task List on user site ===========================#

  def users_tasks

    @user_project = Project.find(params[:id])
    # @user_tasks = @user_project.tasks.where(project_id: @user_project.id)
    @user_tasks = current_user.tasks.where(project_id: @user_project.id)

  end





   #======================== CRUD OPERATION  ===========================#

  def index

    @tasks = Task.order( 'project_id ASC' ).all

  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    # byebug
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new

  end

  # GET /tasks/1/edit

  def edit


  end

  # POST /tasks
  # POST /tasks.json
  def create

    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update

    respond_to do |format|

      if @task.update(task_params)

        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }

      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end

    end

  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :user_id,:description, :duedate, :project_id,:state)
    end

  def user_params
    params.require(:user).permit(:name,:age,:gender,:city,:email,:password,:password_confirmation)
  end




end
