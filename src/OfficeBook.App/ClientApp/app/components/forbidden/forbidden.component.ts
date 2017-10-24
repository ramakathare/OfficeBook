import { Component, OnInit } from '@angular/core';

@Component({
    selector: 'forbidden',
    template: require('./forbidden.component.html')
})

export class ForbiddenComponent implements OnInit {

    public message: string;
    public values: any[];

    constructor() {
        this.message = "ForbiddenComponent constructor";
    }
    
    ngOnInit() {
        
    }
}
