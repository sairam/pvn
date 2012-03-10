Pvn::Application.routes.draw do
  devise_for :users

  # Home - Statistics
  resources   :home,    :only => [:index]

  # Documents
  resources   :documents do # should support edit in the future
    get       '/:slug' => 'documents#translation', :on => :member, :as => :translation, :constraints => { :slug => /[a-z][a-z]/ }
    get       :stats,   :on => :member
    get       :all,     :on => :collection
    post      :upload,  :on => :collection
  end

  resource    :activity, :only =>[] do
    get       :my
    get       '/:user' => 'activity#show', :as => :user
  end


  root        :to => 'home#index'
end
#== Route Map
# Generated on 10 Mar 2012 23:49
#
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#            user_password POST   /users/password(.:format)      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#        user_registration POST   /users(.:format)               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#               home_index GET    /home(.:format)                home#index
#     translation_document GET    /documents/:id/:slug(.:format) documents#translation
#           stats_document GET    /documents/:id/stats(.:format) documents#stats
#            all_documents GET    /documents/all(.:format)       documents#all
#         upload_documents POST   /documents/upload(.:format)    documents#upload
#                documents GET    /documents(.:format)           documents#index
#                          POST   /documents(.:format)           documents#create
#             new_document GET    /documents/new(.:format)       documents#new
#            edit_document GET    /documents/:id/edit(.:format)  documents#edit
#                 document GET    /documents/:id(.:format)       documents#show
#                          PUT    /documents/:id(.:format)       documents#update
#                          DELETE /documents/:id(.:format)       documents#destroy
#              my_activity GET    /activity/my(.:format)         activities#my
#            user_activity GET    /activity/:user(.:format)      activity#show
#                     root        /                              home#index
