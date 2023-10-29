const jwt=require('jsonwebtoken');
const userModel = require('../models/users');

const verifyToken=(req,res,next)=>{
    const authHeader=req.headers.token;

    if (authHeader){
        const token =authHeader.split(" ")[1]
         jwt.verify(token,process.env.SECRET,async(err,user)=>{
            if(err) res.status(403).json('invalid token')
            req.user=user;
            next();
         })
    }else{
        return res.status(401).json("You are not authenicated")
    }
}

const verifyAndauth =async(req,res,next)=>{
   verifyToken(req,res,()=>{
    if (req.user.id===req.params.id){
        next();
    } else{
        res.status(403).json("you are restricted from performing this operation")
    }
   })
}

const verifyAndauthAdmin =async(req,res,next)=>{
    verifyToken(req,res,async ()=>{
        const user= await userModel.findById(req.user.id)
    if (user.isAdmin){
         next();
     }else{
         res.status(403).json("you are restricted from performing this operation Admin")
     }
    })
 }


module.exports={verifyToken,verifyAndauth,verifyAndauthAdmin}