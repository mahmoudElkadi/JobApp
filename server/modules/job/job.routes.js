const jobRouter=require('express').Router();
const {createJob,updateJob,getAllJob,deletejob,getJob,searchJob}=require("./controller/job.controller")
const{verifyAndauth,verifyAndauthAdmin}=require('../../middleware/verifyToken')

jobRouter.post("/",verifyAndauthAdmin,createJob)
 jobRouter.put("/:id",verifyAndauthAdmin,updateJob)
 jobRouter.delete("/:id",verifyAndauthAdmin,deletejob)
 jobRouter.get("/:id",verifyAndauthAdmin,getJob)
 jobRouter.get("/",verifyAndauthAdmin,getAllJob)
 jobRouter.get("/search/:title",verifyAndauthAdmin,searchJob)

module.exports=jobRouter