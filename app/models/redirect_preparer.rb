module RedirectPreparer
  def self.set(referrer, normal_redirect)
    referrer ? referrer : normal_redirect
  end
end
