module GearsHelper
  def gears_by_category(category_id)
    Gear.where("category_id" => category_id, "user_id" => current_user.id).order("upper(name)")
  end
  def gears_uncategorized()
    Gear.where("category_id NOT IN (SELECT id FROM Categories)")
  end
  def wishlists_by_category(category_id)
    Wishlist.where("category_id" => category_id, "user_id" => current_user.id).order("upper(name)")
  end
end
