class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  before_save(:upcase_first_letter)
  before_save(:currency)

  validates(:name, {:presence => true, :length => {:maximum => 100}})
  validates(:name, uniqueness: { case_sensitive: false })

  define_method(:upcase_first_letter) do
    self.name =  self.name.slice(0,1).capitalize + self.name.slice(1..-1)
  end

  define_method(:currency) do
    self.price = ('%.2f' % (self.price.to_f)).prepend("$")
  end
end
