xml.instruct!
xml.Response do
  xml.Gather(:action => @post_to, :numDigits => 1) do
    # xml.Play 'http://kchens.github.io/sounds/TaylorSwiftCall.mp3'
    # xml.Pause :length => 1
    xml.Say "Hello #{@event.patient_name}, Juan loves you and wanted to say: #{@event.message}.", voice: 'alice'
    # xml.Pause :length => 1
    xml.Say "He also ask that you take your #{@event.drug_name} today.", voice: 'alice'
    # xml.Pause :length => 1
    xml.Say "Juan wants to know how much pain you're feeling today? 9 is the most pain. 0 is no pain. Please enter your number now.", voice: 'alice'
  end
end