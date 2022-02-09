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

