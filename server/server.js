const express = require('express')
require("dotenv").config();
const app = express()
const port = process.env.PORT
const initconn = require('./models/connection')
const {authRouter,userRouter,jobRouter,bookmarksRouter}=require('./routes/routes')
initconn()
app.use(express.json());
app.use("/api/",authRouter);
app.use("/api/user/",userRouter);
app.use("/api/job/",jobRouter);
app.use("/api/bookmarks/",bookmarksRouter);

app.get('/', (req, res) => res.send('Hello Elkady!'))
app.listen(port, () => console.log(`Example app listening on port ${port}!`))