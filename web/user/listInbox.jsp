<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>List Inbox</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/skeleton/2.0.4/skeleton.min.css" rel="stylesheet">
    <link href="/css/custom.css" rel="stylesheet">
    <link href="/css/organism.css" rel="stylesheet">
    <jsp:useBean id="userLst" class="java.util.ArrayList" scope="request" />
    <jsp:useBean id="sendersLst" class="java.util.ArrayList" scope="request" />
    <jsp:useBean id="auctionsLst" class="java.util.ArrayList" scope="request" />
</head>
<body>
<div class="container">

    <c:if test="${empty user}">
        <c:redirect url="/"/>
    </c:if>
    <a href="/user/homepage.jsp">home</a>

    <h2>Inbox</h2>
    <div>
        <c:if test="${not empty messagesLst}">
            <c:forEach var="message" items="${messagesLst}" varStatus="status">
                <a href="/message.do?action=getConversation&rid=${message.senderId}&aid=${message.auctionId}" class="message message--inbox">
                    <span class="message__composer">${sendersLst[status.index].firstname} ${sendersLst[status.index].lastname} for ${auctionsLst[status.index].name}:</span>
                    <span class="message__text">${message.message}</span><span class="message__time">${message.sendDate}</span>
                </a>
            </c:forEach>
        </c:if>
    </div>
</div>

</body>
</html>
