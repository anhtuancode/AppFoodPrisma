import { BadRequestException } from "../common/helpers/exception.helper";
import prisma from "../common/prisma/init.prisma";

const rateService = {
    add: async (req) => {
        const {user_id, res_id, amount} = req.body;
        if(amount < 1 || amount > 5){
            throw new BadRequestException("Amount must be between 1 and 5");
        }
        try {
            const newRate = await prisma.rate_res.create({
                data:{
                    user_id: user_id,
                    res_id: res_id,
                    amount: amount,
                    date_rate: new Date()
                }
            })
            return newRate
        } catch (error) {
            throw new BadRequestException("Failed to rate restaurant")
        }
    },
    getRateByRes: async(req) =>{
        const id = parseInt(req.params.id, 10);
        try {
            const rates = await prisma.rate_res.findMany({
                where:{
                    res_id: id
                },
                include:{
                    user: true
                },
                // latest rate will be arrange first 
                orderBy:{
                    date_rate: "desc"
                }
            })

            return {
                rates: rates,
                count: rates.length
            }

        } catch (error) {
            throw new BadRequestException("Failed to get user's review by restaurant id")
        }
    },
    getRateByUser: async(req) =>{
        const id = parseInt(req.params.id, 10);
        try {
            const rates = await prisma.rate_res.findMany({
                where:{
                    user_id: id
                },
                include:{
                    restaurant: true
                },
                // latest rate will be arrange first 
                orderBy:{
                    date_rate: "desc"
                }
            })

            return {
                rates: rates,
                count: rates.length
            }

        } catch (error) {
            throw new BadRequestException("Failed to get restaurant's review by user id")
        }
    }
}

export default rateService;