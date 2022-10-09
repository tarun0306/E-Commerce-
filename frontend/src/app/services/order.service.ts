import {Injectable} from '@angular/core';
import {HttpClient} from "@angular/common/http";

import {Observable, of} from "rxjs";
import {Order} from "../models/Order";
import {apiUrl} from "../../environments/environment";
import {catchError, map,tap} from 'rxjs/operators';
import { Discount } from '../models/discount';
import { OrderListResponse } from '../response/OrderListResponse';


@Injectable({
    providedIn: 'root'
})
export class OrderService {

    private orderUrl = `${apiUrl}/order`;
    private allordersUrl=`${apiUrl}/allOrders`;
    

    constructor(private http: HttpClient) {
    }
    getAll(): Observable<Order[]>{
        const url = `${this.allordersUrl}`;
        return this.http.get<OrderListResponse>(url).pipe(
            tap(_ => {
                
            }),
            map(cart => cart.orderList),
            catchError(_ => of([]))
        );;
        
    }

    getPage(page = 1, size = 10): Observable<any> {
        return this.http.get(`${this.orderUrl}?page=${page}&size=${size}`).pipe();
    }

    show(id): Observable<Order> {
        return this.http.get<Order>(`${this.orderUrl}/${id}`).pipe(
            catchError(_ => of(null))
        );
    }

    cancel(id): Observable<Order> {
        return this.http.patch<Order>(`${this.orderUrl}/cancel/${id}`, null).pipe(
            catchError(_ => of(null))
        );
    }

    finish(id): Observable<Order> {
        return this.http.patch<Order>(`${this.orderUrl}/finish/${id}`, null).pipe(
            catchError(_ => of(null))
        );
    }

    
    getCouponPage(page = 1, size = 10): Observable<any> {
        return this.http.get(`//localhost:8081/coupon/list?page=${page}&size=${size}`).pipe();
    }

    getCoupon():Observable<any>{
        return this.http.get(`//localhost:8081/coupon/alllist`);
    }

    addCoupon(code:string): Observable<Discount> {
        console.log("service");
        const url =`//localhost:8081/add/coupon/${code}` 
        return this.http.post<Discount>(url,null);
    }

    deleteCoupon(code:string): Observable<any>{
        console.log("service")
        return this.http.post(`//localhost:8081/delete/coupon/${code}`,null);
    }
}
