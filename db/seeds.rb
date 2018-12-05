# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Story.refresh_news

Story.delete_all
Country.delete_all

# only seed country array once
array = %w(Argentina
ar
Australia
au

Austria
at

Belgium
be

Brazil
br

Bulgaria
bg

Canada
ca

China
cn

Colombia
co

Cuba
cu

Czech\ Republic
cz

Egypt
eg

France
fr

Germany
de

Greece
gr

Hong\ Kong
hk

Hungary
hu

India
in

Indonesia
id

Ireland
ie

Israel
il

Italy
it

Japan
jp

Latvia
lv

Lithuania
lt

Malaysia
my

Mexico
mx

Morocco
ma

Netherlands
nl

New\ Zealand
nz

Nigeria
ng

Norway
no

Philippines
ph

Poland
pl

Portugal
pt

Romania
ro

Russia
ru

Saudi\ Arabia
sa

Serbia
rs

Singapore
sg

Slovakia
sk

Slovenia
si

South\ Africa
za

South\ Korea
kr

Sweden
se

Switzerland
ch

Taiwan
tw

Thailand
th

Turkey
tr

UAE
ae

Ukraine
ua

United\ Kingdom
gb

United\ States\ of\ America
us

Venuzuela
ve)

country = []
key = []

array.each do |k|
    k.length < 3 ? key.push(k) : country.push(k)

end

hash = {}
n = 0  
country.each do |c|   
     
        hash[c] = key[n]
        n+=1
end

hash.each do |k, v|
    new_country = Country.create(name:k, key:v) 
end

Country.all.each do |country|
    country.get_stories
end




