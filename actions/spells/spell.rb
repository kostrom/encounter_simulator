require_relative '../action'
require_relative '../attack_bonus'
require_relative '../save_dc'

class Spell < Action
  def evaluate
    return false if insufficeint_spell_slots
    true
  end

  def perform
    return false if insufficeint_spell_slots
    character.spell_slots_remaining[spell_level] -= 1
    p "#{character.name} casts #{self.class}!"
    p "#{character.name} has #{character.spell_slots_remaining} spell slots remaining."
    true
  end

  private

  def spell_level
    self.class::Level
  end

  def insufficeint_spell_slots
    character.spell_slots_remaining[spell_level] == 0
  end
end
