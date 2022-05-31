Rails.application.routes.draw do
  #get 'home/index'
  devise_for :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"
  get 'landing', to:"home#landing"
  get 'leave', to:"home#leave"
  get 'managerlanding', to: 'manager#managerlanding'

  resources :designations
  resources :holidays
  resources :leaves
  resources :projects_managements
  resources :employees
  resources :attendances
  resources :employee_details
  resources :addresses
  resources :employee_leaves

  #patch 'employees', to: 'employees#create'
  #post 'employees' , to: 'employees#create'
  #post 'employees', to: 'employees#create'

  #admin_routes
  #get 'adminhome', to:"admin#adminhome"
  #get 'employeemanagement', to: "admin#employeemanagement"
  
  
  #get 'adminhome', to:"admin#adminhome"
  #post 'leaveform', to: "admin#create"
  #get 'leaveform', to:"admin#leaveform"
  
  #get 'index', to: "designations#index"
  #get 'designationform', to: "designation#designationform"
  #post 'designationform', to: "designation#create"
 
  #get 'projectmanagement', to: "project#projectmanagement"
  #get 'projectform', to: "project#projectform"
  #post 'projectform' ,to: "project#create"
  

  #get 'holidaysmanagement', to: "holiday#holidaysmanagement"
  #get 'holidaysform', to: "holiday#holidaysform"
  #post 'holidaysform', to: "holiday#create"
end
