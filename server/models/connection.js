const mongoose = require('mongoose');
function initconn(){
    mongoose.connect(process.env.MONGO_URL)
    .then(()=>console.log('DataBase is connected')
    )
}

//mongodb+srv://jobchatdb:qBICjXY9IofXMh83@jobchatdb.vc3p2dh.mongodb.net/

module.exports=initconn