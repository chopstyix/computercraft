--# Monitors
mainMon = peripheral.wrap("monitor_8")
infoMon = peripheral.wrap("monitor_7")
console = term.redirect(mainMon)

--# Load Images
local card = paintutils.loadImage("card.nfp")
local cardBack = paintutils.loadImage("cardback.nfp")

--# Configure monitors
mainMon.setTextScale(0.5)
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
  term.write("X: "..tx.."  Y: "..ty)
  term.redirect(oldMon)
end

function touchHitbox(x1,y1,x2,y2)
  if (tx >= x1) and (tx <= x2) and (ty >= y1) and (ty <= y2) then
    return true
  else
    return false
end
  
function drawMain()
  local oldMon = term.redirect(mainMon)
  local width, height = getImageSize(card)
  term.setCursorPos(1,1)
  term.clearLine()
  term.setBackgroundColor(colors.green)
  term.clear()
  -- If player taps card 1, it will flip the card.
  if (tx >= 5) and (tx <= (5+width)) and then
  paintutils.drawImage(cardBack,5,2) --# Card 1
  paintutils.drawImage(card,20,2) --# Card 2
end

--# Begin Main Code
while true do
  drawMain()
  _,side,tx,ty = os.pullEvent("monitor_touch")
  drawInfo()
end
--# End Main Code
