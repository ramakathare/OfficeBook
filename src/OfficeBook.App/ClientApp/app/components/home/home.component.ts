import { Component, Output } from '@angular/core';
import { ToastService } from '../../components_shared/toast/toast.service';

@Component({
    selector: 'home',
    template: require('./home.component.html')
})
export class HomeComponent {
    _toaster: ToastService;
    constructor(toaster: ToastService) {
        this._toaster = toaster;
    }
    defaultGroup: string = "@Office";
    displayToast() {
        this._toaster.info("Hello how are you?");
    }
}
