import { isBrowser, isNode } from 'angular2-universal'

export class Window {   
    location: {
        href : any
    };
}

export class WindowRef {
    get nativeWindow(): Window {
        if (isBrowser) return window as Window;
        else return new Window;   
    }
}

//export abstract class WindowRef {
//    abstract get nativeWindow(): Window;
//}

//export class BrowserWindowRef extends WindowRef {
//    get nativeWindow(): Window { return window as Window; }
//}

//export class NodeWindowRef extends WindowRef {
//    get nativeWindow(): Window { return global as Window; }
//}