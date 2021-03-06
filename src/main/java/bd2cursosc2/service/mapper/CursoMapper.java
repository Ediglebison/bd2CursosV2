package bd2cursosc2.service.mapper;

import bd2cursosc2.domain.Curso;
import bd2cursosc2.domain.Usuario;
import bd2cursosc2.service.dto.CursoDTO;
import bd2cursosc2.service.dto.UsuarioDTO;
import org.mapstruct.*;

/**
 * Mapper for the entity {@link Curso} and its DTO {@link CursoDTO}.
 */
@Mapper(componentModel = "spring")
public interface CursoMapper extends EntityMapper<CursoDTO, Curso> {
    @Mapping(target = "professor", source = "professor", qualifiedByName = "usuarioId")
    @Mapping(target = "aluno", source = "aluno", qualifiedByName = "usuarioId")
    CursoDTO toDto(Curso s);

    @Named("usuarioId")
    @BeanMapping(ignoreByDefault = true)
    @Mapping(target = "id", source = "id")
    UsuarioDTO toDtoUsuarioId(Usuario usuario);
}
