import { BadRequestException } from "../common/helpers/exception.helper";
import prisma from "../common/prisma/init.prisma";

const likeService = {
    like: async (req) => {
        // Truyền vô id người like và id nhà hàng
        const {user_id, res_id} = req.body;
        try {
            const existLike = await prisma.like_res.findUnique({
                where:{
                    user_id_res_id:{
                        user_id: user_id,
                        res_id: res_id
                    }
                }
            })

            if(existLike){
                await prisma.like_res.delete({
                    where:{
                        user_id_res_id:{
                            user_id: user_id,
                            res_id: res_id
                        }
                    }
                })
                return { message: "unliked" };
            }else{
                const newLike = await prisma.like_res.create({
                    data:{
                        user_id: user_id,
                        res_id: res_id,
                        date_like: new Date()
                    }
                })
                return newLike;
            }
        } catch (error) {
            throw new BadRequestException("Something is wrong, please check again");
        }
    },
    getLike: async (req) =>{
        const id = parseInt(req.params.id, 10);
        try {
            const likes = await prisma.like_res.findMany({
                where:{
                    res_id: id
                },
                include: {
                    user: true, 
                }
            })

            const users = likes.map(like => like.user);

            return {
                users: users,
                count: users.length
            }
        } catch (error) {
            console.log(error);
            throw new BadRequestException("Failed to get users who liked this restaurant");
        }
    },
    getLikeByUser: async (req) =>{
        const id = parseInt(req.params.id, 10);
        try {
            const likes = await prisma.like_res.findMany({
                where:{
                    user_id: id
                },
                include: {
                    restaurant: true, 
                }
            })

            const restaurants = likes.map(like => like.restaurant);

            return {
                restaurants: restaurants,
                count: restaurants.length
            }
        } catch (error) {
            console.log(error);
            throw new BadRequestException("Failed to get restaurant'like by user");
        }
    }
}

export default likeService;