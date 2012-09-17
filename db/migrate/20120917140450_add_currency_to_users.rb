# -*- coding: utf-8 -*-

class AddCurrencyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :currency, :string, :default => '€'
  end
end
