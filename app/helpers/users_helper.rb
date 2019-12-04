module UsersHelper
      # collection methods
  # user can have toys, animals, and wishes through a keeper or a donor role
  # keepers can also be donors, something like user.animals is ambiguous
  # use keeper_animals and donor_animals (same as calling user.keeper.animals or user.donor.animals)
  def donor_animals
    if self.donor?
      self.donor.animals
    end
  end

  def keeper_animals
    if self.keeper?
      self.keeper.animals
    end
  end
  
end
