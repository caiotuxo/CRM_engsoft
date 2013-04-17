# encoding: UTF-8
class Faq < ActiveRecord::Base
  attr_accessible :resposta, :pergunta, :assunto_id, :assunto
  belongs_to :assunto

  validates :pergunta, :presence => {:message => "Favor digitar uma pergunta"}
  validates :resposta, :presence => {:message => "Favor digitar uma resposta"}
end
