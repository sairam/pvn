Pvn::Application.routes.draw do
  devise_for :users

  # Home - Statistics
  resources   :home,    :only => [:index]

  # Documents
  resources   :documents do # should support edit in the future
    get       '/:lang' => 'documents#translation', :on => :member, :as => :translation, :constraints => { :lang => /[a-z][a-z]/ }
    get       :stats,   :on => :member
    get       :all,     :on => :collection
    post      :upload,  :on => :collection
  end

  resources   :translations, :only => [:show, :index, :create, :destroy] do
    post      :comment, :on => :collection
    delete    :remove_comment, :on => :member

    post      :approve,   :decline,   :on => :member

    get       ':lang/random' => 'translations#random_language_document', :as => :random_language_document, :constraints => { :lang => /[a-z][a-z]/ }, :on => :collection
    get       'random' => 'translations#random_document', :as => :random_document, :on => :collection

    get       ':lang/random' => 'translations#random_lang_single', :as => :random_lang_single, :constraints => { :lang => /[a-z][a-z]/ }, :on => :member
    get       'random' => 'translations#random_single', :as => :random_single, :on => :member

    get       ':lang/:sequence' => 'translations#sentence', :as => :single, :constraints => { :lang => /[a-z][a-z]/ }, :on => :member
    #get       ':lang' => 'translations#sentences', :as => :single, :constraints => { :lang => /[a-z][a-z]/ }, :on => :member

  end

  resource    :activity, :only =>[] do
    get       :my
    get       '/:user' => 'activity#show', :as => :user
  end


  root        :to => 'home#index'
end
#== Route Map
# Generated on 12 Mar 2012 00:28
#
#                          user_session POST   /users/sign_in(.:format)                    devise/sessions#create
#                  destroy_user_session DELETE /users/sign_out(.:format)                   devise/sessions#destroy
#                         user_password POST   /users/password(.:format)                   devise/passwords#create
#                     new_user_password GET    /users/password/new(.:format)               devise/passwords#new
#                    edit_user_password GET    /users/password/edit(.:format)              devise/passwords#edit
#                                       PUT    /users/password(.:format)                   devise/passwords#update
#              cancel_user_registration GET    /users/cancel(.:format)                     devise/registrations#cancel
#                     user_registration POST   /users(.:format)                            devise/registrations#create
#                 new_user_registration GET    /users/sign_up(.:format)                    devise/registrations#new
#                edit_user_registration GET    /users/edit(.:format)                       devise/registrations#edit
#                                       PUT    /users(.:format)                            devise/registrations#update
#                                       DELETE /users(.:format)                            devise/registrations#destroy
#                            home_index GET    /home(.:format)                             home#index
#                  translation_document GET    /documents/:id/:lang(.:format)              documents#translation {:lang=>/[a-z][a-z]/}
#                        stats_document GET    /documents/:id/stats(.:format)              documents#stats
#                         all_documents GET    /documents/all(.:format)                    documents#all
#                      upload_documents POST   /documents/upload(.:format)                 documents#upload
#                             documents GET    /documents(.:format)                        documents#index
#                                       POST   /documents(.:format)                        documents#create
#                          new_document GET    /documents/new(.:format)                    documents#new
#                         edit_document GET    /documents/:id/edit(.:format)               documents#edit
#                              document GET    /documents/:id(.:format)                    documents#show
#                                       PUT    /documents/:id(.:format)                    documents#update
#                                       DELETE /documents/:id(.:format)                    documents#destroy
#                  comment_translations POST   /translations/comment(.:format)             translations#comment
#            remove_comment_translation DELETE /translations/:id/remove_comment(.:format)  translations#remove_comment
#                   approve_translation POST   /translations/:id/approve(.:format)         translations#approve
#                   decline_translation POST   /translations/:id/decline(.:format)         translations#decline
# random_language_document_translations GET    /translations/:lang/random(.:format)        translations#random_language_document {:lang=>/[a-z][a-z]/}
#          random_document_translations GET    /translations/random(.:format)              translations#random_document
#        random_lang_single_translation GET    /translations/:id/:lang/random(.:format)    translations#random_lang_single {:lang=>/[a-z][a-z]/}
#             random_single_translation GET    /translations/:id/random(.:format)          translations#random_single
#                    single_translation GET    /translations/:id/:lang/:sequence(.:format) translations#sentence {:lang=>/[a-z][a-z]/}
#                          translations GET    /translations(.:format)                     translations#index
#                                       POST   /translations(.:format)                     translations#create
#                           translation GET    /translations/:id(.:format)                 translations#show
#                                       DELETE /translations/:id(.:format)                 translations#destroy
#                           my_activity GET    /activity/my(.:format)                      activities#my
#                         user_activity GET    /activity/:user(.:format)                   activity#show
#                                  root        /                                           home#index
