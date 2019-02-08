class Charla < ApplicationRecord
  belongs_to :encuentro

  has_many_attached :fotos

  default_scope { order(:fecha, :hora_inicio) }

  def fecha_display
    I18n.l(fecha, format: :day_name_day_number_month_name)
  end

  def hora_inicio_display
    I18n.l(hora_inicio, format: :short)
  end

  def hora_termino_display
    I18n.l(hora_termino, format: :short)
  end

end
