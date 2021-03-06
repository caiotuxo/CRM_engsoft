class ContactGroup < ActiveRecord::Base
  attr_accessible :name
  
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :newsletters
  has_and_belongs_to_many :marketing_campaigns
  
  validates :name, :presence => {:message => "Favor digitar um nome"}, :uniqueness => {:message => "Deve ser unico"}, :length => { :in => 5..255 , :message => "Deve possuir entre 5 e 255 caracteres"}
  validate :validate_contacts_not_empty
  
  def validate_contacts_not_empty
  	if(contacts.empty?)
  		errors.add(:base, "Pelo menos um contato deve ser selecionado")
  	end
  end
end
