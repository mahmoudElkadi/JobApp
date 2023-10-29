const mongoose = require('mongoose');

const jobSchema=new mongoose.Schema(
    {
      title:{
        type:String,
        required:true
      },
      location:{
        type:String,
        required:true
      },
      description:{
        type:String,
        required:true
      },
      company:{
        type:String,
        required:true
      },
      salary:{
        type:String,
        required:true
      },
      period:{
        type:String,
        required:true
      },
      contract:{
        type:String,
        required:true
      },
      requirements:{
        type:String,
        required:true
      },
      imageUrl:{
        type:String,
        
      },
      agentId:{
        type:mongoose.Schema.Types.ObjectId,
        ref:"User",
        required:true
      }
    },
    {timestamps:true}
);

const jobModel=mongoose.model("Job",jobSchema)

module.exports=jobModel;