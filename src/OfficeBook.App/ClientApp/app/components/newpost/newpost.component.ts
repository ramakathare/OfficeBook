import { Component,Input } from '@angular/core';

@Component({
    selector: 'ob-newpost',
    template: require('./newpost.component.html'),
    styles: [require('./newpost.component.css')]
})
export class NewPostComponent {
    @Input() group: string;
}
