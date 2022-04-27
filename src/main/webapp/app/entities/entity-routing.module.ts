import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';

@NgModule({
  imports: [
    RouterModule.forChild([
      {
        path: 'usuario',
        data: { pageTitle: 'bd2CursosV2App.usuario.home.title' },
        loadChildren: () => import('./usuario/usuario.module').then(m => m.UsuarioModule),
      },
      {
        path: 'endereco',
        data: { pageTitle: 'bd2CursosV2App.endereco.home.title' },
        loadChildren: () => import('./endereco/endereco.module').then(m => m.EnderecoModule),
      },
      {
        path: 'compra',
        data: { pageTitle: 'bd2CursosV2App.compra.home.title' },
        loadChildren: () => import('./compra/compra.module').then(m => m.CompraModule),
      },
      {
        path: 'curso',
        data: { pageTitle: 'bd2CursosV2App.curso.home.title' },
        loadChildren: () => import('./curso/curso.module').then(m => m.CursoModule),
      },
      /* jhipster-needle-add-entity-route - JHipster will add entity modules routes here */
    ]),
  ],
})
export class EntityRoutingModule {}
