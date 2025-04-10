import { BadRequestException } from "../common/helpers/exception.helper";
import prisma from "../common/prisma/init.prisma";

const orderService = {
    add: async(req) =>{
        const {food_id, user_id, amount, code, arr_sub_id} = req.body
        try {
            const newOrder = prisma.order.create({
                data: {
                    food_id: food_id,
                    user_id: user_id,
                    amount: amount,
                    code: code,
                    arr_sub_id: arr_sub_id
                }
            })
            return newOrder
        } catch (error) {
            throw new BadRequestException("Failed to add rate restaurant")
        }
    }
}

export default orderService;