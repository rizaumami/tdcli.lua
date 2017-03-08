-- This script is based on telegram-cli sample lua script by @vysheng, 
-- written to demonstrate how to use tdlib.lua for your telegram-cli bot.

-- Load tdcli library.
tdcli = require 'tdcli'

-- Print message format. Use serpent for prettier result.
function vardump(value, depth, key)
  local linePrefix = ''
  local spaces = ''

  if key ~= nil then
    linePrefix = key .. ' = '
  end

  if depth == nil then
    depth = 0
  else
    depth = depth + 1
    for i=1, depth do 
      spaces = spaces .. '  '
    end
  end

  if type(value) == 'table' then
    mTable = getmetatable(value)
    if mTable == nil then
      print(spaces .. linePrefix .. '(table) ')
    else
      print(spaces .. '(metatable) ')
        value = mTable
    end
    for tableKey, tableValue in pairs(value) do
      vardump(tableValue, depth, tableKey)
    end
  elseif type(value)  == 'function' or 
    type(value) == 'thread' or 
    type(value) == 'userdata' or 
    value == nil then
      print(spaces .. tostring(value))
  elseif type(value)  == 'string' then
    print(spaces .. linePrefix .. '"' .. tostring(value) .. '",')
  else
    print(spaces .. linePrefix .. tostring(value) .. ',')
  end
end

-- Print callback
function dl_cb(arg, data)
  vardump(arg)
  vardump(data)
end

function tdcli_update_callback(data)
  --vardump(data)
  if (data.ID == "UpdateNewMessage") then
    local msg = data.message_
    -- If the message is text message
    if msg.content_.ID == "MessageText" then
      -- And content of the text is...
      if msg.content_.text_ == "ping" then
        -- Reply with regular text
        tdcli.sendText(msg.chat_id_, msg.id_, 0, 1, nil, 'pong', 1)
      -- And if content of the text is...
      elseif msg.content_.text_ == "PING" then
        -- Reply with formatted text
        tdcli.sendText(msg.chat_id_, 0, 0, 1, nil, '<b>PONG</b>', 1, 'html')
      end
    end
  elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
    tdcli_function ({
      ID="GetChats",
      offset_order_="9223372036854775807",
      offset_chat_id_=0,
      limit_=20
    }, dl_cb, nil)
  end
end
