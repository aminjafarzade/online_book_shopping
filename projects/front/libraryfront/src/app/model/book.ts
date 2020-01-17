export class Book {

    id: number = 0;
    name: string = '';
    description: string = '';
    image: string = '';
    pageCount: number = 10;
    register: Date = new Date();
    price: number;
    author: string = '';
    enabled:number=1;
    userId:number=0;

    
    toString(): string {
        return this.name + ' ' + this.description + ' ' + this.price + ' ' + this.author;
    }

}