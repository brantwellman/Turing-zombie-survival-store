module RedirectPreparer
  def self.set_redirect(referrer, normal_redirect)
    referrer ? referrer : normal_redirect
  end
end
