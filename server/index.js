const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const app = express();
const db = require('./database/index');

app.use(cors());
app.use(express.json());
app.use(morgan('combined'));

app.listen('3000',()=>{
    console.log('Server Started at Port 3000');
});

app.get('/', (req,res)=>{
   res.send('Welcome to the Donteur Server!!');
});

app.post('/register_user',(request,response) => {
    db.query(`Insert Into users (user_name,email,password,type) Values ('${request.body.user_name}','${request.body.email}','${request.body.password}','${request.body.type}')`,(err,res )=>{
       if(err)
       {
           response.status(404).send('Error Ocurred while Registerting user');
       }        
           console.log(res);
           console.log('User Registered Successfully!!');
           response.send('User Registered Successfully!!');
    })
});

//This link to login the user into the system
app.post('/login_user',(request,response)=>{
db.query(`Select * from users where email = '${request.body.email}' And password = '${request.body.password}'`,(err,res) =>{
    if(err || res.length == 0)
    {
        response.status(404).send([]);
        console.log("User Doesn't Exist");
    }
    else
    {
        console.log(res);
        console.log('User Found!!');
        response.send(res);
    }
    })
});