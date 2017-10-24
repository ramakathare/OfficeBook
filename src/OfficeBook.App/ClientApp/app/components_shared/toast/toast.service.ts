//declare var _: any;
import { Injectable } from '@angular/core'

@Injectable()
export class ToastService {
    public toaster = {toasts:[]}

    info(message: String, timeout = 5000) {
        this.show(message, 'info', timeout)
    }

    warn(message: String, timeout = 5000) {
        this.show(message, 'warn', timeout)
    }

    remove(toast) {
        this.toaster.toasts = this.toaster.toasts.filter(p => p != toast);
    }

    private show(message: String, theme: String = 'warn', timeout = 5000) {
        let toast = { message, theme }
        this.toaster.toasts.push(toast)
        setTimeout(() => this.remove(toast), timeout)
    }
}
