require "bundler/inline"

gemfile do
    source "https://rubygems.org"
    gem "uchip", require: false
end

require "uchip/mcp2221"

# By default, the MCP2221a doesn't use GP0 as a general purpose IO, so we need to configure it before using it.
# This example changes the "startup" GPIO settings of the chip.

# Find the first connected chip
chip = UChip::MCP2221.first || raise("Couldn't find the chip!")

# Get the GPIO settings
settings = chip.gp_settings

settings.gp0_designation = 0   # We want to use this pin as a GPIO
settings.gp0_output_value = 0  # Set the default value to 0
settings.gp0_direction = 0     # Set the direction to output

# Write the settings to the chip.  Next time the chip starts, the default
# settings for GP0 will reflect these settings
chip.gp_settings = settings