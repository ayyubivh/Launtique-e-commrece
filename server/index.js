const express = require('express');
const mongoose = require('mongoose');
const adminRouter = require('./routes/admin');
const authRouter = require("./routes/auth");
const productRouter = require('./routes/product');
const userRouter = require('./routes/user');

//INIT
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://ayyubi:Sumisalu1@cluster0.ritiylr.mongodb.net/?retryWrites=true&w=majority";

// middleware
app.use(express.json());
app.use(authRouter);  
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

//Connetions
mongoose.connect(DB).then(() =>{
    console.log('Connection Succuessful');
}).catch((e) => {
console.log(e);
}); 


app.listen(PORT, "0.0.0.0", () => {
console.log('connected at port ' + PORT);
});