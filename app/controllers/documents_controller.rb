# Allows a user to create a new document by uploading a document
# We are currently only limiting to text files. We will later
# add support for doc, pdf, markdown format and html
class DocumentsController < ApplicationController

  before_filter :new_document, :only => [:new]
  before_filter :own_document, :only => [:update, :delete, :edit]
  before_filter :public_document, :only => [:show, :stats, :translation]

  before_filter :filter_params, :only => [:update, :create]

  # create a new document to generate basic layout
  def new
  end

  # edit the document
  def edit
  end

  # save the document
  def create
    @document = current_user.documents.new(params[:document], :as => :uploadable_user)
    if @document.save
      flash[:notice] = "Document created"
      redirect_to edit_document_path(@document)
    else
      flash[:notice] = "Error updating document"
      render :new
    end
  end

  # update the document
  def update
    @document.find_translation.create_document!(params[:document].delete :file)
    # create document sequences and sentences

    if @document.update_attributes(params[:document], :as => :uploadable_user)
      flash[:notice] = "Document updated"
      redirect_to documents_path
    else
      flash[:notice] = "Error updating document"
      render :edit
    end
  end

  # delete the document
  def delete
    flash[:error] = "No can't do"
    redirect_to :documents_path
  end

  # If a file is uploaded, parse it , pass it back to the user via AJAX
  def upload
    respond_to do |format|
      format.json do
        render :json => {:success => true, :data => raw_post_data}.to_json if request.xhr?
      end
    end
  end

  # Get all documents present
  def all
    @documents = Document.visible.all
    render 'index'
  end

  def translation
    @translation  = @document.find_translation(params[:lang])
    @data         = @translation.sequenced_sentences
  end

  # Show statistics on a document
  def stats
  end

  def show
    @source_translation = @document.source_translation
    @data               = @source_translation.sequenced_sentences
  end

  # Get all documents by user
  def index
    @documents = current_user.documents
  end


  protected

  # filter any parameters. Catch bad guys
  def filter_params
  end

  # Create a new document from scratch
  def new_document
    @document = Document.new
  end

  # check if a user owns the document so that you can allow him to save the document
  def own_document
    # Check for ownership
    @document = current_user.documents.find_by_slug(params[:id])
  end

  # load public documents
  def public_document
    @document = Document.visible.find_by_slug(params[:id])
  end

end
