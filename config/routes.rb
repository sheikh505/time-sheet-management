Rails.application.routes.draw do

  #******************     Devise   ***********************************


  devise_for :users, :path_prefix=> 'd',:controllers =>
      {
          :registrations => "users/registrations",
          :sessions => "users/sessions",

      }

  resources :tasks
  resources :projects
#*********************   Attendence  ******************************#

  resources :attendences do
    collection do
      get :find_employee_attendence
      get :find_monthly_attendence
      get :user_monthly_attendence

       get :user_attendences

    end
  end


  #************************ user Controller ********************************#

       resources :users

  # post :employee_attendences, to: "employee_attendences#create", as: :employee_attendence




  #************************  Employee Attendence  ***************************#

  resources :employee_attendences do
    collection do

      get :show_attendence
      get :find_attendence
      get :employee_absent
      get :find_absent


    end
  end



#************************  Projects routes  ***************************#

   resources :projects do

     member do

       get :project_assign
       patch :assign_project_user

     end
   end


  get '/project/:id/all_tasks', to: "projects#project_task", as: "all_tasks"
  get '/project/users_project', to: "projects#users_project"
  get '/users_list', to: "users#users_list"

  # get '/attendence/:id/user_attendences', to: 'attendences#user_attendences'
  #



    resources :tasks do
      member do
        get :assign_task
        patch :assign
        get :user_task_list
        get :users_tasks

      end
    end
      # collection do
      #   get :project_tasks
      # end


  root 'home#index'

end
