const bookmarksModel=require("../../../models/bookmarks")

const createBookmarks=async(req,res)=>{
    const newBookmarks=new bookmarksModel(req.body)
       try {
            const createBookmarks=await newBookmarks.save()
            const{__V,createdAt,updatedAt,...others}=createBookmarks._doc
            res.status(201).json({message:"created Bookmarks",...others})
            
        } catch (error) {
            res.status(500).json({message:"not created bookmarks",error})

        }
}

const updateBookmarks=async(req,res)=>{
       try {
            const updateBookmarks=await bookmarksModel.findByIdAndUpdate(
                req.params.id,
                {$set:req.body},
                {new:true}
            )
            const{__V,createdAt,updatedAt,...others}=updateBookmarks._doc
            res.status(200).json({message:"updated Bookmarks",...others})
            
        } catch (error) {
            res.status(500).json({message:"not update bookmarks",error})

        }
}

const deleteBookmarks=async(req,res)=>{
    try {
         await bookmarksModel.findByIdAndDelete(req.params.id)
         res.status(200).json({message:"deleted Bookmarks"})
         
     } catch (error) {
         res.status(500).json({message:"not delete bookmarks",error})

     }
}

const getBookmarks=async(req,res)=>{
    try {
         const getBookmarks= await bookmarksModel.findOne({userId:req.params.userId})
         const{__V,createdAt,updatedAt,...others}=getBookmarks._doc
 
         res.status(200).json({message:"one Bookmarks",...others})
         
     } catch (error) {
         res.status(500).json({message:"not get bookmarks",error})

     }
}

const getAllBookmarks=async(req,res)=>{
    try {
         const getAllBookmarks= await bookmarksModel.find()
         

         res.status(200).json({message:"All Bookmarks",getAllBookmarks})
         
     } catch (error) {
         res.status(500).json({message:"not get All bookmarks",error})

     }
}

module.exports={createBookmarks,updateBookmarks,getAllBookmarks,deleteBookmarks,getBookmarks}