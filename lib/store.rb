class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  before_save(:upcase_first_letter)
  validates(:name, {:presence => true, :length => {:maximum => 100}})

  define_method(:upcase_first_letter) do
    self.name =  self.name.slice(0,1).capitalize + self.name.slice(1..-1)
  end
end
