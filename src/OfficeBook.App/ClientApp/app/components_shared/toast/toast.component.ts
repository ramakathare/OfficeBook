import {Component} from '@angular/core'
import {ToastService} from './toast.service'

@Component({
    selector: 'ob-toast',
    template: require('./toast.component.html'),
    styles: [require('./toast.component.css')]
})
export class ToastComponent {
    private toaster = {toasts:[]};

    constructor(private toastService: ToastService) {
        this.toaster = toastService.toaster;
    }

    //remove(toast) {
    //    this.toastService.remove(toast)
    //}
}
