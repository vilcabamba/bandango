class SaniWorker
  protected

  def transacciones_url
    SANI[:host] + "/api/transacciones.json"
  end

  def sani_request(&block)
    begin
      yield
    rescue Errno::ETIMEDOUT => e
      raise e, "Unable to reach sani"
    end
  end

  def restclient_options
    { content_type: :json, Authorization: "Token token=\"#{SANI[:token]}\"" }
  end
end
