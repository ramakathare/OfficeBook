import { Component, OnInit } from '@angular/core';
import { ValuesService } from './values.service';
import { SecurityService } from '../../app.security';
import { Observable }       from 'rxjs/Observable';

@Component({
    selector: 'values',
    template: require('./values.component.html'),
    providers: [ValuesService]
})

export class ValuesComponent implements OnInit {

    public message: string;
    public values: string;
    public userInfo: any;
   
    constructor(private _ValuesService: ValuesService, public securityService: SecurityService) {
        this.message = "Secure Files download";
    }

    ngOnInit() {
        this.getData();
        this.getUserData();
    }

    //public DownloadFileById(id: any) {
    //    this._ValuesService.DownloadFile(id);
    //}

    private getData() {
        this._ValuesService.GetValues()
            .subscribe(data => this.values = JSON.stringify(data),
            error => this.securityService.HandleError(error),
            () => console.log(this.values));
    }

    private getUserData() {
        this._ValuesService.GetUserInfo()
            .subscribe(data => this.userInfo = data,
            error => this.securityService.HandleError(error),
            () => console.log(this.userInfo));
    }
}
