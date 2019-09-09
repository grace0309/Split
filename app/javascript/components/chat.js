import { CometChat } from "@cometchat-pro/chat"

var appID = "71851ac91c4baf";
const initChat = function() {

  CometChat.init(appID).then(
    () => {
      console.log("Initialization completed successfully");
      // You can now call login function.
    },
    error => {
      console.log("Initialization failed with error:", error);
      // Check the reason for error and take appropriate action.
    }
    );
}

var authToken = "superhero1";

const loginChat = function() {CometChat.login(authToken).then(
  User => {
    console.log("Login successfully:", { User });
    // User loged in successfully.
  },
  error => {
    console.log("Login failed with exception:", { error });
    // User login failed, check error and take appropriate action.
  }
);
}
var receiverID = "SUPERHERO2";
var messageText = "Hello";
var messageType = CometChat.MESSAGE_TYPE.TEXT;
var receiverType = CometChat.RECEIVER_TYPE.USER;

var textMessage = new CometChat.TextMessage(receiverID, messageText, messageType, receiverType);

const sendChat = function() {CometChat.sendMessage(textMessage).then(
  message => {
    console.log("Message sent successfully:", message);
    // Do something with message
  },
  error => {
    console.log("Message sending failed with error:", error);
    // Handle any error
  }
);
}

export { initChat }
export { loginChat }
export { sendChat }
