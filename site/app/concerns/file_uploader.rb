module FileUploader

  def raw_post_data
    request.raw_post.force_encoding('BINARY')
  end

end