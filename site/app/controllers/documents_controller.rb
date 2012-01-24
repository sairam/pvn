# Allows a user to create a new document by uploading a document
# We are currently only limiting to text files. We will later 
# add support for doc, pdf, markdown format and html
class DocumentsController < ApplicationController

  before_filter :new_document, :only => [:new]
  before_filter :own_document, :only => [:update, :create, :delete, :edit]
  before_filter :public_document, :only => [:show, :stats]

  before_filter :filter_params, :only => [:update, :create]

  # create a new document to generate basic layout
  def new
  end

  # edit the document
  def edit
  end

  # save the document
  def create
    d = current_user.documents.new(params[:document])
    if d.save
      flash[:notice] = "Document created"
      redirect_to index_document_path
    else
      redirect_to new_document_path(@document)
    end
  end

  # update the document
  def update
    d = @document.update_attributes(params[:document])
    if d.save
      flash[:notice] = "Document updated"
    else
      redirect_to edit_document_path(@document)
    end
  end

  # delete the document
  def delete
    flash[:notice] = "No can't do"
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
    @documents = Document.all
    render 'index'
  end

  # Show statistics on a document
  def stats
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
    @document = Document.find_by_slug(params[:id]).visible
  end

end
