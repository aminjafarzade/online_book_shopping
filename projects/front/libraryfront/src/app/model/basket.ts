import { Book } from './book';

export class BasketBook{
    constructor(public id:number){

    }
    book:Book;
    count:number=1;
    toString(): string {
        return this.book + ' ' + this.count;
    }
}