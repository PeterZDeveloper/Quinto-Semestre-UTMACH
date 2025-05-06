import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Heroe, HeroesService } from '../../services/heroes.service';

@Component({
  selector: 'app-heroe',
  templateUrl: './heroe.component.html',
  styleUrl: './heroe.component.css'
})
export class HeroeComponent {
  heroe!: Heroe;

  constructor(private activatedRoute: ActivatedRoute, private heroesService: HeroesService) {
    this.activatedRoute.params.subscribe(params => {
      const id = +params['id']; // '+' convierte string a número
      this.heroe = this.heroesService.buscarHeroe(id);
    });
  }
}
