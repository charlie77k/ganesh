const express = require('express');
const app = express();
const bodyParser = require('body-parser');
app.set('view engine', 'hbs');//set the template engine hbs
app.use(bodyParser.urlencoded({ extended:true }));// parse requests of content-type
app.use(bodyParser.json());//middlewares
app.use(express.static('public'));

//Listen on port 3000
server = app.listen(3000, ()=> console.log("Server is Started on 3000"));

var con = require("./config/db");
//routes
  app.get('/', (req, res) => {//client view
  res.render('chat')
  });

  app.get('/register', (req, res) => {//admin view
    res.render('register');
  });

  app.get('/test', (req, res) => {//admin view
    res.render('tes');
  });

  
  app.post('/register', (req, res) => {//get register data
      var sql =  "INSERT INTO `register_data` (`name`, `password`) VALUES ('"+req.body.name+"','" +req.body.password+ "');"
      con.con.query(sql, function (err, result) {
        if (!err) {          
          res.render('chat', {msg:'hello'});
        }
        else res.redirect('/register');
      });
  });

//socket.io installation
const io = require("socket.io")(server);

var clients ={}

io.sockets.on("connection", function (client) {  
  //client request join to server
  client.on("join", function(users){
    var sql = "SELECT `id` FROM `register_data` WHERE `name` = '"+users.name+"' && `password` = '" +users.password+ "';"
      con.con.query(sql, function (err, result, fields) {
        if (!err) {
        if(result.length == 1)  { //accsepted
            console.log("Joined: " + users.name);
            clients[client.id] = users.name;
            client.emit("update", "You have connected to the server.");
            // con.con.query('SELECT `name`, `msg`, `time` FROM `chat_tran` WHERE 1', function (err, result, fields) {
            //           if (err) throw err;
            //           else{ var length = Object.keys(result).length;                          
            //             for(var i = 0; i < length; i++ ){
            //               if( users.name == result[i].name ){
            //               client.emit("self", result[i].name, result[i].msg, result[i].time);
            //               }else  client.emit("chat", result[i].name, result[i].msg, result[i].time);
            //               }
            //            }
            //         }); 
              con.con.query('SELECT `id`, `name` FROM `register_data` WHERE 1', function (err, result, fields) {
                if (err) throw err;
                else{ var length = Object.keys(result).length;   
                    
                  for(var i = 0; i < length; i++ ){  
                    if( clients[client.id] != result[i].name )
                     client.emit("user_list", result[i].name, result[i].id);                    
                    }
                  }
              });                    
            client.broadcast.emit("update", users.name + " has joined the server.");
        }
        else  client.emit("login", "You are not join to server");
      }  
    });
});

  client.on("send", function(msg){
    console.log("Message: " + msg);
    if(clients[client.id] != undefined){
      sql= "INSERT INTO `chat_tran` (`sender`, `receiver`, `msg`) VALUES ('"+clients[client.id]+"','"+clients[client.receiver]+"', '"+msg+"');"
      con.con.query(sql, function (err, result, fields) {
        if (err) throw err;
        client.broadcast.emit("chat", clients[client.id], msg);
      });
    }
    else console.log("Error : Chat data is not inserted in db please Refresh web page");      
  });

  client.on("getChat", function(name){
    clients[client.receiver] = name;
    var sql = "SELECT `sender`, `msg`, `time` FROM `chat_tran` WHERE `sender`='"+clients[client.id]+"' && `receiver`='"+clients[client.receiver]+"' || `receiver`='"+clients[client.id]+"' && `sender`='"+clients[client.receiver]+"'";
    con.con.query(sql, function (err, result, fields) {
      if (err) throw err;
      else{ var length = Object.keys(result).length;            
        client.emit("chatRemove");                     
        for(var i = 0; i < length; i++ ){        
          if( clients[client.id] == result[i].sender ){
          client.emit("self", result[i].sender, result[i].msg, result[i].time);
          }else  client.emit("chat", result[i].sender, result[i].msg, result[i].time);
          }
       }
    });    
  });

  

  client.on("disconnect", function(){
    console.log("Disconnect");
      io.emit("update", clients[client.id] + " has left the server.");
      delete clients[client.id];
  });

});
