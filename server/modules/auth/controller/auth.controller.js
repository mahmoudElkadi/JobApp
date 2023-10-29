const userModel=require("../../../models/users")
const CryptoJs = require('crypto-js');
const jwt=require("jsonwebtoken")


const register=async (req,res)=>{
    const {userName,email,password}=req.body
    let encrypted=CryptoJs.AES.encrypt(password,process.env.SECRET).toString();
    const newUser=new userModel({
        userName:userName,
        email:email,
        password:encrypted
    })
    try {
        const savedUser=await newUser.save();

        res.status(201).json({message:"register is successfully",savedUser})
    } catch (error) {
        res.status(500).json(error)
    }
    
}

const login=async (req,res)=>{
    const {email,password}=req.body

    const user=await userModel.findOne({email:email})
    if (user) {
        let decryptedPass=CryptoJs.AES.decrypt(user.password,process.env.SECRET).toString(CryptoJs.enc.Utf8);

        if(decryptedPass==password){
            
            const token=jwt.sign({id:user._id},process.env.SECRET)

                res.status(200).json({message:"welcome",token})
        
        }else{
            res.status(401).json("password is not correct")

        }
        
    } else {
        res.status(401).json("email is not register")

    }
   
    
}

module.exports={register,login}