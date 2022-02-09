--# Monitors
touchMon = peripheral.wrap("monitor_8")
infoMon = peripheral.wrap("monitor_7")

--# Load Images
local card = paintutils.loadImage("card.nfp")
local cardBack = paintutils.loadImage("cardback.nfp")

--# Configure monitor sizes
touchMon.setTextScale(0.5)
infoMon.setTextScale(0.5)

function getImageSize(image)
  local height = #image
  local width = 0
  for _index,line in pairs(image) do
    for _index,pixel in ipairs(line) do
      if width < _index then
        width = _index
      end
    end
  end
  return width, height
end

