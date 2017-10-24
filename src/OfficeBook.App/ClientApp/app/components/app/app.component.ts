import { Component, OnInit } from '@angular/core';
//import { ActivatedRoute } from '@angular/router';
//import { LocationStrategy, PlatformLocation, Location } from '@angular/common';
import { PlatformLocation } from '@angular/common';

import { SecurityService } from '../../app.security';

@Component({
    selector: 'app',
    template: require('./app.component.html'),
    styles: [require('./app.component.css')]
})
export class AppComponent {

    //private location: PlatformLocation;

    constructor(public securityService: SecurityService, private location: PlatformLocation) {
        //this.location = _location;
        //console.log('locationStrategy', locationStrategy)
        //console.log('locationStrategy.path()', locationStrategy.path())
        //console.log('locationStrategy.prepareExternalUrl()', locationStrategy.prepareExternalUrl('xxx'));

        //console.log('location.location', location);
        //console.log('location.path()', location.path());
        //console.log('location.prepareExternalUrl()', location.prepareExternalUrl('xxx'));

        //console.log('platformLocation', platformLocation);
        //console.log('platformLocation.getBaseHrefFromDOM()', platformLocation.getBaseHrefFromDOM());
        //// if(platformLocation instanceof BrowserPlatformLocation) { // BrowserPlatformLocation is private and can't be imported
        //console.log('platformLocation.location.url', platformLocation.hash);
        ////console.log('platformLocation.location.origin', platformLocation);
        //}
    }

    ngOnInit() {
        console.log("ngOnInit _securityService.AuthorizedCallback");
        //console.log(this.route.snapshot.data);

        console.log(this.location.hash);

        //if (this.locationStrategy..hash) {
        //    this.securityService.AuthorizedCallback();
        //}
          
        if (this.location.hash) {
            this.securityService.AuthorizedCallback(this.location.hash);
        }
    }
}
