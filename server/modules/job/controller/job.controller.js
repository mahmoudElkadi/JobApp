const jobModel=require("../../../models/job")


const createJob=async(req,res)=>{
    const newJob =new jobModel(req.body)
    try {
        const savedJob=await newJob.save()
        const{__V,createdAt,updatedAt,...others}=savedJob._doc
        res.status(200).json({message:"Added Job",...others})
    } catch (error) {
        res.status(500).json({message:"not add Job",error})

    }
}

const updateJob=async(req,res)=>{
    try {
        const updateJob=await jobModel.findByIdAndUpdate(
            req.params.id,
            {$set:req.body},
            {new:true}
        )
        const{__V,createdAt,updatedAt,...others}=updateJob._doc
        res.status(200).json({message:"updated job",...others})
        
    } catch (error) {
        res.status(500).json({message:"not update Job",error})

    }
}

const deletejob=async(req,res)=>{
    try {
        await jobModel.findByIdAndDelete(
            req.params.id,
        )
        
        res.status(200).json({message:"deleted job"})
        
    } catch (error) {
        res.status(500).json({message:"not update Job",error})

    }
}

const getJob=async(req,res)=>{
    try {
       const getJob= await jobModel.findById(
            req.params.id,
        )
        const{__V,createdAt,updatedAt,...others}=getJob._doc
        res.status(200).json({message:"one job",...others})
        
    } catch (error) {
        res.status(500).json({message:"not update Job",error})

    }
}

const getAllJob=async(req,res)=>{
    try {
       const getAllJob= await jobModel.find()
        
        res.status(200).json({message:"All job",getAllJob})
        
    } catch (error) {
        res.status(500).json({message:"not update Job",error})

    }
}
//const products=await productModel.find({productName:{$regex:product,$options:'i'}});

const searchJob =async(req,res)=>{
    try {
        const searchJob=await jobModel.find({title:{$regex:req.params.title,$options:'i'}})
        //const{__V,createdAt,updatedAt,...others}=searchJob._doc
        res.status(200).json({message:"search job",searchJob})
    } catch (error) {
        res.status(500).json({message:"not search Job",error})

    }
}



module.exports={createJob,updateJob,deletejob,getJob,getAllJob,searchJob}