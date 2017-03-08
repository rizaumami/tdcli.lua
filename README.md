# tdcli.lua
A simple Lua library for the [`telegram-cli`](https://valtman.name/telegram-cli).

See [wiki](https://github.com/rizaumami/tdcli.lua/wiki) for documentation.

## How to Use

- `luarocks install tdcli.lua`
- Import `tdcli.lua` into your bot.
- Call the functions.

See example script below.

```lua
-- Load tdcli library.
tdcli = require 'tdcli'

-- An alias to sendText
function sendText(chat_id, reply_to_message_id, text, disable_web_page_preview, parse_mode)
  local parse_mode = parse_mode or 'HTML'
  local disable_web_page_preview = disable_web_page_preview or 1
  tdcli.sendText(chat_id, reply_to_message_id, 0, 1, nil, text, disable_web_page_preview, parse_mode)
end

function tdcli_update_callback(data)
  if (data.ID == "UpdateNewMessage") then
    local msg = data.message_
    local input = msg.content_.text_
    local chat_id = msg.chat_id_
    local user_id = msg.sender_user_id_
    -- If the message is text message
    if msg.content_.ID == "MessageText" then
      -- And the text is...
      if input == "ping" then
        -- Reply with unformatted text
        sendText(chat_id, msg.id_, 'pong')
      -- And if the text is...
      elseif input == "PING" then
        -- Reply with formatted text
        sendText(user_id, 0, '*PONG*', 1, 'Markdown')
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

```

## The Functions

`tdcli.lua` is a Work In Progress. This commit is based on [telegram-cli-1222.tl](https://valtman.name/files/telegram-cli-1222.tl) scheme.
Here is a list of functions that's should works, and what left to be tested.

- [x] [getAuthState](https://github.com/rizaumami/tdcli.lua/wiki/getAuthState)
- [ ] setAuthPhoneNumber
- [ ] resendAuthCode
- [ ] checkAuthCode
- [ ] checkAuthPassword
- [ ] requestAuthPasswordRecovery
- [ ] recoverAuthPassword
- [x] [resetAuth](https://github.com/rizaumami/tdcli.lua/wiki/resetAuth)
- [ ] checkAuthBotToken
- [x] [getPasswordState](https://github.com/rizaumami/tdcli.lua/wiki/getPasswordState)
- [x] [setPassword](https://github.com/rizaumami/tdcli.lua/wiki/setPassword)
- [x] [getRecoveryEmail](https://github.com/rizaumami/tdcli.lua/wiki/getRecoveryEmail)
- [x] [setRecoveryEmail](https://github.com/rizaumami/tdcli.lua/wiki/setRecoveryEmail)
- [x] [requestPasswordRecovery](https://github.com/rizaumami/tdcli.lua/wiki/requestPasswordRecovery)
- [x] [recoverPassword](https://github.com/rizaumami/tdcli.lua/wiki/recoverPassword)
- [x] [getMe](https://github.com/rizaumami/tdcli.lua/wiki/getMe)
- [x] [getUser](https://github.com/rizaumami/tdcli.lua/wiki/getUser)
- [x] [getUserFull](https://github.com/rizaumami/tdcli.lua/wiki/getUserFull)
- [x] [getGroup](https://github.com/rizaumami/tdcli.lua/wiki/getGroup)
- [x] [getGroupFull](https://github.com/rizaumami/tdcli.lua/wiki/getGroupFull)
- [x] [getChannel](https://github.com/rizaumami/tdcli.lua/wiki/getChannel)
- [x] [getChannelFull](https://github.com/rizaumami/tdcli.lua/wiki/getChannelFull)
- [ ] getSecretChat
- [x] [getChat](https://github.com/rizaumami/tdcli.lua/wiki/getChat)
- [x] [getMessage](https://github.com/rizaumami/tdcli.lua/wiki/getMessage)
- [x] [getMessages](https://github.com/rizaumami/tdcli.lua/wiki/getMessages)
- [x] [getFile](https://github.com/rizaumami/tdcli.lua/wiki/getFile)
- [x] [getFilePersistent](https://github.com/rizaumami/tdcli.lua/wiki/getFilePersistent)
- [x] [getChats](https://github.com/rizaumami/tdcli.lua/wiki/getChats)
- [x] [searchPublicChat](https://github.com/rizaumami/tdcli.lua/wiki/searchPublicChat)
- [x] [searchPublicChats](https://github.com/rizaumami/tdcli.lua/wiki/searchPublicChats)
- [x] [searchChats](https://github.com/rizaumami/tdcli.lua/wiki/searchChats)
- [x] [addRecentlyFoundChat](https://github.com/rizaumami/tdcli.lua/wiki/addRecentlyFoundChat)
- [x] [deleteRecentlyFoundChat](https://github.com/rizaumami/tdcli.lua/wiki/deleteRecentlyFoundChat)
- [x] [deleteRecentlyFoundChats](https://github.com/rizaumami/tdcli.lua/wiki/deleteRecentlyFoundChats)
- [x] [getCommonChats](https://github.com/rizaumami/tdcli.lua/wiki/getCommonChats)
- [x] [getChatHistory](https://github.com/rizaumami/tdcli.lua/wiki/getChatHistory)
- [x] [deleteChatHistory](https://github.com/rizaumami/tdcli.lua/wiki/deleteChatHistory)
- [x] [searchChatMessages](https://github.com/rizaumami/tdcli.lua/wiki/searchChatMessages)
- [x] [searchMessages](https://github.com/rizaumami/tdcli.lua/wiki/searchMessages)
- [x] [sendBotStartMessage](https://github.com/rizaumami/tdcli.lua/wiki/sendBotStartMessage)
- [ ] sendInlineQueryResultMessage
- [x] [forwardMessages](https://github.com/rizaumami/tdcli.lua/wiki/forwardMessages)
- [ ] sendChatSetTtlMessage
- [x] [deleteMessages](https://github.com/rizaumami/tdcli.lua/wiki/deleteMessages)
- [x] [deleteMessagesFromUser](https://github.com/rizaumami/tdcli.lua/wiki/deleteMessagesFromUser)
- [x] [editMessageText](https://github.com/rizaumami/tdcli.lua/wiki/editMessageText)
- [x] [editMessageCaption](https://github.com/rizaumami/tdcli.lua/wiki/editMessageCaption)
- [ ] editMessageReplyMarkup
- [ ] editInlineMessageText
- [ ] editInlineMessageCaption
- [ ] editInlineMessageReplyMarkup
- [ ] getInlineQueryResults
- [ ] answerInlineQuery
- [ ] getCallbackQueryAnswer
- [ ] answerCallbackQuery
- [ ] setGameScore
- [ ] setInlineGameScore
- [ ] getGameHighScores
- [ ] getInlineGameHighScores
- [ ] deleteChatReplyMarkup
- [x] [sendChatAction](https://github.com/rizaumami/tdcli.lua/wiki/sendChatAction)
- [ ] sendChatScreenshotTakenNotification
- [x] [openChat](https://github.com/rizaumami/tdcli.lua/wiki/openChat)
- [x] [closeChat](https://github.com/rizaumami/tdcli.lua/wiki/closeChat)
- [x] [viewMessages](https://github.com/rizaumami/tdcli.lua/wiki/viewMessages)
- [x] [openMessageContent](https://github.com/rizaumami/tdcli.lua/wiki/openMessageContent)
- [x] [createPrivateChat](https://github.com/rizaumami/tdcli.lua/wiki/createPrivateChat)
- [x] [createGroupChat](https://github.com/rizaumami/tdcli.lua/wiki/createGroupChat)
- [x] [createChannelChat](https://github.com/rizaumami/tdcli.lua/wiki/createChannelChat)
- [ ] createSecretChat
- [x] [createNewGroupChat](https://github.com/rizaumami/tdcli.lua/wiki/createNewGroupChat)
- [x] [createNewChannelChat](https://github.com/rizaumami/tdcli.lua/wiki/createNewChannelChat)
- [ ] createNewSecretChat
- [x] [migrateGroupChatToChannelChat](https://github.com/rizaumami/tdcli.lua/wiki/migrateGroupChatToChannelChat)
- [x] [changeChatTitle](https://github.com/rizaumami/tdcli.lua/wiki/changeChatTitle)
- [x] [changeChatPhoto](https://github.com/rizaumami/tdcli.lua/wiki/changeChatPhoto)
- [x] [changeChatDraftMessage](https://github.com/rizaumami/tdcli.lua/wiki/changeChatDraftMessage)
- [x] [addChatMember](https://github.com/rizaumami/tdcli.lua/wiki/addChatMember)
- [x] [addChatMembers](https://github.com/rizaumami/tdcli.lua/wiki/addChatMembers)
- [x] [changeChatMemberStatus](https://github.com/rizaumami/tdcli.lua/wiki/changeChatMemberStatus)
- [x] [getChatMember](https://github.com/rizaumami/tdcli.lua/wiki/getChatMember)
- [x] [downloadFile](https://github.com/rizaumami/tdcli.lua/wiki/downloadFile)
- [x] [cancelDownloadFile](https://github.com/rizaumami/tdcli.lua/wiki/cancelDownloadFile)
- [ ] setFileGenerationProgress
- [ ] finishFileGeneration
- [x] [exportChatInviteLink](https://github.com/rizaumami/tdcli.lua/wiki/exportChatInviteLink)
- [x] [checkChatInviteLink](https://github.com/rizaumami/tdcli.lua/wiki/checkChatInviteLink)
- [x] [importChatInviteLink](https://github.com/rizaumami/tdcli.lua/wiki/importChatInviteLink)
- [x] [blockUser](https://github.com/rizaumami/tdcli.lua/wiki/blockUser)
- [x] [unblockUser](https://github.com/rizaumami/tdcli.lua/wiki/unblockUser)
- [x] [getBlockedUsers](https://github.com/rizaumami/tdcli.lua/wiki/getBlockedUsers)
- [x] [importContacts](https://github.com/rizaumami/tdcli.lua/wiki/importContacts)
- [x] [searchContacts](https://github.com/rizaumami/tdcli.lua/wiki/searchContacts)
- [x] [deleteContacts](https://github.com/rizaumami/tdcli.lua/wiki/deleteContacts)
- [x] [getUserProfilePhotos](https://github.com/rizaumami/tdcli.lua/wiki/getUserProfilePhotos)
- [x] [getStickers](https://github.com/rizaumami/tdcli.lua/wiki/getStickers)
- [x] [getStickerSets](https://github.com/rizaumami/tdcli.lua/wiki/getStickerSets)
- [x] [getArchivedStickerSets](https://github.com/rizaumami/tdcli.lua/wiki/getArchivedStickerSets)
- [x] [getTrendingStickerSets](https://github.com/rizaumami/tdcli.lua/wiki/getTrendingStickerSets)
- [ ] getAttachedStickerSets
- [x] [getStickerSet](https://github.com/rizaumami/tdcli.lua/wiki/getStickerSet)
- [x] [searchStickerSet](https://github.com/rizaumami/tdcli.lua/wiki/searchStickerSet)
- [x] [updateStickerSet](https://github.com/rizaumami/tdcli.lua/wiki/updateStickerSet)
- [x] [viewTrendingStickerSets](https://github.com/rizaumami/tdcli.lua/wiki/viewTrendingStickerSets)
- [ ] reorderStickerSets
- [x] [getRecentStickers](https://github.com/rizaumami/tdcli.lua/wiki/getRecentStickers)
- [x] [addRecentSticker](https://github.com/rizaumami/tdcli.lua/wiki/addRecentSticker)
- [x] [deleteRecentSticker](https://github.com/rizaumami/tdcli.lua/wiki/deleteRecentSticker)
- [x] [clearRecentStickers](https://github.com/rizaumami/tdcli.lua/wiki/clearRecentStickers)
- [x] [getStickerEmojis](https://github.com/rizaumami/tdcli.lua/wiki/getStickerEmojis)
- [x] [getSavedAnimations](https://github.com/rizaumami/tdcli.lua/wiki/getSavedAnimations)
- [x] [addSavedAnimation](https://github.com/rizaumami/tdcli.lua/wiki/addSavedAnimation)
- [x] [deleteSavedAnimation](https://github.com/rizaumami/tdcli.lua/wiki/deleteSavedAnimation)
- [x] [getRecentInlineBots](https://github.com/rizaumami/tdcli.lua/wiki/getRecentInlineBots)
- [x] [getWebPagePreview](https://github.com/rizaumami/tdcli.lua/wiki/getWebPagePreview)
- [x] [getNotificationSettings](https://github.com/rizaumami/tdcli.lua/wiki/getNotificationSettings)
- [x] [setNotificationSettings](https://github.com/rizaumami/tdcli.lua/wiki/setNotificationSettings)
- [x] [resetAllNotificationSettings](https://github.com/rizaumami/tdcli.lua/wiki/resetAllNotificationSettings)
- [x] [setProfilePhoto](https://github.com/rizaumami/tdcli.lua/wiki/setProfilePhoto)
- [x] [deleteProfilePhoto](https://github.com/rizaumami/tdcli.lua/wiki/deleteProfilePhoto)
- [x] [changeName](https://github.com/rizaumami/tdcli.lua/wiki/changeName)
- [x] [changeAbout](https://github.com/rizaumami/tdcli.lua/wiki/changeAbout)
- [x] [changeUsername](https://github.com/rizaumami/tdcli.lua/wiki/changeUsername)
- [x] [changePhoneNumber](https://github.com/rizaumami/tdcli.lua/wiki/changePhoneNumber)
- [x] [resendChangePhoneNumberCode](https://github.com/rizaumami/tdcli.lua/wiki/resendChangePhoneNumberCode)
- [x] [checkChangePhoneNumberCode](https://github.com/rizaumami/tdcli.lua/wiki/checkChangePhoneNumberCode)
- [x] [getActiveSessions](https://github.com/rizaumami/tdcli.lua/wiki/getActiveSessions)
- [x] [terminateSession](https://github.com/rizaumami/tdcli.lua/wiki/terminateSession)
- [x] [terminateAllOtherSessions](https://github.com/rizaumami/tdcli.lua/wiki/terminateAllOtherSessions)
- [x] [toggleGroupEditors](https://github.com/rizaumami/tdcli.lua/wiki/toggleGroupEditors)
- [x] [changeChannelUsername](https://github.com/rizaumami/tdcli.lua/wiki/changeChannelUsername)
- [x] [toggleChannelInvites](https://github.com/rizaumami/tdcli.lua/wiki/toggleChannelInvites)
- [x] [toggleChannelSignMessages](https://github.com/rizaumami/tdcli.lua/wiki/toggleChannelSignMessages)
- [x] [changeChannelAbout](https://github.com/rizaumami/tdcli.lua/wiki/changeChannelAbout)
- [x] [pinChannelMessage](https://github.com/rizaumami/tdcli.lua/wiki/pinChannelMessage)
- [x] [unpinChannelMessage](https://github.com/rizaumami/tdcli.lua/wiki/unpinChannelMessage)
- [x] [reportChannelSpam](https://github.com/rizaumami/tdcli.lua/wiki/reportChannelSpam)
- [x] [getChannelMembers](https://github.com/rizaumami/tdcli.lua/wiki/getChannelMembers)
- [x] [deleteChannel](https://github.com/rizaumami/tdcli.lua/wiki/deleteChannel)
- [x] [getCreatedPublicChannels](https://github.com/rizaumami/tdcli.lua/wiki/getCreatedPublicChannels)
- [ ] closeSecretChat
- [x] [getSupportUser](https://github.com/rizaumami/tdcli.lua/wiki/getSupportUser)
- [x] [getWallpapers](https://github.com/rizaumami/tdcli.lua/wiki/getWallpapers)
- [ ] registerDevice
- [x] [getDeviceTokens](https://github.com/rizaumami/tdcli.lua/wiki/getDeviceTokens)
- [x] [setPrivacy](https://github.com/rizaumami/tdcli.lua/wiki/setPrivacy)
- [x] [getPrivacy](https://github.com/rizaumami/tdcli.lua/wiki/getPrivacy)
- [x] [getOption](https://github.com/rizaumami/tdcli.lua/wiki/getOption)
- [x] [setOption](https://github.com/rizaumami/tdcli.lua/wiki/setOption)
- [x] [changeAccountTtl](https://github.com/rizaumami/tdcli.lua/wiki/changeAccountTtl)
- [x] [getAccountTtl](https://github.com/rizaumami/tdcli.lua/wiki/getAccountTtl)
- [x] [deleteAccount](https://github.com/rizaumami/tdcli.lua/wiki/deleteAccount)
- [x] [getChatReportSpamState](https://github.com/rizaumami/tdcli.lua/wiki/getChatReportSpamState)
- [x] [changeChatReportSpamState](https://github.com/rizaumami/tdcli.lua/wiki/changeChatReportSpamState)
- [ ] setBotUpdatesStatus
- [x] [setAlarm](https://github.com/rizaumami/tdcli.lua/wiki/setAlarm)
- [x] [sendText](https://github.com/rizaumami/tdcli.lua/wiki/sendText)
- [x] [sendAnimation](https://github.com/rizaumami/tdcli.lua/wiki/sendAnimation)
- [x] [sendAudio](https://github.com/rizaumami/tdcli.lua/wiki/sendAudio)
- [x] [sendDocument](https://github.com/rizaumami/tdcli.lua/wiki/sendDocument)
- [x] [sendPhoto](https://github.com/rizaumami/tdcli.lua/wiki/sendPhoto)
- [x] [sendSticker](https://github.com/rizaumami/tdcli.lua/wiki/sendSticker)
- [x] [sendVideo](https://github.com/rizaumami/tdcli.lua/wiki/sendVideo)
- [x] [sendVoice](https://github.com/rizaumami/tdcli.lua/wiki/sendVoice)
- [x] [sendLocation](https://github.com/rizaumami/tdcli.lua/wiki/sendLocation)
- [x] [sendVenue](https://github.com/rizaumami/tdcli.lua/wiki/sendVenue)
- [x] [sendContact](https://github.com/rizaumami/tdcli.lua/wiki/sendContact)
- [x] [sendGame](https://github.com/rizaumami/tdcli.lua/wiki/sendGame)
- [x] [sendForwarded](https://github.com/rizaumami/tdcli.lua/wiki/sendForwarded)
