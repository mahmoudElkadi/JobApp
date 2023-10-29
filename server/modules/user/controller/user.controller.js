const userModel=require("../../../models/users")
const CryptoJs = require('crypto-js');

const updateUser=async(req,res)=>{
    if(req.body.password){
        req.body.password=CryptoJs.AES.encrypt(req.body.password,process.env.SECRET).toString();
    }
    try {
        const updateUser=await userModel.findByIdAndUpdate(
            req.params.id,{
                $set :req.body
            },{new:true}
        );
        const {password,__v,...others}=updateUser._doc
        res.status(201).json({message:"updated user",...others})
        
    } catch (error) {
        res.status(400).json({message:"updated error",error})

    }
}



const deleteUser=async(req,res)=>{
    try {
        await userModel.findByIdAndDelete(req.params.id)
        console.log(req.user);
        res.status(200).json({message:"Account successfully Deleted"})
        
    } catch (error) {
        res.status(500).json(error)
    }
}

const getUser=async(req,res)=>{
    try {
      const getUser=await userModel.findById(req.params.id)
        const{password,__v,...others}=getUser._doc
        res.status(200).json({message:"user founded",others})

    } catch (error) {
        res.status(500).json(error)

    }
}


const getAllUser=async(req,res)=>{
    try {
      const getUser=await userModel.find()
      console.log(req.user.isAdmin);
        //const{password,__v,...others}=getUser._doc
        res.status(200).json({message:"users founded",getUser})

    } catch (error) {
        res.status(500).json(error)

    }
}

module.exports={updateUser ,deleteUser,getUser,getAllUser}