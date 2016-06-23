class Items::SellItemService
  
  attr_reader :item, :player

  def initialize(player, item)
    @player =  player
    @item = item
  end

  def call
    deposite_money if delete_an_item_from_an_inventory
  end

  private

  def deposite_money 
    player.increment!(:gold, item.sell_price)
  end

  def delete_an_item_from_an_inventory
    player.inventory.delete(item.id.to_s)
  end
end 