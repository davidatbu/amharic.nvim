local  letters
letters = {
{'','e','u','i','a',';','','o'},
{'h','ሀ','ሁ','ሂ','ሃ','ሄ','ህ','ሆ'},
{'l','ለ','ሉ','ሊ','ላ','ሌ','ል','ሎ'},
{'m','መ','ሙ','ሚ','ማ','ሜ','ም','ሞ'},
{'r','ረ','ሩ','ሪ','ራ','ሬ','ር','ሮ'},
{'s','ሰ','ሱ','ሲ','ሳ','ሴ','ስ','ሶ'},
{'S','ሸ','ሹ','ሺ','ሻ','ሼ','ሽ','ሾ'},
{'q', 'ቀ', 'ቁ', 'ቂ', 'ቃ', 'ቄ', 'ቅ', 'ቆ'},
{'b', 'በ', 'ቡ', 'ቢ', 'ባ', 'ቤ', 'ብ', 'ቦ'},
{'v', 'ቨ', 'ቩ', 'ቪ', 'ቫ', 'ቬ', 'ቭ', 'ቮ'},
{'t', 'ተ', 'ቱ', 'ቲ', 'ታ', 'ቴ', 'ት', 'ቶ'},
{'c', 'ቸ', 'ቹ', 'ቺ', 'ቻ', 'ቼ', 'ች', 'ቾ'},
{'H', 'ኀ', 'ኁ', 'ኂ', 'ኃ', 'ኄ', 'ኅ', 'ኆ'},
{'n', 'ነ', 'ኑ', 'ኒ', 'ና', 'ኔ', 'ን', 'ኖ'},
{'N', 'ኘ', 'ኙ', 'ኚ', 'ኛ', 'ኜ', 'ኝ', 'ኞ'},
{"'", 'አ', 'ኡ', 'ኢ', 'ኣ', 'ኤ', 'እ', 'ኦ'},
{'k', 'ከ', 'ኩ', 'ኪ', 'ካ', 'ኬ', 'ክ', 'ኮ'},
{'x', 'ኸ', 'ኹ', 'ኺ', 'ኻ', 'ኼ', 'ኽ', 'ኾ'},
{'w', 'ወ', 'ዉ', 'ዊ', 'ዋ', 'ዌ', 'ው', 'ዎ'},
{'z', 'ዘ', 'ዙ', 'ዚ', 'ዛ', 'ዜ', 'ዝ', 'ዞ'},
{'Z', 'ዠ', 'ዡ', 'ዢ', 'ዣ', 'ዤ', 'ዥ', 'ዦ'},
{'y', 'የ', 'ዩ', 'ዪ', 'ያ', 'ዬ', 'ይ', 'ዮ'},
{'d', 'ደ', 'ዱ', 'ዲ', 'ዳ', 'ዴ', 'ድ', 'ዶ'},
{'j', 'ጀ', 'ጁ', 'ጂ', 'ጃ', 'ጄ', 'ጅ', 'ጆ'},
{'g', 'ገ', 'ጉ', 'ጊ', 'ጋ', 'ጌ', 'ግ', 'ጎ'},
{'T', 'ጠ', 'ጡ', 'ጢ', 'ጣ', 'ጤ', 'ጥ', 'ጦ'},
{'C', 'ጨ', 'ጩ', 'ጪ', 'ጫ', 'ጬ', 'ጭ', 'ጮ'},
{'P', 'ጰ', 'ጱ', 'ጲ', 'ጳ', 'ጴ', 'ጵ', 'ጶ'},
{'X', 'ፀ', 'ፁ', 'ፂ', 'ፃ', 'ፄ', 'ፅ', 'ፆ'},
{'f', 'ፈ', 'ፉ', 'ፊ', 'ፋ', 'ፌ', 'ፍ', 'ፎ'},
{'p', 'ፐ', 'ፑ', 'ፒ', 'ፓ', 'ፔ', 'ፕ', 'ፖ'}
}

local Amharic = {}
local amharic_is_on = false

Amharic.toggle_amharic = function()
  local header_row

  header_row = letters[1]
  local viml_to_execute = ""
  for row_idx = 2, #letters do
    for col_idx = 2, #header_row do
      local viml_line
      if amharic_is_on then
        viml_line = "iunmap <buffer> ".. letters[row_idx][1] .. header_row[col_idx]
      else
        viml_line = "inoremap <buffer> " .. letters[row_idx][1] .. header_row[col_idx] .. " " .. letters[row_idx][col_idx]
      end
      viml_to_execute = viml_to_execute .. viml_line .. "\n"
    end
  end
  vim.api.nvim_exec(viml_to_execute, false)
  amharic_is_on = not amharic_is_on
end


return Amharic