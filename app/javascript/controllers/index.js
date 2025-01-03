// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName
// stimulus:manifest:update

import { application } from "./application"

import FlashMessageController from "./flash_message_controller"
import TextareaAutogrowController from "./textarea_autogrow_controller"

application.register("flash-message", FlashMessageController)
application.register("textarea-autogrow", TextareaAutogrowController)
