begin
  require "uchip/mcp2221"
rescue LoadError
  require_relative "setup"
end

def hit_bell pin
  pin.value = 0
  pin.value = 1
  sleep 0.009
  pin.value = 0
end

# Find the first connected chip
chip = UChip::MCP2221.first || raise("Couldn't find the chip!")

pin = chip.pin 0
pin.output!

loop do
  hit_bell pin
  sleep 2
end