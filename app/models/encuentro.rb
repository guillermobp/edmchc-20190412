class Encuentro < ApplicationRecord
  has_many :charlas, dependent: :destroy
  has_many :exponentes, dependent: :destroy
  has_many :conciertos, dependent: :destroy

  has_one_attached :video
  has_one_attached :banner_promocional
  has_many_attached :logos
  has_many_attached :fotos
  has_many_attached :fotos_ensayos
  has_one_attached :foto_quienes_somos
  has_one_attached :foto_coordinador
  has_many_attached :imagenes_prensa

  def mostrar_banner_promocional?
    mostrar_promocional != nil && mostrar_promocional? && banner_promocional.attached?
  end

  def charlas_por_fecha
    charlas.group_by(&:fecha)
  end

  def conciertos_por_fecha
    conciertos.group_by(&:fecha)
  end

end
