
	var textarea = document.getElementById("messageWindow");
	var receiver;
	var sender;
	var user1 = $("#user1").val();
	var user2 = $("#user2").val();
	var chatno = $("#chatno").val();
	var nickname = $("#nickname").val();
	var chatno = $("#chatno").val();
	var webSocket = new WebSocket('ws://192.168.10.33:8787/Doncar/chating');
	var inputMessage = document.getElementById("inputMessage");

	function enterkey(){
		if(window.event.keyCode == 13){
			send();
		}
	}
	
	webSocket.onerror = function(event){
		onError(event)
	};
	
	webSocket.onopen = function(event){
		onOpen(event)
	};
	
	webSocket.onmessage = function(event){
		onMessage(event);
	};
	
	function onMessage(event){
		textarea.value += receiver+":" + event.data + "\n";
	}
	
	function onOpen(event){
		textarea.value += "------새로운메세지------\n";
		var setmsg = "mynumis/";
		if(user1 == nickname){
			setmsg = setmsg+chatno+"/user1"
		}else{
			setmsg = setmsg+chatno+"/user2"
		}
		webSocket.send(setmsg);
	}
	
	function onError(event){
		alert(event.data);
	}
	
	function send(){
		webSocket.send(inputMessage.value);
		insertmsg(inputMessage.value);
		inputMessage.value="";
	}
	
	function insertmsg(msg){
		msg = encodeURIComponent(msg);
		var data = "command=insert_msg"+"&chat_no="+chatno+"&sender="+sender+"&receiver="+receiver+"&content="+msg;
		
		$.ajax({
			url : "msg.do",
			data : data,
			dataType : "json",
			success : function(obj){
				var message = decodeURIComponent(obj.msg);
					textarea.value += obj.sender+":" + message + "\n";
			},error : function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
	}
	
	
	$(function(){
		if(nickname == user1){
			receiver = user2;
			sender = user1;
		}else{
			receiver = user1;
			sender = user2;
		}
	})