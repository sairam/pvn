class TranslationsController < ApplicationController
  before_filter :find_translation, :except => [:index]

  before_filter :find_language, :only => [:sentence, :random_language_document, :random_slug_single]

  def sentence
    source_document = @document.find_translation
    @source_sentence = source_document.sequences.find_by_sequence(params[:sequence].sub("-","."))

    translated_document = @document.find_translation(@language.slug)

    @target_sentence = if translated_document = source_document
      flash[:error] = "Source and Target are same. No need to translate"
      nil
    else
      translated_document.sequences.find_or_create_by_sequence(params[:sequence].sub("-","."))
    end
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