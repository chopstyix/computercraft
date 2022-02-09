--# Monitors
mainMon = peripheral.wrap("monitor_8")
infoMon = peripheral.wrap("monitor_7")
console = term.redirect(mainMon)

--# Load Images
local card = paintutils.loadImage("card.nfp")
local cardBack = paintutils.loadImage("cardback.nfp")

--# Configure monitors
touchMon.setTextScale(0.5)
infoMon.setTextScale(0.5)

--# Functions
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

function drawInfo()
  local oldMon = term.redirect(infoMon)
  term.setCursorPos(1,1)
  term.clearLine()
  term.setBackgroundColor(colors.green)
  term.clear()
  term.write("X: "..x.."  Y: "..y)
  term.redirect(oldMon)
end

function drawMain()
  local oldMon = term.redirect(mainMon)
  term.setCursorPos(1,1)
  term.clearLine()
  term.setBackgroundColor(colors.green)
  term.clear()
  paintutils.drawImage(cardBack,5,2) --# Card 1
  paintutils.drawImage(card,20,2) --# Card 2
end

--# Begin Main Code
while true do
  drawMain()
  _,side,x,y = os.pullEvent("monitor_touch")
  drawInfo()
--# End Main Code
