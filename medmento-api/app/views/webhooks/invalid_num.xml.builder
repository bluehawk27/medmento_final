xml.instruct!
xml.Response do
  xml.Say "Invalid pain rating.", voice: 'alice'
  xml.Redirect @redirect_to
end
