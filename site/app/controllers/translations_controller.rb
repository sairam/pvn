class TranslationsController < ApplicationController
  before_filter :find_translation, :except => [:index, :create, :remove_comment,:comment]

  before_filter :find_language, :only => [:sentence, :random_language_document, :random_slug_single]

  def sentence
    source_document = @document.find_translation
    @source_sentence = source_document.sentences.find_all_by_sequence_id(params[:sequence].sub("-",".")).first

    translated_document = @document.find_translation(@language.slug)

    @target_sentences = if translated_document == source_document
      flash[:error] = "Source and Target are same. No need to translate"
      nil
    else
      @new_sentence = translated_document.sentences.new
      @new_sentence.sentence_id = @source_sentence.id
      translated_document.sentences.find_all_by_sequence_id_and_sentence_id(params[:sequence].sub("-","."),@source_sentence)
    end
    @comments = @target_sentences.map{|x| x.comment_threads.order('lft ASC')}

  end

  def comment
    @sentence = Sentence.find(params[:sentence][:comment_threads][:commentable_id])
    body = params[:sentence][:comment_threads][:body]
    comment = Comment.build_from(@sentence, current_user, body)
    comment.save
    unless (parent_id = params[:sentence][:comment_threads][:parent_id]).empty?
      parent_comment = Comment.find(parent_id)
      comment.move_to_child_of(parent_comment)
    end
    redirect_to :back
  end

  def remove_comment
    @comment = Comment.find(params[:id]).delete
    redirect_to :back
  end

  def create
    # create sentence
    extra = {:sequence_id => Sentence.find(params[:sentence][:sentence_id]).sequence_id, :user_id => current_user.id}

    translated_document = TranslatedDocument.find(params[:sentence][:translated_document_id])
    sentence = translated_document.sentences.new(params[:sentence].merge(extra), :as => :contributor)

    if sentence.save
      flash[:notice] = 'Created Sentence translation'
    else
      raise sentence.errors.inspect
      flash[:error] = 'Could not save translation'
    end
    redirect_to :back
  end

  def approve
    Sentence.find(params[:id]).approve!
    redirect_to :back
  end

  def decline
    Sentence.find(params[:id]).decline!
    redirect_to :back
  end

  def destroy
    Sentence.find(params[:id]).delete
    redirect_to :back
  end

  # find a random sentence in a specific language
  def random_language_document
    # TODO: find a way to get a random document and translation
    @sequence = Sequence.first

    redirect_to_sentence
  end

  # find a random sentence in any language or in the user's languages (if signed in)
  def random_document
    # TODO: find a way to get a random document and translation
    @sequence = Sequence.first

    redirect_to_sentence
  end

  # find a random sentence to translate in a particular document in a particular language
  def random_slug_single
    # TODO: find a way to get a translation / sequence based on parameters
    @sequence = Sequence.first

    redirect_to_sentence
  end

  # find a random sentence to translate in a particular document in any language or in the user's languages (if signed in)
  def random_single
    # TODO: find a way to get a random random translation based on paramters
    @sequence = Sequence.first

    redirect_to_sentence
  end

  def index
    @documents = Document.visible.all
    # summary of what we display in show method
  end

  def show
    # detailed reports of translations, contributors etc
  end

  private

  def redirect_to_sentence
    redirect_to single_translation_path(*@sequence.document_language_sequence_param)
  end

  def find_translation
    @document = Document.visible.find_by_slug(params[:id])
  end

  def find_language
    @language = Language.find_by_slug(params[:slug])
  end

end