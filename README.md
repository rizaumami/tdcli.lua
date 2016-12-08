# tdcli.lua
A simple Lua library for the [`telegram-cli`](https://valtman.name/telegram-cli).

## How to Use

See example [script](https://github.com/rizaumami/tdcli.lua/wiki/script) below.  
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
    -- If [the](https://github.com/rizaumami/tdcli.lua/wiki/the) message is text message
    if msg.content_.ID [==](https://github.com/rizaumami/tdcli.lua/wiki/==) "MessageText" then
      -- And [the](https://github.com/rizaumami/tdcli.lua/wiki/the) text is...
      if msg.content_.text_ [==](https://github.com/rizaumami/tdcli.lua/wiki/==) "ping" then
        -- Reply [with](https://github.com/rizaumami/tdcli.lua/wiki/with) unformatted text
        tdcli.sendMessage(msg.chat_id_, msg.id_, 1, 'pong', 1)
      -- And [if](https://github.com/rizaumami/tdcli.lua/wiki/if) the text is...
      elseif msg.content_.text_ [==](https://github.com/rizaumami/tdcli.lua/wiki/==) "PING" then
        -- Reply [with](https://github.com/rizaumami/tdcli.lua/wiki/with) formatted text
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
- [x] [sendMessage](https://github.com/rizaumami/tdcli.lua/wiki/sendMessage)
- [x] [sendBotStartMessage](https://github.com/rizaumami/tdcli.lua/wiki/sendBotStartMessage)
- [ ] sendInlineQueryResultMessage
- [x] [forwardMessages](https://github.com/rizaumami/tdcli.lua/wiki/forwardMessages)
- [x] [deleteMessages](https://github.com/rizaumami/tdcli.lua/wiki/deleteMessages)
- [x] [editMessageText](https://github.com/rizaumami/tdcli.lua/wiki/editMessageText)
- [x] [editMessageCaption](https://github.com/rizaumami/tdcli.lua/wiki/editMessageCaption)
- [ ] editMessageReplyMarkup
- [ []](https://github.com/rizaumami/tdcli.lua/wiki/]) editInlineMessageText
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
- [x] [getStickerSet](https://github.com/rizaumami/tdcli.lua/wiki/getStickerSet)
- [x] [searchStickerSet](https://github.com/rizaumami/tdcli.lua/wiki/searchStickerSet)
- [ ] updateStickerSet
- [x] [getSavedAnimations](https://github.com/rizaumami/tdcli.lua/wiki/getSavedAnimations)
- [x] [addSavedAnimation](https://github.com/rizaumami/tdcli.lua/wiki/addSavedAnimation)
- [x] [deleteSavedAnimation](https://github.com/rizaumami/tdcli.lua/wiki/deleteSavedAnimation)
- [x] [getRecentInlineBots](https://github.com/rizaumami/tdcli.lua/wiki/getRecentInlineBots)
- [x] [getWebPagePreview](https://github.com/rizaumami/tdcli.lua/wiki/getWebPagePreview)
- [x] [getNotificationSettings](https://github.com/rizaumami/tdcli.lua/wiki/getNotificationSettings)
- [x] [setNotificationSettings](https://github.com/rizaumami/tdcli.lua/wiki/setNotificationSettings)
- [x] [setProfilePhoto](https://github.com/rizaumami/tdcli.lua/wiki/setProfilePhoto)
- [ ] deleteProfilePhoto
- [x] [changeName](https://github.com/rizaumami/tdcli.lua/wiki/changeName)
- [x] [changeAbout](https://github.com/rizaumami/tdcli.lua/wiki/changeAbout)
- [x] [changeUsername](https://github.com/rizaumami/tdcli.lua/wiki/changeUsername)
- [x] [changePhoneNumber](https://github.com/rizaumami/tdcli.lua/wiki/changePhoneNumber)
- [ ] resendChangePhoneNumberCode
- [ ] checkChangePhoneNumberCode
- [x] [getActiveSessions](https://github.com/rizaumami/tdcli.lua/wiki/getActiveSessions)
- [ ] terminateSession
- [ ] terminateAllOtherSessions
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
- [x] [getSupportUser](https://github.com/rizaumami/tdcli.lua/wiki/getSupportUser)
- [x] [getWallpapers](https://github.com/rizaumami/tdcli.lua/wiki/getWallpapers)
- [ ] registerDevice
- [x] [getDeviceTokens](https://github.com/rizaumami/tdcli.lua/wiki/getDeviceTokens)
- [ ] setPrivacy
- [x] [getPrivacy](https://github.com/rizaumami/tdcli.lua/wiki/getPrivacy)
- [x] [getOption](https://github.com/rizaumami/tdcli.lua/wiki/getOption)
- [x] [setOption](https://github.com/rizaumami/tdcli.lua/wiki/setOption)
- [x] [changeAccountTtl](https://github.com/rizaumami/tdcli.lua/wiki/changeAccountTtl)
- [x] [getAccountTtl](https://github.com/rizaumami/tdcli.lua/wiki/getAccountTtl)
- [ ] deleteAccount
- [x] [getChatReportSpamState](https://github.com/rizaumami/tdcli.lua/wiki/getChatReportSpamState)
- [x] [changeChatReportSpamState](https://github.com/rizaumami/tdcli.lua/wiki/changeChatReportSpamState)
- [ ] setBotUpdatesStatus
- [x] [setAlarm](https://github.com/rizaumami/tdcli.lua/wiki/setAlarm)
- [x] [account_change_username](https://github.com/rizaumami/tdcli.lua/wiki/account_change_username)
- [x] [account_change_name](https://github.com/rizaumami/tdcli.lua/wiki/account_change_name)
- [x] [account_change_photo](https://github.com/rizaumami/tdcli.lua/wiki/account_change_photo)
- [x] [add_contact](https://github.com/rizaumami/tdcli.lua/wiki/add_contact)
- [x] [block_user](https://github.com/rizaumami/tdcli.lua/wiki/block_user)
- [x] [channel_get_admins](https://github.com/rizaumami/tdcli.lua/wiki/channel_get_admins)
- [x] [channel_get_bots](https://github.com/rizaumami/tdcli.lua/wiki/channel_get_bots)
- [x] [channel_get_kicked](https://github.com/rizaumami/tdcli.lua/wiki/channel_get_kicked)
- [x] [channel_get_members](https://github.com/rizaumami/tdcli.lua/wiki/channel_get_members)
- [x] [channel_change_about](https://github.com/rizaumami/tdcli.lua/wiki/channel_change_about)
- [x] [channel_change_username](https://github.com/rizaumami/tdcli.lua/wiki/channel_change_username)
- [x] [channel_edit](https://github.com/rizaumami/tdcli.lua/wiki/channel_edit)
- [x] [chat_add_user](https://github.com/rizaumami/tdcli.lua/wiki/chat_add_user)
- [x] [chat_change_photo](https://github.com/rizaumami/tdcli.lua/wiki/chat_change_photo)
- [x] [chat_change_title](https://github.com/rizaumami/tdcli.lua/wiki/chat_change_title)
- [x] [chat_change_role](https://github.com/rizaumami/tdcli.lua/wiki/chat_change_role)
- [x] [chat_del_user](https://github.com/rizaumami/tdcli.lua/wiki/chat_del_user)
- [x] [chat_info](https://github.com/rizaumami/tdcli.lua/wiki/chat_info)
- [x] [chat_join](https://github.com/rizaumami/tdcli.lua/wiki/chat_join)
- [x] [chat_leave](https://github.com/rizaumami/tdcli.lua/wiki/chat_leave)
- [x] [chat_check_invite_link](https://github.com/rizaumami/tdcli.lua/wiki/chat_check_invite_link)
- [x] [chat_create_broadcast](https://github.com/rizaumami/tdcli.lua/wiki/chat_create_broadcast)
- [x] [chat_create_group](https://github.com/rizaumami/tdcli.lua/wiki/chat_create_group)
- [x] [chat_create_supergroup](https://github.com/rizaumami/tdcli.lua/wiki/chat_create_supergroup)
- [x] [chat_export_invite_link](https://github.com/rizaumami/tdcli.lua/wiki/chat_export_invite_link)
- [x] [chat_import_invite_link](https://github.com/rizaumami/tdcli.lua/wiki/chat_import_invite_link)
- [x] [contact_list](https://github.com/rizaumami/tdcli.lua/wiki/contact_list)
- [x] [contact_delete](https://github.com/rizaumami/tdcli.lua/wiki/contact_delete)
- [x] [delete_msg](https://github.com/rizaumami/tdcli.lua/wiki/delete_msg)
- [x] [dialog_list](https://github.com/rizaumami/tdcli.lua/wiki/dialog_list)
- [x] [fwd](https://github.com/rizaumami/tdcli.lua/wiki/fwd)
- [x] [get_message](https://github.com/rizaumami/tdcli.lua/wiki/get_message)
- [x] [group_upgrade](https://github.com/rizaumami/tdcli.lua/wiki/group_upgrade)
- [x] [history](https://github.com/rizaumami/tdcli.lua/wiki/history)
- [x] [mark_read](https://github.com/rizaumami/tdcli.lua/wiki/mark_read)
- [x] [msg](https://github.com/rizaumami/tdcli.lua/wiki/msg)
- [x] [mute](https://github.com/rizaumami/tdcli.lua/wiki/mute)
- [x] [pin_message](https://github.com/rizaumami/tdcli.lua/wiki/pin_message)
- [ ] push_button
- [x] [resolve_username](https://github.com/rizaumami/tdcli.lua/wiki/resolve_username)
- [x] [reply](https://github.com/rizaumami/tdcli.lua/wiki/reply)
- [x] [reply_file](https://github.com/rizaumami/tdcli.lua/wiki/reply_file)
- [ ] reply_fwd
- [x] [reply_location](https://github.com/rizaumami/tdcli.lua/wiki/reply_location)
- [x] [search](https://github.com/rizaumami/tdcli.lua/wiki/search)
- [x] [send_file](https://github.com/rizaumami/tdcli.lua/wiki/send_file)
- [x] [send_location](https://github.com/rizaumami/tdcli.lua/wiki/send_location)
- [x] [send_typing](https://github.com/rizaumami/tdcli.lua/wiki/send_typing)
- [x] [start_bot](https://github.com/rizaumami/tdcli.lua/wiki/start_bot)
- [x] [timer](https://github.com/rizaumami/tdcli.lua/wiki/timer)
- [x] [unblock_user](https://github.com/rizaumami/tdcli.lua/wiki/unblock_user)
- [x] [unmute](https://github.com/rizaumami/tdcli.lua/wiki/unmute)
