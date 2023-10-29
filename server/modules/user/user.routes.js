const userRouter=require('express').Router();
const {updateUser,getAllUser,deleteUser,getUser}=require("./controller/user.controller")
const{verifyAndauth,verifyAndauthAdmin}=require('../../middleware/verifyToken')

userRouter.put("/:id",verifyAndauth,updateUser)
userRouter.delete("/:id",verifyAndauth,deleteUser)
userRouter.get("/:id",verifyAndauth,getUser)
userRouter.get("/",verifyAndauthAdmin,getAllUser)

module.exports=userRouter