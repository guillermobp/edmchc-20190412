class Encuentro < ApplicationRecord
  has_many :charlas
  has_many :exponentes
  has_many :ensayos
  has_many :conciertos

  has_many_attached :logos
  has_many_attached :fotos
  has_one_attached :foto_quienes_somos
  has_one_attached :foto_coordinador

  def charlas_por_dia
    charlas.group(:fecha).select(:fecha)
  end

  def fotos_charlas
    ary = Array.new
    charlas.each do |c|
      c.fotos.each do |f|
        ary.push(f)
      end
    end
    ary
  end

  def fotos_ensayos
    ary = Array.new
    ensayos.each do |e|
      e.fotos.each do |f|
        ary.push(f)
      end
    end
    ary
  end

  def fotos_conciertos
    ary = Array.new
    conciertos.each do |c|
      c.fotos.each do |f|
        ary.push(f)
      end
    end
    ary
  end

end
