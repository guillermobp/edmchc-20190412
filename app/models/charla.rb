# frozen_string_literal: true

class Charla < ApplicationRecord
  belongs_to :encuentro

  has_many_attached :fotos

  default_scope { order(:fecha, :hora_inicio) }

  def fecha_display
    fecha ? I18n.l(fecha, format: :day_name_day_number_month_name) : ''
  end

  def hora_inicio_display
    hora_inicio ? I18n.l(hora_inicio, format: :short) : ''
  end

  def hora_termino_display
    hora_termino ? I18n.l(hora_termino, format: :short) : ''
  end
end
