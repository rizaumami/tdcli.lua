# tdcli.lua
A simple Lua library for the [`telegram-cli`](https://valtman.name/telegram-cli).

## How to Use

See example script below.  
- Place this `tdcli.lua` file inside the same folder as your bot, or anywhere else as long as you import it properly.
- Import it into your bot.
- Call a function.

```lua
-- Load tdcli library.
local tdcli = require('tdcli')

function dl_cb(arg, data)
end

function tdcli_update_callback(data)
  if (data.ID == "UpdateNewMessage") then
    local msg = data.message_
    -- If the message is text message
    if msg.content_.ID == "MessageText" then
      -- And the text is...
      if msg.content_.text_ == "ping" then
        -- Reply with unformatted text
        tdcli.sendMessage(msg.chat_id_, msg.id_, 1, 'pong', 1)
      -- And if the text is...
      elseif msg.content_.text_ == "PING" then
        -- Reply with formatted text
        tdcli.sendMessage(msg.chat_id_, 0, 1, '<b>PONG</b>', 1, 'html')
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

`tdcli.lua` is a Work In Progress. This commit is based on [telegram-cli-1124.tl](https://valtman.name/files/telegram-cli-1124.tl) scheme.  
Here is a list of functions that's should works, and what left to be tested.

- [x] getAuthState
- [ ] setAuthPhoneNumber
- [ ] resendAuthCode
- [ ] checkAuthCode
- [ ] checkAuthPassword
- [ ] requestAuthPasswordRecovery
- [ ] recoverAuthPassword
- [x] resetAuth
- [ ] checkAuthBotToken
- [x] getPasswordState
- [x] setPassword
- [x] getRecoveryEmail
- [x] setRecoveryEmail
- [x] requestPasswordRecovery
- [x] recoverPassword
- [x] getMe
- [x] getUser
- [x] getUserFull
- [x] getGroup
- [x] getGroupFull
- [x] getChannel
- [x] getChannelFull
- [x] getChat
- [x] getMessage
- [x] getMessages
- [x] getFile
- [x] getFilePersistent
- [x] getChats
- [x] searchPublicChat
- [x] searchPublicChats
- [x] searchChats
- [x] addRecentlyFoundChat
- [x] deleteRecentlyFoundChat
- [x] deleteRecentlyFoundChats
- [x] getCommonChats
- [x] getChatHistory
- [x] deleteChatHistory
- [x] searchChatMessages
- [x] searchMessages
- [x] sendMessage
- [x] sendBotStartMessage
- [ ] sendInlineQueryResultMessage
- [x] forwardMessages
- [x] deleteMessages
- [x] editMessageText
- [x] editMessageCaption
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
- [x] sendChatAction
- [x] openChat
- [x] closeChat
- [x] viewMessages
- [x] openMessageContent
- [x] createPrivateChat
- [x] createGroupChat
- [x] createChannelChat
- [ ] createSecretChat
- [x] createNewGroupChat
- [x] createNewChannelChat
- [ ] createNewSecretChat
- [x] migrateGroupChatToChannelChat
- [x] changeChatTitle
- [x] changeChatPhoto
- [x] changeChatDraftMessage
- [x] addChatMember
- [x] addChatMembers
- [x] changeChatMemberStatus
- [x] getChatMember
- [x] downloadFile
- [x] cancelDownloadFile
- [x] exportChatInviteLink
- [x] checkChatInviteLink
- [x] importChatInviteLink
- [x] blockUser
- [x] unblockUser
- [x] getBlockedUsers
- [x] importContacts
- [x] searchContacts
- [x] deleteContacts
- [x] getUserProfilePhotos
- [x] getStickers
- [x] getStickerSets
- [x] getStickerSet
- [x] searchStickerSet
- [ ] updateStickerSet
- [x] getSavedAnimations
- [x] addSavedAnimation
- [x] deleteSavedAnimation
- [x] getRecentInlineBots
- [x] getWebPagePreview
- [x] getNotificationSettings
- [x] setNotificationSettings
- [x] setProfilePhoto
- [ ] deleteProfilePhoto
- [x] changeName
- [x] changeAbout
- [x] changeUsername
- [x] changePhoneNumber
- [ ] resendChangePhoneNumberCode
- [ ] checkChangePhoneNumberCode
- [x] getActiveSessions
- [ ] terminateSession
- [ ] terminateAllOtherSessions
- [x] toggleGroupEditors
- [x] changeChannelUsername
- [x] toggleChannelInvites
- [x] toggleChannelSignMessages
- [x] changeChannelAbout
- [x] pinChannelMessage
- [x] unpinChannelMessage
- [x] reportChannelSpam
- [x] getChannelMembers
- [x] deleteChannel
- [x] getSupportUser
- [x] getWallpapers
- [ ] registerDevice
- [x] getDeviceTokens
- [ ] setPrivacy
- [x] getPrivacy
- [x] getOption
- [x] setOption
- [x] changeAccountTtl
- [x] getAccountTtl
- [ ] deleteAccount
- [x] getChatReportSpamState
- [x] changeChatReportSpamState
- [ ] setBotUpdatesStatus
- [x] setAlarm
- [x] account_change_username
- [x] account_change_name
- [x] account_change_photo
- [x] add_contact
- [x] block_user
- [x] channel_get_admins
- [x] channel_get_bots
- [x] channel_get_kicked
- [x] channel_get_members
- [x] channel_change_about
- [x] channel_change_username
- [x] channel_edit
- [x] chat_add_user
- [x] chat_change_photo
- [x] chat_change_title
- [x] chat_change_role
- [x] chat_del_user
- [x] chat_info
- [x] chat_join
- [x] chat_leave
- [x] chat_check_invite_link
- [x] chat_create_broadcast
- [x] chat_create_group
- [x] chat_create_supergroup
- [x] chat_export_invite_link
- [x] chat_import_invite_link
- [x] contact_list
- [x] contact_delete
- [x] delete_msg
- [x] dialog_list
- [x] fwd
- [x] get_message
- [x] group_upgrade
- [x] history
- [x] mark_read
- [x] msg
- [x] mute
- [x] pin_message
- [ ] push_button
- [x] resolve_username
- [x] reply
- [x] reply_file
- [ ] reply_fwd
- [x] reply_location
- [x] search
- [x] send_file
- [x] send_location
- [x] send_typing
- [x] start_bot
- [x] timer
- [x] unblock_user
- [x] unmute
