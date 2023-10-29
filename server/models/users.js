const mongoose = require('mongoose');

const UserSchema=new mongoose.Schema(
    {
        userName:{
            type:String,
            required:true,
            unique:true
        },
        email:{
            type:String,
            required:true,
            unique:true
        },
        password:{
            type:String,
            required:true
        },
        location:{
            type:String,
            required:false
        },
        isAdmin:{
            type:Boolean,
            default:false
        },
        isAgent:{
            type:Boolean,
            default:false
        },
        skills:{
            type:Array,
            default:false
        },
        profile:{
            type:String,
            required:true,
            default:"https://w7.pngwing.com/pngs/177/551/png-transparent-user-interface-design-computer-icons-default-stephen-salazar-graphy-user-interface-design-computer-wallpaper-sphere-thumbnail.png"
        },
    },{timestamps:true}
);

const userModel=mongoose.model("User",UserSchema)

module.exports=userModel;
