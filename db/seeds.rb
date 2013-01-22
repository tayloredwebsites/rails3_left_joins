# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Lookup.create(
  :name => 'Lookup Item 1',
  :value => '1'
)
Lookup.create(
  :name => 'Lookup Item 2',
  :value => '2'
)
Lookup.create(
  :name => 'Lookup Item 3',
  :value => '3'
)

ThroughReference.create(
  :description => 'Main Item 1'
)
ThroughReference.create(
  :description => 'Main Item 2'
)

ThroughTable.create(
:through_reference_id => 1,
:lookup_id => 1,
:description => 'Main Item 1 has Lookup item 1'
)
ThroughTable.create(
:through_reference_id => 1,
:lookup_id => 3,
:description => 'Main Item 1 has Lookup item 3'
)
ThroughTable.create(
:through_reference_id => 2,
:lookup_id => 1,
:description => 'Main Item 2 has Lookup item 1'
)
ThroughTable.create(
:through_reference_id => 2,
:lookup_id => 2,
:description => 'Main Item 2 has Lookup item 2'
)
