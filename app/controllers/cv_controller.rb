class CvController < ApplicationController
  def en
    cv = File.join(Rails.root, 'public/cv/curriculum_vitae_en.pdf')
    send_file(cv, filename: 'curriculum_vitae_en.pdf', disposition: 'inline', type: 'application/pdf')
  end

  def ru
    cv = File.join(Rails.root, 'public/cv/curriculum_vitae_ru.pdf')
    send_file(cv, filename: 'curriculum_vitae_ru.pdf', disposition: 'inline', type: 'application/pdf')
  end
end
