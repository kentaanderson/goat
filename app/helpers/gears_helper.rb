module GearsHelper
  def gear_by_category(category_id)
    @gear_by_category = Gear.where("category_id" => category_id, "user_id" => current_user.id)
  end
end
