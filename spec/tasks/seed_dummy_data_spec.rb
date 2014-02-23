require "spec_helper"
require "rake"

describe "db:dummy" do
  before :all do
    load Rails.root + "db/seeds.rb"
    Rake.application.rake_require "tasks/dummy"
    Rake::Task.define_task(:environment)
    Rake::Task["db:dummy"].reenable
    Rake.application.invoke_task "db:dummy"
  end

  it "should add an admin" do
    User.first.username.should eq("admin")
  end

  it "should add an emisor with a valid ruc" do
    Emisor.first.ruc.should eq("1104680135001")
  end

  it "should add some clients" do
    Cliente.exists?(identificacion: "1104680135001").should be_true
    Cliente.exists?(identificacion: "1104015936").should be_true
    Cliente.exists?(identificacion: "1104706922").should be_true
    Cliente.exists?(email: "tomster@emberjs.com").should be_true
    Cliente.exists?(email: "info@newrelic.com").should be_true
  end

  it "should create some items and categories" do
    Category.exists?(nombre: "bebidas").should be_true
    nestea = Item.find_by nombre: "Nestea"
    nestea.category.nombre.should eq("bebidas")
    doritos = Item.find_by nombre: "Doritos"
    doritos.category.nombre.should eq("snacks")
  end

  it "should add some compras and ventas" do
    counts = [Compra.count, Venta.count, Compra.yesterday.count, Venta.yesterday.count]
    counts.each do |count|
      count.should_not eq(0)
    end
  end
end
