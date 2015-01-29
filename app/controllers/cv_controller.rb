#curriculum_vitae

class CVController < ApplicationController
  def en
    cv = File.join(Rails.root, 'public/curriculum_vitae_en.pdf')
    send_file(cv, filename: 'curriculum_vitae_en.pdf', type: 'application/pdf')
  end

  def ru
    cv = File.join(Rails.root, 'public/curriculum_vitae_ru.pdf')
    send_file(cv, filename: 'curriculum_vitae_ru.pdf', type: 'application/pdf')
  end
end