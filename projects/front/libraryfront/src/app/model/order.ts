import { BasketBook } from './basket';
import { Customer } from './customer';

export class OrderModel{
    constructor(public id:number){

    }
    customer:Customer=new Customer(0);
    basketBooks:BasketBook[]=[];
    totalPrice:number;
    register:Date=new Date();
    note:string;

    
}