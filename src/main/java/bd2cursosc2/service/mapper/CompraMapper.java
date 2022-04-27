package bd2cursosc2.service.mapper;

import bd2cursosc2.domain.Compra;
import bd2cursosc2.domain.Curso;
import bd2cursosc2.domain.Usuario;
import bd2cursosc2.service.dto.CompraDTO;
import bd2cursosc2.service.dto.CursoDTO;
import bd2cursosc2.service.dto.UsuarioDTO;
import org.mapstruct.*;

/**
 * Mapper for the entity {@link Compra} and its DTO {@link CompraDTO}.
 */
@Mapper(componentModel = "spring")
public interface CompraMapper extends EntityMapper<CompraDTO, Compra> {
    @Mapping(target = "curso", source = "curso", qualifiedByName = "cursoTitulo")
    @Mapping(target = "usuario", source = "usuario", qualifiedByName = "usuarioNome")
    CompraDTO toDto(Compra s);

    @Named("cursoTitulo")
    @BeanMapping(ignoreByDefault = true)
    @Mapping(target = "id", source = "id")
    @Mapping(target = "titulo", source = "titulo")
    CursoDTO toDtoCursoTitulo(Curso curso);

    @Named("usuarioNome")
    @BeanMapping(ignoreByDefault = true)
    @Mapping(target = "id", source = "id")
    @Mapping(target = "nome", source = "nome")
    UsuarioDTO toDtoUsuarioNome(Usuario usuario);
}
