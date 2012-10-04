# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
User.create(:email => 'admin@unredd.com', :password => 'admin123')

Principle.create(:name => 'Principle 1', :description => 'Apply norms of democratic governance, including those reflected in national commitments and Multilateral Agreements')
Principle.create(:name => 'Principle 2', :description => 'Respect and protect stakeholder rights, including human rights, statutory and customary rights, and collective rights')
Principle.create(:name => 'Principle 3', :description => "Promote and enhance forests' contribution to sustainable livelihoods")
Principle.create(:name => 'Principle 4', :description => 'Contribute to low-carbon, climate-resilient sustainable development policy, consistent with national development strategies, national forest programmes and commitments under international conventions and agreements')
Principle.create(:name => 'Principle 5', :description => 'Principle 5Protect natural forest from degradation and/or conversion to other land uses, including plantation forest')
Principle.create(:name => 'Principle 6', :description => 'Maintain and enhance multiple functions of forest to deliver benefits including biodiversity conservation and ecosystem services')
Principle.create(:name => 'Principle 7', :description => 'Minimize adverse impacts (direct and indirect) on non-forest ecosystem services and biodiversity')


principle_1 = Principle.find_by_name('Principle 1')
Criterion.create(:name => 'Criterion 1', :description => 'Ensure the integrity and transparency of fiduciary and fund management systems', :principle => principle_1)
Criterion.create(:name => 'Criterion 2', :description => 'Ensure accountability and legitimacy of all bodies representing stakeholders, including through establishing responsive national feedback, complaints and grievance mechanisms, amongst others', :principle => principle_1)



