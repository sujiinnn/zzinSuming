<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="deu.cse.suming.Dto.Message"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.StringWriter" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.Set"%>
<%
    StringWriter buf = new StringWriter();
    StringWriter buf2 = new StringWriter();
    Set<String> printedIDs = new HashSet<>();
%>

<%
    List<Message> messages = (List<Message>) session.getAttribute("messages");
    Iterator<Message> iter = null;
    Iterator<Message> iter2 = null;
    if (messages != null) {
        iter = messages.iterator();
        iter2 = messages.iterator();
    }
    String uid = (String) session.getAttribute("uid");
    System.out.println("uid" + uid);
    String chatfriend2 = request.getParameter("friend");
    System.out.println("friend" + chatfriend2);
    session.setAttribute("sfriend", chatfriend2);
    String sefriend = (String) session.getAttribute("sfriend");
    System.out.println("friend" + sefriend);
    String sefriend2 = (String) session.getAttribute("sfriend2");
    System.out.println("friend" + sefriend2);
    boolean isChat = false;
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>채팅</title>
    <link rel="stylesheet" href="bootstrap3.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="cCSS/chat.css">
    <script>
        var chatfriend = "";
        function handleClick(friendElement) {
            console.log("함수 호출됨");
            chatfriend = friendElement;
            console.log(chatfriend.textContent);
            window.location.href = "chat.jsp?friend=" + chatfriend.textContent;
            <% session.setAttribute("sfriend2", null); %>
        }
    </script>
</head>

<body>
    <div id="app" class="app">

        <!-- LEFT SECTION -->
        <section id="main-left" class="main-left">
            <!-- header -->
            <div id="header-left" class="header-left">
                <span class="glyphicon glyphicon-menu-hamburger hamburger-btn"></span>
                <span class="glyphicon glyphicon-search search-btn"></span>
                <span class="glyphicon glyphicon-option-vertical option-btn"></span>
            </div>

            <!-- chat list -->
            <div id="chat-list" class="chat-list">
                <% if (iter2 != null) {
                    while (iter2.hasNext()) {
                        Message st = iter2.next();
                        if (st.getId().equals(uid) && !printedIDs.contains(st.getUserId())) {
                            buf2.append("<div class='friends' ondblclick='handleClick(this)'><div class='friends-credent'><span class='friends-name'>");
                            buf2.append(st.getUserId());
                            buf2.append("</span></div></div>");
                            printedIDs.add(st.getUserId());
                        }
                        if (st.getUserId().equals(uid) && !printedIDs.contains(st.getId())) {
                            buf2.append("<div class='friends' ondblclick='handleClick(this)'><div class='friends-credent'><span class='friends-name'>");
                            buf2.append(st.getId());
                            buf2.append("</span></div></div>");
                            printedIDs.add(st.getId());
                        }
                    }
                } %>
                <%= buf2.toString() %>
            </div>
        </section>

        <!-- RIGHT SECTION -->
        <section id="main-right" class="main-right">
            <!-- header -->
            <div id="header-right" class="header-right">
                <!-- profile pict -->
                <div id="header-img" class="profile header-img">
                    <img src="chatimages/ava2.jpg" alt="">
                </div>

                <!-- name -->
                <h4 class="name friend-name">
                    <% if (chatfriend2 != null || sefriend2 != null) {
                        if (sefriend2 != null) { %>
                            <%= sefriend2 %>
                        <% } else if (chatfriend2 != null) { %>
                            <%= chatfriend2 %>
                        <% }
                    } %>
                </h4>

                <!-- some btn -->
                <div class="some-btn">
                    <span class="glyphicon glyphicon-facetime-video"></span>
                    <span class="glyphicon glyphicon-earphone"></span>
                    <span class="glyphicon glyphicon-option-vertical option-btn"></span>
                </div>
            </div>

            <!-- chat area -->
            <div id="chat-area" class="chat-area">
                <!-- chat content -->
                <% if (iter != null) {
                    while (iter.hasNext()) {
                        Message st = iter.next();
                        if (sefriend2 != null) {
                            if (st.getId().equals(uid) && st.getUserId().equals(sefriend2)) {
                                buf.append("<div id='your-chat' class='your-chat'><p class='your-chat-balloon'>");
                                buf.append(st.getMessage());
                                buf.append("</p></div>");
                            }
                            if (st.getUserId().equals(uid) && st.getId().equals(sefriend2)) {
                                buf.append("<div id='friends-chat' class='friends-chat'><div class='friends-chat-content'>");
                                buf.append("<p class='friends-chat-name'>");
                                buf.append(st.getId());
                                buf.append("</p><p class='friends-chat-balloon'>");
                                buf.append(st.getMessage());
                                buf.append("</p></div></div>");
                            }
                        } else {
                            if (st.getId().equals(uid) && st.getUserId().equals(chatfriend2)) {
                                buf.append("<div id='your-chat' class='your-chat'><p class='your-chat-balloon'>");
                                buf.append(st.getMessage());
                                buf.append("</p></div>");
                            }
                            if (st.getUserId().equals(uid) && st.getId().equals(chatfriend2)) {
                                buf.append("<div id='friends-chat' class='friends-chat'><div class='friends-chat-content'>");
                                buf.append("<p class='friends-chat-name'>");
                                buf.append(st.getId());
                                buf.append("</p><p class='friends-chat-balloon'>");
                                buf.append(st.getMessage());
                                buf.append("</p></div></div>");
                            }
                        }
                    }
                } %>
                <%= buf.toString() %>
            </div>

            <!-- typing area -->
            <div id="typing-area" class="typing-area">
                <!-- input form -->
                <form action="SEND_CHAT.jsp" name="frm"> 
                    <input type="text" name="messagetext" placeholder="Type something..." style="width:132.5%; height:100px;" required>
                    <!-- send btn -->
                    <button class="glyphicon glyphicon-send send-btn" id="send-message-button" style="background-color: white; border:white;" type="submit"></button>
                </form>
            </div>
        </section>
    </div>

    <!-- jQuey -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- bootstrap js -->
    <script src="bootstrap3.3/js/bootstrap.min.js"></script>
</body>

</html>
