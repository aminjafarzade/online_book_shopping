import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { OrderedBookComponent } from './ordered-book.component';

describe('OrderedBookComponent', () => {
  let component: OrderedBookComponent;
  let fixture: ComponentFixture<OrderedBookComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ OrderedBookComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(OrderedBookComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
