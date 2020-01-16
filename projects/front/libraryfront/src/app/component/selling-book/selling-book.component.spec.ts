import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SellingBookComponent } from './selling-book.component';

describe('SellingBookComponent', () => {
  let component: SellingBookComponent;
  let fixture: ComponentFixture<SellingBookComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SellingBookComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SellingBookComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
