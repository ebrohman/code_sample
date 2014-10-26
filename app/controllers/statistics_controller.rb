class StatisticsController < ApplicationController
  def index
    # We are purposefully referring to only one player, you don't need to worry
    # about this.
    @player = Player.find_by_uuid('8CD7F0AB-6F0F-4ECC-8F5C-CDEF8C11B261')
  end
end
