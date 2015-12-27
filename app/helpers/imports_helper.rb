module ImportsHelper
  def gear_by_category(category_id)
    @gear_by_category = Gear.where("category_id" => category_id)
  end
end
